Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 43073608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 00:34:07 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id e6so420721vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 17:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=RtFWkhw8/N1ehULcPwA3WS1VnTTDzBG/CA3TOoKeKXc=;
	b=ZYdUL41f+07QhqaGjBsGajcxeDn31VNSZ9DjKnfhVKFBo+F21c4Q6RFviW2dp3VGag
	0sH7BI+yfU+SpKdxJZYhpDLY694cdnmyo5zXaYXDBCy4lO++TT1gGI4WzHjktQk4GFsO
	KNwdKM2rJeWgbsm16X3UwseLB0Yx3dbFEwEFWmP+Axq0PGatKvm1ylH1LNy17L5k4U9B
	qoyZXyAi6jPCWPWj0IWua2aOu7Yk3JhekvyK9OQFt+G/eFd36WIeN03+g8lZnzxLLWuQ
	XMbWSOfX0zEo4crnU6YBROXLykcW9SlPzyerTQvWZc4aaeExdAUSvUB56KOAk0s6mOuR
	PqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=RtFWkhw8/N1ehULcPwA3WS1VnTTDzBG/CA3TOoKeKXc=;
	b=BQs0jYMuZOg803ZNu6mweRrWmgSGzj9f1JkqZgo0vj966cT8a9j82WJe78++wNSYF6
	Kvt6DJtG2rTBjHbWSRQdX7t2A2s9UtmGLe0TmQJ79HRrwYYFWPQkUpWjbY/TBWEw8yQe
	96QiQACWqsguBCpu29brjUvcl2rotmUrWfWyotM6qtPX+X+yBQCRqJ8XQP60lIrginQq
	b+z9velE0L+WbROGRSooBa540fYYaigYQh7WJAmw4ax6cjxA9QSqUClQ9juWnwf36R46
	LAiIN3VQ7/c2yGJLwNXS0Im1c2qcJJGlTzfHBr26aC4h85ETc9D+wC7oq5C3uqzUxTkO
	1glA==
X-Gm-Message-State: AD7BkJIR4bRdOSI7xQG7gP0lWOIFq2ThIIXkiL3cRX0pLR80qs0HlwgAi/by+SCu0Jmyb+u+goI6eJFY8XSQQw==
MIME-Version: 1.0
X-Received: by 10.159.37.10 with SMTP id 10mr24815uaz.88.1458693248517; Tue,
	22 Mar 2016 17:34:08 -0700 (PDT)
Received: by 10.103.84.156 with HTTP; Tue, 22 Mar 2016 17:34:08 -0700 (PDT)
Received: by 10.103.84.156 with HTTP; Tue, 22 Mar 2016 17:34:08 -0700 (PDT)
In-Reply-To: <1455701436-11645-1-git-send-email-u.oelmann@pengutronix.de>
References: <1455701436-11645-1-git-send-email-u.oelmann@pengutronix.de>
Date: Tue, 22 Mar 2016 18:34:08 -0600
Message-ID: <CACS+7ZTw_vCMo5dfGCT9PyUMFvq7QaoXRbK5Ou60Y=m=YGhL_g@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: bugfix: adjust name of statd service unit
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
X-List-Received-Date: Wed, 23 Mar 2016 00:34:11 -0000
Content-Type: multipart/alternative; boundary=94eb2c1241f4ea0e9c052eac7c93

--94eb2c1241f4ea0e9c052eac7c93
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 Feb 2016 3:48 a.m., "Ulrich =C3=96lmann" <u.oelmann@pengutronix.de> w=
rote:
>
> Upstream nfs-utils use 'rpc-statd.service' and Yocto introduced
> 'nfs-statd.service' instead but forgot to update the mount.nfs helper
> 'start-statd' accordingly.
>
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>  .../files/bugfix-adjust-statd-service-name.patch   | 34
++++++++++++++++++++++
>  .../nfs-utils/nfs-utils_1.3.3.bb                   |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644
meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.=
patch
>
> diff --git
a/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-nam=
e.patch
b/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-nam=
e.patch
> new file mode 100644
> index 0000000..14bd403
> --- /dev/null
> +++
b/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-nam=
e.patch
> @@ -0,0 +1,34 @@
> +From 398fed3bb0350cb1229e54e7020ae0e044c206d1 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Ulrich=3D20=3DC3=3D96lmann?=3D <u.oelmann@pengutronix.=
de>
> +Date: Wed, 17 Feb 2016 08:33:45 +0100
> +Subject: bugfix: adjust statd service name
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream uses 'rpc-statd.service' and Yocto introduced
'nfs-statd.service'
> +instead but forgot to update the mount.nfs helper 'start-statd'
accordingly.
> +
> +Upstream-Status: Inappropriate [other]
> +
> +Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> +---
> + utils/statd/start-statd | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/utils/statd/start-statd b/utils/statd/start-statd
> +index 8211a90..3c2aa6f 100755
> +--- a/utils/statd/start-statd
> ++++ b/utils/statd/start-statd
> +@@ -16,7 +16,7 @@ fi
> + # First try systemd if it's installed.
> + if [ -d /run/systemd/system ]; then
> +     # Quit only if the call worked.
> +-    systemctl start rpc-statd.service && exit
> ++    systemctl start nfs-statd.service && exit
> + fi
> +
> + # Fall back to launching it ourselves.
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
> index ea00656..a6268f3 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
> @@ -32,6 +32,7 @@ SRC_URI =3D
"${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>
file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
>             file://nfs-utils-debianize-start-statd.patch \
>
file://0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch \
> +           file://bugfix-adjust-statd-service-name.patch \
>  "
>
>  SRC_URI[md5sum] =3D "cd6b568c2e9301cc3bfac09d87fbbc0b"
> --
> 2.7.0
>
> --
>

