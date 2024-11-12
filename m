Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3D0D42B85
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 14:01:18 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.87085.1731420070090785046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 06:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RnAlLak5;
 spf=pass (domain: mvista.com, ip: 209.85.208.169, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so47042711fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 06:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1731420068; x=1732024868; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nvyTnrjniSXdSuf3yWBsp/aIeu3N2bqb9HlrBXlibhg=;
        b=RnAlLak5wtPOZ5ZDNnT8wReZ1oX6qp8Mj88pjKjlUKmj6AAisQnJczoDhyH5K4D7Hh
         xjfFG5HrkkbuJQl18KnYriUPQsED5cq75CZtX3dAhAlYs7x7CWs47yRNgsWEW8d/FjGx
         pPMlFkon0nWnOXsjxt3ScpgQT4aiqFEWY3QW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731420068; x=1732024868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvyTnrjniSXdSuf3yWBsp/aIeu3N2bqb9HlrBXlibhg=;
        b=pYYkm1uu1vxECFTG1/+17kNpeQUWIvLwGWFTK3y8iV3nJpyUOQVWaW9i1qz4YUGmgl
         243jyEz9G9eo04IJzrygwCiUnz/aYU+Tn21bh5fMKlhq82Dj+cxhiG904Wo/uSqGw5MX
         SbPEXKjf1qZWv4FYxNWh4nnhuBuNdzunX6JvkPxPcthAY4RIDCgGBnT82SPaJV51kg84
         ZiiMv2dUkr6wiby1H+nM+k7v8ZDHWFb8z1+Uy3EkS6VbDT0QxV7wjfrAsyxxRELPqLpI
         pPLLzLF3e9gF+05HAYYDALcNrjLrkXsz0jg8jSacZfb9pNxQKyQu2yMNOfkBQjfjKuxB
         tYrA==
X-Gm-Message-State: AOJu0YxUepLfXGufFbp0UaZuUaZLsDN4+OXeurBGiJDpLjeFRYJrmpzQ
	S2ckS9g2gK8BCsK9lzV86GWegaTEmAmcbx7fM2kF5hv5vaFyh8QBdU6ghAmRwOyfAf5ebSPSX1n
	sr9NdO0qC/IJQPYZwc8jAh7LWxq7NFrPe5YLf3g==
X-Google-Smtp-Source: AGHT+IGsSIXyMsIdypI5JOEyzl7yOp4x5lVNeX5N7LCFR0woQO9/LRc8zuWaxzsT0okj7jf70C25M8NZD6PF6oEr218=
X-Received: by 2002:a2e:a888:0:b0:2fb:5014:c963 with SMTP id
 38308e7fff4ca-2ff2026a704mr84141461fa.20.1731420066987; Tue, 12 Nov 2024
 06:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20241112133330.2828105-1-vanusuri@mvista.com> <AS1PR10MB56972FC07BDF7F76588523B5FD592@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56972FC07BDF7F76588523B5FD592@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 12 Nov 2024 19:30:55 +0530
Message-ID: <CANQUz1_E8DKDj6PkjXvP6TKUtfysCjC0V5b0fFO0f0Brx=ZHSQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] curl: Fix for CVE-2024-9681
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000ce42b0626b7a693"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 14:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207056

--0000000000000ce42b0626b7a693
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for letting me know.

Hi Steve,
Please ignore my patch as Peter already submitted it.

Thanks & Regards,
Vijay

