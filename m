Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 64F3E74F04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 14:57:38 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id d5-v6so16737604oib.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 07:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3y7gT/+w2SqZoFx8/6I4Us8I63tPw6DsUnpRf0525+c=;
	b=AuYp8Ql2qN3ULuPgDnzFPK4SvdOHohIs8CNIqCUhpha02kfGg5+KvvXutR2Ve/oskW
	MSF8QZJjcet+r3B1UxmdU8zbaUHZvZWEnx8NgdyA6MnzPiaioXdSx85pfLqFXXAuDP2C
	9Qst9eeJQEao35KwlCNrN+3B8SougNRr04l+QeOYAiGWllAzr2fvxCoNZ3rLpKBVn1fd
	C1UGlZPRKibLkYIyu7XhK6EUYmn5APfytzOHINB/COTdM+eGlZZa9hGgnXLT5KtiV/Mq
	TGBbPHafyLC+TN7n/9/jAmWae8pFfrKUND4KOvCcPDzf8ycEaOdrJGM4mYojO8OvkgOM
	UtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3y7gT/+w2SqZoFx8/6I4Us8I63tPw6DsUnpRf0525+c=;
	b=huux0sYG4wZDmJaCHoP7cHKLNNq+dvm94y4IQRWDbRDJASxUxrsHMzVc5krZv3gosd
	VuDFxma/yaT+rSbSDY2T5jyA+LQKv8fZ77y0uiHXhN1A1aZlMeoDHJGWo2wWmNDXc18r
	GLYxg4YRXyxpqbXYRo+b3hBdSwe2jo0kbKOlnqgDYTToxcPzrVX/3TbqFqCRMO74kONz
	Dy8uWtLZbiD/PLUX/xgTq1uTRhjq24vDo2DemfCvyUj59Ak1B8TKvfwEfD//kqnRA4qj
	9f+JF2aveAQ8mNMZhqVa2xGhnz7J+4mI0vL0sInZUdg63U/qYR24rcq72kypkUwQffhP
	sGrQ==
X-Gm-Message-State: ALKqPweRVTOlZwkx1AhDdPMkteR5G4Mc+IvRh0uEAHEH4IH5bTdYhJ7O
	GzgVqxxWPea7/XWE08UWr2YPfcI5OFgA6/cThE9Pkg==
X-Google-Smtp-Source: ADUXVKLjZj2BQ1RcogWB9yDWrmtd5ojWNV/yGaMnUwBjHzx+gJcXVOUunBiFrkLj7npO/6+CCRR32brTg8NqSCJGfB8=
X-Received: by 2002:aca:ced5:: with SMTP id
	e204-v6mr4273608oig.206.1527778659235; 
	Thu, 31 May 2018 07:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1527755434.git.Qi.Chen@windriver.com>
	<57e4cd5f6cf998b6f7b1a939c1cae2ce2a4dbdfd.1527755435.git.Qi.Chen@windriver.com>
In-Reply-To: <57e4cd5f6cf998b6f7b1a939c1cae2ce2a4dbdfd.1527755435.git.Qi.Chen@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 31 May 2018 07:57:27 -0700
Message-ID: <CABcZANmig7C5KK_+voznmgSPF9k49VQ0Esknc8p9HUX=pMz-FA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] bitbake.conf: fix HOSTTOOLS setting related to image testing
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
X-List-Received-Date: Thu, 31 May 2018 14:57:38 -0000
Content-Type: multipart/alternative; boundary="000000000000477c93056d81b029"

--000000000000477c93056d81b029
Content-Type: text/plain; charset="UTF-8"

While you're at it, I'd suggest fixing this to stop using the horrible
indexing a list with a boolean hack and use a proper inline conditional.
'foo' if bar else 'baz'.

On Thu, May 31, 2018 at 1:43 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> A list of tools are added to HOSTTOOLS depending on if we inherit
> testimage or not. Unfortunately, if we use TEST_IMAGE variable to
> automate the test, these tools are not added to HOSTTOOLS.
>
> Modify the condition to also check TEST_IMAGE to fix the above problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 6ecf78b..7b7472c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -487,7 +487,7 @@ HOSTTOOLS += " \
>  "
>
>  # Tools needed to run testimage runtime image testing
> -HOSTTOOLS += "${@['', 'ip ping ps scp ssh
> stty'][bb.data.inherits_class('testimage', d)]}"
> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh
> stty'][bb.data.inherits_class('testimage', d) or d.getVar('TEST_IMAGE') ==
> '1']}"
>
>  # Link to these if present
>  HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat
> ssh sudo"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000477c93056d81b029
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">While you&#39;re at it, I&#39;d suggest fixing this to sto=
p using the horrible indexing a list with a boolean hack and use a proper i=
nline conditional. &#39;foo&#39; if bar else &#39;baz&#39;.<br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr">On Thu, May 31, 2018 at 1:43 AM C=
hen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">A list of tools are a=
dded to HOSTTOOLS depending on if we inherit<br>
testimage or not. Unfortunately, if we use TEST_IMAGE variable to<br>
automate the test, these tools are not added to HOSTTOOLS.<br>
<br>
Modify the condition to also check TEST_IMAGE to fix the above problem.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 6ecf78b..7b7472c 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -487,7 +487,7 @@ HOSTTOOLS +=3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# Tools needed to run testimage runtime image testing<br>
-HOSTTOOLS +=3D &quot;${@[&#39;&#39;, &#39;ip ping ps scp ssh stty&#39;][bb=
.data.inherits_class(&#39;testimage&#39;, d)]}&quot;<br>
+HOSTTOOLS +=3D &quot;${@[&#39;&#39;, &#39;ip ping ps scp ssh stty&#39;][bb=
.data.inherits_class(&#39;testimage&#39;, d) or d.getVar(&#39;TEST_IMAGE&#3=
9;) =3D=3D &#39;1&#39;]}&quot;<br>
<br>
=C2=A0# Link to these if present<br>
=C2=A0HOSTTOOLS_NONFATAL +=3D &quot;aws ccache gcc-ar gpg ld.bfd ld.gold nc=
 sftp socat ssh sudo&quot;<br>
-- <br>
1.9.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graph=
ics</div></div></div></div>

--000000000000477c93056d81b029--
