Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id BDD016E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:54:42 +0000 (UTC)
Received: by ioir85 with SMTP id r85so123105328ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fUMENJ7VCwAMEvl4F1chPCz6sl45cRZLKe94ClOD6gc=;
	b=FXJSWmNehGK84jIKXIzmuyV9N60Fm2E5xPJbAfQZOSn2rBt06al362y8JYQKIQyVgr
	Am1iLLR1mZHNrrobVpY5swvqb18U9FMWWHok6FvjcE1vXJbKtnuISJ5YOQvPjwD3h2d0
	6XT18HIRhfcv4RruNyPd2xLNy1+k7jpdm+q8oS2gaR3jI/2ftJdOh+J9C6Zup1NttQjh
	csVim42pKmvtMBU9Sgeh1ZwdjQh9qOF4eR835+yJJRr4bGNnjDULv+CKpsuknU4SGocU
	I0mXMjkIs/N6uB1jdE53YUJ3SBJO0Mf7HGrEaXMCSy0ONUvxME6WhmNgPuEej1n5wVlh
	K8GA==
X-Received: by 10.107.38.83 with SMTP id m80mr6464467iom.98.1447689282400;
	Mon, 16 Nov 2015 07:54:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.93.7 with HTTP; Mon, 16 Nov 2015 07:54:22 -0800 (PST)
In-Reply-To: <CAJTo0LZbY3d718R8WL4mLuS-hxKiWTgHYBNf51VPwUfbbNSeAw@mail.gmail.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
	<7dfc5c44d99054fd0f087bd1b4102aef0511029e.1447371033.git.chris_larson@mentor.com>
	<CAJTo0LZbY3d718R8WL4mLuS-hxKiWTgHYBNf51VPwUfbbNSeAw@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 16 Nov 2015 08:54:22 -0700
Message-ID: <CABcZANnm-hty1_MznJDsLLGWrSA2T+bpMxVG2mgEegeZJtbahg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] systemd: drop unneeded $D check in prerm
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
X-List-Received-Date: Mon, 16 Nov 2015 15:54:43 -0000
Content-Type: multipart/alternative; boundary=001a1140ca026c3b140524aa6d62

--001a1140ca026c3b140524aa6d62
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 16, 2015 at 8:18 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 12 November 2015 at 23:39, Christopher Larson <kergoth@gmail.com>
> wrote:
>
>> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
>> index 315c17f..1f5bbcc 100644
>> --- a/meta/classes/qemu.bbclass
>> +++ b/meta/classes/qemu.bbclass
>> @@ -50,3 +50,8 @@ QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e5500"
>>  QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e6500"
>>  QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e6500"
>>  QEMU_EXTRAOPTIONS_ppc7400   = " -cpu 7400"
>> +
>> +python () {
>> +    if "QEMU_EXTRAOPTIONS" in d and
>> d.expand("QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}") not in d and
>> d.getVar("PACKAGE_ARCH", True) != "all":
>> +        bb.fatal("Incorrect use of overrides rather than PACKAGE_ARCH
>> for QEMU_EXTRAOPTIONS")
>> +}
>>
>
> I think you meant to split this out.
>

Er, yes, no idea how I missed that when reviewing the diffs. That was meant
to stay local. Sorry about that.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1140ca026c3b140524aa6d62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Nov 16, 2015 at 8:18 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_=
extra"><span class=3D""><div class=3D"gmail_quote">On 12 November 2015 at 2=
3:39, Christopher Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gm=
ail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div style=3D"overflow:hidden">diff --git a/meta/=
classes/qemu.bbclass b/meta/classes/qemu.bbclass<br>
index 315c17f..1f5bbcc 100644<br>
--- a/meta/classes/qemu.bbclass<br>
+++ b/meta/classes/qemu.bbclass<br>
@@ -50,3 +50,8 @@ QEMU_EXTRAOPTIONS_ppc64e5500 =3D &quot; -cpu e5500&quot;<=
br>
=C2=A0QEMU_EXTRAOPTIONS_ppce6500 =3D &quot; -cpu e6500&quot;<br>
=C2=A0QEMU_EXTRAOPTIONS_ppc64e6500 =3D &quot; -cpu e6500&quot;<br>
=C2=A0QEMU_EXTRAOPTIONS_ppc7400=C2=A0 =C2=A0=3D &quot; -cpu 7400&quot;<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 if &quot;QEMU_EXTRAOPTIONS&quot; in d and d.expand(&quot;QEM=
U_EXTRAOPTIONS_${PACKAGE_ARCH}&quot;) not in d and d.getVar(&quot;PACKAGE_A=
RCH&quot;, True) !=3D &quot;all&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Incorrect use of overrides rath=
er than PACKAGE_ARCH for QEMU_EXTRAOPTIONS&quot;)<br>
+}</div></blockquote></div><br></span>I think you meant to split this out.<=
/div></blockquote></div><br>Er, yes, no idea how I missed that when reviewi=
ng the diffs. That was meant to stay local. Sorry about that.<br>-- <br><di=
v class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth =
at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintain=
er - Tslib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1140ca026c3b140524aa6d62--