On Tue, Nov 12, 2024 at 7:17=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> This patch was already submitted.
> See https://lists.openembedded.org/g/openembedded-core/message/206904
>
> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Vijay Anusuri via
> > lists.openembedded.org
> > Sent: Tuesday, November 12, 2024 14:34
> > To: openembedded-core@lists.openembedded.org
> > Cc: Vijay Anusuri <vanusuri@mvista.com>
> > Subject: [OE-core][kirkstone][PATCH] curl: Fix for CVE-2024-9681
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Ref: https://curl.se/docs/CVE-2024-9681.html
> >
> > Upstream-Commit:
> >
> https://github.com/curl/curl/commit/a94973805df96269bf3f3bf0a20ccb9887313
> > 316
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../curl/curl/CVE-2024-9681.patch             | 88 +++++++++++++++++++
> >  meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
> >  2 files changed, 89 insertions(+)
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2024-9681.patch
> >
> > diff --git a/meta/recipes-support/curl/curl/CVE-2024-9681.patch
> > b/meta/recipes-support/curl/curl/CVE-2024-9681.patch
> > new file mode 100644
> > index 0000000000..1ba373a1c4
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2024-9681.patch
> > @@ -0,0 +1,88 @@
> > +From a94973805df96269bf3f3bf0a20ccb9887313316 Mon Sep 17 00:00:00
> > 2001
> > +From: Daniel Stenberg <daniel@haxx.se>
> > +Date: Wed, 9 Oct 2024 10:04:35 +0200
> > +Subject: [PATCH] hsts: improve subdomain handling
> > +
> > +- on load, only replace existing HSTS entries if there is a full host
> > +  match
> > +
> > +- on matching, prefer a full host match and secondary the longest tail
> > +  subdomain match
> > +
> > +Closes #15210
> > +
> > +Upstream-Status: Backport
> > [
> https://github.com/curl/curl/commit/a94973805df96269bf3f3bf0a20ccb988731
> > 3316]
> > +CVE: CVE-2024-9681
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/hsts.c          | 14 ++++++++++----
> > + tests/data/test1660 |  2 +-
> > + 2 files changed, 11 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/lib/hsts.c b/lib/hsts.c
> > +index 08e15dc..06d2edf 100644
> > +--- a/lib/hsts.c
> > ++++ b/lib/hsts.c
> > +@@ -247,12 +247,14 @@ CURLcode Curl_hsts_parse(struct hsts *h, const
> char
> > *hostname,
> > + struct stsentry *Curl_hsts(struct hsts *h, const char *hostname,
> > +                            bool subdomain)
> > + {
> > ++  struct stsentry *bestsub =3D NULL;
> > +   if(h) {
> > +     char buffer[MAX_HSTS_HOSTLEN + 1];
> > +     time_t now =3D time(NULL);
> > +     size_t hlen =3D strlen(hostname);
> > +     struct Curl_llist_element *e;
> > +     struct Curl_llist_element *n;
> > ++    size_t blen =3D 0;
> > +
> > +     if((hlen > MAX_HSTS_HOSTLEN) || !hlen)
> > +       return NULL;
> > +@@ -277,15 +279,19 @@ struct stsentry *Curl_hsts(struct hsts *h, const
> char
> > *hostname,
> > +         if(ntail < hlen) {
> > +           size_t offs =3D hlen - ntail;
> > +           if((hostname[offs-1] =3D=3D '.') &&
> > +-             Curl_strncasecompare(&hostname[offs], sts->host, ntail))
> > +-            return sts;
> > ++             Curl_strncasecompare(&hostname[offs], sts->host, ntail) =
&&
> > ++         (ntail > blen)) {
> > ++            /* save the tail match with the longest tail */
> > ++            bestsub =3D sts;
> > ++            blen =3D ntail;
> > ++      }
> > +         }
> > +       }
> > +       if(Curl_strcasecompare(hostname, sts->host))
> > +         return sts;
> > +     }
> > +   }
> > +-  return NULL; /* no match */
> > ++  return bestsub;
> > + }
> > +
> > + /*
> > +@@ -447,7 +453,7 @@ static CURLcode hsts_add(struct hsts *h, char *lin=
e)
> > +     e =3D Curl_hsts(h, p, subdomain);
> > +     if(!e)
> > +       result =3D hsts_create(h, p, subdomain, expires);
> > +-    else {
> > ++    else if(Curl_strcasecompare(p, e->host)) {
> > +       /* the same host name, use the largest expire time */
> > +       if(expires > e->expires)
> > +         e->expires =3D expires;
> > +diff --git a/tests/data/test1660 b/tests/data/test1660
> > +index cbbcf75..662026b 100644
> > +--- a/tests/data/test1660
> > ++++ b/tests/data/test1660
> > +@@ -52,7 +52,7 @@ this.example [this.example]: 1548400797
> > + Input 12: error 43
> > + Input 13: error 43
> > + Input 14: error 43
> > +-3.example.com [example.com]: 1569905261 includeSubDomains
> > ++3.example.com [3.example.com]: 1569905261 includeSubDomains
> > + 3.example.com [example.com]: 1569905261 includeSubDomains
> > + foo.example.com [example.com]: 1569905261 includeSubDomains
> > + 'foo.xample.com' is not HSTS
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-
> > support/curl/curl_7.82.0.bb
> > index ba3abadac9..cda42da4d3 100644
> > --- a/meta/recipes-support/curl/curl_7.82.0.bb
> > +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> > @@ -62,6 +62,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
> >             file://CVE-2024-7264_2.patch \
> >             file://CVE-2024-8096.patch \
> >             file://0001-url-free-old-conn-better-on-reuse.patch \
> > +           file://CVE-2024-9681.patch \
> >             "
> >  SRC_URI[sha256sum] =3D
> > "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
> >
> > --
> > 2.25.1
>
>

