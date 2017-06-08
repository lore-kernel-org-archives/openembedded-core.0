Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 206E778205
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 13:36:28 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id u19so41328919qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 06:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eaphH8JBlt5RM5IC8wOgd51E7Y9zUtMYJHDaK6ugQS8=;
	b=vrVPfyAi7i6Qmoz9nDGF6AGuEsfL/sThNkfTUtEqvWA9Or0OJuRlnqpqlrXdYw8m14
	0r25K+T7i1HG+sn/Z39KBVPovio9W4xvF5ch13lWJlkV7mK5x5v2X/r6nVZ/mEWKcR7c
	BCvcPCbkigA6IUTb5kMZ2TrlMuVbpBb5pA0m7lK+OyHEzdOSWEg/LSe5v8za5K1Ldunz
	ASx/isOInoXo9WbGR7y7hmbm0SAYZUXpd5pRnCinLl6iEWIHAk22CHynBdhKGoZDqunh
	wQvoewHAOAs3/HmFlAl+Fq5s5pvBYHYoOrmXWmbsjOIGY7Hs7YU0Xos+UD+WekzCJJqr
	bJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eaphH8JBlt5RM5IC8wOgd51E7Y9zUtMYJHDaK6ugQS8=;
	b=k4MrfKBB1+ZhUV8d0i7FYMb175FD4pFBduyM3e8cm4Lfeieal8ttZfFdjbep79XgDH
	0AT0CDrBj5CU6UDqUQUe4r/MRmyN57Du0wpD0NLFROb2M1l0uPeVDwkhR8lVKm7MPXdo
	Q+2/4zfqBkYGVOTyVFre/T1s/jMVKYsRNqq2kp+1DSrFyhAScFkPpIuG9UM5ePP3FNGV
	MDNk6rC/HFtK08CfLbRiwCdXtk7qvtBmjuqqwFScpkUrumT12bmDmRg4YpBl9nG/uYF1
	/P1UeXeV7QH2US3nf6eL/lVjGXeKvQtxDDZH35mSXZQnxmyr/N1mkKkypFYkqK3Z8m41
	36Bw==
X-Gm-Message-State: AODbwcBRjDxpCQ07AbMqewd5oCDUUk0JzX13CiYRcw14jdaGLF9M9g72
	PcNQndU3vuLquZ6EFs6fED7KbMEMBX7f
X-Received: by 10.200.45.231 with SMTP id q36mr15607276qta.177.1496928989925; 
	Thu, 08 Jun 2017 06:36:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 8 Jun 2017 06:36:09 -0700 (PDT)
In-Reply-To: <1496654112-103612-1-git-send-email-li.zhou@windriver.com>
References: <1496654112-103612-1-git-send-email-li.zhou@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Jun 2017 14:36:09 +0100
Message-ID: <CAJTo0LY90JXpc4Af8qY-fU-LjX9PFFwg3rHvYrXKO5yGspL04g@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] python2/3: Remove building host path from packages
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
X-List-Received-Date: Thu, 08 Jun 2017 13:36:29 -0000
Content-Type: multipart/alternative; boundary="001a1143cabab2ebd1055172f06b"

--001a1143cabab2ebd1055172f06b
Content-Type: text/plain; charset="UTF-8"

On 5 June 2017 at 10:15, Li Zhou <li.zhou@windriver.com> wrote:

