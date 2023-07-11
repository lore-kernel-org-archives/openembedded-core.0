Return-Path: <dit.kozmaj@kynetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1991FEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 15:27:59 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.2544.1689089271452767891
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 08:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kynetics.com header.s=google header.b=hk2E9Saq;
 spf=pass (domain: kynetics.com, ip: 209.85.167.176, mailfrom: dit.kozmaj@kynetics.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a04e5baffcso4774959b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 08:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics.com; s=google; t=1689089270; x=1691681270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+X3lCo2mMZpS9DKysOHrgVt5X/F0WyDr0UnVI3/iIjA=;
        b=hk2E9SaqtL58QYKmhJzf4fOuTXFUmd+GqMvhjghVzXct1dU+QrmGupX0Wl/c7DL/ar
         2bR8U7OvRjbtrjxN+V+UFR86jog5+ienc1/vupa6/GTaMugr78ts2GdamAUIO0tEJoGc
         H6ExrEZ6nbzbTRLC/duD0grj51qVGkVdwPG8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689089270; x=1691681270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+X3lCo2mMZpS9DKysOHrgVt5X/F0WyDr0UnVI3/iIjA=;
        b=iCeEKihrcvBIaOb0/bT/dz+/4HJ95WA0Ux9CN8Cs7fKwKB4115f234PRc9fcFZkpDY
         tKpGw4/qwPFtbn+KBCdb1aTKY1cg4m+3eoshIlopG1iGnNLRfUvzGrfmJ/3agypXn/Ju
         UgN1IF+wZGoXeFZkva8zic/jcAxx0INkVOXvWetYE9zDhfcMJcP+6iDpINPkxr5+ENBz
         Ba4hnU61sQETCDk+XkP6fvlkZto20/xxNloMK6Sv6jvzdyWBFb4z1nsjlzmfq451aOiX
         Ks6k6BfhqAHzdl53ofCUuUkAHEi/mrMmdnE3gYE49DWHBTgcuVFY0Fg12xbpPuGG8m1V
         Oxgg==
X-Gm-Message-State: ABy/qLZqZftsGg8kQekIQQV6/Kpbt5MVWRqlK8A4Gkem0m+Sx8XZO2Ky
	z6haFn1F7IjNHYEgMprq4RuhHTs5WFfJDZeTzYuMuiP3XXZ7EAD0nmjtig==
X-Google-Smtp-Source: APBJJlFz+XcBui002zp39K76SeSlzoJ3Hzu4AAkkKyIK+5nxG/2sEubvCw+/50QIEfaHCb6HeRxPbkxifiVSQ8FLQPc=
X-Received: by 2002:a05:6808:bc5:b0:3a3:7454:e57e with SMTP id
 o5-20020a0568080bc500b003a37454e57emr20060567oik.9.1689089270423; Tue, 11 Jul
 2023 08:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230711143320.255308-1-dit.kozmaj@kynetics.com>
In-Reply-To: <20230711143320.255308-1-dit.kozmaj@kynetics.com>
From: Dit Kozmaj <dit.kozmaj@kynetics.com>
Date: Tue, 11 Jul 2023 17:27:39 +0200
Message-ID: <CABU0hB++m5F_mNZx5C3qpL+NF0sScGVNy=hEJMBSVUcnjwRZvQ@mail.gmail.com>
Subject: Re: [PATCH] fetch2: Set maxsplit to match expected variables
To: openembedded-core@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Content-Type: multipart/alternative; boundary="000000000000f537df060037bd6d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 15:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184143

--000000000000f537df060037bd6d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bitbucket added a new feature that provides limited access to a specific
repository using a Repository Access Tokens. This token comes in the form
token-auth:key.

https://support.atlassian.com/bitbucket-cloud/docs/repository-access-tokens=
/
https://support.atlassian.com/bitbucket-cloud/docs/using-access-tokens/#Inc=
lude-the-Repository-Access-Token-in-the-URL

The token can be used in the user parameter of SRC_URI as this parameter is
in the form user=3Duserid:password, and works correctly excluding the cases
when the password contains a "=3D" symbol.

The error comes from the split logic, which doesn't manage the case when
the value contains the symbol "=3D".

The proposed change guarantees that only two variables will be returned,
splitted in "key" and "value" and the value can contain, especially in
cases when it is a password, the "=3D" character.

On Tue, Jul 11, 2023 at 4:33=E2=80=AFPM <dit.kozmaj@kynetics.com> wrote:

> From: Dit Kozmaj <dit.kozmaj@kynetics.com>
>
> Set the maxsplit value to match the expected number of variables.
> This also avoids an unnecessary split as the parameters are in the form
> 'key=3Dvalue'
> and the 'value' could contain the '=3D' character.
>
> Signed-off-by: Dit Kozmaj <dit.kozmaj@kynetics.com>
> ---
>  bitbake/lib/bb/fetch2/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bitbake/lib/bb/fetch2/__init__.py
> b/bitbake/lib/bb/fetch2/__init__.py
> index 3e6555bd67..79b289eaec 100644
> --- a/bitbake/lib/bb/fetch2/__init__.py
> +++ b/bitbake/lib/bb/fetch2/__init__.py
> @@ -388,7 +388,7 @@ def decodeurl(url):
>              if s:
>                  if not '=3D' in s:
>                      raise MalformedUrl(url, "The URL: '%s' is invalid:
> parameter %s does not specify a value (missing '=3D')" % (url, s))
> -                s1, s2 =3D s.split('=3D')
> +                s1, s2 =3D s.split('=3D', 1)
>                  p[s1] =3D s2
>
>      return type, host, urllib.parse.unquote(path), user, pswd, p
> --
> 2.25.1
>
>

--000000000000f537df060037bd6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.295;margin-top:0pt;m=
argin-bottom:8pt" id=3D"gmail-docs-internal-guid-0aa839b9-7fff-a8b5-1c68-ef=
6f9dec57e5"><span style=3D"font-size:11pt;font-family:&quot;Times New Roman=
&quot;;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre-wrap">Bitbucket added a new feature that provides limited=
 access to a specific repository using a Repository Access Tokens. This tok=
en comes in the form </span><span style=3D"color:rgb(0,0,0);background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre-wrap;font-family:mono=
space"><font size=3D"2">token-auth:key</font></span><span style=3D"font-siz=
e:11pt;font-family:&quot;Times New Roman&quot;;color:rgb(0,0,0);background-=
color:transparent;font-weight:400;font-style:normal;font-variant:normal;tex=
t-decoration:none;vertical-align:baseline;white-space:pre-wrap">.</span></p=
><p dir=3D"ltr" style=3D"line-height:1.295;margin-top:0pt;margin-bottom:8pt=
"><a href=3D"https://support.atlassian.com/bitbucket-cloud/docs/repository-=
access-tokens/" style=3D"text-decoration:none"><span style=3D"font-size:11p=
t;font-family:&quot;Times New Roman&quot;;color:rgb(17,85,204);background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:underline;vertical-align:baseline;white-space:pre-wrap">https:/=
/support.atlassian.com/bitbucket-cloud/docs/repository-access-tokens/</span=
><span style=3D"font-size:11pt;font-family:&quot;Times New Roman&quot;;colo=
r:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre-wrap"><br></span></a><a href=3D"https://support.atlassian.com/bitbuc=
ket-cloud/docs/using-access-tokens/#Include-the-Repository-Access-Token-in-=
the-URL" style=3D"text-decoration:none"><span style=3D"font-size:11pt;font-=
family:&quot;Times New Roman&quot;;color:rgb(17,85,204);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:underline;vertical-align:baseline;white-space:pre-wrap">https://suppor=
t.atlassian.com/bitbucket-cloud/docs/using-access-tokens/#Include-the-Repos=
itory-Access-Token-in-the-URL</span></a></p><p dir=3D"ltr" style=3D"line-he=
ight:1.295;margin-top:0pt;margin-bottom:8pt"><span style=3D"font-size:11pt;=
font-family:&quot;Times New Roman&quot;;color:rgb(0,0,0);background-color:t=
ransparent;font-weight:400;font-style:normal;font-variant:normal;text-decor=
ation:none;vertical-align:baseline;white-space:pre-wrap">The token can be u=
sed in the user parameter of SRC_URI as this parameter is in the form </spa=
n><span style=3D"color:rgb(0,0,0);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap;font-family:monospace"><font size=3D"2">us=
er=3Duserid:password</font></span><span style=3D"font-size:11pt;font-family=
:&quot;Times New Roman&quot;;color:rgb(0,0,0);background-color:transparent;=
font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;=
vertical-align:baseline;white-space:pre-wrap">, and works correctly excludi=
ng the cases when the password contains a &quot;=3D&quot; symbol.</span></p=
><p dir=3D"ltr" style=3D"line-height:1.295;margin-top:0pt;margin-bottom:8pt=
"><span style=3D"font-size:11pt;font-family:&quot;Times New Roman&quot;;col=
or:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:norma=
l;font-variant:normal;text-decoration:none;vertical-align:baseline;white-sp=
ace:pre-wrap">The error comes from the split logic, which doesn&#39;t manag=
e the case when the value contains the symbol &quot;=3D&quot;.</span></p><p=
 dir=3D"ltr" style=3D"line-height:1.295;margin-top:0pt;margin-bottom:8pt"><=
span style=3D"font-size:11pt;font-family:&quot;Times New Roman&quot;;color:=
rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre-wrap">The proposed change guarantees that only two variables will be r=
eturned, splitted in &quot;key&quot; and &quot;value&quot; and the value ca=
n contain, especially in cases when it is a password, the &quot;=3D&quot; c=
haracter.</span></p></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, Jul 11, 2023 at 4:33=E2=80=AFPM &lt;<a href=3D"=
mailto:dit.kozmaj@kynetics.com">dit.kozmaj@kynetics.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">From: Dit Kozmaj &lt=
;<a href=3D"mailto:dit.kozmaj@kynetics.com" target=3D"_blank">dit.kozmaj@ky=
netics.com</a>&gt;<br>
<br>
Set the maxsplit value to match the expected number of variables.<br>
This also avoids an unnecessary split as the parameters are in the form &#3=
9;key=3Dvalue&#39;<br>
and the &#39;value&#39; could contain the &#39;=3D&#39; character.<br>
<br>
Signed-off-by: Dit Kozmaj &lt;<a href=3D"mailto:dit.kozmaj@kynetics.com" ta=
rget=3D"_blank">dit.kozmaj@kynetics.com</a>&gt;<br>
---<br>
=C2=A0bitbake/lib/bb/fetch2/__init__.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__in=
it__.py<br>
index 3e6555bd67..79b289eaec 100644<br>
--- a/bitbake/lib/bb/fetch2/__init__.py<br>
+++ b/bitbake/lib/bb/fetch2/__init__.py<br>
@@ -388,7 +388,7 @@ def decodeurl(url):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not &#39;=
=3D&#39; in s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0raise MalformedUrl(url, &quot;The URL: &#39;%s&#39; is invalid: paramete=
r %s does not specify a value (missing &#39;=3D&#39;)&quot; % (url, s))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s1, s2 =3D s.split=
(&#39;=3D&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s1, s2 =3D s.split=
(&#39;=3D&#39;, 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p[s1] =3D s2<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0return type, host, urllib.parse.unquote(path), user, ps=
wd, p<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000f537df060037bd6d--

