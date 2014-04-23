Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7E665D50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 16:43:55 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id j5so1203699qga.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cSLJ734A3AYgOgHpUcz8hnE4JmIo4R+KAtaoo79IbK4=;
	b=xBcm1pL4PH9QE4MbW2MDRP7rgLYFKr6Os9pV2HFiuFVVy89Udhy1LNH+qDTH/DiuDa
	F3LYSceHGYUIifxcuSy5Ce/zsMFVFXX1Bp8fMCxI6anMiya0OXY4wwZEOLBT6Jq9Q5/E
	FGiv2XRIsC0bCatQXCzx4mowddsDg3CFWVVmqRRSD1yBP4+gu45eXs3+Fxi23MCHjudX
	CG/iB1g1IPob8M4RV5RuE8HCWx4vrac1OTEEDgs+L6WwOYUmJdbzffo+d4dXE6DyESbz
	9jWf62ylRHX8xFhjBM7kKBadFlXz+EjSdbES0FxsQ0ktoxTa9gi3md7NUnazOTKKPGY4
	tk9g==
MIME-Version: 1.0
X-Received: by 10.140.48.173 with SMTP id o42mr55941529qga.68.1398271436169;
	Wed, 23 Apr 2014 09:43:56 -0700 (PDT)
Received: by 10.96.148.2 with HTTP; Wed, 23 Apr 2014 09:43:56 -0700 (PDT)
In-Reply-To: <5357EBAE.6040408@linux.intel.com>
References: <CACS+7ZR=mA9+=NzxF=XLXvxxgypsjzcftZQ0UVWG-0rBLk202A@mail.gmail.com>
	<5357EBAE.6040408@linux.intel.com>
Date: Wed, 23 Apr 2014 10:43:56 -0600
Message-ID: <CACS+7ZQOx4JqsRERztKBgFrNZTkQmdG0CoGN0DbdxZxWy75NDg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] systemd: fix tests when not using gold
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
X-List-Received-Date: Wed, 23 Apr 2014 16:43:58 -0000
Content-Type: multipart/alternative; boundary=001a1135346440a85a04f7b8700f

--001a1135346440a85a04f7b8700f
Content-Type: text/plain; charset=UTF-8

On 23 April 2014 10:34, Saul Wold <sgw@linux.intel.com> wrote:

> On 04/23/2014 08:01 AM, Dan McGregor wrote:
>
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>> Explicitly mark the dummy function as externally visible
>> so that ld can find the symbol at link time. This is needed
>> when the DISTRO_FEATURE ld-is-gold is not enabled; systemd
>> uses -flto anyway.
>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> ---
>>   meta/recipes-core/systemd/systemd/systemd-lto-fix.patch | 14
>> ++++++++++++++
>>   meta/recipes-core/systemd/systemd_211.bb                |  1 +
>>   2 files changed, 15 insertions(+)
>>   create mode 100644 meta/recipes-core/systemd/
>> systemd/systemd-lto-fix.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>> b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>> new file mode 100644
>> index 0000000..90875e4
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>>
>
> The patch also needs an appropriate Upstream-Status and Signed-off-by tags
> here.
>
> Thanks
>         Sau!
>
>
As I said to Ross off-list (accidentally), this patch was for Linaro GCC as
of 2014-03-20. I'm going to check that it's still vald, and if so I'll send
it upstream too.

Thanks,

--001a1135346440a85a04f7b8700f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
3 April 2014 10:34, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@l=
inux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<div class=3D"">On 04/23/2014 08:01 AM, Dan McGregor wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca" target=3D"_=
blank">dan.mcgregor@usask.ca</a>&gt;<br>
<br>
Explicitly mark the dummy function as externally visible<br>
so that ld can find the symbol at link time. This is needed<br>
when the DISTRO_FEATURE ld-is-gold is not enabled; systemd<br>
uses -flto anyway.<br>
<br>
Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca" ta=
rget=3D"_blank">dan.mcgregor@usask.ca</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-core/systemd/<u></u>systemd/systemd-lto-fix.patch | 14 =
++++++++++++++<br>
=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_211.bb" target=
=3D"_blank">syst<u></u>emd_211.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A01 +<br>
=C2=A0 2 files changed, 15 insertions(+)<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/<u></u>systemd/systemd-=
lto-fix.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/<u></u>systemd/systemd-lto-fix.patch=
<br>
b/meta/recipes-core/systemd/<u></u>systemd/systemd-lto-fix.patch<br>
new file mode 100644<br>
index 0000000..90875e4<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/<u></u>systemd/systemd-lto-fix.patch<br>
</blockquote>
<br></div>
The patch also needs an appropriate Upstream-Status and Signed-off-by tags =
here.<br>
<br>
Thanks<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br=
></div></div></blockquote></div><br></div><div class=3D"gmail_extra">As I s=
aid to Ross off-list (accidentally), this patch was for Linaro GCC as of 20=
14-03-20. I&#39;m going to check that it&#39;s still vald, and if so I&#39;=
ll send it upstream too.<br>
<br></div><div class=3D"gmail_extra">Thanks,<br></div></div>

--001a1135346440a85a04f7b8700f--