> @@ -185,9 +185,14 @@ py_package_preprocess () {
>         install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${
> PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile
>         # Remove references to buildmachine paths in target Makefile and
> _sysconfigdata
>         sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e
> s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
> +               -e 's:${STAGING_DIR_NATIVE}::g' \
> +               -e 's:${STAGING_DIR_HOST}::g' \
> +               -e 's:${WORKDIR}::g' \
> +               -e 's:${TMPDIR}::g' \
>                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
>                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${
> PYTHON_MAJMIN}${PYTHON_ABI}/Makefile \
> -               ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
> +               ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
> \
> +               ${PKGD}/${bindir}/python${PYTHON_MAJMIN}${PYTHON_ABI}-
> config
>  }
>

The problem with doing this is py_package_preprocess is that it doesn't
touch the .pyc files, so they'll have to be recompiled:

ross@flashheart
/data/poky-master/tmp/work/corei7-64-poky-linux/python3/3.5.3-r1.0/packages-split
$ grep -r /data/poky-master
Binary file
python3-core/usr/lib/python3.5/__pycache__/_sysconfigdata.cpython-35.opt-2.pyc
matches
Binary file
python3-core/usr/lib/python3.5/__pycache__/_sysconfigdata.cpython-35.opt-1.pyc
matches
Binary file
python3-core/usr/lib/python3.5/__pycache__/_sysconfigdata.cpython-35.pyc
matches

I think the seds need to be moved earlier in the build, or that py file
recompiled.

Ross

--001a1143cabab2ebd1055172f06b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 June 2017 at 10:15, Li Zhou <span dir=3D"ltr">&lt;<a href=3D"mailto:li=
.zhou@windriver.com" target=3D"_blank">li.zhou@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204=
,204,204);padding-left:1ex"><div id=3D"gmail-:1hn" class=3D"gmail-a3s gmail=
-aXjCH gmail-m15c778af488b389e">@@ -185,9 +185,14 @@ py_package_preprocess =
() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${B}/Makefile.orig ${PKGD}/${li=
bdir}/<span class=3D"gmail-il">python</span>${<wbr>PYTHON_MAJMIN}/config-${=
<wbr>PYTHON_MAJMIN}${PYTHON_ABI}/<wbr>Makefile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove references to buildmachine paths in ta=
rget Makefile and _sysconfigdata<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s:--sysroot=3D${STAGING_DIR_<wbr=
>TARGET}::g&#39; -e s:&#39;--with-libtool-sysroot=3D${<wbr>STAGING_DIR_TARG=
ET}&#39;::g \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${STAGING=
_DIR_NATIVE}::g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${STAGING=
_DIR_HOST}::g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${WORKDIR=
}::g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s:${TMPDIR}=
::g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PKGD}/${libdir}/<=
span class=3D"gmail-il">python</span>${<wbr>PYTHON_MAJMIN}/config/Makefile =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PKGD}/${libdir}/<=
span class=3D"gmail-il">python</span>${<wbr>PYTHON_MAJMIN}/config-${<wbr>PY=
THON_MAJMIN}${PYTHON_ABI}/<wbr>Makefile \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${libdir}/<=
span class=3D"gmail-il">python</span>${<wbr>PYTHON_MAJMIN}/_sysconfigdata.<=
wbr>py<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${libdir}/<=
span class=3D"gmail-il">python</span>${<wbr>PYTHON_MAJMIN}/_sysconfigdata.<=
wbr>py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PKGD}/${bindir}/<=
span class=3D"gmail-il">python</span>${<wbr>PYTHON_MAJMIN}${PYTHON_ABI}-<wb=
r>config<br>
=C2=A0}</div></blockquote></div><br>The problem with doing this is py_packa=
ge_preprocess is that it doesn&#39;t touch the .pyc files, so they&#39;ll h=
ave to be recompiled:</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra"><div class=3D"gmail_extra">ross@flashheart /data/poky-mast=
er/tmp/work/corei7-64-poky-linux/python3/3.5.3-r1.0/packages-split</div><di=
v class=3D"gmail_extra">$ grep -r /data/poky-master</div><div class=3D"gmai=
l_extra">Binary file python3-core/usr/lib/python3.5/__pycache__/_sysconfigd=
ata.cpython-35.opt-2.pyc matches</div><div class=3D"gmail_extra">Binary fil=
e python3-core/usr/lib/python3.5/__pycache__/_sysconfigdata.cpython-35.opt-=
1.pyc matches</div><div class=3D"gmail_extra">Binary file python3-core/usr/=
lib/python3.5/__pycache__/_sysconfigdata.cpython-35.pyc matches</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I think the seds =
need to be moved earlier in the build, or that py file recompiled.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v></div>

--001a1143cabab2ebd1055172f06b--
