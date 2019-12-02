Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 88A577EDF1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 15:10:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47RT8G2WZFz4R;
	Mon,  2 Dec 2019 16:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575299454;
	bh=sUUskC8LqrFp3N1ZGCH/QAAZzmYi9VPquOWPGoODHEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PuXaUGugm9WgeRiERrj343uL6jmnL+ph9SUd6iI4kAXBpZPYgC9eC07ZQj+ZwFS9m
	GfyBMMV9xZGmiXAHGm5I0U3RXy3RUiUbfLvfeDiP+3rD5eHynhmvMjsafvHXptYki6
	zRj2kZ2IM4BALcrwdn+FJQNB7merAkhj7S7ky+m8/gt+SLjERnKZLEFfe7WO9noYYc
	cokc/pVyJx2gs8ANshJev9LW1t7wPLRkA060LRzYmdxHyRc8iVAfzlubKhH5x1BnvP
	KCtbWVdjWJcBANIrB7gI4nsGykpt6wLjcseiwXfQ4NclaqDyirkIU8WUJg78K5teCp
	t2C+ktKfAXWYbyVhr+nN5W6ympZVeo9ny9zCGliwWTBuV6Z6bB/ntH2nvMd2An0va5
	qWqKCJlhX3fF6Caf5VywDa2hIhvk1FbQ2/Wh/IuefSWD9zt6onJFHin/FT0Rc0EgG8
	UcPCgvJgIRpd5M9mAOdxU6bP1CvyXW4xXt2tNESXN/Qm975cgXrPP+3vcU2PTTFIxB
	v2Ny4LDHs4XIbTF+H7z2poaAD5QexqeroUrIplyKyb7hCaeIBECztzC06if2W84/Ql
	MkCJ/w1c6HdY0kl7p6gacih2zky9mr1rXFoa5dmvlODXOWQe/8oLuxfG/HfdyTFxxz
	isKhNikl/Ta0yUQX9UIwF0us=
Date: Mon, 2 Dec 2019 17:10:51 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191202151051.GC1581@localhost>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-2-alex.kanavin@gmail.com>
	<33182b29-de6e-f918-2915-df016b854e81@intel.com>
MIME-Version: 1.0
In-Reply-To: <33182b29-de6e-f918-2915-df016b854e81@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/15] libdnf: upgrade 0.28.1 -> 0.38.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Dec 2019 15:10:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Dec 02, 2019 at 02:55:06PM +0000, Ross Burton wrote:
> FAILED: libdnf/CMakeFiles/libdnf.dir/dnf-context.cpp.o
> /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:2618:8:
> error: ‘atomic_flag’ in namespace ‘std’ does not name a type
>  static std::atomic_flag cfgMainLoaded = ATOMIC_FLAG_INIT;
>         ^
> /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:
> In function ‘libdnf::ConfigMain& libdnf::getGlobalMainConfig()’:
> /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:2622:10:
> error: ‘cfgMainLoaded’ was not declared in this scope
>      if (!cfgMainLoaded.test_and_set()) {
>           ^
> This was on a Centos 7 worker...

The build should also fail on Ubuntu 16.04.

Building with -std=gnu++11 should fix it (untested).

> Ross

cu
Adrian

