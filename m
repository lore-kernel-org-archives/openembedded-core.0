Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8FFC26FFED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 20:27:12 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id d62so8216400iof.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 13:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=9MQgsuJ1KHBZ+Lab3bXWPF1OHLgJhMcxY5MjIHHob18=;
	b=R6Iy6XqSooRiYXwWDST8XKKttZWTvBNmzAvzB2PM40/hSe91t+CexWB+5NyPYIUIuX
	IFImDSYv00FeDzUhSo/p5BgbgkvOidjbNio0n6WP4D6/jYHlybfJs7YaEEuTPFVccKCT
	kQ9KH+5qbr3dUX6Mvi2F9y3q3YoED5shjSrKuwpXpfRhtotP2rW/dreiVjBFgI9Qceic
	1ycLlD1mPtQtKeUboFKSe1xDJvOcCpx+jg42g00JNwZqDVqbW6PTLIBWD5jFnWTmIsLX
	S48yye1DGUPCalGwzArVXHHObZtdgDrZVZ9QdY56j3D3khXWALSnJENK+QmMgclhJWXA
	hc1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=9MQgsuJ1KHBZ+Lab3bXWPF1OHLgJhMcxY5MjIHHob18=;
	b=xC8UpUaniqW/71UJXodVlWZFuO9hT2zUhYVNLHb7NzgdVWf4M+yvkfqo4pWBXGkOcH
	olnRQ41ZrrrIz5Wdnx3/qaegjPlJB9fVDTCzs7iL7grvF7/scpqIv6yks4H4ZtIHRJBx
	X1+fn4DL9VHqf9xnitgi1gS3rJJW7wo08baATprWi0Gh1vaOHBAczKC35vf8eaYN+Jor
	EVP+uwc/nwt5ZjSrLFMnS5Gh2nochj9s4kJpO5eBU1e8UpW1ZKxh7RqDMebsssTsfPIh
	t5aldFR8jbwrvVuvctRbrm5tUrQui6OeEbXLy1corTBkLwZkiztzMPGjTKTsQ1rcNK/K
	Ghfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=9MQgsuJ1KHBZ+Lab3bXWPF1OHLgJhMcxY5MjIHHob18=;
	b=Wj7bNn6OciZhe9OR6ni4stu1r7NGv7FWs4qDvfGL0gPHaCrAsgIW+ItyTbpRyLExuu
	17wk6QKRGIuXaJhGZdAzgdr0P41Eu7OL+O31uCVWBefurywU99CnR6Hylsim6KYpdXpL
	sHX3BZA65gBMab0coZrMSwI6/wfc+5hVFvRKD8vuYdn0GeUTJ1D7mhOzFEi+BWodCq8Z
	9tRAZHBe3eRyyItnHPvD5UBxJGEWNazBGKyauAQ6vqN/xvRYxiy6aVR/xMPijsAOJb7y
	ZNr7ORK8oa7jZHBbNujfgf5pwNpkwawD73ioBttDlcsrK/D1C/tWSoQnAuGi4h8F6ddM
	cweQ==
X-Gm-Message-State: AOPr4FWFA+KTgidne7Gxcl7wjaKySfPNbFdO0KWlj8u1g0dgeH4MDnn8mdnyOhC8hy2By6D+jFQkO+k35eSITA==
X-Received: by 10.107.131.12 with SMTP id f12mr13100966iod.126.1461788832669; 
	Wed, 27 Apr 2016 13:27:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Wed, 27 Apr 2016 13:26:53 -0700 (PDT)
In-Reply-To: <80df31c476967370f13a104cc5a777cd5127ef1b.1461700116.git.pkj@axis.com>
References: <cover.1461700116.git.pkj@axis.com>
	<80df31c476967370f13a104cc5a777cd5127ef1b.1461700116.git.pkj@axis.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 27 Apr 2016 13:26:53 -0700
X-Google-Sender-Auth: 7nfaoahOrXOY5JZemnkNAAYdMrU
Message-ID: <CABcZANmw0D1xZsFQZYYxyQDwbj3P_8Ab1CO0k52f2XpKbUUwFg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] metadata_scm.bbclass: Do not assume ${COREBASE} is a Git repo
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
X-List-Received-Date: Wed, 27 Apr 2016 20:27:13 -0000
Content-Type: multipart/alternative; boundary=001a113f31c21ba66b05317d3c3c

--001a113f31c21ba66b05317d3c3c
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 26, 2016 at 12:49 PM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> The functions base_detect_revision() and base_detect_branch() try to
> extract SCM meta information from the path returned by
> base_get_scmbasepath(), which currently returns ${COREBASE}. However,
> making the assumption that ${COREBASE} contains SCM meta information
> can be false. It is true for Poky, but not necessarily other
> environments. A better option is to look for the SCM meta information
> based on the meta layer.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/metadata_scm.bbclass | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/metadata_scm.bbclass
> b/meta/classes/metadata_scm.bbclass
> index 0f7f423..2e6fac2 100644
> --- a/meta/classes/metadata_scm.bbclass
> +++ b/meta/classes/metadata_scm.bbclass
> @@ -4,8 +4,7 @@ METADATA_REVISION ?= "${@base_detect_revision(d)}"
>  def base_detect_revision(d):
>      path = base_get_scmbasepath(d)
>
> -    scms = [base_get_metadata_git_revision, \
> -            base_get_metadata_svn_revision]
> +    scms = [base_get_metadata_git_revision]
>

Was this change intended? Because it doesn't match up with the commit
message, as far as I can see.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113f31c21ba66b05317d3c3c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 26, 2016 at 12:49 PM, Peter Kjellerstedt <span dir=3D"ltr">=
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">The functions base_detect_revision() and base_detect_branch() try to<br>
extract SCM meta information from the path returned by<br>
base_get_scmbasepath(), which currently returns ${COREBASE}. However,<br>
making the assumption that ${COREBASE} contains SCM meta information<br>
can be false. It is true for Poky, but not necessarily other<br>
environments. A better option is to look for the SCM meta information<br>
based on the meta layer.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/metadata_scm.bbclass | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.=
bbclass<br>
index 0f7f423..2e6fac2 100644<br>
--- a/meta/classes/metadata_scm.bbclass<br>
+++ b/meta/classes/metadata_scm.bbclass<br>
@@ -4,8 +4,7 @@ METADATA_REVISION ?=3D &quot;${@base_detect_revision(d)}&qu=
ot;<br>
=C2=A0def base_detect_revision(d):<br>
=C2=A0 =C2=A0 =C2=A0path =3D base_get_scmbasepath(d)<br>
<br>
-=C2=A0 =C2=A0 scms =3D [base_get_metadata_git_revision, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base_get_metadata_svn_revision]<=
br>
+=C2=A0 =C2=A0 scms =3D [base_get_metadata_git_revision]<br></blockquote><d=
iv><br></div><div>Was this change intended? Because it doesn&#39;t match up=
 with the commit message, as far as I can see.</div></div>-- <br><div class=
=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior S=
oftware Engineer, Mentor Graphics</div>
</div></div>

--001a113f31c21ba66b05317d3c3c--
