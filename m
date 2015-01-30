Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E9FC060034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 04:24:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56867817"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jan 2015 12:20:54 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0U4Nh5R009273;
	Fri, 30 Jan 2015 12:23:43 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD01.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6;
	Fri, 30 Jan 2015 12:24:24 +0800
Date: Fri, 30 Jan 2015 12:24:21 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20150130122421.272fee84@Fedora>
In-Reply-To: <CAJ86T=VV+SOyH-WW65Nb2cigL+kr+ne33RDStpOUxKZ_kiVSvA@mail.gmail.com>
References: <CAJ86T=VV+SOyH-WW65Nb2cigL+kr+ne33RDStpOUxKZ_kiVSvA@mail.gmail.com>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Nondeterministic acl support in coreutils 6.9
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
X-List-Received-Date: Fri, 30 Jan 2015 04:24:25 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Mon, 12 Jan 2015 11:25:19 -0800
Andre McCurdy <armccurdy@gmail.com> wrote:

> The GPLv2 coreutils recipe has PACKAGECONFIG support for acl, however
> the coreutils 6.9 configure script doesn't seem to support
> --disable-acl.

I have the same problem. There's no QA waring aflter droping the PACKAGECONFIG.
I saw the commit message(8030fdc198c1037ae458899eebd14a4fae04c49a) and don'k
know what the  "CQID: 430353" means. Is this a number of bugzilla?
 
> Build Configuration:
> BB_VERSION        = "1.24.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "i586-rdk-linux"
> MACHINE           = "vbox32"
> DISTRO            = "rdk"
> DISTRO_VERSION    = "2.0"
> TUNE_FEATURES     = "m32 core2"
> TARGET_FPU        = ""
> meta-bsp-vbox     = "(nobranch):0bf672f55d7566541846f32878d87d232ce9e501"
> meta-rdk          =
> "(detachedfrom74057dd):74057dd18efb19601fdad551b5dc716a1c75bf43"
> meta-metrological = "(nobranch):abbd111fee3ae1ade2fc2997ccda0eb9782da761"
> meta-multimedia
> meta-oe
> meta-python
> meta-networking
> meta-ruby         = "(nobranch):200f6cafc878d4c26871fc56d21ecc8eaa9aa61b"
> meta-qt5          =
> "(detachedfrom41c5daa):41c5daa84af4466bfc9aa61f6f772c68470a628b"
> meta              =
> "(detachedfrom93d79fc):93d79fc162bd49387958e9e4d898dc4ba50d20b0"
> 
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: QA Issue: coreutils rdepends on libacl, but it isn't a build
> dependency? [build-deps]



-- 
Qian Lei

