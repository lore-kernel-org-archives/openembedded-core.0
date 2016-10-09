Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4647A719C1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Oct 2016 14:29:18 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id l131so5631325lfl.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2016 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qqHJVrl/LvsLHrknlpYJWrTuyGBJrq/tlPnQ8CGr9lY=;
	b=oTTwBtlQXvnlTSB8F12KauLt0S6U1XD1YzedbtwPGHog6gWh3hOk8r7DJbWnt8LbEW
	VUwr3rmrUtVJrRpaH0ul8iAJ+lLTTPz0H+vmF2wtbf1ngWxKPxC/Yuoh9zgfokNNwz2t
	7kDlWobr+ZJLbaJw2Sk3WPLcY5kwAILSg+NotZXG2M9/3Htyh83+QpQ15LX11yw+ndJA
	msY6PFu4j0wXziJ/VxrWdNXgV52xUemtKbGaY5b02I3wHsGyl0+r5p18ytToOFvBZKqo
	yJEBS7bEho7ON4JunPM0XG2gTC65mLZdJs/yidfYo6HSd676yvHqoweoBLb/5lZYgz/C
	KciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qqHJVrl/LvsLHrknlpYJWrTuyGBJrq/tlPnQ8CGr9lY=;
	b=Di5NNZX4fdfqeobLLlq8NYPEz8QWAnhEjTjm4elEpjJxBELAtl2m4IomnFqv8XxXjh
	wtQ15S7ij3sjcvaVQARlVAfsFCH7zeWf0jnxcFBVy5ZFZMTAzElc1b3X3GyXxBMiNU7n
	j3ueI3hKUW3pJnXfw3xiwWE3gvmIx2hI3RUcSYZZ7+/0pQDeRW9jqptb+S+xueaDvZmo
	DaPbtsk1MfqRpKcF8fPn6br/jimPUdkVWVFEz/hYTj/G1ehqe6rNbxLXgHktp/o+Skrb
	fY3n0z1KReMDpXHGgOiQuW8U+IzoweinaO7pV6JOC8Dn37XCM6goK1fRTBJIasSDgXyB
	p9ow==
X-Gm-Message-State: AA6/9RktA3lBsqrNvsOHFDnbZoybo/IGyYEECX8vRJDMeXlC6ZiKROCgGNF3YjPFvYvhbeHpLWMGwvG58Id14Q==
X-Received: by 10.194.87.34 with SMTP id u2mr30873120wjz.118.1476023358548;
	Sun, 09 Oct 2016 07:29:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.159.203 with HTTP; Sun, 9 Oct 2016 07:29:17 -0700 (PDT)
In-Reply-To: <f6ceb0b6-2c3c-652c-174a-c5b6881b6dd3@mlbassoc.com>
References: <1d898f50-ceb1-ca9d-ec79-e9f043a88c8f@mlbassoc.com>
	<f6ceb0b6-2c3c-652c-174a-c5b6881b6dd3@mlbassoc.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 9 Oct 2016 16:29:18 +0200
Message-ID: <CA+chaQd4QyJXUiy=1YkT3hX7DX56ULjibbywr45oFhjp1fxKKA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Serious build error
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
X-List-Received-Date: Sun, 09 Oct 2016 14:29:21 -0000
Content-Type: multipart/alternative; boundary=089e010d8a22f76fd1053e6f77ef

--089e010d8a22f76fd1053e6f77ef
Content-Type: text/plain; charset=UTF-8

Just grep Packages files in deploy/ipk dirs to find what package depends on
it, something might be autodetecting webkitgtk.

On Sun, Oct 9, 2016 at 1:32 PM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2016-10-09 13:24, Gary Thomas wrote:
>
>> Using Poky/Yocto rev 65107a9abe6c6c92c2c21e7dacfe4cc028ab7cb7
>> (2016-10-09), I get this
>> during do_rootfs for my image:
>>
>> Collected errors:
>>   * calculate_dependencies_for: Cannot satisfy the following dependencies
>> for epiphany:
>>   *      webkitgtk (>= 2.12.5) *
>>   * opkg_solver_install: Cannot install package epiphany.
>>
>> I'm not sure how to interpret this as webkitgtk v2.12.5-r0 is in my build?
>> I'm also not sure why the version pinning as the only reference I can find
>> for this is in .../meta/recipes-gnome/epiphany/epiphany_3.20.3.bb:
>>   DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi
>> libnotify gcr libwnck3 \
>>
>> I also didn't find any use of epiphany in any of the image recipes
>> in the default Poky/Yocto.  Is this actually being tested on a regular
>> basis?
>>
>>
> n.b. I do use epiphany in my [image] recipe, I just didn't see
> any use of it in any of the OE-core+Poky/Yocto recipes.
>
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e010d8a22f76fd1053e6f77ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just grep Packages files in deploy/ipk dirs to find what p=
ackage depends on it, something might be autodetecting webkitgtk.</div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Oct 9, 2016 a=
t 1:32 PM, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mailto:gary@mlbasso=
c.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><span class=3D"">On 2016-10-09 13:24, Gary Thomas w=
rote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Using Poky/Yocto rev 65107a9abe6c6c92c2c21e7dacfe4c<wbr>c028ab7cb7 (2016-10=
-09), I get this<br>
during do_rootfs for my image:<br>
<br>
Collected errors:<br>
=C2=A0 * calculate_dependencies_for: Cannot satisfy the following dependenc=
ies for epiphany:<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 webkitgtk (&gt;=3D 2.12.5) *<br>
=C2=A0 * opkg_solver_install: Cannot install package epiphany.<br>
<br>
I&#39;m not sure how to interpret this as webkitgtk v2.12.5-r0 is in my bui=
ld?<br>
I&#39;m also not sure why the version pinning as the only reference I can f=
ind<br>
for this is in .../meta/recipes-gnome/epiphan<wbr>y/<a href=3D"http://epiph=
any_3.20.3.bb" rel=3D"noreferrer" target=3D"_blank">epiphany_3.20.3.bb</a>:=
<br>
=C2=A0 DEPENDS =3D &quot;libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certifica=
tes avahi libnotify gcr libwnck3 \<br>
<br>
I also didn&#39;t find any use of epiphany in any of the image recipes<br>
in the default Poky/Yocto.=C2=A0 Is this actually being tested on a regular=
<br>
basis?<br>
<br>
</blockquote>
<br></span>
n.b. I do use epiphany in my [image] recipe, I just didn&#39;t see<br>
any use of it in any of the OE-core+Poky/Yocto recipes.<div class=3D"HOEnZb=
"><div class=3D"h5"><br>
<br>
-- <br>
------------------------------<wbr>------------------------------<br>
Gary Thomas=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 Consulting for the<br>
MLB Associates=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 Embedded world<br>
------------------------------<wbr>------------------------------<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--089e010d8a22f76fd1053e6f77ef--
