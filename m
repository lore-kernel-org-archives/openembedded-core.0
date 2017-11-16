Return-Path: <vlsireddy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C828C787BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:41:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b189so2177876wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RAeFVOrj6UI7PqXr545a7biXgO4uAlsBXOP8tkXDUDw=;
	b=e3W8BKVJEcB/AhIz6jQTRmD6TCJLVHgqvNOWQzLTpOZIO2eaeGDzi4eSoKDbVSHEs6
	RopCZCBJ8bRiQgky1b78TEgr8kNX15sNKZUO7gknOlU0vkgPz60RYL2gnI1CKYC/3Jtk
	yBmca8jXisy8IfsJd4d8cE6yB66kQXRX4263sXkO+Z/7XmFhuW7lctZJ3l4GtYlbI043
	Ae1cN6vX65zn/QQSyBHeARYmKiV6YU6EOfKUinnIPWRqwFSvXPrYq7MVKNTJ29DV2zKa
	hpgXUabJM9x1hB0OhwBJL1ktdni2lDeb2T7VzZ5TOv9KzxN2hn77AjOs/BOnTw8sXL0T
	VpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RAeFVOrj6UI7PqXr545a7biXgO4uAlsBXOP8tkXDUDw=;
	b=IWy+8XbaMubWNuhX2Jmt1XKOHhL8v/WYJXSHZ2B3HT0DCyRNcHx/F2DfSohbLKt2YQ
	+FfsnrXx4VjpwbFDwfqEQxS97mnZS4t4ExFle75CkiRGg2pkwHFIfbJCDdZvfkrw5l15
	ATwPQ/cemz9TH6kZ5zcbtt+H+tuZEjsQ4kYM3hUBfKQwt63VYLH0IKY2LiB3V6AUVg1l
	jXf+kxEkSfAytUcJlM7Zax0St9cq+R7ea/qmRxjh8IA+0JQqYbf9/YBDg1l8KCQ534zi
	G0Jdv1rwyTgP9EeTglCVAWY1uvUd5k8vQHw6Kn+9jD+ExY5Fc1PGBSwhzAOagPJFI0ro
	l+Ow==
X-Gm-Message-State: AJaThX5L/DS5eZ/Jg9xN0WrJW2UlZ34ChKJGYiDZUgRZv4G3JihJOrox
	5CPnC9Qar3DzJf3YpWMeuDsPG4j1NXqHlEft70M=
X-Google-Smtp-Source: AGs4zMblHbC4TcHYvjQq1QSai3WJ63D0m1e75P0EqQokWFg1K5MI3NhnrDWMaZSJElkqLtu4kanVbSJXQVrzXgskyzw=
X-Received: by 10.28.13.212 with SMTP id 203mr2206110wmn.141.1510857670403;
	Thu, 16 Nov 2017 10:41:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.87.208 with HTTP; Thu, 16 Nov 2017 10:41:09 -0800 (PST)
In-Reply-To: <CABcZANkN28FE_RLtwbzshWr2TYeZdcoqX_6SWheC4S_wAVOZ9A@mail.gmail.com>
References: <1510847249-15722-1-git-send-email-vlsireddy@gmail.com>
	<CABcZANkN28FE_RLtwbzshWr2TYeZdcoqX_6SWheC4S_wAVOZ9A@mail.gmail.com>
From: Ravi chandra reddy <vlsireddy@gmail.com>
Date: Thu, 16 Nov 2017 13:41:09 -0500
Message-ID: <CAGQ4JX3FGDdfoiv_c0QW0454MLAshTOVvcRS6X8LBUtuU3V+2g@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH]ethool updated to 4.13] ethtool bb: upgraded the .bb to pick latest ethtool-4.13.tar.xz
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
X-List-Received-Date: Thu, 16 Nov 2017 18:41:10 -0000
Content-Type: multipart/alternative; boundary="001a11444e26c02c7d055e1df653"

--001a11444e26c02c7d055e1df653
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Larson,

 I built ethtool individually [download 4.13 tar and then compiled] and a
yocto image generated has 4.11, i wanted to upgrade the default in the
yocto, thats why the effort.

i will put the release notes on upgrade.

will correct the typo.

Thanks

On Thu, Nov 16, 2017 at 10:55 AM, Christopher Larson <kergoth@gmail.com>
wrote:

>
>
> On Thu, Nov 16, 2017 at 8:47 AM, RC Reddy <vlsireddy@gmail.com> wrote:
>
>> Tests : - Compiled and tested the ethtool 4.13 package from
>> https://www.kernel.org/pub/software/network/ethtool/ethtool-4.13.tar.xz
>> using AARCH64 compiler [compilation succeed and also the binary works]
>>
>> Signed-off-by: RC Reddy <vlsireddy@gmail.com>
>> ---
>>  meta/recipes-extended/ethtool/{ethtool_4.11.bb =3D> ethtool_4.13.bb} | =
4
>> ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-extended/ethtool/{ethtool_4.11.bb =3D> ethtool_4.13=
.bb}
>> (88%)
>>
>> diff --git a/meta/recipes-extended/ethtool/ethtool_4.11.bb
>> b/meta/recipes-extended/ethtool/ethtool_4.13.bb
>> similarity index 88%
>> rename from meta/recipes-extended/ethtool/ethtool_4.11.bb
>> rename to meta/recipes-extended/ethtool/ethtool_4.13.bb
>> index befe9b9..c862a57 100644
>> --- a/meta/recipes-extended/ethtool/ethtool_4.11.bb
>> +++ b/meta/recipes-extended/ethtool/ethtool_4.13.bb
>> @@ -11,8 +11,8 @@ SRC_URI =3D "${KERNELORG_MIRROR}/software/
>> network/ethtool/ethtool-${PV}.tar.gz \
>>             file://avoid_parallel_tests.patch \
>>             "
>>
>> -SRC_URI[md5sum] =3D "8f1072679888c9335e49b17efb798b4c"
>> -SRC_URI[sha256sum] =3D "af2fd9692f3159d3ab1e41e6f9b7d
>> 8db2a4693f1cb22348c88ba89f70f0e6503"
>> +SRC_URI[md5sum] =3D "2ba44eb0ca96752392e9bf8dc83ba302"
>> +SRC_URI[sha256sum] =3D "d311c4b557c44c5248ac5436b9e19
>> c391a60d8e4830b6a7f41be16d89c0556de"
>>
>>
> If you=E2=80=99re going to update a checksum for a tarball that was repla=
ced
> in-place upstream, we need to know why it changed, and what changed,
> otherwise it could well have been compromised. Also, the subject line has=
 a
