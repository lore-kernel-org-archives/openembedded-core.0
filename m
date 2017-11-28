Return-Path: <liu.ming50@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id E1CDF6AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 01:02:56 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id c123so24630812qkf.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 17:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p5PUZ1WZ57ifdHMJezriYaNVPCtXP+LS8qSoWhvokL0=;
	b=oM20wmTTo39rtRL2WwjXLKJqdQaT7hkaddnN0q/Bn3R494KNRXDE00Sqtv3g3TQsvL
	jy0EW0HZWZ+NqDxi3c6Qjjrk9S8BlbUNnBrpvmYONfcpsXyVoeiKzWLaX1Gx5X7aodRu
	UdfnKK0FAdl0ZSczbebVTjm0KfXkyuk9pkmSZdhfgw9Q8mfymQdeGY1dE6gCxZhctfql
	YmbiWA+LBJ9rZZSEzqToR81YOEMLF1erDALXDLjrkxjs8eLbYlBHXlV/KB9eE+xP7LlU
	abdlFNb4CwPCDv1iK4OEBn2x+8VsVbvjyEWzhUI0woJhycWwFRnhwzgdeEYtcrSlNFv7
	epmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p5PUZ1WZ57ifdHMJezriYaNVPCtXP+LS8qSoWhvokL0=;
	b=nrHzlwQf4poswPb+HrX6+4lqR3oTLpdM/AEbV+Q1izBmv149Kq+XbcITUNRHQ0mQEr
	Lz/XC0urmjRHjk9y0VmK0WC/xQd+IBsNHX2wcbllX50D6cMLV1mRoPWMjz2IEcY84E+G
	0OGXv09Y2t3OyoKu87/pJzeqvMd32g4Q7uhhi5awXrqtCqbCN3QQqyhg5qOZnk44tDKs
	aRDuBZGkd1hNLVUetbLV1lmVAORU/dUhbHuxspxTZKwJMBs31/raAjtBh1b5dq3Nodki
	7dFdF34YgC86TQ1iacxgZK/yNZVYh8x9LV3cRLsG95FJjFNvxlC/lDYHCiOn+yClXhIy
	P5DA==
X-Gm-Message-State: AJaThX7MMVqcali1qLQkEaXlRuNETmOnjFHa3XMdB/UB0XTdkYN1Vxx4
	fnjpiCconic6B8Ra4EApW3C3DDPJxwAKc7QT4yQ=
X-Google-Smtp-Source: AGs4zMY0XonVKUg/Gxh/Ryv/fVqY+VMNwL1hzAqq4snjiJc7BTryFEwWRiGnucLBhmfhCUO+3D1g9xrM6eD9PbayP7A=
X-Received: by 10.55.70.77 with SMTP id t74mr33097737qka.342.1511830977835;
	Mon, 27 Nov 2017 17:02:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.38.132 with HTTP; Mon, 27 Nov 2017 17:02:57 -0800 (PST)
In-Reply-To: <CADkTA4N1Zci8nuXLRecGW6Pk0P9MvaY3Luob=jTQWdvnb70hxA@mail.gmail.com>
References: <1511787260-2490-1-git-send-email-liu.ming50@gmail.com>
	<CADkTA4N1Zci8nuXLRecGW6Pk0P9MvaY3Luob=jTQWdvnb70hxA@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 28 Nov 2017 09:02:57 +0800
Message-ID: <CALatG=592Jf8+T6uY-qFCyYXJS9ro5xg9aBbd1RRuCqe_zKg4w@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto: drop KCONF_BSP_AUDIT_LEVEL
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
X-List-Received-Date: Tue, 28 Nov 2017 01:02:57 -0000
Content-Type: multipart/alternative; boundary="001a114ab57064f5d8055f009490"

--001a114ab57064f5d8055f009490
Content-Type: text/plain; charset="UTF-8"

Hi, Bruce:

OK, got that.

//Ming Liu

2017-11-27 21:36 GMT+08:00 Bruce Ashfield <bruce.ashfield@gmail.com>:

