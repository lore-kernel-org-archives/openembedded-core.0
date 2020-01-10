Return-Path: <anibal.limon@linaro.org>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id DEA007FCFB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 15:27:38 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id b79so1459591vsd.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 07:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oSg7VFI/UJd1ECqNwgdGHaKrHSzex/EgPHfdk1gwok8=;
	b=OCfh6gXvHtp2W7DZtlCxLf8bOgKp2J7zJ15rPE9B7cQ/LylPDk+5Wu5uQWoA8vz+HH
	DTOVxWPaB7qlVAD+mCwEopwhrokz/NVuxQFsoupVt/4iMbbh/ltuvVTSziKPMBEZWusu
	cSD374+hRhrlf+V+iUE3FN56M8j/t5psUcs38utyAXMDlnLuxKOdwci6j3vwmF+BW8qO
	ISZbMX2fXMpsUWZdfFRU2o9ZXovs8EHVxuPS+qWegHSJ3fcOOfsqSXHeFxyG0IoCOb/7
	ISJ1UDmhzx7rn6YRTzI3wYjwFDa7UsbXZsKzHw+1s17nwYGGi+RcbqIVIBcTLyGhNN14
	7ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oSg7VFI/UJd1ECqNwgdGHaKrHSzex/EgPHfdk1gwok8=;
	b=GHf9QbsVOBKrthCfTmp3OUXDSXU36s6Z4oeiizpUAMSS62BTKvM43h1f6crcvyzVLK
	CKmEVEBVb1pPmLevOkL/wYVAgNa7uoTXBbjKNsrllQd0S/F012LX61wvdRH7Uu5q3xHN
	Jq45FKKVT6QveOLJb9SI6L80T7onygQp4sqaZwCqOzrsyJNiruTGG0wzrpVSK/SUt2b4
	nVgk3G++KGsgxwl9wrV4azcPoRZa1v2a8fUwdL1fOf2HFadDSRTTlXujBf/H9DG0MzZQ
	WqVbWc7DaHQCoioqw92trToJzCHE/avXmvpC54FF4d3W1KoWdgrcZ0KhDzHgXAKzuUJU
	5lzw==
X-Gm-Message-State: APjAAAWix2EwO15CxFkGF+KE4MS4idcPJCtY+B3p44OMbyW4Ctsa6tzB
	YGMGARwm2ACx1q/HxC4D2kIPAyY9KHLoebMfQ9yWsVAW
X-Google-Smtp-Source: APXvYqwxsvlQ1ucCkKIRxh47VjK9nPtMiULIrz1ewJMH79iERpy+5G8qsZb4E664rj0TUs+uzFIoBGc8gKi/RZKwrJU=
X-Received: by 2002:a67:7795:: with SMTP id s143mr2083629vsc.227.1578670059621;
	Fri, 10 Jan 2020 07:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20200109200258.410279-1-anibal.limon@linaro.org>
In-Reply-To: <20200109200258.410279-1-anibal.limon@linaro.org>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Fri, 10 Jan 2020 09:27:28 -0600
Message-ID: <CA+_AqitOta6C4DCdK5sVDvhuA3Cs3DDD_dE5D-pJ2_YA=Cr5=g@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/conf/bitbake.conf: Add BB_SIGNATURE_LOCAL_DIRS_EXCLUDE with VCS
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
X-List-Received-Date: Fri, 10 Jan 2020 15:27:39 -0000
Content-Type: multipart/alternative; boundary="0000000000001f2471059bcac449"

--0000000000001f2471059bcac449
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forget this patch, I was confused about which version merged on bitbake.

Anibal

On Thu, 9 Jan 2020 at 14:03, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.or=
g> wrote:

> The new BB_SIGNATURE_LOCAL_DIRS_EXCLUDE allows you to specify a list
> of directories to exclude when making taskhash [1], set default as common
> VCS directories.
>
> [1]
> http://git.openembedded.org/bitbake/commit/?id=3D923aff060d8aba8456979c35=
b16d300ba7c13ff9
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  meta/conf/bitbake.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 62b5466b71..b3688edd9a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -885,6 +885,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?=3D "doc deps depends \
>      sstate-lockfile-shared prefuncs postfuncs export_func deptask
> rdeptask \
>      recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename
> lineno \
>      progress mcdepends number_threads"
> +BB_SIGNATURE_LOCAL_DIRS_EXCLUDE ?=3D "CVS .bzr .git .hg .osc .p4 .repo .=
svn"
>
>  MLPREFIX ??=3D ""
>  MULTILIB_VARIANTS ??=3D ""
> --
> 2.24.1
>
>

--0000000000001f2471059bcac449
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Forget this patch, I was confused about which version merg=
ed on bitbake.<div><br></div><div>Anibal</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Jan 2020 at 14:03, =
An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org">aniba=
l.limon@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">The new BB_SIGNATURE_LOCAL_DIRS_EXCLUDE allows you to spe=
cify a list<br>
of directories to exclude when making taskhash [1], set default as common<b=
r>
VCS directories.<br>
<br>
[1] <a href=3D"http://git.openembedded.org/bitbake/commit/?id=3D923aff060d8=
aba8456979c35b16d300ba7c13ff9" rel=3D"noreferrer" target=3D"_blank">http://=
git.openembedded.org/bitbake/commit/?id=3D923aff060d8aba8456979c35b16d300ba=
7c13ff9</a><br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 62b5466b71..b3688edd9a 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -885,6 +885,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?=3D &quot;doc deps depends =
\<br>
=C2=A0 =C2=A0 =C2=A0sstate-lockfile-shared prefuncs postfuncs export_func d=
eptask rdeptask \<br>
=C2=A0 =C2=A0 =C2=A0recrdeptask nodeprrecs stamp-extra-info sstate-outputdi=
rs filename lineno \<br>
=C2=A0 =C2=A0 =C2=A0progress mcdepends number_threads&quot;<br>
+BB_SIGNATURE_LOCAL_DIRS_EXCLUDE ?=3D &quot;CVS .bzr .git .hg .osc .p4 .rep=
o .svn&quot;<br>
<br>
=C2=A0MLPREFIX ??=3D &quot;&quot;<br>
=C2=A0MULTILIB_VARIANTS ??=3D &quot;&quot;<br>
-- <br>
2.24.1<br>
<br>
</blockquote></div>

--0000000000001f2471059bcac449--
