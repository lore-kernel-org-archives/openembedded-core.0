Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 326D26FA94
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 02:30:14 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id a41so3820933yho.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Sep 2014 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=q3X39wOLR3ZE1sD7PElUVNTvn8919JUXq3tEoZWO8wg=;
	b=CslDR0UXcGfnh/PJlF/PxR80YDazZ/1Q4HfbgoemwFP+javXSce8mpvGYX+iproaiN
	DgBzb0Zhr2a6gC1YRqZ361+kbP/C4yykjwnUye7kLF4FMfYKV5rXLeXsd9lb6j4aZzk4
	UU3gBFyrvEqhwKSof9FvESsjk+PJcAYpIjkejczgP+rlU3fbaIRjXTQ8q3D4Vzw2J8rz
	enuEvnK2ggieJsJL1VWT73jCu49lQX70f8bYj9WbOMt5qTK/lNjJ8wUSsXr0gHJaBN6w
	6HzEam/Ss/7KHJMcx2fu98rIgEWdWdVfLBBr7J6GrHp2nv1eiUzowLoi59srfdnvbLrK
	BRFg==
MIME-Version: 1.0
X-Received: by 10.236.26.7 with SMTP id b7mr17217188yha.72.1409625015876; Mon,
	01 Sep 2014 19:30:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 1 Sep 2014 19:30:15 -0700 (PDT)
Date: Mon, 1 Sep 2014 23:30:15 -0300
X-Google-Sender-Auth: e7TUflc5JhwlFH4TCfkPqGx4atw
Message-ID: <CAP9ODKpWHy4XW6OVs34=-p+GRK6iOLvgsAqr22obSAaj9_2SDQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Error while building qemu without X11 support.
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
X-List-Received-Date: Tue, 02 Sep 2014 02:30:22 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

During our regression tests we found the following error:

directfb fsl-image-machine-test@imx6qsabresd (1/4) consider defining a
PREFERRED_PROVIDER entry to match jpeg
directfb fsl-image-machine-test@imx6qsabresd (1/4) ERROR: Nothing
PROVIDES 'libxext-native' (but
virtual:native:.../sources/poky/meta/recipes-devtools/qemu/qemu_2.1.0.bb
DEPENDS on or otherwise requires it)
directfb fsl-image-machine-test@imx6qsabresd (1/4) ERROR:
libxext-native was skipped: missing required distro feature 'x11' (not
in DISTRO_FEATURES)
directfb fsl-image-machine-test@imx6qsabresd (1/4) Runtime target
'pango' is unbuildable, removing...
directfb fsl-image-machine-test@imx6qsabresd (1/4) Missing or
unbuildable dependency chain was: ['pango', 'qemu-native',
'libxext-native']
directfb fsl-image-machine-test@imx6qsabresd (1/4) Runtime target
'packagegroup-core-directfb' is unbuildable, removing...

Do someone know how to fix it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

