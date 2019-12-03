Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 001917F266
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 23:37:56 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m188so5377925qkc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2019 15:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nzqNQ7W4mt3y/zUuZWm1k59P87Ml9bHBYYpyE7wsB3c=;
	b=LO0SMv5Og+GNhy3xp41V3pnjmB42wNooLlILe/OZOjqEwv/Ofqsk6UAPKL77Z3dxKg
	Xk7gN7CCwVSwgqPONh4i/VbvXKU+PgkocOzsA3gwv5SQw5u1V2LJHBvOhvXx4Li0rR/m
	HXBmMzPpnxWR40bX19YKv4/1UtJCcwt5bzpV0WMStCpqlVQXlHJd2Z4bzuPs4UUjY9LS
	SugHV/CPQ8YFmb6KM/qDpVcXRS5fJdiE5FhRbimKgZWVkbnh3+Gkv6MNrPcmFz1BTqfv
	jEOfNKtcsMEvThT7VW5rWURFdXN/tNdxAjwPdhItiLCoxnmFfXuRlhZ7AIa3+iob2uGF
	t1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nzqNQ7W4mt3y/zUuZWm1k59P87Ml9bHBYYpyE7wsB3c=;
	b=YjcCAHFBpzKVKaf65xbohpErRCfa1Be2nR7bpkXDDvbxZyXVWd09ZWE5koOtij54UH
	c5VOLjo9sd3hQxOTHdNwlrBT+lQJ3qmxt0c6aCyJCgrsaLKywN4y/9XwGTRV06EjtRP2
	wfCOpL9jU6PXT31twWLywnM0grINlbis4vyWsp2cWsSAz7fhP3jImlDhT0eE7CWQ8SOW
	svo8Y4DUTPlCHWcLNe8yh5zExgC9RNlVnQqT9L+DuvfL6MpDsQXtkZm1n+vqnUjoqNd1
	Ed4jtOlLtsmDg2qMvxbWpWzUgcIomJ9ZuCDoUZpsSbW0ggG6nPwR1rbYOVlsYgWcWQCh
	sDhA==
X-Gm-Message-State: APjAAAVL66MxxSyKlEoRhrH5ewUvb/LE0u+Q5Pfl3NWJ4YsFa7An3XxM
	1IlX3nCv2lPLIkD8WUINFtuP1e8Kqx1FhuyU8Jg=
X-Google-Smtp-Source: APXvYqwBA922x2FDy0t4vDiwvZPjSGAoEzxnWqyMIjcW8AxQ/EE7qniCSUZb4zZdLkcH2p2VDeuvSmiG90gvK5ATccI=
X-Received: by 2002:a37:bf82:: with SMTP id p124mr8184453qkf.337.1575416277488;
	Tue, 03 Dec 2019 15:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20191203220624.26500-1-anibal.limon@linaro.org>
In-Reply-To: <20191203220624.26500-1-anibal.limon@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Dec 2019 15:37:47 -0800
Message-ID: <CAMKF1spabEvBMwjvefWN7ULZ8ZpGfNDgJ1gf75u1B7h3oD4nJg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta/classes/meson.bbclass: Add inherit setuptools3
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
X-List-Received-Date: Tue, 03 Dec 2019 23:37:57 -0000
Content-Type: multipart/alternative; boundary="00000000000097d77e0598d52f4b"

--00000000000097d77e0598d52f4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2019 at 2:06 PM An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.=
org> wrote:

> Fixes,
>
> ...
> | Program python3 found: YES
> (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aa=
rch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-na=
tive/python3)
> |
> | meson.build:36:0: ERROR: <ExternalProgram 'python3' ->
> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/a=
arch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-n=
ative/python3']>
> is not a valid python or it is missing setuptools
> |
> | A full log can be found at
> /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aar=
ch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
> | WARNING: exit code 1 from a shell command.
> ...
>

I wonder if it=E2=80=99s better to add this inherit to waffle recipe alone =
I doubt
that all meson using recipes are building python modules


> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  meta/classes/meson.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index efa6234078..90868963b7 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -1,4 +1,4 @@
> -inherit siteinfo python3native
> +inherit siteinfo python3native setuptools3
>
>  DEPENDS_append =3D " meson-native ninja-native"
>
> --
> 2.24.0
>
>

--00000000000097d77e0598d52f4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Dec 3, 2019 at 2:06 PM An=C3=ADbal Lim=C3=B3n &lt;<=
a href=3D"mailto:anibal.limon@linaro.org">anibal.limon@linaro.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Fixes,<br>
<br>
...<br>
| Program python3 found: YES (/home/anibal.limon/linaro/oe-rpb-master/build=
-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroo=
t-native/usr/bin/python3-native/python3)<br>
|<br>
| meson.build:36:0: ERROR: &lt;ExternalProgram &#39;python3&#39; -&gt; [&#3=
9;/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aar=
ch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-nat=
ive/python3&#39;]&gt; is not a valid python or it is missing setuptools<br>
|<br>
| A full log can be found at /home/anibal.limon/linaro/oe-rpb-master/build-=
410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/build/meson-lo=
gs/meson-log.txt<br>
| WARNING: exit code 1 from a shell command.<br>
...<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I wonder if it=
=E2=80=99s better to add this inherit to waffle recipe alone I doubt that a=
ll meson using recipes are building python modules=C2=A0</div><div dir=3D"a=
uto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org" target=3D"_blank">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/classes/meson.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass<br>
index efa6234078..90868963b7 100644<br>
--- a/meta/classes/meson.bbclass<br>
+++ b/meta/classes/meson.bbclass<br>
@@ -1,4 +1,4 @@<br>
-inherit siteinfo python3native<br>
+inherit siteinfo python3native setuptools3<br>
<br>
=C2=A0DEPENDS_append =3D &quot; meson-native ninja-native&quot;<br>
<br>
-- <br>
2.24.0<br>
<br>
</blockquote></div></div>

--00000000000097d77e0598d52f4b--
