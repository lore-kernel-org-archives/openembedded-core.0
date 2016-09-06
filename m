Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2406D7761C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 15:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u86FQ95s012874; Tue, 6 Sep 2016 16:26:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4ITMj-czOMik; Tue,  6 Sep 2016 16:26:09 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u86FQ5Yg012871
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 6 Sep 2016 16:26:06 +0100
Message-ID: <1473175565.20226.54.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Joshua Lock
	<joshua.g.lock@intel.com>
Date: Tue, 06 Sep 2016 16:26:05 +0100
In-Reply-To: <CAP71WjwZ8Py3To_t+oEVuKNXEagshT2HBiZLL_FtgtCbgD9zBA@mail.gmail.com>
References: <cover.1472225461.git.joshua.g.lock@intel.com>
	<387803c1b2b8c0f2b3b29b55be61c27b52b4e7f0.1472225461.git.joshua.g.lock@intel.com>
	<CAP71WjwZ8Py3To_t+oEVuKNXEagshT2HBiZLL_FtgtCbgD9zBA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oe.path: preserve xattr in copytree() and copyhardlinktree()
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
X-List-Received-Date: Tue, 06 Sep 2016 15:26:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-09-06 at 17:22 +0200, Nicolas Dechesne wrote:
> What happens is that I am installing coreutils in my images, and i
> have a copy of 'cp' in my sysroot *and* I don't have xattrs in
> DISTRO_FEATURES. As a consequence the 'cp' command which is invoked
> does not have xattrs support, while my host 'cp' command has it...
> 
> e.g.
> 
> ~/work/oe-rpb-master/build-rpb$
> tmp-rpb-glibc/sysroots/x86_64-linux/usr/bin/cp -afl --preserve=xattr
> foo bar
> tmp-rpb-glibc/sysroots/x86_64-linux/usr/bin/cp: cannot preserve
> extended attributes, cp is built without xattr support
> 
> while this one works fine:
> 
> ~/work/oe-rpb-master/build-rpb$ cp -afl --preserve=xattr foo bar
> 
> Should we revert these patches or am I missing anything?

Did you have:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=92fc3ef9738165300a4daed4c90526dbbad43149

Cheers,

Richard

