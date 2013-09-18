Return-Path: <anders.darander@gmail.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id 19F916B6BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 05:06:20 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id h10so4752232vbh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 22:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=243xU0od4WGxHoshnhfUr6MjGlSxySocub84wEAJimE=;
	b=m1F672J7+bnsSfStbMrBR1Zn3D+y1+JfXz63lBhOOzH1llsZEEw48EeL3LBRv6tG8x
	4Jt/i2lBV3Oo7zjkFK6GKrE42vKzIScek4NMd2nBW/cQlTTLcfNChxLhuLEy2iia2QP2
	9eTYTM5ngAlTDlQzZ0RetqAkmgY6Vu4xW9d/I/UGEpNn86Hx0w0ldM+K/MIPflATwW8P
	WaiZDeXgtNNnIebubNP9sCcAT2zka/3vc36JRfH3mZB8iwBiBeNx2/1ZQh2dY0+C10MQ
	oGeYAJoXgJVYL2hGZI800reUk7GxxEbG5gG8c8hNC7+LEVJVsDMUQKvJxVIoEZNJcuJK
	QDig==
MIME-Version: 1.0
X-Received: by 10.52.227.6 with SMTP id rw6mr30271481vdc.19.1379480781493;
	Tue, 17 Sep 2013 22:06:21 -0700 (PDT)
Received: by 10.220.104.143 with HTTP; Tue, 17 Sep 2013 22:06:21 -0700 (PDT)
In-Reply-To: <CAE4k23-+smrW4=M80uNwrH1fG7U5zt2S8PhxpQF4askX=3vtug@mail.gmail.com>
References: <cover.1379100075.git.anders@chargestorm.se>
	<a8748357e163efb38b354d4142293393c2a2cc9a.1379100075.git.anders@chargestorm.se>
	<5238EA0D.2010108@linux.intel.com>
	<CAE4k23-+smrW4=M80uNwrH1fG7U5zt2S8PhxpQF4askX=3vtug@mail.gmail.com>
Date: Wed, 18 Sep 2013 07:06:21 +0200
Message-ID: <CAE4k23_h2pYnntiAtFv5puu=fT=mJDEN9Yo5=YeqM1TdPEyasA@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] u-boot-fw-utils: reinstate target recipe for fw_printenv
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
X-List-Received-Date: Wed, 18 Sep 2013 05:06:21 -0000
Content-Type: multipart/alternative; boundary=089e01161660f49d6e04e6a165ab

--089e01161660f49d6e04e6a165ab
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I just noted that Otavio already sent a fix for this.

Please, review and apply his fix.

Cheers,
Anders


On 18 September 2013 06:51, Anders Darander <anders.darander@gmail.com>wrot=
e:

>
>
>
> On 18 September 2013 01:47, Saul Wold <sgw@linux.intel.com> wrote:
>
>> On 09/13/2013 12:21 PM, Anders Darander wrote:
>>
>>> The latest upgrade changed u-boot-fw-utils to u-boot-fw-utils-cross,
>>> which
>>> removed the on-target fw_printenv (and fw_setenv).
>>>
>>> Re-create the updated version of the u-boot-fw-utils recipe.
>>>
>>> U-Boot does try to strip the fw_printenv binary by default now. To avoi=
d
>>> this, without patching the Makefile, we add HOSTSTRIP=3Dtrue to
>>> EXTRA_OEMAKE.
>>>
>>> The new U-Boot do also require us to configure the build for a specific
>>> machine, thus we change the package arch.=A7
>>>
>>> Signed-off-by: Anders Darander <anders@chargestorm.se>
>>> ---
>>>   meta/recipes-bsp/u-boot/u-**boot-fw-utils_2013.07.bb<http://u-boot-fw=
-utils_2013.07.bb>| 31 ++++++++++++++++++++++
>>>   1 file changed, 31 insertions(+)
>>>   create mode 100644 meta/recipes-bsp/u-boot/u-**
>>> boot-fw-utils_2013.07.bb <http://u-boot-fw-utils_2013.07.bb>
>>>
>>> diff --git a/meta/recipes-bsp/u-boot/u-**boot-fw-utils_2013.07.bb<http:=
//u-boot-fw-utils_2013.07.bb>b/meta/recipes-bsp/u-boot/
>>> u-**boot-fw-utils_2013.07.bb <http://u-boot-fw-utils_2013.07.bb>
>>> new file mode 100644
>>> index 0000000..f97df71
>>> --- /dev/null
>>> +++ b/meta/recipes-bsp/u-boot/u-**boot-fw-utils_2013.07.bb<http://u-boo=
t-fw-utils_2013.07.bb>
>>> @@ -0,0 +1,31 @@
>>> +DESCRIPTION =3D "U-boot bootloader fw_printenv/setenv utils"
>>> +LICENSE =3D "GPLv2+"
>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D**1707d6db1d42237583f50183a=
5651e
>>> **cb"
>>> +SECTION =3D "bootloader"
>>> +DEPENDS =3D "mtd-utils"
>>> +
>>> +# This revision corresponds to the tag "v2013.07"
>>> +# We use the revision in order to avoid having to fetch it from the
>>> +# repo during parse
>>> +SRCREV =3D "**62c175fbb8a0f9a926c88294ea9f7e**88eb898f6c"
>>> +
>>> +PV =3D "v2013.07+git${SRCPV}"
>>> +
>>> +SRC_URI =3D "git://git.denx.de/u-boot.git;**branch=3Dmaster;protocol=
=3Dgit<http://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit>
>>> "
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}" HOSTSTRIP=3D"true"'
>>> +
>>> +do_compile () {
>>> +  oe_runmake ${UBOOT_MACHINE}
>>> +  oe_runmake env
>>> +}
>>> +
>>> +do_install () {
>>> +  install -d ${D}${base_sbindir}
>>> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_**
>>> printenv
>>> +  install -m 755 ${S}/tools/env/fw_printenv
>>> ${D}${base_sbindir}/fw_setenv
>>> +}
>>> +
>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>
>>>
>> I think this might need a COMPATIBLE_MACHINE or some check for correct
>> systems
>>
>
> Ah, you're correct.
>
> I was looking too much on the old recipe and my working machine... As
> we're currently making the package machine specific, we definitely need
> this test. v2 on its way...
>
> Cheers,
> Anders
>
>



