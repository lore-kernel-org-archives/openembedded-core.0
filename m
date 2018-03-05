Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 13BAE782D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 13:28:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1520256512; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=Zwa0OE8rT04hCihqzMPlLz17u4KO9GBFInhUYL0DMZ4=;
	b=Zh6IHBUnxsCRRyzGz8if2AroWX3KzN8NH5YR16loggaMh8mm4V0k6lh8teOfNTzvD9ZPBCAQ
	e7rj3WvebeW+AmRX4v70cJJUhAM6MDETvo04toiY33e5nYj/f2yhdbYLljiOZBD4SVplZLFo
	V0gr85e83hhOtKMk2FhcY2ADrzw=
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mxa.mailgun.org with ESMTP id 5a9d4600.7f14ec07d7f0-smtp-out-n03;
	Mon, 05 Mar 2018 13:28:32 -0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id v124so20497870qkh.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 05:28:32 -0800 (PST)
X-Gm-Message-State: AElRT7F+obZaqBZUeYB/6nqjWhOl3oEcOEfS2EOgVPvDnCdpPakj9bVg
	WhOEAm0arhzVOYVUh/BVeU98D6SOJYWInn5Fsnw=
X-Google-Smtp-Source: AG47ELuKs5ADLIAK0aBcAu6ERC9gZb92jNGUf55B7/Jw30xT/ZynI/BS61Tw1s1w+z/h+fg7AoOIktR8yV5YsAyJwJc=
X-Received: by 10.55.20.233 with SMTP id 102mr22425601qku.18.1520256511425;
	Mon, 05 Mar 2018 05:28:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.35 with HTTP; Mon, 5 Mar 2018 05:28:30 -0800 (PST)
In-Reply-To: <CADNbA1pV9OMsnPNCy+Tj9TLQqjQ7cR=8s-2igRRdu4p1TDOF5A@mail.gmail.com>
References: <1520254360-16927-1-git-send-email-derek@asterius.io>
	<CAJTo0LbwDJGp6zGz=OenK0rFnrKMogASi-EzuQ5BOgCsDakhsA@mail.gmail.com>
	<CADNbA1pV9OMsnPNCy+Tj9TLQqjQ7cR=8s-2igRRdu4p1TDOF5A@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 5 Mar 2018 08:28:30 -0500
X-Gmail-Original-Message-ID: <CADNbA1qrhSrVDbno=EPHr3avg6CVhMa1hhJoe12P64BGosWLqQ@mail.gmail.com>
Message-ID: <CADNbA1qrhSrVDbno=EPHr3avg6CVhMa1hhJoe12P64BGosWLqQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-pycairo: update to 1.16.3
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
X-List-Received-Date: Mon, 05 Mar 2018 13:28:32 -0000
Content-Type: multipart/alternative; boundary="001a11400fc054c69a0566aa4d62"

--001a11400fc054c69a0566aa4d62
Content-Type: text/plain; charset="UTF-8"

Not sure that it is the correct solution, but I sent a v2.  Is it better to
override --install-data directory in this instance rather than touching up
the locations in the do_install_append?

On Mon, Mar 5, 2018 at 7:59 AM, Derek Straka <derek@asterius.io> wrote:

> Probably.  I didn't even notice that it wasn't.  v2 coming once I verify.
>
> On Mon, Mar 5, 2018 at 7:56 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>> Shouldn't the .h and .pc be in PN-dev?
>>
>> On 5 March 2018 at 12:52, Derek Straka <derek@asterius.io> wrote:
>>
>>> Update to the latest stable release
>>> Add the .pc file to the list of FILES
>>>
>>> Tested in qemux86-64 running core-image-minimal
>>>
>>> Signed-off-by: Derek Straka <derek@asterius.io>
>>> ---
>>>  .../{python3-pycairo_1.15.6.bb => python3-pycairo_1.16.3.bb}     | 9
>>> ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>  rename meta/recipes-devtools/python/{python3-pycairo_1.15.6.bb =>
>>> python3-pycairo_1.16.3.bb} (78%)
>>>
>>> diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
>>> b/meta/recipes-devtools/python/python3-pycairo_1.16.3.bb
>>> similarity index 78%
>>> rename from meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
>>> rename to meta/recipes-devtools/python/python3-pycairo_1.16.3.bb
>>> index 5c3e1e6..b648852 100644
>>> --- a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
>>> +++ b/meta/recipes-devtools/python/python3-pycairo_1.16.3.bb
>>> @@ -13,8 +13,8 @@ DEPENDS = "cairo"
>>>  SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${P
>>> V}/pycairo-${PV}.tar.gz"
>>>  UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
>>>
>>> -SRC_URI[md5sum] = "3ff210c34e7b052590e15fd0fb147766"
>>> -SRC_URI[sha256sum] = "ad150ea637860836b66705e0513b8
>>> e59494538f0b80497ad3462051368755016"
>>> +SRC_URI[md5sum] = "d2a115037ccd128219f43d5ed3df7926"
>>> +SRC_URI[sha256sum] = "5bb321e5d4f8b3a51f56fc6a35c14
>>> 3f1b72ce0d748b43d8b623596e8215f01f7"
>>>
>>>  S = "${WORKDIR}/pycairo-${PV}"
>>>
>>> @@ -28,4 +28,7 @@ do_install_append() {
>>>      install -d ${D}${includedir}/pycairo/
>>>      install -m 0644 ${D}${datadir}/include/pycairo/py3cairo.h
>>> ${D}${includedir}/pycairo/
>>>  }
>>> -FILES_${PN} += "${datadir}/include/pycairo/py3cairo.h"
>>> +FILES_${PN} += " \
>>> +    ${datadir}/include/pycairo/py3cairo.h \
>>> +    ${datadir}/lib/pkgconfig/py3cairo.pc \
>>> +"
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>
>

