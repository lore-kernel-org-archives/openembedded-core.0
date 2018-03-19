Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id EF5E47895D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 11:37:09 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id j137-v6so2888882ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 04:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F/gLW29MNJaICBrNIfBVC8iyZE+N3TAzZjX3sN6ugeQ=;
	b=OLVY8z8QdHgE+rlE07LVUCg3wVI4T1DIpMawDlT8geYHXiPWtNtAdtgY6WMopAccfo
	LvEryzK7Tvp630j3ufYDx7sfUvscmt2Klvx1RMVr4oObV93cfNA3TFGhJxpT6UYo0MWq
	CYtYkTyhGXzRxwiNIwMbqPCg+Y4s+sykh5zi4qPB3Nv4KMLNiol7gJgCxMgLK4+RmlHn
	ldNrWLvArjUHbh1OCKvYYPkrP20tVqGrtw/qvZ54BZiWVdaxiihyl7RbMN3SKj3+FdgI
	xlvafkNZfOCazJHkj3fQKWmS9oVTIvp+540dcowv02kithdmQtp/3gXmFkZTM2979ybn
	iU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F/gLW29MNJaICBrNIfBVC8iyZE+N3TAzZjX3sN6ugeQ=;
	b=maVgXBOsbvY27dTPf5PQvcfwNQIqu8r242qJvA9vDn5pZ5byKVFOh3gteyzLmP551u
	3YuYZNTnl0iNnenOYtNuzf803kl+OJ/2exj7GA04vepWPsKuhZuw7Gs7dnGRmvPLM1nA
	WfVmbA4HhaZLZk0bb70/XjS9nUXdnONDdxN4yFVPpTzFXa+VxoFqTYkxVwKY9Wx0whmN
	FcoAmypmihdJW8+zHmHyweDGhSEoiwvZL8D+nLwMFrDWcqpGXoVLQex2wj4nXsVq6A77
	rAJrZxzv7MDT45Ri3RT3tadmyKzZ1Q6WQ7hyfFehbGi/Myyyj1hLUCZlmU3j9Y24lwPU
	Wt+A==
X-Gm-Message-State: AElRT7HNAEFyR2tYPnjjbfvYDRVxBeAr2ZC04CkwHjb5E0oGKBz+5Ga3
	xvv4RJ7Tte4ZQ+Yb9Qe7MDLoDXLo20rsoRk+WFvlNw==
X-Google-Smtp-Source: AG47ELu2rFg9KNIP6zstHiIjc+ei96YNkSzf3T5w+ClNHWxfp6Ywbi4NJJ/co5P4v17tDvPk7w0QS2s9N08D5hBGdH8=
X-Received: by 2002:a24:f685:: with SMTP id
	u127-v6mr1242486ith.131.1521459431008; 
	Mon, 19 Mar 2018 04:37:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 19 Mar 2018 04:36:50 -0700 (PDT)
In-Reply-To: <19ff9542e08c7df5898cc811f65200050ecf02d5.1521257828.git.raj.khem@gmail.com>
References: <cover.1521257828.git.raj.khem@gmail.com>
	<19ff9542e08c7df5898cc811f65200050ecf02d5.1521257828.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Mar 2018 11:36:50 +0000
Message-ID: <CAJTo0LZ0Mqnpu+021rDroBnVWKB-zbdC+Q35XXwQpb12_FYHNQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] x264: Use updated gnu-config artifacts
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
X-List-Received-Date: Mon, 19 Mar 2018 11:37:10 -0000
Content-Type: multipart/alternative; boundary="000000000000ed25c60567c2604c"

--000000000000ed25c60567c2604c
Content-Type: text/plain; charset="UTF-8"

On 17 March 2018 at 03:40, Khem Raj <raj.khem@gmail.com> wrote:

> It is not using autoconf completely, therefore there
> is no autoreconf happening, so when we depend on latest
> gnu-config changes e.g. new architectures like riscv
> the build does not see them and fails.
>
> Installing these files from native sysroot helps
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-multimedia/x264/x264_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-multimedia/x264/x264_git.bb
> b/meta/recipes-multimedia/x264/x264_git.bb
> index a669295044..c445d15e69 100644
> --- a/meta/recipes-multimedia/x264/x264_git.bb
> +++ b/meta/recipes-multimedia/x264/x264_git.bb
> @@ -43,6 +43,8 @@ EXTRA_OECONF = '--prefix=${prefix} \
>                 '
>
>  do_configure() {
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess
> ${S}
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
>      ./configure ${EXTRA_OECONF}


A neater way is to call gnu-configize --force ${S}.

Ross

--000000000000ed25c60567c2604c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 March 2018 at 03:40, Khem Raj <span dir=3D"ltr">&lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com<=
/a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">It is not using autoconf completely, the=
refore there<br>
is no autoreconf happening, so when we depend on latest<br>
gnu-config changes e.g. new architectures like riscv<br>
the build does not see them and fails.<br>
<br>
Installing these files from native sysroot helps<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb" rel=3D"no=
referrer" target=3D"_blank">x<wbr>264_git.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>x264/<a href=3D"http://x264_git.b=
b" rel=3D"noreferrer" target=3D"_blank">x264_git.bb</a> b/meta/recipes-mult=
imedia/<wbr>x264/<a href=3D"http://x264_git.bb" rel=3D"noreferrer" target=
=3D"_blank">x264_git.bb</a><br>
index a669295044..c445d15e69 100644<br>
--- a/meta/recipes-multimedia/<wbr>x264/<a href=3D"http://x264_git.bb" rel=
=3D"noreferrer" target=3D"_blank">x264_git.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>x264/<a href=3D"http://x264_git.bb" rel=
=3D"noreferrer" target=3D"_blank">x264_git.bb</a><br>
@@ -43,6 +43,8 @@ EXTRA_OECONF =3D &#39;--prefix=3D${prefix} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;<br>
<br>
=C2=A0do_configure() {<br>
+=C2=A0 =C2=A0 install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-<wbr>config/co=
nfig.guess ${S}<br>
+=C2=A0 =C2=A0 install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-<wbr>config/co=
nfig.sub ${S}<br>
=C2=A0 =C2=A0 =C2=A0./configure ${EXTRA_OECONF}</blockquote><div><br></div>=
<div>A neater way is to call gnu-configize --force ${S}.</div><div><br></di=
v><div>Ross</div></div></div></div>

--000000000000ed25c60567c2604c--