--=20
Anders Darander
EPO guidelines 1978: "If the contribution to the known art resides
solely in a computer program then the subject matter is not
patentable in whatever manner it may be presented in the claims."

--089e01161660f49d6e04e6a165ab
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just noted that Otavio already sent a fix for this.<div>=
<br></div><div>Please, review and apply his fix.</div><div><br></div><div>C=
heers,</div><div>Anders</div></div><div class=3D"gmail_extra"><br><br><div =
class=3D"gmail_quote">
On 18 September 2013 06:51, Anders Darander <span dir=3D"ltr">&lt;<a href=
=3D"mailto:anders.darander@gmail.com" target=3D"_blank">anders.darander@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote"><div><div class=3D"h5">On 18 September 2013 01:47, Saul Wold <span =
dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sg=
w@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div>On 09/13/2013 12:21 PM, Anders Dar=
ander wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The latest upgrade changed u-boot-fw-utils to u-boot-fw-utils-cross, which<=
br>
removed the on-target fw_printenv (and fw_setenv).<br>
<br>
Re-create the updated version of the u-boot-fw-utils recipe.<br>
<br>
U-Boot does try to strip the fw_printenv binary by default now. To avoid<br=
>
this, without patching the Makefile, we add HOSTSTRIP=3Dtrue to EXTRA_OEMAK=
E.<br>
<br>
The new U-Boot do also require us to configure the build for a specific<br>
machine, thus we change the package arch.=A7<br>
<br>
Signed-off-by: Anders Darander &lt;<a href=3D"mailto:anders@chargestorm.se"=
 target=3D"_blank">anders@chargestorm.se</a>&gt;<br>
---<br>
=A0 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2013.07.bb" t=
arget=3D"_blank">u-<u></u>boot-fw-utils_2013.07.bb</a> | 31 +++++++++++++++=
+++++++<br>
=A0 1 file changed, 31 insertions(+)<br>
=A0 create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-=
utils_2013.07.bb" target=3D"_blank">u-<u></u>boot-fw-utils_2013.07.bb</a><b=
r>
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2013=
.07.bb" target=3D"_blank">u-<u></u>boot-fw-utils_2013.07.bb</a> b/meta/reci=
pes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2013.07.bb" target=3D"_bla=
nk">u-<u></u>boot-fw-utils_2013.07.bb</a><br>


new file mode 100644<br>
index 0000000..f97df71<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2013.07.bb"=
 target=3D"_blank">u-<u></u>boot-fw-utils_2013.07.bb</a><br>
@@ -0,0 +1,31 @@<br>
+DESCRIPTION =3D &quot;U-boot bootloader fw_printenv/setenv utils&quot;<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>1707d6db1d42237583f=
50183a5651e<u></u>cb&quot;<br>
+SECTION =3D &quot;bootloader&quot;<br>
+DEPENDS =3D &quot;mtd-utils&quot;<br>
+<br>
+# This revision corresponds to the tag &quot;v2013.07&quot;<br>
+# We use the revision in order to avoid having to fetch it from the<br>
+# repo during parse<br>
+SRCREV =3D &quot;<u></u>62c175fbb8a0f9a926c88294ea9f7e<u></u>88eb898f6c&qu=
ot;<br>
+<br>
+PV =3D &quot;v2013.07+git${SRCPV}&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git;branch=3D=
master;protocol=3Dgit" target=3D"_blank">git.denx.de/u-boot.git;<u></u>bran=
ch=3Dmaster;protocol=3Dgit</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+EXTRA_OEMAKE =3D &#39;HOSTCC=3D&quot;${CC}&quot; HOSTSTRIP=3D&quot;true&qu=
ot;&#39;<br>
+<br>
+do_compile () {<br>
+ =A0oe_runmake ${UBOOT_MACHINE}<br>
+ =A0oe_runmake env<br>
+}<br>
+<br>
+do_install () {<br>
+ =A0install -d ${D}${base_sbindir}<br>
+ =A0install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_<u></=
u>printenv<br>
+ =A0install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_seten=
v<br>
+}<br>
+<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
</blockquote>
<br></div></div>
I think this might need a COMPATIBLE_MACHINE or some check for correct syst=
ems<br></blockquote><div><br></div></div></div><div>Ah, you&#39;re correct.=
=A0</div><div><br></div><div>I was looking too much on the old recipe and m=
y working machine... As we&#39;re currently making the package machine spec=
ific, we definitely need this test. v2 on its way...</div>

<div><br></div><div>Cheers,</div><div>Anders</div><div>=A0</div></div></div=
></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>Anders Daran=
der<br>EPO guidelines 1978: &quot;If the contribution to the known art resi=
des<br>solely in a computer program then the subject matter is not<br>paten=
table in whatever manner it may be presented in the claims.&quot;
</div>

--089e01161660f49d6e04e6a165ab--