I just got bit by this in jethro. Can it be backported?

_______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--94eb2c1241f4ea0e9c052eac7c93
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 17 Feb 2016 3:48 a.m., &quot;Ulrich =C3=96lmann&quot; &lt;<a href=3D"mai=
lto:u.oelmann@pengutronix.de">u.oelmann@pengutronix.de</a>&gt; wrote:<br>
&gt;<br>
&gt; Upstream nfs-utils use &#39;rpc-statd.service&#39; and Yocto introduce=
d<br>
&gt; &#39;nfs-statd.service&#39; instead but forgot to update the mount.nfs=
 helper<br>
&gt; &#39;start-statd&#39; accordingly.<br>
&gt;<br>
&gt; Signed-off-by: Ulrich =C3=96lmann &lt;<a href=3D"mailto:u.oelmann@peng=
utronix.de">u.oelmann@pengutronix.de</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../files/bugfix-adjust-statd-service-name.patch=C2=A0 =C2=A0| 3=
4 ++++++++++++++++++++++<br>
&gt; =C2=A0.../nfs-utils/<a href=3D"http://nfs-utils_1.3.3.bb">nfs-utils_1.=
3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
&gt; =C2=A02 files changed, 35 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/files/bug=
fix-adjust-statd-service-name.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-s=
tatd-service-name.patch b/meta/recipes-connectivity/nfs-utils/files/bugfix-=
adjust-statd-service-name.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..14bd403<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-se=
rvice-name.patch<br>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +From 398fed3bb0350cb1229e54e7020ae0e044c206d1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Ulrich=3D20=3DC3=3D96lmann?=3D &lt;<a href=3D"mailt=
o:u.oelmann@pengutronix.de">u.oelmann@pengutronix.de</a>&gt;<br>
&gt; +Date: Wed, 17 Feb 2016 08:33:45 +0100<br>
&gt; +Subject: bugfix: adjust statd service name<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +Upstream uses &#39;rpc-statd.service&#39; and Yocto introduced &#39;n=
fs-statd.service&#39;<br>
&gt; +instead but forgot to update the mount.nfs helper &#39;start-statd&#3=
9; accordingly.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [other]<br>
&gt; +<br>
&gt; +Signed-off-by: Ulrich =C3=96lmann &lt;<a href=3D"mailto:u.oelmann@pen=
gutronix.de">u.oelmann@pengutronix.de</a>&gt;<br>
&gt; +---<br>
&gt; + utils/statd/start-statd | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/utils/statd/start-statd b/utils/statd/start-statd<br>
&gt; +index 8211a90..3c2aa6f 100755<br>
&gt; +--- a/utils/statd/start-statd<br>
&gt; ++++ b/utils/statd/start-statd<br>
&gt; +@@ -16,7 +16,7 @@ fi<br>
&gt; + # First try systemd if it&#39;s installed.<br>
&gt; + if [ -d /run/systemd/system ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Quit only if the call worked.<br>
&gt; +-=C2=A0 =C2=A0 systemctl start rpc-statd.service &amp;&amp; exit<br>
&gt; ++=C2=A0 =C2=A0 systemctl start nfs-statd.service &amp;&amp; exit<br>
&gt; + fi<br>
&gt; +<br>
&gt; + # Fall back to launching it ourselves.<br>
&gt; +--<br>
&gt; +2.1.4<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs=
-utils_1.3.3.bb">nfs-utils_1.3.3.bb</a> b/meta/recipes-connectivity/nfs-uti=
ls/<a href=3D"http://nfs-utils_1.3.3.bb">nfs-utils_1.3.3.bb</a><br>
&gt; index ea00656..a6268f3 100644<br>
&gt; --- a/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_=
1.3.3.bb">nfs-utils_1.3.3.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_=
1.3.3.bb">nfs-utils_1.3.3.bb</a><br>
&gt; @@ -32,6 +32,7 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/nf=
s-utils/${PV}/nfs-utils-${PV}.tar.x<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://nfs-utils-Do-not-pass=
-CFLAGS-to-gcc-while-building.patch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://nfs-utils-debianize-s=
tart-statd.patch \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-nfs-utils-statd-=
fix-a-segfault-caused-by-improper-us.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://bugfix-adjust-statd-s=
ervice-name.patch \<br>
&gt; =C2=A0&quot;<br>
&gt;<br>
&gt; =C2=A0SRC_URI[md5sum] =3D &quot;cd6b568c2e9301cc3bfac09d87fbbc0b&quot;=
<br>
&gt; --<br>
&gt; 2.7.0<br>
&gt;<br>
&gt; --<br>
&gt;</p>
<p dir=3D"ltr">I just got bit by this in jethro. Can it be backported?</p>
<p dir=3D"ltr"> _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--94eb2c1241f4ea0e9c052eac7c93--