--0000000000000ce42b0626b7a693
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Thanks for letting me know. <br><br></div>H=
i Steve,<br></div>Please ignore my patch as Peter already submitted it.<br>=
<br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 1=
2, 2024 at 7:17=E2=80=AFPM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@s=
iemens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">This patch was already submitted.<br>
See <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/2=
06904" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/message/206904</a><br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Vijay Anusuri via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Tuesday, November 12, 2024 14:34<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D=
"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; Subject: [OE-core][kirkstone][PATCH] curl: Fix for CVE-2024-9681<br>
&gt; <br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; <br>
&gt; Ref: <a href=3D"https://curl.se/docs/CVE-2024-9681.html" rel=3D"norefe=
rrer" target=3D"_blank">https://curl.se/docs/CVE-2024-9681.html</a><br>
&gt; <br>
&gt; Upstream-Commit:<br>
&gt; <a href=3D"https://github.com/curl/curl/commit/a94973805df96269bf3f3bf=
0a20ccb9887313" rel=3D"noreferrer" target=3D"_blank">https://github.com/cur=
l/curl/commit/a94973805df96269bf3f3bf0a20ccb9887313</a><br>
&gt; 316<br>
&gt; <br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../curl/curl/CVE-2024-9681.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 88 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.82.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 89 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-9681.=
patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2024-9681.patch<br>
&gt; b/meta/recipes-support/curl/curl/CVE-2024-9681.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1ba373a1c4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2024-9681.patch<br>
&gt; @@ -0,0 +1,88 @@<br>
&gt; +From a94973805df96269bf3f3bf0a20ccb9887313316 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" target=3D=
"_blank">daniel@haxx.se</a>&gt;<br>
&gt; +Date: Wed, 9 Oct 2024 10:04:35 +0200<br>
&gt; +Subject: [PATCH] hsts: improve subdomain handling<br>
&gt; +<br>
&gt; +- on load, only replace existing HSTS entries if there is a full host=
<br>
&gt; +=C2=A0 match<br>
&gt; +<br>
&gt; +- on matching, prefer a full host match and secondary the longest tai=
l<br>
&gt; +=C2=A0 subdomain match<br>
&gt; +<br>
&gt; +Closes #15210<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D"https://github.com/curl/curl/commit/a94973805df96269bf3f3b=
f0a20ccb988731" rel=3D"noreferrer" target=3D"_blank">https://github.com/cur=
l/curl/commit/a94973805df96269bf3f3bf0a20ccb988731</a><br>
&gt; 3316]<br>
&gt; +CVE: CVE-2024-9681<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/hsts.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 ++++++++++----<br>
&gt; + tests/data/test1660 |=C2=A0 2 +-<br>
&gt; + 2 files changed, 11 insertions(+), 5 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/hsts.c b/lib/hsts.c<br>
&gt; +index 08e15dc..06d2edf 100644<br>
&gt; +--- a/lib/hsts.c<br>
&gt; ++++ b/lib/hsts.c<br>
&gt; +@@ -247,12 +247,14 @@ CURLcode Curl_hsts_parse(struct hsts *h, const =
char<br>
&gt; *hostname,<br>
&gt; + struct stsentry *Curl_hsts(struct hsts *h, const char *hostname,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool subdomain)<br>
&gt; + {<br>
&gt; ++=C2=A0 struct stsentry *bestsub =3D NULL;<br>
&gt; +=C2=A0 =C2=A0if(h) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char buffer[MAX_HSTS_HOSTLEN + 1];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0time_t now =3D time(NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t hlen =3D strlen(hostname);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct Curl_llist_element *e;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct Curl_llist_element *n;<br>
&gt; ++=C2=A0 =C2=A0 size_t blen =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if((hlen &gt; MAX_HSTS_HOSTLEN) || !hlen)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; +@@ -277,15 +279,19 @@ struct stsentry *Curl_hsts(struct hsts *h, cons=
t char<br>
&gt; *hostname,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(ntail &lt; hlen) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t offs =3D hlen - ntail=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if((hostname[offs-1] =3D=3D =
&#39;.&#39;) &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Curl_strncasecompare=
(&amp;hostname[offs], sts-&gt;host, ntail))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return sts;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Curl_strncasecompare=
(&amp;hostname[offs], sts-&gt;host, ntail) &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ntail &gt; blen)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* save the tail match wit=
h the longest tail */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bestsub =3D sts;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blen =3D ntail;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if(Curl_strcasecompare(hostname, sts-&gt;h=
ost))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return sts;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 return NULL; /* no match */<br>
&gt; ++=C2=A0 return bestsub;<br>
&gt; + }<br>
&gt; +<br>
&gt; + /*<br>
&gt; +@@ -447,7 +453,7 @@ static CURLcode hsts_add(struct hsts *h, char *li=
ne)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0e =3D Curl_hsts(h, p, subdomain);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if(!e)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D hsts_create(h, p, subdomain, ex=
pires);<br>
&gt; +-=C2=A0 =C2=A0 else {<br>
&gt; ++=C2=A0 =C2=A0 else if(Curl_strcasecompare(p, e-&gt;host)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* the same host name, use the largest exp=
ire time */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if(expires &gt; e-&gt;expires)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e-&gt;expires =3D expires;<br>
&gt; +diff --git a/tests/data/test1660 b/tests/data/test1660<br>
&gt; +index cbbcf75..662026b 100644<br>
&gt; +--- a/tests/data/test1660<br>
&gt; ++++ b/tests/data/test1660<br>
&gt; +@@ -52,7 +52,7 @@ this.example [this.example]: 1548400797<br>
&gt; + Input 12: error 43<br>
&gt; + Input 13: error 43<br>
&gt; + Input 14: error 43<br>
&gt; +-<a href=3D"http://3.example.com" rel=3D"noreferrer" target=3D"_blank=
">3.example.com</a> [<a href=3D"http://example.com" rel=3D"noreferrer" targ=
et=3D"_blank">example.com</a>]: 1569905261 includeSubDomains<br>
&gt; ++<a href=3D"http://3.example.com" rel=3D"noreferrer" target=3D"_blank=
">3.example.com</a> [<a href=3D"http://3.example.com" rel=3D"noreferrer" ta=
rget=3D"_blank">3.example.com</a>]: 1569905261 includeSubDomains<br>
&gt; + <a href=3D"http://3.example.com" rel=3D"noreferrer" target=3D"_blank=
">3.example.com</a> [<a href=3D"http://example.com" rel=3D"noreferrer" targ=
et=3D"_blank">example.com</a>]: 1569905261 includeSubDomains<br>
&gt; + <a href=3D"http://foo.example.com" rel=3D"noreferrer" target=3D"_bla=
nk">foo.example.com</a> [<a href=3D"http://example.com" rel=3D"noreferrer" =
target=3D"_blank">example.com</a>]: 1569905261 includeSubDomains<br>
&gt; + &#39;<a href=3D"http://foo.xample.com" rel=3D"noreferrer" target=3D"=
_blank">foo.xample.com</a>&#39; is not HSTS<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.b=
b" rel=3D"noreferrer" target=3D"_blank">curl_7.82.0.bb</a> b/meta/recipes-<=
br>
&gt; support/curl/<a href=3D"http://curl_7.82.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">curl_7.82.0.bb</a><br>
&gt; index ba3abadac9..cda42da4d3 100644<br>
&gt; --- a/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.82.0.bb</a><br>
&gt; +++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.82.0.bb</a><br>
&gt; @@ -62,6 +62,7 @@ SRC_URI =3D &quot;<a href=3D"https://curl.se/downloa=
d/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://curl.se/do=
wnload/${BP}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-7264_2.=
patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-8096.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-url-free-ol=
d-conn-better-on-reuse.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-9681.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D<br>
&gt; &quot;0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c=
&quot;<br>
&gt; <br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
</blockquote></div>

--0000000000000ce42b0626b7a693--

