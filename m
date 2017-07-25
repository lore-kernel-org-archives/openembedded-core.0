Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0719960939
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 13:13:03 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id h199so50635928ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K3nA8djQa72+tzcDw1hKM6v6PxupEW/0q6WWc/MTbjY=;
	b=WatQ1KavBKz/eJPhMrUnq1EIzp1U2QcZ5dkBvHCkBROzjQhYshnlWztIwkAFqm9Exw
	sB8w3HoYxWZEg806ODGRQkrILmkjNHrqPFFAbGNNfQrRaItqJCUsw9nGaDJyG+1Q8REq
	MaDeh/n6uMJmEd1zNIpsKehIiBgtEOUpRDVC8uFt2e2aYQ744f2CAseMRynrlbt+hXI1
	bSTYYIzcjVgnC2FaKqL+ZuX615PUfm8vzYHzyxkFrTikx8/YQIyx+Ynu51hrgk72qHv8
	yXwvDK2OXfJqbdsOIdQfEr2WZChkqoAGN38QRnxwpGQbEBpHQYP4I+NGjGqsLC6QkOtq
	stLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K3nA8djQa72+tzcDw1hKM6v6PxupEW/0q6WWc/MTbjY=;
	b=j9gCjbBchz/qCIVuinKf3o/WE+LGv4zEwO0sZlDksPC0jVeSVM1f0Pn619PLxltxUm
	AdPKyHCrdxR0DpPc8kg7qUwVlW7xxtFOuM3TrucF6HR4PmSHnR3qeo9eds3EXDSiIfZL
	EbykDziJ0OYpTGO5nML0A0EjhLb3EzBmjPhhdNcmet7ZmLpc46+Ad0CXPiC1N4mwqZJf
	z0wlcOTrQrzd7jlQZetxcsr+rjcr6SzSohDIvKrzu9ms+VibZd9VYZRy4rMMaxd4kKFm
	kKYhf4vPdtedAqG2IEqnq86A2Tv8ob4wNx5xckfFPwt23plF9dWD16xhsbct6jf3SSHq
	/vBw==
X-Gm-Message-State: AIVw112umDsMxCed0LPYV0RIULTvq/ZVEYwgqd5u/MmYSWrPfjPBkIw2
	0kN4RaJ4jV8wVKeIStnuiZCKUP/nVpArtm8=
X-Received: by 10.36.218.3 with SMTP id z3mr9880891itg.116.1500988385052; Tue,
	25 Jul 2017 06:13:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 25 Jul 2017 06:12:44 -0700 (PDT)
In-Reply-To: <20170724142818.44403-5-alexander.kanavin@linux.intel.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
	<20170724142818.44403-5-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Jul 2017 14:12:44 +0100
Message-ID: <CAJTo0LbJvsviFJGW8k=Hgsr=kCgFhv7MX=wyjxYz2t23zkSQ1Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] gperf: upgrade to 3.1
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
X-List-Received-Date: Tue, 25 Jul 2017 13:13:04 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b0ad680e5070555241716"

--94eb2c0b0ad680e5070555241716
Content-Type: text/plain; charset="UTF-8"

This breaks the libcap build:

| In file included from <command-line>:0:0:
| ./_caps_output.gperf:71:80: error: unknown type name 'size_t'
|  gperf_case_strncmp (register const char *s1, register const char *s2,
register size_t n)
|
      ^~~~~~
| ./_caps_output.gperf:96:53: error: unknown type name 'size_t'
|  __cap_hash_name (register const char *str, register size_t len)
|                                                      ^~~~~~
| ./_caps_output.gperf:200:55: error: unknown type name 'size_t'
|  __cap_lookup_name (register const char *str, register size_t len)
|                                                        ^~~~~~
| ./_caps_output.gperf:200:1: error: conflicting types for
'__cap_lookup_name'
|  __cap_lookup_name (register const char *str, register size_t len)
|  ^~~~~~~~~~~~~~~~~
| ./_caps_output.gperf:33:29: note: previous declaration of
'__cap_lookup_name' was here
|  const struct __cap_token_s *__cap_lookup_name(const char *, unsigned
int);
|                              ^~~~~~~~~~~~~~~~~
| cap_text.c: In function 'cap_to_name':
| cap_text.c:291:2: warning: ignoring return value of 'asprintf', declared
with attribute warn_unused_result [-Wunused-result]
|   asprintf(&tmp, "%u", cap);
|   ^~~~~~~~~~~~~~~~~~~~~~~~~
| Makefile:63: recipe for target 'cap_text.o' failed

Ross

On 24 July 2017 at 15:28, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-extended/gperf/gperf_3.0.4.bb | 5 -----
>  meta/recipes-extended/gperf/gperf_3.1.bb   | 5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  delete mode 100644 meta/recipes-extended/gperf/gperf_3.0.4.bb
>  create mode 100644 meta/recipes-extended/gperf/gperf_3.1.bb
>
> diff --git a/meta/recipes-extended/gperf/gperf_3.0.4.bb
> b/meta/recipes-extended/gperf/gperf_3.0.4.bb
> deleted file mode 100644
> index 64003fc0bb7..00000000000
> --- a/meta/recipes-extended/gperf/gperf_3.0.4.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -require gperf.inc
> -
> -
> -SRC_URI[md5sum] = "c1f1db32fb6598d6a93e6e88796a8632"
> -SRC_URI[sha256sum] = "767112a204407e62dbc3106647cf83
> 9ed544f3cf5d0f0523aaa2508623aad63e"
> diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb
> b/meta/recipes-extended/gperf/gperf_3.1.bb
> new file mode 100644
> index 00000000000..942820b91d5
> --- /dev/null
> +++ b/meta/recipes-extended/gperf/gperf_3.1.bb
> @@ -0,0 +1,5 @@
> +require gperf.inc
> +
> +
> +SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
> +SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4
> ab466e3f33024a352fc2198112cdbb3ae2"
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0b0ad680e5070555241716
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks the libcap build:<div><br></div><div><div>| In=
 file included from &lt;command-line&gt;:0:0:</div><div>| ./_caps_output.gp=
