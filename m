Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id B6FD760670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 19:25:18 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id i138so22055090oig.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 11:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=qUory/aORCnQd/awA+CEZ/sbsxL0G7PXOwdkf1mZAag=;
	b=NNVifGpcKBV7hxFV5gN/03vD3vWJKmgoJcyxhWfWH+BGfqcJa1V4CXrfthY/xPq66t
	nJ0eSgWzC9TFv/5AMpCcZbvPLeKaYhk33sw8j+TG3UlzCDjMormB/K3Qx1WKVutJC3kn
	6WMm1B80GpjLcdkEqDrRuyEq5QLVz9D/5wHRZRG603sIpea8qrD1sXQk9WtTd1gY56e0
	pwq4pbrf7ZpyHJJMVYMyobDZR/B0k7qSC92Nk6OtRnkNzxV5ek9vg7Lu+dT5YmXgMeaX
	BR1HiDbBUD8yWt+/3ze806US8AgroNiLZtX2KOcbKqk42jr9UKoV3RNaetIi3JLk0Y7t
	qDMA==
MIME-Version: 1.0
X-Received: by 10.60.141.231 with SMTP id rr7mr18495127oeb.19.1421090719432;
	Mon, 12 Jan 2015 11:25:19 -0800 (PST)
Received: by 10.202.227.10 with HTTP; Mon, 12 Jan 2015 11:25:19 -0800 (PST)
Date: Mon, 12 Jan 2015 11:25:19 -0800
Message-ID: <CAJ86T=VV+SOyH-WW65Nb2cigL+kr+ne33RDStpOUxKZ_kiVSvA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joe Slater <jslater@windriver.com>
Subject: Nondeterministic acl support in coreutils 6.9
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
X-List-Received-Date: Mon, 12 Jan 2015 19:25:26 -0000
Content-Type: text/plain; charset=UTF-8

The GPLv2 coreutils recipe has PACKAGECONFIG support for acl, however
the coreutils 6.9 configure script doesn't seem to support
--disable-acl.

Build Configuration:
BB_VERSION        = "1.24.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "i586-rdk-linux"
MACHINE           = "vbox32"
DISTRO            = "rdk"
DISTRO_VERSION    = "2.0"
TUNE_FEATURES     = "m32 core2"
TARGET_FPU        = ""
meta-bsp-vbox     = "(nobranch):0bf672f55d7566541846f32878d87d232ce9e501"
meta-rdk          =
"(detachedfrom74057dd):74057dd18efb19601fdad551b5dc716a1c75bf43"
meta-metrological = "(nobranch):abbd111fee3ae1ade2fc2997ccda0eb9782da761"
meta-multimedia
meta-oe
meta-python
meta-networking
meta-ruby         = "(nobranch):200f6cafc878d4c26871fc56d21ecc8eaa9aa61b"
meta-qt5          =
"(detachedfrom41c5daa):41c5daa84af4466bfc9aa61f6f772c68470a628b"
meta              =
"(detachedfrom93d79fc):93d79fc162bd49387958e9e4d898dc4ba50d20b0"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: QA Issue: coreutils rdepends on libacl, but it isn't a build
dependency? [build-deps]

