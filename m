Return-Path: <sujith.h@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 56E1265E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 10:00:51 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id m20so1372525qcx.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 03:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=i7LhUucYtei8eIeVco2zoF1SUWJgrcSTf5iM9HXAQsE=;
	b=K4D+N+Hfrj5WlvVGYiGfXlwzxUChZ8fOIW98OWymy/Y2BRipnF7zeKqh5qGXSv1PwU
	PyjditiMmLi4zAdfwdl8Jo/QQzFc+x/lKYkmxyTpVaSuEUDN4tw0baHJ9wc2pfMf8drf
	sA2zS0Q0xa3DuA8x6J4iB1qOpRGTc4UNJ4mZa5yWYto82D2or+vWq3jfR7k0CjEvxMs+
	y2wXNpEJuiTzMTFVNJWuqELoSDyRtQpqmmasthB+KwhxdBqKeFfyWfTSAUJvskULGpoN
	gA8NQidRpFQA6UKuHxlehVaF0TyD6Apkeyxm1GTaaIvnLkGiifBb+ipIT8BDdo5i5e0g
	0q+g==
X-Received: by 10.224.36.4 with SMTP id r4mr14742870qad.69.1407751252301; Mon,
	11 Aug 2014 03:00:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Mon, 11 Aug 2014 03:00:32 -0700 (PDT)
In-Reply-To: <53E511E2.10300@linux.intel.com>
References: <1407488988-14910-1-git-send-email-sujith.h@gmail.com>
	<53E511E2.10300@linux.intel.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 11 Aug 2014 15:30:32 +0530
Message-ID: <CADyYWLma=JqZF=dJRysw7H4HHWSSKdgcpJe4kL3-As9pcwbK5Q@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Muzaffar Mahmood <muzaffar_mahmood@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] psplash: Adding support for systemd service files
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
X-List-Received-Date: Mon, 11 Aug 2014 10:00:57 -0000
Content-Type: multipart/alternative; boundary=089e015372805373ac050057a1a5

--089e015372805373ac050057a1a5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2014 at 11:37 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 08/08/2014 02:09 AM, Sujith H wrote:
>
>> From: Sujith H <Sujith_Haridasan@mentor.com>
>>
>> If the DISTRO_FEATURES has systemd, then its better
>> to have corresponding service files associated with
>> the psplash. This change will help to do the same.
>>
>>  Can you propose a patch to the psplash upstream which is part of the
> Yocto Project (send the patch to yocto@yoctoproject.org) and then we can
> do a psplash upgrade to include these files directly?
>

Ok then I will submit the same patch to Yocto Project.

Thanks,
Sujith H