--001a11400fc054c69a0566aa4d62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not sure that it is the correct solution, but I sent a v2.=
=C2=A0 Is it better to override=C2=A0<span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">--install-d=
ata directory in this instance rather than touching up the locations in the=
 do_install_append?</span></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Mon, Mar 5, 2018 at 7:59 AM, Derek Straka <span dir=3D"=
ltr">&lt;<a href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@aster=
ius.io</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr">Probably.=C2=A0 I didn&#39;t even notice that it wasn&#39;t.=C2=A0 v2 =
coming once I verify.</div><div class=3D"HOEnZb"><div class=3D"h5"><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Mar 5, 2018 at 7:=
56 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@int=
el.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"ltr">Shouldn&#39;t the .h and .pc =
be in PN-dev?</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
"><div><div class=3D"m_-8992084579151626636h5">On 5 March 2018 at 12:52, De=
rek Straka <span dir=3D"ltr">&lt;<a href=3D"mailto:derek@asterius.io" targe=
t=3D"_blank">derek@asterius.io</a>&gt;</span> wrote:<br></div></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div><div class=3D"m_-8992084579151626636h5">Update=
 to the latest stable release<br>
Add the .pc file to the list of FILES<br>
<br>
Tested in qemux86-64 running core-image-minimal<br>
<br>
Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" target=
=3D"_blank">derek@asterius.io</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-pycairo_1.15.6.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-pycairo_1.15.6.b<wbr>b</a> =3D&gt; <a href=3D"htt=
p://python3-pycairo_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pycairo_1.16.3.bb</a>}=C2=A0 =C2=A0 =C2=A0| 9 ++++++---<br>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-pycair=
o_1.15.6.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>python3-pycairo_1.15=
.6.bb</a> =3D&gt; <a href=3D"http://python3-pycairo_1.16.3.bb" rel=3D"noref=
errer" target=3D"_blank">python3-pycairo_1.16.3.bb</a>} (78%)<br>
<br>
diff --git a/meta/recipes-devtools/python<wbr>/<a href=3D"http://python3-py=
cairo_1.15.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.15.=
6.bb</a> b/meta/recipes-devtools/python<wbr>/<a href=3D"http://python3-pyca=
iro_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.16.3.=
bb</a><br>
similarity index 78%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_=
1.15.6.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython3-pycairo_1.15.6=
.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_1.=
16.3.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython3-pycairo_1.16.3.b=
b</a><br>
index 5c3e1e6..b648852 100644<br>
--- a/meta/recipes-devtools/python<wbr>/<a href=3D"http://python3-pycairo_1=
.15.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.15.6.bb</a=
><br>
+++ b/meta/recipes-devtools/python<wbr>/<a href=3D"http://python3-pycairo_1=
.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.16.3.bb</a=
><br>
@@ -13,8 +13,8 @@ DEPENDS =3D &quot;cairo&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/pygobject/pycairo/rel=
eases/download/v$%7BPV%7D/pycairo-$%7BPV%7D.tar.gz" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/pygobject/<wbr>pycairo/releases/download/v=
${P<wbr>V}/pycairo-${PV}.tar.gz</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/pygobject/=
pycairo/releases/" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
pygobject/<wbr>pycairo/releases/</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;3ff210c34e7b052590e15fd0fb147<wbr>766&quot;<br>
-SRC_URI[sha256sum] =3D &quot;ad150ea637860836b66705e0513b8<wbr>e59494538f0=
b80497ad34620513687<wbr>55016&quot;<br>
+SRC_URI[md5sum] =3D &quot;d2a115037ccd128219f43d5ed3df7<wbr>926&quot;<br>
+SRC_URI[sha256sum] =3D &quot;5bb321e5d4f8b3a51f56fc6a35c14<wbr>3f1b72ce0d7=
48b43d8b623596e8215<wbr>f01f7&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/pycairo-${PV}&quot;<br>
<br>
@@ -28,4 +28,7 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${includedir}/pycairo/<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${D}${datadir}/include/pycairo<wbr>/py3=
cairo.h ${D}${includedir}/pycairo/<br>
=C2=A0}<br>
-FILES_${PN} +=3D &quot;${datadir}/include/pycairo/py<wbr>3cairo.h&quot;<br=
>
+FILES_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/include/pycairo/py3<wbr>cairo.h \<br>
+=C2=A0 =C2=A0 ${datadir}/lib/pkgconfig/py3ca<wbr>iro.pc \<br>
+&quot;<br>
</div></div><span class=3D"m_-8992084579151626636HOEnZb"><font color=3D"#88=
8888"><span class=3D"m_-8992084579151626636m_-1005834292654371431HOEnZb"><f=
ont color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><br></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a11400fc054c69a0566aa4d62--