> Nope.
>
> This flag can stay. I have new audit code coming that will use it again ..
> that's
> why it was left in the first place.
>
> Cheers,
>
> Bruce
>
> On Mon, Nov 27, 2017 at 7:54 AM, <liu.ming50@gmail.com> wrote:
>
>> From: Ming Liu <liu.ming50@gmail.com>
>>
>> The warning that this flag was trying to control, it had been dropped
>> by commit 0f698dfd:
>> [ kernel-yocto: streamline patch, configuration and audit phases ]
>>
>> so this flag is useless since that commit merged, drop it as well.
>>
>> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>> ---
>>  meta/classes/kernel-yocto.bbclass                  | 1 -
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 1 -
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 1 -
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    | 1 -
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 1 -
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 1 -
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 1 -
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  | 1 -
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 1 -
>>  meta/recipes-kernel/linux/linux-yocto.inc          | 1 -
>>  meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 1 -
>>  meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 1 -
>>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 1 -
>>  meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 1 -
>>  14 files changed, 14 deletions(-)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/
>> kernel-yocto.bbclass
>> index 1d44795..1c3b778 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -322,7 +322,6 @@ python do_kernel_configcheck() {
>>      ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
>>
>>      config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
>> -    bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
>>
>>      # if config check visibility is non-zero, report dropped
>> configuration values
>>      mismatch_file = d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>> index f93d953..0c388d5 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
>> @@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.10.17"
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  LINUX_KERNEL_TYPE = "preempt-rt"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>> index 983c1cc..e7172a5 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
>> @@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.12.14"
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  LINUX_KERNEL_TYPE = "preempt-rt"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> index c1cbf35..9c23a3f 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> @@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.4.93"
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  LINUX_KERNEL_TYPE = "preempt-rt"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>> index b6c98a5..0ef43cd 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
>> @@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.9.57"
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  LINUX_KERNEL_TYPE = "preempt-rt"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
>> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
>> index edaf853..39b58cd 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
>> @@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
>>  LINUX_VERSION ?= "4.10.17"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  SRCREV_machine ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
>>  SRCREV_meta ?= "40ee48ac099c04f60d2c132031d9625a4e0c4c9e"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
>> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
>> index 658ecc0..ed61756 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
>> @@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
>>  LINUX_VERSION ?= "4.12.14"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  SRCREV_machine ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
>>  SRCREV_meta ?= "cebe198870d781829bd997a188cc34d9f7a61023"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
>> index dd38095..7491ed2 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
>> @@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
>>  LINUX_VERSION ?= "4.4.93"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  SRCREV_machine ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
>>  SRCREV_meta ?= "ae0119a2ff737b8c14bdf904b4c6eb790a7792cb"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
>> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
>> index 79b8bfd..34ffdb4 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
>> @@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
>>  LINUX_VERSION ?= "4.9.57"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  SRCREV_machine ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
>>  SRCREV_meta ?= "cdbd35c54b6a62e4fd543164f1dcdf92c85cff2d"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>> b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 9c1f61b..07b9af7 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -46,7 +46,6 @@ SRCREV_FORMAT ?= "meta_machine"
>>  #   1: report options that are specified, but not in the final config
>>  #   2: report options that are not hardware related, but set by a BSP
>>  KCONF_AUDIT_LEVEL ?= "1"
>> -KCONF_BSP_AUDIT_LEVEL ?= "0"
>>  KMETA_AUDIT ?= "yes"
>>
>>  LINUX_VERSION_EXTENSION ??= "-yocto-${LINUX_KERNEL_TYPE}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
>> b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
>> index 7fcc753..f5b777e 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
>> @@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.10.17"
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
>> b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
>> index a7dd763..493eb99 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
>> @@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.12.14"
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> index 4d8d3da..dbe9665 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
>> @@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.4.93"
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qem
>> uppc|qemumips|qemumips64|qemux86-64"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
>> b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
>> index 2486792..479064a 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
>> @@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.9.57"
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>  KMETA = "kernel-meta"
>> -KCONF_BSP_AUDIT_LEVEL = "2"
>>
>>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--001a114ab57064f5d8055f009490
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi, Bruce:<br><br></div>OK, got that.<br><br></d=
iv>//Ming Liu<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">2017-11-27 21:36 GMT+08:00 Bruce Ashfield <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gma=
il.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">N=
ope.=C2=A0<div><br></div><div>This flag can stay. I have new audit code com=
ing that will use it again .. that&#39;s</div><div>why it was left in the f=
irst place.</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce=
<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div cla=
ss=3D"h5">On Mon, Nov 27, 2017 at 7:54 AM,  <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>=
&gt;</span> wrote:<br></div></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><di=
v class=3D"h5">From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" t=
arget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
<br>
The warning that this flag was trying to control, it had been dropped<br>
by commit 0f698dfd:<br>
[ kernel-yocto: streamline patch, configuration and audit phases ]<br>
<br>
so this flag is useless since that commit merged, drop it as well.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.bbc<wbr>lass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" r=
el=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto-rt_4.10.bb</a>=C2=A0 =
=C2=A0| 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto-rt_4.12.bb</a>=C2=A0 =
=C2=A0| 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto-rt_4.4.bb</a>=C2=A0 =C2=
=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" re=
l=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto-rt_4.9.bb</a>=C2=A0 =C2=
=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto-tiny_4.10.bb</a> | 1=
 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto-tiny_4.12.bb</a> | 1=
 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto-tiny_4.4.bb</a>=C2=A0=
 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.9.bb" =
rel=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto-tiny_4.9.bb</a>=C2=A0=
 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/lin<wbr>ux-yocto.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.10.bb" rel=
=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto_4.10.bb</a>=C2=A0 =C2=A0=
 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto_4.12.bb</a>=C2=A0 =C2=A0=
 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto_4.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">lin<wbr>ux-yocto_4.9.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A014 files changed, 14 deletions(-)<br>
<br>
diff --git a/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yocto.b=
b</a><wbr>class b/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yo=
cto.bb</a><wbr>class<br>
index 1d44795..1c3b778 100644<br>
--- a/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yocto.bb</a><w=
br>class<br>
+++ b/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yocto.bb</a><w=
br>class<br>
@@ -322,7 +322,6 @@ python do_kernel_configcheck() {<br>
=C2=A0 =C2=A0 =C2=A0ret, result =3D oe.utils.getstatusoutput(&quot;%s%s<wbr=
>&quot; % (pathprefix, cmd))<br>
<br>
=C2=A0 =C2=A0 =C2=A0config_check_visibility =3D int(d.getVar(&quot;KCONF_AU=
DIT_LEVE<wbr>L&quot;) or 0)<br>
-=C2=A0 =C2=A0 bsp_check_visibility =3D int(d.getVar(&quot;KCONF_BSP_AUDIT_=
<wbr>LEVEL&quot;) or 0)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# if config check visibility is non-zero, report droppe=
d configuration values<br>
=C2=A0 =C2=A0 =C2=A0mismatch_file =3D d.expand(&quot;${S}/%s/cfg/mismatch<w=
br>.txt&quot; % kmeta)<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a> =
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a><br>
index f93d953..0c388d5 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a><br>
@@ -22,7 +22,6 @@ LINUX_VERSION ?=3D &quot;4.10.17&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a> =
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
index 983c1cc..e7172a5 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
@@ -22,7 +22,6 @@ LINUX_VERSION ?=3D &quot;4.12.14&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4=
.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb</a> b/=
meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb</a><br>
index c1cbf35..9c23a3f 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb</a><br>
@@ -22,7 +22,6 @@ LINUX_VERSION ?=3D &quot;4.4.93&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9=
.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb</a> b/=
meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb</a><br>
index b6c98a5..0ef43cd 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb</a><br>
@@ -22,7 +22,6 @@ LINUX_VERSION ?=3D &quot;4.9.57&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.10.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.10.bb<=
/a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.10.bb</a><br>
index edaf853..39b58cd 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.10.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.10.bb</a><br>
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.10.17&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;c1d8c4408b8aedd88eeb6ccc89ce8<wbr>34dd41b3f=
09&quot;<br>
=C2=A0SRCREV_meta ?=3D &quot;40ee48ac099c04f60d2c132031d96<wbr>25a4e0c4c9e&=
quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.12.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb<=
/a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb</a><br>
index 658ecc0..ed61756 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb</a><br>
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.12.14&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;9cc6b0ae1aad7312e85ac4134398f<wbr>81c0140de=
33&quot;<br>
=C2=A0SRCREV_meta ?=3D &quot;cebe198870d781829bd997a188cc3<wbr>4d9f7a61023&=
quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.4.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.4.bb</a=
> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.4.bb</a><br>
index dd38095..7491ed2 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.4.bb</a><br>
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.4.93&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;f070447fb60b5b939c94583d7c05f<wbr>55ec2b37a=
cd&quot;<br>
=C2=A0SRCREV_meta ?=3D &quot;ae0119a2ff737b8c14bdf904b4c6e<wbr>b790a7792cb&=
quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.9.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.9.bb</a=
> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.9.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.9.bb</a><br>
index 79b8bfd..34ffdb4 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.9.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.9.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.9.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.9.bb</a><br>
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yoc<wbr>to.inc<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.9.57&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;cd8f9254aaaacbfa7f45fcc0bf2bb<wbr>307615a17=
4b&quot;<br>
=C2=A0SRCREV_meta ?=3D &quot;cdbd35c54b6a62e4fd543164f1dcd<wbr>f92c85cff2d&=
quot;<br>
diff --git a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc b/meta/recipes-=
kernel/linux/li<wbr>nux-yocto.inc<br>
index 9c1f61b..07b9af7 100644<br>
--- a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
@@ -46,7 +46,6 @@ SRCREV_FORMAT ?=3D &quot;meta_machine&quot;<br>
=C2=A0#=C2=A0 =C2=A01: report options that are specified, but not in the fi=
nal config<br>
=C2=A0#=C2=A0 =C2=A02: report options that are not hardware related, but se=
t by a BSP<br>
=C2=A0KCONF_AUDIT_LEVEL ?=3D &quot;1&quot;<br>
-KCONF_BSP_AUDIT_LEVEL ?=3D &quot;0&quot;<br>
=C2=A0KMETA_AUDIT ?=3D &quot;yes&quot;<br>
<br>
=C2=A0LINUX_VERSION_EXTENSION ??=3D &quot;-yocto-${LINUX_KERNEL_TYPE}&quot;=
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.10.b=
b" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.10.bb</a> b/meta=
/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.10.bb" rel=3D"norefer=
rer" target=3D"_blank">li<wbr>nux-yocto_4.10.bb</a><br>
index 7fcc753..f5b777e 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.10.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.10.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.10.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.10.bb</a><br>
@@ -29,7 +29,6 @@ LINUX_VERSION ?=3D &quot;4.10.17&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.b=
b" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a> b/meta=
/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=3D"norefer=
rer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a><br>
index a7dd763..493eb99 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a><br>
@@ -29,7 +29,6 @@ LINUX_VERSION ?=3D &quot;4.12.14&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.4.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=3D"noreferrer=
" target=3D"_blank">li<wbr>nux-yocto_4.4.bb</a><br>
index 4d8d3da..dbe9665 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.4.bb</a><br>
@@ -29,7 +29,6 @@ LINUX_VERSION ?=3D &quot;4.4.93&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|qem<wbr>uppc|q=
emumips|qemumips64|qemux<wbr>86-64&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=3D"noreferrer=
" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a><br>
index 2486792..479064a 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a><br>
@@ -29,7 +29,6 @@ LINUX_VERSION ?=3D &quot;4.9.57&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
</div></div><span class=3D"m_-2123488700047007755HOEnZb"><font color=3D"#88=
8888"><br>
--<br>
2.7.4<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><span class=3D"HOEnZb"><font=
 color=3D"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"m_-2123488700047007755gmail_signature" data-smartmail=3D"gmail_signatur=
e">&quot;Thou shalt not follow the NULL pointer, for chaos and madness awai=
t thee at its end&quot;</div>
</font></span></div></div></div>
</blockquote></div><br></div>

--001a114ab57064f5d8055f009490--
