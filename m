Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id DED297199A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 02:06:58 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id w11so5168343oia.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 19:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Magw71HxCbgiouC7uIj5Mv13AFsxBj5mmI/qrL/lqx8=;
	b=pq2eq5SYEMqJ/rD6fk21Oy3UgjJDMBj7Uf0y31iD+n3eu7CDACKgsImahiAvDIcVcN
	4o5UTjHE9VLTDPLX1jdU+62C+vWwzPtkFhcALmwI/r13AfBX+qP2nrx6BSfUrVGLOSAP
	Wx7vKAmGhRRSOFLIdDIXCnGMKSc18vnHymB0kMyCwW8TRTaDp1io6qXao3pm9ZxQAvMl
	JYuyLJ5I9vWdYX0S7CFk1+7by3Qnmu36ghKjffljD7t/dSN7fLz/iGWY72QLmWy7nOrs
	4HfXkOK3f3M9iDyCaD72zVs7e27/fcrSrrQ32CsyRuKqs5JK+ldMd8mU7WSECDAbBFiO
	lZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Magw71HxCbgiouC7uIj5Mv13AFsxBj5mmI/qrL/lqx8=;
	b=YhA56+MFRaHcYEwyQ4Ev1Je8txtl4rQH9hz5NfWX8/OFu7EKfwvetbQCTBZgf5h4ao
	E8FqwHi6g2PfmgkyAi8vpiw8fACEQ7CecgP8WK8USdsqdih+rfzl+cX06cXgrudPL8eX
	0O/pxT+RYMQPmkz3t/2Wje9TOeS+S0lhvkTLUEEx+qBXzHmsOxsj6czSi0nzyPYPoT+3
	nhA+SttoUYcqfeAsXn6/aEADLklzIP/UZWDT+yw4hsDf4dtXFMKcdO3e2kS7syiD/y2y
	YwUn+M0HcvprcXbY0APLhhD31mvjrGDzdq0NixHJgZIkbTc+cYvLUItX9qcf+KXt0/kM
	8rBg==
X-Gm-Message-State: AE9vXwO5/tpUsfqSe/VASb+A45PUjU+LeoUq9bWGJRafY8zPW/DD1W4QygDTtIoMHXWttaVZ/G33QkirWVEiBg==
X-Received: by 10.202.192.69 with SMTP id q66mr13154514oif.52.1474510020100;
	Wed, 21 Sep 2016 19:07:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Wed, 21 Sep 2016 19:06:39 -0700 (PDT)
In-Reply-To: <facdb05bcfaa9eab9eed0b7db17fad854f6ec046.1474444335.git.mariano.lopez@linux.intel.com>
References: <cover.1474444335.git.mariano.lopez@linux.intel.com>
	<facdb05bcfaa9eab9eed0b7db17fad854f6ec046.1474444335.git.mariano.lopez@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 21 Sep 2016 19:06:39 -0700
X-Google-Sender-Auth: OGdKeeuClHvi3XTMGYyB-rd3ik4
Message-ID: <CABcZAN=K8oZwJds4AnjMcvLoq3PtrS+Be8hu=GQYKQUy-s=65A@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] toolchain-shar-relocate.sh: Add error-handling
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
X-List-Received-Date: Thu, 22 Sep 2016 02:07:01 -0000
Content-Type: multipart/alternative; boundary=001a113d4536f74f89053d0f1df9

--001a113d4536f74f89053d0f1df9
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 21, 2016 at 12:54 AM, <mariano.lopez@linux.intel.com> wrote:

> diff --git a/meta/files/toolchain-shar-relocate.sh
> b/meta/files/toolchain-shar-relocate.sh
> index d4bcf0e..e491153 100644
> --- a/meta/files/toolchain-shar-relocate.sh
> +++ b/meta/files/toolchain-shar-relocate.sh
> @@ -1,3 +1,8 @@
> +if ! xargs --version > /dev/null 2>&1; then
> +       echo "xargs is required by the relocation script, please install
> it firts. Abort!"
> +       exit 1
> +fi
>

This is pointless, xargs is mandated by posix/sus.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113d4536f74f89053d0f1df9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Sep 21, 2016 at 12:54 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:=
mariano.lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":l6"=
 class=3D"a3s aXjCH m1574d78834e657af">diff --git a/meta/files/toolchain-sh=
ar-<wbr>relocate.sh b/meta/files/toolchain-shar-<wbr>relocate.sh<br>
index d4bcf0e..e491153 100644<br>
--- a/meta/files/toolchain-shar-<wbr>relocate.sh<br>
+++ b/meta/files/toolchain-shar-<wbr>relocate.sh<br>
@@ -1,3 +1,8 @@<br>
+if ! xargs --version &gt; /dev/null 2&gt;&amp;1; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;xargs is required by the relocation =
script, please install it firts. Abort!&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
+fi</div></blockquote></div><br>This is pointless, xargs is mandated by pos=
ix/sus.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitB=
ake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engi=
neer, Mentor Graphics</div>
</div></div>

--001a113d4536f74f89053d0f1df9--
