Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id ED34D7841A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 11:41:36 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id o76so14400256wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 03:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QT2GlVirWaMc0mFu0hZ/L2IcNX1uf66CMpqJ9PpWpQg=;
	b=veub1K00FSA0MVUrSOTo4QguyUv2GdBZSdsiMZWNDcqEsTmm9ziG32yHRi3ugGfBSn
	HLtYWk3weQPwnvA95FgKhpruUFYGyJIQmlvEBWNhGgplwJybiHeBfNbqJH0Batwa0U+m
	pZa0kz46j5pFbMz/quaqcaex3qMnWJjH6hz7uBDmuF+q6k+IWW4IirXoCD+QSZ5vrTVf
	pTNaDQzQEJRSqQoH6c3SbzflmjOIalX8+djX/iqoiYiQqi0ZgBqwi1WMb4mMozcWOVmY
	ipgA6vtzBPQxDIrxI4/Z0Z/WgowXuSKD8d555ubpKzUYeSws5o6r1+9SkTP2mclTyQSq
	dC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QT2GlVirWaMc0mFu0hZ/L2IcNX1uf66CMpqJ9PpWpQg=;
	b=BzoVGKFsDttei6hyOWRx0NfIsPxZdJno3/9BkbcZkntvJKVTuND445yGuufIAgFhXO
	JEPd5Z9qdRqeaQZxKxsUH6Ky138y2CI3J1xtkDEOHb82OoxhKF958ieEL5BqrX9H3+zJ
	H1WET2mWd4Ohz+WlnElRosWnMNp+/6AGyxS9ZWepNeBnSniIEysYNhuIoGGDO/KRmnHl
	WwfwvtyDbAqkh9DUK1C8svfvoT8GVZ0FaaogV6b1SOziGnLq35pwQAbtMHikm0yp4K66
	mS9epfHlvyWxo3N8X2m/icR2wZXHEHwsa6Gf6EeeTJu76YvMdb079JEHaLxOmGVB+pXs
	imkA==
X-Gm-Message-State: APf1xPCBPWX2EBJSD/7kLWEBlmx4teHaQA9X7wYz9Qk4SGSn0/GZC1UH
	IFU4hm4Wa/ap983XIOLvldE5KvBve4P9rdcqGZY=
X-Google-Smtp-Source: AG47ELuXvugc8vaup8rSFS0JkiI9OTETISQ6703shRwIwfkukA7wmfoJ/OF8aue6CZTsmQgLcYiNsSmd9cEZyaetdzI=
X-Received: by 10.223.160.42 with SMTP id k39mr10633333wrk.138.1520163697625; 
	Sun, 04 Mar 2018 03:41:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 4 Mar 2018 03:41:37 -0800 (PST)
In-Reply-To: <20180212101918.228-1-Martin.Jansa@gmail.com>
References: <CA+chaQcQztFnFJjZhXVYQeTZuv4qJ41j5cNca0NJhHPz4R6x7A@mail.gmail.com>
	<20180212101918.228-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Mar 2018 12:41:37 +0100
Message-ID: <CA+chaQcHJ=x+j+5tSpdCW-QC_wOuqNNwO2TVTCPMHC--qNROkA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] bitbake.conf: add ssh to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Sun, 04 Mar 2018 11:41:37 -0000
Content-Type: multipart/alternative; boundary="94eb2c05ddb2328d25056694b1c7"

--94eb2c05ddb2328d25056694b1c7
Content-Type: text/plain; charset="UTF-8"

ping

On Mon, Feb 12, 2018 at 11:19 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> We changed to make tools required by testimage to be included
> conditionally.
> This resulted in users who use ssh for git fetching having failures.
>
> Add ssh to HOSTTOOLS_NONFATAL to make things work for the above situation.
>
> [YOCTO #12227]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f3994fc642..e2383d2709 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -472,7 +472,7 @@ HOSTTOOLS += " \
>  HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage',
> d)]}"
>
>  # Link to these if present
> -HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat
> sudo"
> +HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat
> ssh sudo"
>
>  # Temporary add few more detected in bitbake world
>  HOSTTOOLS_NONFATAL += "join nl size yes zcat"
> --
> 2.15.1
>
>

--94eb2c05ddb2328d25056694b1c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Mon, Feb 12, 2018 at 11:19 AM, Martin Jansa <span dir=3D"ltr">=
&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jans=
a@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: C=
hen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</=
a>&gt;<br>
<br>
We changed to make tools required by testimage to be included conditionally=
.<br>
This resulted in users who use ssh for git fetching having failures.<br>
<br>
Add ssh to HOSTTOOLS_NONFATAL to make things work for the above situation.<=
br>
<br>
[YOCTO #12227]<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index f3994fc642..e2383d2709 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -472,7 +472,7 @@ HOSTTOOLS +=3D &quot; \<br>
=C2=A0HOSTTOOLS +=3D &quot;${@[&#39;&#39;, &#39;ip ping ps scp ssh stty&#39=
;][bb.data.inherits_class(<wbr>&#39;testimage&#39;, d)]}&quot;<br>
<br>
=C2=A0# Link to these if present<br>
-HOSTTOOLS_NONFATAL +=3D &quot;aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp=
 socat sudo&quot;<br>
+HOSTTOOLS_NONFATAL +=3D &quot;aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp=
 socat ssh sudo&quot;<br>
<br>
=C2=A0# Temporary add few more detected in bitbake world<br>
=C2=A0HOSTTOOLS_NONFATAL +=3D &quot;join nl size yes zcat&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c05ddb2328d25056694b1c7--
