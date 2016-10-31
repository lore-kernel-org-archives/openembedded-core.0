Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 00F0F60102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 19:23:03 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id d65so85166690vkg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 12:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P/JDChj3Ho32W6GNQE979HAvugarkZtLxRnFWhAUz30=;
	b=rfQheMQYY0tKsQQLZNHbEfhRbQm/WLqFRWuaVLH5lCaVwF9XbgUjs3TQvcqJ2HPYiu
	pYycNSsWBVjQzYs032j2oASXlW9c2Ou+Q6MXGg6xMaKUSMOUg+BIlgKljyr2xlpsFyU0
	7xXwaLYE/igEZqqjnGy8KMWrI89Esz6T82EQH1cSY9RwmbT7OfIuLv8oBhGfUpaBeO0C
	Aadv0vBnTZO6IG6aeQ5V1tjY3OfE65otqoyLpEmZNgYbA9Da5NqKQ3Zdv1VHMDUtbU0b
	dmHlGwKV/hwo31L2TJb7dwH6JeT1aaG9i2yhGEeHzclQDBRls8PNWTltdtjx2d2+4wBs
	pUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P/JDChj3Ho32W6GNQE979HAvugarkZtLxRnFWhAUz30=;
	b=KiOpknApeBopgj1b0a4vAgw/n+yGdLLVjodMUAHJCy0B5gFn+vrZAt/mRGgVLXqYx0
	0JvYSM0QOgGP7YDzHx27Mirb4uSPGY+ZAh75O7S3TLVG9VdH9ZY5OhhQWO4fC8xzdZe1
	TTyN55XbTcRTHaY1s9DeF3Q/yFwOFbESkiLyZ4wH+vvaEPSKbgBAReTaTEAbhZmbdJnj
	Wk5IXZ+lgv5QbQVRIENcWTODC4o/Sgxt8k586IAvFmCna/pwL1ILrAWQUo+VRD+FZRRN
	aREyjpeYrphKb/OA0GHWewx10vKp8diEK8dyv1FAQRck+IZ2R9adAnOi7QTs/ayoyosK
	Cppg==
X-Gm-Message-State: ABUngvcqdTdfcees77J0P69gL4S7iU5JhiGR1ltkrCxLT2JZyhzdarCxNfZNXnkl3y4xDuUT3x98e37jQLKMCA==
X-Received: by 10.31.153.195 with SMTP id b186mr687426vke.140.1477941784923;
	Mon, 31 Oct 2016 12:23:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Mon, 31 Oct 2016 12:23:04 -0700 (PDT)
Received: by 10.176.5.136 with HTTP; Mon, 31 Oct 2016 12:23:04 -0700 (PDT)
In-Reply-To: <e1af68e680f3fbf20d7b0a8c55802a9cdd3f404b.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
	<e1af68e680f3fbf20d7b0a8c55802a9cdd3f404b.1477886344.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Oct 2016 12:23:04 -0700
Message-ID: <CAMKF1soshS9nzHZ_OEQ9cJvZNRREnAKQKz6fXUzcJQGBD6nvHA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] classes/license: fix handling of symlinks pointed to in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 31 Oct 2016 19:23:06 -0000
Content-Type: multipart/alternative; boundary=001a1141d5b816d5b605402e237c

--001a1141d5b816d5b605402e237c
Content-Type: text/plain; charset=UTF-8

Is this sstate safe?

On Oct 30, 2016 9:11 PM, "Paul Eggleton" <paul.eggleton@linux.intel.com>
wrote:

> If you set LIC_FILES_CHKSUM to point to a relative symlink then you'll
> get "Could not copy license file" warnings in copy_license_files() since
> the symlink won't be valid after it's copied. If the source is a symlink
> then we need to dereference it first.
>
> I encountered this when I used recipetool on the sources for capnproto,
> where the c++ directory contains a LICENSE.txt symlink to the LICENSE
> file in the parent directory, and this symlink ends up being pointed to
> in LIC_FILES_CHKSUM.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index da4fc3e..660b85f 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -351,6 +351,8 @@ def copy_license_files(lic_files_paths, destdir):
>              dst = os.path.join(destdir, basename)
>              if os.path.exists(dst):
>                  os.remove(dst)
> +            if os.path.islink(src):
> +                src = os.path.realpath(src)
>              canlink = os.access(src, os.W_OK) and (os.stat(src).st_dev ==
> os.stat(destdir).st_dev)
>              if canlink:
>                  try:
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141d5b816d5b605402e237c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Is this sstate safe?</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Oct 30, 2016 9=
:11 PM, &quot;Paul Eggleton&quot; &lt;<a href=3D"mailto:paul.eggleton@linux=
.intel.com">paul.eggleton@linux.intel.com</a>&gt; wrote:<br type=3D"attribu=
tion"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">If you set LIC_FILES_CHKSUM to point t=
o a relative symlink then you&#39;ll<br>
get &quot;Could not copy license file&quot; warnings in copy_license_files(=
) since<br>
the symlink won&#39;t be valid after it&#39;s copied. If the source is a sy=
mlink<br>
then we need to dereference it first.<br>
<br>
I encountered this when I used recipetool on the sources for capnproto,<br>
where the c++ directory contains a LICENSE.txt symlink to the LICENSE<br>
file in the parent directory, and this symlink ends up being pointed to<br>
in LIC_FILES_CHKSUM.<br>
<br>
Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.inte=
l.com">paul.eggleton@linux.intel.com</a><wbr>&gt;<br>
---<br>
=C2=A0meta/classes/license.bbclass | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass<br=
>
index da4fc3e..660b85f 100644<br>
--- a/meta/classes/license.bbclass<br>
+++ b/meta/classes/license.bbclass<br>
@@ -351,6 +351,8 @@ def copy_license_files(lic_files_<wbr>paths, destdir):<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst =3D os.path.join(destdi=
r, basename)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(dst):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(dst=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.islink(src):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D os.path.re=
alpath(src)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0canlink =3D os.access(src, =
os.W_OK) and (os.stat(src).st_dev =3D=3D os.stat(destdir).st_dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if canlink:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
--<br>
2.5.5<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div></div>

--001a1141d5b816d5b605402e237c--