> typo: ethool.
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>

--001a11444e26c02c7d055e1df653
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Larson,<div><br></div><div>=C2=A0I built ethtool indivi=
dually [download 4.13 tar and then compiled] and a yocto image generated ha=
s 4.11, i wanted to upgrade the default in the yocto, thats why the effort.=
</div><div><br></div><div>i will put the release notes on upgrade.</div><di=
v><br></div><div>will correct the typo.</div><div><br></div><div>Thanks</di=
v></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, N=
ov 16, 2017 at 10:55 AM, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">On Thu,=
 Nov 16, 2017 at 8:47 AM, RC Reddy <span dir=3D"ltr">&lt;<a href=3D"mailto:=
vlsireddy@gmail.com" target=3D"_blank">vlsireddy@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Tests : - Compiled and tested the e=
thtool 4.13 package from<br>
<a href=3D"https://www.kernel.org/pub/software/network/ethtool/ethtool-4.13=
.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://www.kernel.org/pub/so=
f<wbr>tware/network/ethtool/ethtool-<wbr>4.13.tar.xz</a><br>
using AARCH64 compiler [compilation succeed and also the binary works]<br>
<br>
Signed-off-by: RC Reddy &lt;<a href=3D"mailto:vlsireddy@gmail.com" target=
=3D"_blank">vlsireddy@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/<wbr>ethtool/{<a href=3D"http://ethtool_4.11.bb=
" rel=3D"noreferrer" target=3D"_blank">ethtool_4.11.bb</a> =3D&gt; <a href=
=3D"http://ethtool_4.13.bb" rel=3D"noreferrer" target=3D"_blank">ethtool_4.=
13.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-extended/ethtool/<wbr>{<a href=3D"http://ethtool_=
4.11.bb" rel=3D"noreferrer" target=3D"_blank">ethtool_4.11.bb</a> =3D&gt; <=
a href=3D"http://ethtool_4.13.bb" rel=3D"noreferrer" target=3D"_blank">etht=
ool_4.13.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-extended/ethtoo<wbr>l/<a href=3D"http://ethtool_4=
.11.bb" rel=3D"noreferrer" target=3D"_blank">ethtool_4.11.bb</a> b/meta/rec=
ipes-extended/ethtoo<wbr>l/<a href=3D"http://ethtool_4.13.bb" rel=3D"norefe=
rrer" target=3D"_blank">ethtool_4.13.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-extended/ethtool/<a href=3D"http://ethtool_4.11.bb=
" rel=3D"noreferrer" target=3D"_blank"><wbr>ethtool_4.11.bb</a><br>
rename to meta/recipes-extended/ethtool/<a href=3D"http://ethtool_4.13.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>ethtool_4.13.bb</a><br>
index befe9b9..c862a57 100644<br>
--- a/meta/recipes-extended/ethtoo<wbr>l/<a href=3D"http://ethtool_4.11.bb"=
 rel=3D"noreferrer" target=3D"_blank">ethtool_4.11.bb</a><br>
+++ b/meta/recipes-extended/ethtoo<wbr>l/<a href=3D"http://ethtool_4.13.bb"=
 rel=3D"noreferrer" target=3D"_blank">ethtool_4.13.bb</a><br>
@@ -11,8 +11,8 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/software/<wbr>netwo=
rk/ethtool/ethtool-${PV}.<wbr>tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://avoid_pa=
rallel_tests.pa">avoid_parallel_tests.pa</a><wbr>tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;8f1072679888c9335e49b17efb798<wbr>b4c&quot;<br>
-SRC_URI[sha256sum] =3D &quot;af2fd9692f3159d3ab1e41e6f9b7d<wbr>8db2a4693f1=
cb22348c88ba89f70f0<wbr>e6503&quot;<br>
+SRC_URI[md5sum] =3D &quot;2ba44eb0ca96752392e9bf8dc83ba<wbr>302&quot;<br>
+SRC_URI[sha256sum] =3D &quot;d311c4b557c44c5248ac5436b9e19<wbr>c391a60d8e4=
830b6a7f41be16d89c0<wbr>556de&quot;<br><br></blockquote><div><br></div></sp=
an><div>If you=E2=80=99re going to update a checksum for a tarball that was=
 replaced in-place upstream, we need to know why it changed, and what chang=
ed, otherwise it could well have been compromised. Also, the subject line h=
as a typo: ethool.</div></div><span class=3D"HOEnZb"><font color=3D"#888888=
">-- <br><div class=3D"m_-255801991132395722gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Lar=
son<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZau=
rus<br>Senior Software Engineer, Mentor Graphics</div></div></div></div>
</font></span></div></div>
</blockquote></div><br></div>

--001a11444e26c02c7d055e1df653--