>
> Thanks
>         Sau!
>
>
>  Signed-off-by: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
>> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
>> ---
>>   meta/recipes-core/psplash/files/psplash-quit.service  | 11 +++++++++++
>>   meta/recipes-core/psplash/files/psplash-start.service | 11 +++++++++++
>>   meta/recipes-core/psplash/psplash_git.bb              | 12 +++++++++++=
-
>>   3 files changed, 33 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-core/psplash/files/psplash-quit.servic=
e
>>   create mode 100644 meta/recipes-core/psplash/
>> files/psplash-start.service
>>
>> diff --git a/meta/recipes-core/psplash/files/psplash-quit.service
>> b/meta/recipes-core/psplash/files/psplash-quit.service
>> new file mode 100644
>> index 0000000..14bd499
>> --- /dev/null
>> +++ b/meta/recipes-core/psplash/files/psplash-quit.service
>> @@ -0,0 +1,11 @@
>> +[Unit]
>> +Description=3DTerminate Psplash Boot Screen
>> +After=3Dpsplash-start.service
>> +
>> +[Service]
>> +Type=3Doneshot
>> +ExecStart=3D/usr/bin/psplash-write QUIT
>> +TimeoutSec=3D20
>> +
>> +[Install]
>> +WantedBy=3Dmulti-user.target
>> diff --git a/meta/recipes-core/psplash/files/psplash-start.service
>> b/meta/recipes-core/psplash/files/psplash-start.service
>> new file mode 100644
>> index 0000000..502b150
>> --- /dev/null
>> +++ b/meta/recipes-core/psplash/files/psplash-start.service
>> @@ -0,0 +1,11 @@
>> +[Unit]
>> +Description=3DStarts Psplash Boot screen
>> +Wants=3Dsystemd-vconsole-setup.service
>> +After=3Dsystemd-vconsole-setup.service systemd-udev-trigger.service
>> systemd-udevd.service
>> +DefaultDependencies=3Dno
>> +
>> +[Service]
>> +ExecStart=3D/usr/bin/psplash
>> +
>> +[Install]
>> +WantedBy=3Dsysinit.target
>> diff --git a/meta/recipes-core/psplash/psplash_git.bb
>> b/meta/recipes-core/psplash/psplash_git.bb
>> index 628ced4..16fa0ae 100644
>> --- a/meta/recipes-core/psplash/psplash_git.bb
>> +++ b/meta/recipes-core/psplash/psplash_git.bb
>> @@ -11,6 +11,8 @@ PR =3D "r15"
>>
>>   SRC_URI =3D "git://git.yoctoproject.org/${BPN}
>> <http://git.yoctoproject.org/$%7BBPN%7D> \
>>              file://psplash-init \
>> +           file://psplash-start.service \
>> +           file://psplash-quit.service \
>>              ${SPLASH_IMAGES}"
>>
>>   SPLASH_IMAGES =3D "file://psplash-poky-img.h;outsuffix=3Ddefault"
>> @@ -65,11 +67,14 @@ python __anonymous() {
>>
>>   S =3D "${WORKDIR}/git"
>>
>> -inherit autotools pkgconfig update-rc.d update-alternatives
>> +inherit autotools pkgconfig update-rc.d update-alternatives systemd
>>
>>   ALTERNATIVE_PRIORITY =3D "100"
>>   ALTERNATIVE_LINK_NAME[psplash] =3D "${bindir}/psplash"
>>
>> +SYSTEMD_PACKAGES =3D "${@base_contains('DISTRO_
>> FEATURES','systemd','${PN}','',d)}"
>> +SYSTEMD_SERVICE_${PN} =3D "${@base_contains('DISTRO_
>> FEATURES','systemd','psplash-start.service psplash-quit.service','',d)}"
>> +
>>   python do_compile () {
>>       import shutil
>>
>> @@ -103,6 +108,11 @@ do_install_append() {
>>                 install -m 0755 $i ${D}${bindir}/$i
>>         done
>>         rm -f ${D}${bindir}/psplash
>> +
>> +       if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d=
)};
>> then
>> +                install -d ${D}${systemd_unitdir}/system
>> +                install -m 644 ${WORKDIR}/*.service
>> ${D}/${systemd_unitdir}/system
>> +        fi
>>   }
>>
>>   FILES_${PN} +=3D "/mnt/.psplash"
>>
>>


--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--089e015372805373ac050057a1a5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><div class=3D"gmail_extra"><br><br><div class=3D"=
gmail_quote">On Fri, Aug 8, 2014 at 11:37 PM, Saul Wold <span dir=3D"ltr">&=
lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel=
.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On 08/08/2014 02:09 AM, Suji=
th H wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com" target=3D=
"_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
<br>
If the DISTRO_FEATURES has systemd, then its better<br>
to have corresponding service files associated with<br>
the psplash. This change will help to do the same.<br>
<br>
</blockquote></div>
Can you propose a patch to the psplash upstream which is part of the Yocto =
Project (send the patch to <a href=3D"mailto:yocto@yoctoproject.org" target=
=3D"_blank">yocto@yoctoproject.org</a>) and then we can do a psplash upgrad=
e to include these files directly?<br>

</blockquote><div><br></div><div>Ok then I will submit the same patch to Yo=
cto Project.<br><br></div><div>Thanks,<br>Sujith H <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">


<br>
Thanks<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br=
>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Muzaffar Mahmood &lt;<a href=3D"mailto:muzaffar_mahmood@ment=
or.com" target=3D"_blank">muzaffar_mahmood@mentor.com</a>&gt;<br>
Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com" =
target=3D"_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-core/psplash/<u></u>files/psplash-quit.service =C2=A0| =
11 +++++++++++<br>
=C2=A0 meta/recipes-core/psplash/<u></u>files/psplash-start.service | 11 ++=
+++++++++<br>
=C2=A0 meta/recipes-core/psplash/<a href=3D"http://psplash_git.bb" target=
=3D"_blank">pspl<u></u>ash_git.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 12 +++++++++++-<br>
=C2=A0 3 files changed, 33 insertions(+), 1 deletion(-)<br>
=C2=A0 create mode 100644 meta/recipes-core/psplash/<u></u>files/psplash-qu=
it.service<br>
=C2=A0 create mode 100644 meta/recipes-core/psplash/<u></u>files/psplash-st=
art.service<br>
<br>
diff --git a/meta/recipes-core/psplash/<u></u>files/psplash-quit.service b/=
meta/recipes-core/psplash/<u></u>files/psplash-quit.service<br>
new file mode 100644<br>
index 0000000..14bd499<br>
--- /dev/null<br>
+++ b/meta/recipes-core/psplash/<u></u>files/psplash-quit.service<br>
@@ -0,0 +1,11 @@<br>
+[Unit]<br>
+Description=3DTerminate Psplash Boot Screen<br>
+After=3Dpsplash-start.service<br>
+<br>
+[Service]<br>
+Type=3Doneshot<br>
+ExecStart=3D/usr/bin/psplash-<u></u>write QUIT<br>
+TimeoutSec=3D20<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/meta/recipes-core/psplash/<u></u>files/psplash-start.service b=
/meta/recipes-core/psplash/<u></u>files/psplash-start.service<br>
new file mode 100644<br>
index 0000000..502b150<br>
--- /dev/null<br>
+++ b/meta/recipes-core/psplash/<u></u>files/psplash-start.service<br>
@@ -0,0 +1,11 @@<br>
+[Unit]<br>
+Description=3DStarts Psplash Boot screen<br>
+Wants=3Dsystemd-vconsole-setup.<u></u>service<br>
+After=3Dsystemd-vconsole-setup.<u></u>service systemd-udev-trigger.service=
 systemd-udevd.service<br>
+DefaultDependencies=3Dno<br>
+<br>
+[Service]<br>
+ExecStart=3D/usr/bin/psplash<br>
+<br>
+[Install]<br>
+WantedBy=3Dsysinit.target<br>
diff --git a/meta/recipes-core/psplash/<a href=3D"http://psplash_git.bb" ta=
rget=3D"_blank">ps<u></u>plash_git.bb</a> b/meta/recipes-core/psplash/<a hr=
ef=3D"http://psplash_git.bb" target=3D"_blank">ps<u></u>plash_git.bb</a><br=
>
index 628ced4..16fa0ae 100644<br>
--- a/meta/recipes-core/psplash/<a href=3D"http://psplash_git.bb" target=3D=
"_blank">ps<u></u>plash_git.bb</a><br>
+++ b/meta/recipes-core/psplash/<a href=3D"http://psplash_git.bb" target=3D=
"_blank">ps<u></u>plash_git.bb</a><br>
@@ -11,6 +11,8 @@ PR =3D &quot;r15&quot;<br>
<br>
=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/$%7BB=
PN%7D" target=3D"_blank">git.yoctoproject.org/${<u></u>BPN}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://psplash-init \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://psplash-start.service \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://psplash-quit.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${SPLASH_IMAGES}&quot;<br>
<br>
=C2=A0 SPLASH_IMAGES =3D &quot;file://psplash-poky-img.h;<u></u>outsuffix=
=3Ddefault&quot;<br>
@@ -65,11 +67,14 @@ python __anonymous() {<br>
<br>
=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-inherit autotools pkgconfig update-rc.d update-alternatives<br>
+inherit autotools pkgconfig update-rc.d update-alternatives systemd<br>
<br>
=C2=A0 ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
=C2=A0 ALTERNATIVE_LINK_NAME[psplash] =3D &quot;${bindir}/psplash&quot;<br>
<br>
+SYSTEMD_PACKAGES =3D &quot;${@base_contains(&#39;DISTRO_<u></u>FEATURES&#3=
9;,&#39;systemd&#39;,&#39;${PN}&#39;,&#39;&#39;<u></u>,d)}&quot;<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;${@base_contains(&#39;DISTRO_<u></u>FEATUR=
ES&#39;,&#39;systemd&#39;,&#39;psplash-<u></u>start.service psplash-quit.se=
rvice&#39;,&#39;&#39;,d)}&quot;<br>
+<br>
=C2=A0 python do_compile () {<br>
=C2=A0 =C2=A0 =C2=A0 import shutil<br>
<br>
@@ -103,6 +108,11 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 $i =
${D}${bindir}/$i<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${bindir}/psplash<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if ${@base_contains(&#39;DISTRO_<u></u>FEATURES&#39;=
,&#39;systemd&#39;,&#39;true&#39;,&#39;<u></u>false&#39;,d)}; then<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${s=
ystemd_unitdir}/system<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${W=
ORKDIR}/*.service ${D}/${systemd_unitdir}/system<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 }<br>
<br>
=C2=A0 FILES_${PN} +=3D &quot;/mnt/.psplash&quot;<br>
<br>
</blockquote>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br>=E0=B4=B8=
=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=
=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&g=
t;Contributor to KDE project<br><a href=3D"http://fci.wikia.com/wiki/Anti-D=
RM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign<=
/a><br>

&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujit=
hh.info</a><br>
</div></div></div>

--089e015372805373ac050057a1a5--
