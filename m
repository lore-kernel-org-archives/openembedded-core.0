Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjorn.forsman@gmail.com>) id 1Tkxn8-0001Ve-QG
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 15:05:06 +0100
Received: by mail-ee0-f54.google.com with SMTP id c13so357499eek.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 05:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=+wkeWNnv8KyuoGBlRnApr2k7af+QiMu0VmDbjaccWpQ=;
	b=NEVl0bJw4wERauQ8fGBxrBBDKJEsfFu/K06/i8lZRIgBglD4GYPw/qHJSaJv70qSw4
	R/Iek4up+jQurerki/jW1Qpw48jQzJlIXK3EBWgkn9TdJAxWttv8aS5m9/qhBw4y5loS
	SPlXzKyDDECh+sWyxY7lNK2EbNAcJJHUrgswGbbI3JC5SbrVKLdDhcwheREbjbUWAA9X
	zSGVpBMZbMxg8J5xLLyBl37HpI4qE65NK0pCsQ3OKmuzi96d+YF3/c4CrrpDza1P6KAx
	MlY3dBCGbqXm/yDWbZR938/v5X6v9VpBopq55N3E9GIun/1HNBuXBIKyxXCT5i4J0VVv
	ygUQ==
MIME-Version: 1.0
Received: by 10.14.215.197 with SMTP id e45mr5990875eep.0.1355838625052; Tue,
	18 Dec 2012 05:50:25 -0800 (PST)
Received: by 10.14.135.145 with HTTP; Tue, 18 Dec 2012 05:50:24 -0800 (PST)
In-Reply-To: <50CF9ABE.3000508@windriver.com>
References: <CAEYzJUHZYS8cA3KRRM2L+etHxAOxaU=vBzgaRbUc9hSg8AJODA@mail.gmail.com>
	<50CF3D03.3040301@windriver.com>
	<CAEYzJUGVz4DTiqa8V6tOtQCg53C4TQ_zPb5jh6gEWks1+xP4vg@mail.gmail.com>
	<CAEYzJUG1fnyG53nx7DXYhSCnoxw44nW_hZXQX-gKij525dPYdA@mail.gmail.com>
	<50CF9ABE.3000508@windriver.com>
Date: Tue, 18 Dec 2012 14:50:24 +0100
Message-ID: <CAEYzJUGy1LR0YomqNEKnYPtVWAtMUpC=R21vZRZAx-SSe8GVVg@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK confusion!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 14:05:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 December 2012 23:20, Mark Hatle <mark.hatle@windriver.com> wrote:
[...]
> This is Yocto Project 1.2, the feature arrived sometime between 1.2 and 1=
.3.
>
> The 'danny' branch is 1.3, 'denzil' is 1.2.  I may have said 'denzil' by
> accident in the last email.
>
> Basically you need a newer oe-core to use this feature, or you need to
> backport it.

Ok. I have switched branches now and got it working for
core-image-minimal. Thanks.

However, the systemd-image in Angstrom has an issue that breaks
"bitbake systemd-image -c populate_sdk". I have posted a message on
their list just now. But basically, the error is this:

$ bitbake systemd-image -c populate_sdk
[...]
| Package netbase-dbg (5.0-r1) installed in root is up to date.
| Collected errors:
|  * check_conflicts_for: The following packages conflict with openssh:
|  * check_conflicts_for: 	dropbear *
|  * opkg_install_cmd: Cannot install package openssh-dev.
|  * check_conflicts_for: The following packages conflict with openssh:
|  * check_conflicts_for: 	dropbear *
|  * opkg_install_cmd: Cannot install package openssh-dbg.
| DEBUG: Python function do_populate_sdk finished
| ERROR: Function failed: populate_sdk_image (see
/home/bfo/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/beaglebone-=
angstrom-linux-gnueabi/systemd-image-1.0-r0/temp/log.do_populate_sdk.18052
for further information)
ERROR: Task 10 (/home/bfo/setup-scripts/sources/meta-angstrom/recipes-image=
s/angstrom/systemd-image.bb,
do_populate_sdk) failed with exit code '1'

Best regards,
Bj=C3=B8rn Forsman


