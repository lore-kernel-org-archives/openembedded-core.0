Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id B9FA76022E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 09:24:33 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id p16so43697115qta.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 01:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BQbpqODhJzxyIrCdiifjV+WdvVV3UKvKYf7T0CTGdEM=;
	b=oDGILGiIREhAKwoiNe0+FwoPJUNnmC0JTmpCfOE2GESh17Sz+v9j6vwL1aKi826UcS
	VK8SYbi7ahmXErA6DQeuO9AzWFtDtBpT1HYQZGhubNh1oiOeiwSrK+1VLtSGItEsXyRv
	Wv4UXz1CJiTBCb/F86lvEmQ3HoNkV2DfDHXKWtyyrFxy3jss/sZINDCyrozTXH+T6zwJ
	Jn7H5zDK6Ur9aFvRqlrC2IKizQ5cemkzXW3eiKmTaF0hlWJNA4kiesjWDHNLVeCbtqCY
	VK2MR+8SeETKyqOyoXI6VX37e3nA6yGwjtbhHhfjaj1qbKtkaoghtUn8bY5z8oudA7qm
	gAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BQbpqODhJzxyIrCdiifjV+WdvVV3UKvKYf7T0CTGdEM=;
	b=Ud2q/QTksFHTWLrIP+e/I5zQanregLNNUj9HgrRRFm7rXECfrVbWRDhaARlMxeczkS
	lukyU6rQNnXkHHogbL4gwV9QA57PTt0UnmoVwVnKDXsdeSBkD+AfT3tgbLk8bceZV2p8
	RLxCyE5jo39FEBs8t8u7xnkgVB0JMLXM1MbLWyvCl7q8WAjLUER+NEHcejPF4vdZdyob
	nQZF3PjibH5iz+3eaA9Q/vEbSHJcM3p9GT5IbIJcD28A/OWaJckISYXh7WUNJijMkkOJ
	SfGaeWXzVC0Qr4Kwug8GD30beRutAaxvTuHKDwFHERU0kHkjzaUrPwUWFdgmfgyPDpsS
	pagQ==
X-Gm-Message-State: ABUngve8/1Xe2tY7eZ1Ku+qySMQCS22c33dnVOT2H2dZcJEWGhU62HpNPe+K6Nqb00dYSkQxuoT9ev9UTITX5eC7
X-Received: by 10.200.57.54 with SMTP id s51mr10082387qtb.68.1479115475143;
	Mon, 14 Nov 2016 01:24:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 14 Nov 2016 01:24:14 -0800 (PST)
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Nov 2016 09:24:14 +0000
Message-ID: <CAJTo0LZiXenXy8WC28z+5a4+ibJekaqeD+0_O84aejyi9XNH4w@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 00/10] wic: bugfixes & --fixed-size support, tests, selftest: minor fixes
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
X-List-Received-Date: Mon, 14 Nov 2016 09:24:34 -0000
Content-Type: multipart/alternative; boundary=001a113a01e87a699305413f6859

--001a113a01e87a699305413f6859
Content-Type: text/plain; charset=UTF-8

On 10 November 2016 at 12:18, Maciej Borzecki <maciej.borzecki@rndity.com>
wrote:

> v2 of patch series previously posted here [1].
>
> The series introduces anumber of fixes to wic, as well as a new
> --fixed-size
> option applicable to `part` entries in kickstart files. The option makes it
> possible to have a fixed size partition, with additional verification that
> the
> file system image fits into the allocated disk space. This is in cotrast
> with
> --size option, which the minimum size, and partition may in fact be larger
> in
> the final disk image.
>
> The series introduces two tests that verify if wic has created the image
> with
> properly sized partition and that partition size checks work as expected.
>
> Patch `oe-selftest: fix handling of test cases without ID in
> --list-tests-by` is
> a small bugfix for oe-selftes tool which resolves an issue triggered by
> Python
> 3.x being more strict than 2.x.
>

This series appears to be causing selftest to fail on the autobuilders:

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/732/steps/Running%20oe-selftest/logs/stdio

Ross

--001a113a01e87a699305413f6859
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2016 at 12:18, Maciej Borzecki <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maciej.borzecki@rndity.com" target=3D"_blank">maciej.borzecki@rn=
dity.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:3t" =
class=3D"gmail-a3s gmail-aXjCH gmail-m1584e3562a4c9c01">v2 of patch series =
previously posted here [1].<br>
<br>
The series introduces anumber of fixes to <span class=3D"gmail-il">wic</spa=
n>, as well as a new --fixed-size<br>
option applicable to `part` entries in kickstart files. The option makes it=
<br>
possible to have a fixed size partition, with additional verification that =
the<br>
file system image fits into the allocated disk space. This is in cotrast wi=
th<br>
--size option, which the minimum size, and partition may in fact be larger =
in<br>
the final disk image.<br>
<br>
The series introduces two tests that verify if <span class=3D"gmail-il">wic=
</span> has created the image with<br>
properly sized partition and that partition size checks work as expected.<b=
r>
<br>
Patch `oe-selftest: fix handling of test cases without ID in --list-tests-b=
y` is<br>
a small bugfix for oe-selftes tool which resolves an issue triggered by Pyt=
hon<br>
3.x being more strict than 2.x.</div></blockquote></div><div class=3D"gmail=
_extra"><br></div>This series appears to be causing selftest to fail on the=
 autobuilders:</div><div class=3D"gmail_extra"><br><a href=3D"https://autob=
uilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/732/steps/=
Running%20oe-selftest/logs/stdio">https://autobuilder.yoctoproject.org/main=
/builders/nightly-oe-selftest/builds/732/steps/Running%20oe-selftest/logs/s=
tdio</a><br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a113a01e87a699305413f6859--
