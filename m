Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FA6EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 12:49:59 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.6815.1689079789654761413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 05:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pOzfUnRb;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b6ff1a637bso89709421fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 05:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689079788; x=1691671788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2XARyJNiYtU8dTK6ih/Za8tXbJsFVU7unujGFtRjACE=;
        b=pOzfUnRbBfrXNCrDacmxc47ZxB0/CX9gsS77sYuzprsIiPXi4UeZT/5t11tsoka+IM
         krbW2CPqKi7LkmELQ2EIDHl+IPEtDSnqtYuB4//vg6Ot4q50TGLCMkrl5txhyHR+0Vw2
         r/Pk84rb96yAAZiQzmRBQURoL4UJcz2AyjHGkd1IE3mvK7sirXJFv99JZdFkuNgQY71h
         JcAoJxHFKD0G0qL593IPx+Vl61fIMKehrMlYuh36tKR8W9lWAa6toucQQHU/550guWUq
         5iPwIaZGm0QUtN8fHs/yVwwrYo/RMaJ6v91ISlaksoOJjgvKAIprBzqUwQcJ/fJT1/Fc
         tEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689079788; x=1691671788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XARyJNiYtU8dTK6ih/Za8tXbJsFVU7unujGFtRjACE=;
        b=fdhH0C6NQQM4gWcgz7Q9d/h/ulZ85vZfPTPwP00Otdprg26FCfBzYJCTykWTCJ9ExV
         lwbO/cBUXaJBPD+D8sgNNt5P982Sfkepf2FFPXBOIuWE9C7YrXhqbmN61rTpxH1be66K
         BGgFNid69JQv9eS3S/a2SuR/Wb87Vv5g1+clk3VTS0tr3u/20xD24ccj36FwhwSDx3vm
         xaVQ3EnRyDlrH7OUMLeQN00JShX8qHRHEAU7jSCm7UZHwHhDdTpPPxpSRZdPKAqP/gdZ
         gg6cl6/Z057a8+WbEl0ZcJj9/3CGIUuRS1mQs4a8HVJRSZEy+xzTAENDm/JX4qXRWAsT
         sZFg==
X-Gm-Message-State: ABy/qLY7Ha8ZDIuB/qKIOc8byBWbam8pSoZT6iYWWQCp0GiH9yYj8Q67
	q0PmiLYhCVK53XIOSG4kmwQQdg4eZTnCVC8PshIuytv1Bfk=
X-Google-Smtp-Source: APBJJlFPW1+SxY4Ls2xVT/QI8WxhsE3+xz8oNtjOrAr15ocCt1GDsO4SWG4N5nL/zPQkGH0PHrO+r/dfPqbPhSFSTpA=
X-Received: by 2002:a2e:9189:0:b0:2b4:78f6:d335 with SMTP id
 f9-20020a2e9189000000b002b478f6d335mr12653346ljg.8.1689079787445; Tue, 11 Jul
 2023 05:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230711063629.7627-1-peter.marko@siemens.com>
In-Reply-To: <20230711063629.7627-1-peter.marko@siemens.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 11 Jul 2023 14:49:34 +0200
Message-ID: <CAApg2=R=JysFvHZv_zA=YbwgP9-R53ToCF3hsS1==g3cn5rv9g@mail.gmail.com>
Subject: Re: [OE-core][master][mickledore][kirkstone][dunfell][PATCH 1/2]
 cve-update-nvd2-native: retry all errors and sleep between retries
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ba6258060035882e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 12:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184136

--000000000000ba6258060035882e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Peter for debugging this. Could you dump us a log of one of your
typical runs to see what the errors are?
We might consider mirroring at some point.

Kind regards,
Marta

On Tue, Jul 11, 2023 at 8:37=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> Last couple days it is not possible to update NVD DB as servers
> are returning lot of errors.
> Mostly "HTTP Error 503: Service Unavailable" is observed but
> sporadially also some others.
>
> Retrying helps in most cases, so extend retries to all errors.
>
> Additionally add sleep which is recommended by NVD between requests.
> These retries are already implemented between successful requests,
> but giving servers time between failed ones is important, too.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> index 4585126f73..a7392405e0 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -119,6 +119,7 @@ def nvd_request_next(url, api_key, args):
>      import urllib.parse
>      import gzip
>      import http
> +    import time
>
>      headers =3D {}
>      if api_key:
> @@ -140,13 +141,9 @@ def nvd_request_next(url, api_key, args):
>
>              r.close()
>
> -        except UnicodeDecodeError:
> -            # Received garbage, retry
> -            bb.debug(2, "CVE database: received malformed data, retrying
> (request: %s)" %(full_request))
> -            pass
> -        except http.client.IncompleteRead:
> -            # Read incomplete, let's try again
> -            bb.debug(2, "CVE database: received incomplete data, retryin=
g
> (request: %s)" %(full_request))
> +        except Exception as e:
> +            bb.debug(2, "CVE database: received error (%s), retrying
> (request: %s)" %(e, full_request))
> +            time.sleep(6)
>              pass
>          else:
>              return raw_data
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184115):
> https://lists.openembedded.org/g/openembedded-core/message/184115
> Mute This Topic: https://lists.openembedded.org/mt/100074006/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ba6258060035882e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you Peter for debugging this. Could you dump us=
 a log of one of your typical runs to see what the errors are?</div><div>We=
 might consider mirroring at some point.</div><div><br></div><div>Kind rega=
rds,</div><div>Marta<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jul 11, 2023 at 8:37=E2=80=AFAM Peter=
 Marko via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.org=
">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Peter Marko &lt;<a href=3D"mailto=
:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;=
<br>
<br>
Last couple days it is not possible to update NVD DB as servers<br>
are returning lot of errors.<br>
Mostly &quot;HTTP Error 503: Service Unavailable&quot; is observed but<br>
sporadially also some others.<br>
<br>
Retrying helps in most cases, so extend retries to all errors.<br>
<br>
Additionally add sleep which is recommended by NVD between requests.<br>
These retries are already implemented between successful requests,<br>
but giving servers time between failed ones is important, too.<br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> | 11 ++++=
-------<br>
=C2=A01 file changed, 4 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-nativ=
e.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> b/=
meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
index 4585126f73..a7392405e0 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
@@ -119,6 +119,7 @@ def nvd_request_next(url, api_key, args):<br>
=C2=A0 =C2=A0 =C2=A0import urllib.parse<br>
=C2=A0 =C2=A0 =C2=A0import gzip<br>
=C2=A0 =C2=A0 =C2=A0import http<br>
+=C2=A0 =C2=A0 import time<br>
<br>
=C2=A0 =C2=A0 =C2=A0headers =3D {}<br>
=C2=A0 =C2=A0 =C2=A0if api_key:<br>
@@ -140,13 +141,9 @@ def nvd_request_next(url, api_key, args):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r.close()<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except UnicodeDecodeError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Received garbage, retry<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;CVE database: =
received malformed data, retrying (request: %s)&quot; %(full_request))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except http.client.IncompleteRead:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Read incomplete, let&#39;s try=
 again<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;CVE database: =
received incomplete data, retrying (request: %s)&quot; %(full_request))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;CVE database: =
received error (%s), retrying (request: %s)&quot; %(e, full_request))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(6)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return raw_data<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184115): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184115" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184115</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100074006/582=
7677" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100074006/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmail.com" targ=
et=3D"_blank">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ba6258060035882e--

