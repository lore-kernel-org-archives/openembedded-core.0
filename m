Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id B8FC97C434
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 10:45:59 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n18so15612657otq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 03:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+a0LJReEWHFnNO7cK6Y/VEkGt3aMXOASpkSnB4YjCfY=;
	b=LdtQYas/UrKxLT+J4xmsRh/j6VT9pInHp3jf3gEZ81EJ8l52qlrBJ/3f1Z8QD66caw
	njF8A5epTNHQQUy6gpPFwKuck2Es8n6Vp21Sffj6OpTd1sQXEsPvcYzIhVT3+N5++hkV
	pFDhhowkf6/9KVqsKaBxF+fHe6ADjxVcaDZnbBzg8OrDLn6SgaivPyNxjLTD+dJf8u1s
	YyDhgZuCcw2F0cQVR13gxlmmnBw4JBWzhR9bXQBSeqYgnkuN63gGWPPto5Hc90oLcaFw
	Yj6dT76/M9uODAW9lmvYvoXesoOieZNIptW07JgjYUJv4DHe+QzMTcLqKHJXJse5HmLz
	Zfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+a0LJReEWHFnNO7cK6Y/VEkGt3aMXOASpkSnB4YjCfY=;
	b=jGE/rFe6KQy44f6GyWsaTGDoTTfdYw65imeevEgAg2X5BqQxcWTFiG8P/8V9Sv/26Q
	XjB/VgnF7YcZFn92D07vxYcGP6PoZ9KZSjB0h9I7UB99dlud7FogDKHKUFcZp/AGez+/
	gqb54axOB6FZhyc6gejOcRNUQXdvwGc3QRgwgZyTj/5xQ0L+cS+xyp0XdCZOa9juoAvZ
	i2xiSiDqyqbZaFW5XWIf2gvnZ9pFMQ5b4kh9Fk4Hdguk+heynCsoqBzmrIi1Tt2pIJ83
	yVCdR9ikt9IeUwz877Lj85sFftJX+O2WFKBGdYMi+9xa+98F6AXHS9Gm0mqwi9nn2Ydv
	4gjA==
X-Gm-Message-State: APjAAAWrQsxBNFBcXnfeTXKJXfgztvfFkWyiyNxRYZGNE3+iUnUUwpNM
	tUvFG1Bwt1J6bmEGd187gbhNRuG1fZISngigXaY=
X-Google-Smtp-Source: APXvYqxlAdPN2HgUELgLNjy2jD6FdPgDZh52pUpqVc7tT+98L9J+QiQqAskJSgx39H7ms4YV26OvVBk9B8FDMUpjz+0=
X-Received: by 2002:a9d:d87:: with SMTP id 7mr606626ots.263.1559558760764;
	Mon, 03 Jun 2019 03:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190603084920.46967-1-hongxu.jia@windriver.com>