erf:71:80: error: unknown type name &#39;size_t&#39;</div><div>| =C2=A0gper=
f_case_strncmp (register const char *s1, register const char *s2, register =
size_t n)</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^~~~~~</div><div>| ./_caps_output.gperf:96:53: error: unknown type n=
ame &#39;size_t&#39;</div><div>| =C2=A0__cap_hash_name (register const char=
 *str, register size_t len)</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~~~~</div><div>| ./_caps_output.gperf:200:55: error: unknown type n=
ame &#39;size_t&#39;</div><div>| =C2=A0__cap_lookup_name (register const ch=
ar *str, register size_t len)</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~~</div><div>| ./_caps_output.gperf:200:1: error: conf=
licting types for &#39;__cap_lookup_name&#39;</div><div>| =C2=A0__cap_looku=
p_name (register const char *str, register size_t len)</div><div>| =C2=A0^~=
~~~~~~~~~~~~~~~</div><div>| ./_caps_output.gperf:33:29: note: previous decl=
aration of &#39;__cap_lookup_name&#39; was here</div><div>| =C2=A0const str=
uct __cap_token_s *__cap_lookup_name(const char *, unsigned int);</div><div=
>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~</div><div>| cap_text.c:=
 In function &#39;cap_to_name&#39;:</div><div>| cap_text.c:291:2: warning: =
ignoring return value of &#39;asprintf&#39;, declared with attribute warn_u=
nused_result [-Wunused-result]</div><div>| =C2=A0 asprintf(&amp;tmp, &quot;=
%u&quot;, cap);</div><div>| =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~</div><div>| Ma=
kefile:63: recipe for target &#39;cap_text.o&#39; failed</div></div><div><b=
r></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On 24 July 2017 at 15:28, Alexander Kanavin <span dir=3D"ltr">&=
lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">a=
lexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexan=
der.kanavin@linux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;=
<br>
---<br>
=C2=A0meta/recipes-extended/gperf/<a href=3D"http://gperf_3.0.4.bb" rel=3D"=
noreferrer" target=3D"_blank">gp<wbr>erf_3.0.4.bb</a> | 5 -----<br>
=C2=A0meta/recipes-extended/gperf/<a href=3D"http://gperf_3.1.bb" rel=3D"no=
referrer" target=3D"_blank">gp<wbr>erf_3.1.bb</a>=C2=A0 =C2=A0| 5 +++++<br>
=C2=A02 files changed, 5 insertions(+), 5 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/gperf/<a href=3D"http://gper=
f_3.0.4.bb" rel=3D"noreferrer" target=3D"_blank">gp<wbr>erf_3.0.4.bb</a><br=
>
=C2=A0create mode 100644 meta/recipes-extended/gperf/<a href=3D"http://gper=
f_3.1.bb" rel=3D"noreferrer" target=3D"_blank">gp<wbr>erf_3.1.bb</a><br>
<br>
diff --git a/meta/recipes-extended/gperf/<a href=3D"http://gperf_3.0.4.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>gperf_3.0.4.bb</a> b/meta/recipes=
-extended/gperf/<a href=3D"http://gperf_3.0.4.bb" rel=3D"noreferrer" target=
=3D"_blank"><wbr>gperf_3.0.4.bb</a><br>
deleted file mode 100644<br>
index 64003fc0bb7..00000000000<br>
--- a/meta/recipes-extended/gperf/<a href=3D"http://gperf_3.0.4.bb" rel=3D"=
noreferrer" target=3D"_blank"><wbr>gperf_3.0.4.bb</a><br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-require gperf.inc<br>
-<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>c1f1db32fb6598d6a93e6e88796a86<wbr>32&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>767112a204407e62dbc3106647cf83<wbr>9ed54=
4f3cf5d0f0523aaa2508623aa<wbr>d63e&quot;<br>
diff --git a/meta/recipes-extended/gperf/<a href=3D"http://gperf_3.1.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>gperf_3.1.bb</a> b/meta/recipes-ext=
ended/gperf/<a href=3D"http://gperf_3.1.bb" rel=3D"noreferrer" target=3D"_b=
lank"><wbr>gperf_3.1.bb</a><br>
new file mode 100644<br>
index 00000000000..942820b91d5<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/gperf/<a href=3D"http://gperf_3.1.bb" rel=3D"no=
referrer" target=3D"_blank"><wbr>gperf_3.1.bb</a><br>
@@ -0,0 +1,5 @@<br>
+require gperf.inc<br>
+<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>9e251c0a618ad0824b51117d5d9db8<wbr>7e&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>588546b945bba4b70b6a3a616e80b4<wbr>ab466=
e3f33024a352fc2198112cdbb<wbr>3ae2&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0b0ad680e5070555241716--