In-Reply-To: <20190603084920.46967-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jun 2019 12:45:49 +0200
Message-ID: <CANNYZj8mnJ9WMwRGW1HBcTXPLcd_CbnUGNhhbFaUGBZcjotwbQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/reciputils.py: support character `+' in git pv
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
X-List-Received-Date: Mon, 03 Jun 2019 10:45:59 -0000
Content-Type: multipart/alternative; boundary="000000000000f11a56058a69114a"

--000000000000f11a56058a69114a
Content-Type: text/plain; charset="UTF-8"

Thanks, this addresses the issue well :)

Alex

On Mon, 3 Jun 2019 at 10:49, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> While pv contains char `+' (such as ncurses 6.1+20181013),
> it was incorrectly converted to `6.1'
>
> In this commit:
> - Convert [^\+]* to .*?
>   Support pv to contain char `+' and not greedy match
>   (Such as ncurses 6.1+20181013)
>
> - Add [^\+] to sfx match
>   Support sfx contains extra chars between `+' and `git'
>   (such as asciidoc "8.6.9+py3-gitAUTOINC+618f6e6f6b")
>
> - Make sfx and rev greedy match
>
> Run `devtool check-upgrade-status --all' in poky and compare results,
> only one difference on ncurses version:
> Without the commit:
> INFO: ncurses                   6.1             6.1+20181013    Hongxu Jia
> <hongxu.jia@windriver.com> 7a97a7f937762ba342d5b2fd7cd090885a809835
>
> With the commit:
> INFO: ncurses                   6.1+20181013    MATCH           Hongxu Jia
> <hongxu.jia@windriver.com> 7a97a7f937762ba342d5b2fd7cd090885a809835
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/recipeutils.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> index 1e5b9a49f9..630ae967af 100644
> --- a/meta/lib/oe/recipeutils.py
> +++ b/meta/lib/oe/recipeutils.py
> @@ -934,7 +934,7 @@ def get_recipe_pv_without_srcpv(pv, uri_type):
>      sfx = ''
>
>      if uri_type == 'git':
> -        git_regex =
> re.compile(r"(?P<pfx>v?)(?P<ver>[^\+]*)((?P<sfx>\+(git)?r?(AUTOINC\+))(?P<rev>.*))?")
> +        git_regex =
> re.compile(r"(?P<pfx>v?)(?P<ver>.*?)(?P<sfx>\+[^\+]*(git)?r?(AUTOINC\+))(?P<rev>.*)")
>          m = git_regex.match(pv)
>
>          if m:
> --
> 2.21.0
>
>

--000000000000f11a56058a69114a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, this addresses the issue well :)</div><div><b=
r></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, 3 Jun 2019 at 10:49, Hongxu Jia &lt;<a h=
ref=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">While pv co=
ntains char `+&#39; (such as ncurses 6.1+20181013),<br>
it was incorrectly converted to `6.1&#39;<br>
<br>
In this commit:<br>
- Convert [^\+]* to .*?<br>
=C2=A0 Support pv to contain char `+&#39; and not greedy match<br>
=C2=A0 (Such as ncurses 6.1+20181013)<br>
<br>
- Add [^\+] to sfx match<br>
=C2=A0 Support sfx contains extra chars between `+&#39; and `git&#39;<br>
=C2=A0 (such as asciidoc &quot;8.6.9+py3-gitAUTOINC+618f6e6f6b&quot;)<br>
<br>
- Make sfx and rev greedy match<br>
<br>
Run `devtool check-upgrade-status --all&#39; in poky and compare results,<b=
r>
only one difference on ncurses version:<br>
Without the commit:<br>
INFO: ncurses=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A06.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06.1+20181013=C2=
=A0 =C2=A0 Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" targe=
t=3D"_blank">hongxu.jia@windriver.com</a>&gt; 7a97a7f937762ba342d5b2fd7cd09=
0885a809835<br>
<br>
With the commit:<br>
INFO: ncurses=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A06.1+20181013=C2=A0 =C2=A0 MATCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D"=
_blank">hongxu.jia@windriver.com</a>&gt; 7a97a7f937762ba342d5b2fd7cd090885a=
809835<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/recipeutils.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py<br>
index 1e5b9a49f9..630ae967af 100644<br>
--- a/meta/lib/oe/recipeutils.py<br>
+++ b/meta/lib/oe/recipeutils.py<br>
@@ -934,7 +934,7 @@ def get_recipe_pv_without_srcpv(pv, uri_type):<br>
=C2=A0 =C2=A0 =C2=A0sfx =3D &#39;&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if uri_type =3D=3D &#39;git&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 git_regex =3D re.compile(r&quot;(?P&lt;pfx&gt;=
v?)(?P&lt;ver&gt;[^\+]*)((?P&lt;sfx&gt;\+(git)?r?(AUTOINC\+))(?P&lt;rev&gt;=
.*))?&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 git_regex =3D re.compile(r&quot;(?P&lt;pfx&gt;=
v?)(?P&lt;ver&gt;.*?)(?P&lt;sfx&gt;\+[^\+]*(git)?r?(AUTOINC\+))(?P&lt;rev&g=
t;.*)&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m =3D git_regex.match(pv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if m:<br>
-- <br>
2.21.0<br>
<br>
</blockquote></div>

--000000000000f11a56058a69114a--
