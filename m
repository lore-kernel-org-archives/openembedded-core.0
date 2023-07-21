Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E0FEB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 16:03:21 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.10899.1689955396707359194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 09:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qYuKjFmM;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b701e41cd3so30541681fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 09:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689955394; x=1690560194;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oH54k6rWmL4apijk3rtdjxl9cFZSolWwOyj4PNXF/l4=;
        b=qYuKjFmMdKA3AQNFAOUF0ecsCdnfSGKJCmLXtken5Xoo63i+mGRLVsv4SHCSPJUKn3
         mgh9q+/jANug56pJoD1ZDIBPO9jlUeRSuzJgHDZZfnrkZBbyZojzV/nLHTPngMZ0h+Aq
         rWglk7s27J0yeZop1Cbs2FPNxwpb4W20qB7IHXPyQmQWRwAhS2LE7Q9Gs5mSl1kZVhNN
         b9aTzSaOC+FfKJL0TMdEGxV8oRAl+Mrww7OZDGJaHpff7pBkhlMYIhVzW9l81M8Hd6ok
         YbneMzZBjdkrvlW/d9QKihOyqozQC2GZLXZb5ljQdNgbjD1APeSm47VWRxnytaHuitb5
         qgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689955394; x=1690560194;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oH54k6rWmL4apijk3rtdjxl9cFZSolWwOyj4PNXF/l4=;
        b=V3rRNWfoibvFkRJEuaMZ39n4DoXM8BbCfIiyi8EyPHbLg7PHmTyXOTa+SowTlOy8RP
         SumGVpW4TJYoV4xDiEsf0Hr1XUHTXibC6OkmkXyB2MKWyLkZx0qNPIzCRGdJQPVSS1Rh
         KjgSrM2Jof3v8k6wEykjl0m9prpN0GBRsJ9Z17lho/6TgFJ24wOyI36Kj5QhGqj5tXZo
         cA0bP4zw+ui/CO/E/fkdnioOlsUY0XVE4gKbNEkAsl3SEsEHpli14rwBvdqs1D7CNVc2
         /cEeN9jsMxgvKon0AmOsZJZsKIhRjomFkJ/LPGBK95PQZTQzkx9L1YLdxZrTAl+rq4bi
         bfdA==
X-Gm-Message-State: ABy/qLZLmYxBaAkcwx17gx1170HNKh/L/phJ+Xg0UpT2Pl16FJAocAfw
	tcd+RaaVFGQ8B3OmKPiThTvynlyWt+uJoAQYd7BJG4rU
X-Google-Smtp-Source: APBJJlGlGo4Vzds1Ipn2zcFdbob+rAZ7l92M6gYU0WJXEP7x/1sYTI5pqkdDfKPSKIwDzbVewq5vZDv3QWOlI09ae8Q=
X-Received: by 2002:a2e:8884:0:b0:2b9:2e85:2f9b with SMTP id
 k4-20020a2e8884000000b002b92e852f9bmr2051101lji.2.1689955393784; Fri, 21 Jul
 2023 09:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <888cf277-5987-4800-83e3-081527d5b59dn@list.nist.gov>
In-Reply-To: <888cf277-5987-4800-83e3-081527d5b59dn@list.nist.gov>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 21 Jul 2023 18:03:01 +0200
Message-ID: <CAApg2=Tp7NhuGvBQNLP0R3AwoVjurO0v-57NKMUirkn_QyJ7Zg@mail.gmail.com>
Subject: Fwd: [nvd-news] Keyword and Keyword Exact Match Searches Temporarily Disabled
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000eed41f0601016651"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 16:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184704

--000000000000eed41f0601016651
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We might see some difficulties in the next days.

Marta

---------- Forwarded message ---------
From: nvd-news <nvd-news@list.nist.gov>
Date: Fri, Jul 21, 2023 at 5:57=E2=80=AFPM
Subject: [nvd-news] Keyword and Keyword Exact Match Searches Temporarily
Disabled
To: nvd-news <nvd-news@list.nist.gov>


*Keyword and Keyword Exact Match Searches Temporarily Disabled*

The NVD has been experiencing issues with website and API availability. We
have identified the root cause, however, due to the particular complexities
and other operational needs, a larger scale solution must be put into
place. This will take time to implement and resolve. In the interim, to
ensure continuity of services that are not impacted, we will be disabling
both the keyword and keyword exact match capabilities of the vulnerability
search page and APIs. We are aware that this will impact the daily efforts
of many that make use of our data and request understanding and patience
while we move towards a viable solution.

For questions and concerns you can contact nvd@nist.gov . Please refrain
from requesting timelines on resolution, we will notify all users through
the various channels available when we have information to share on the
topic.

V/r,
The National Vulnerability Database Team

--=20
To unsubscribe from this group, send email to
nvd-news+unsubscribe@list.nist.gov
View this group at https://list.nist.gov/nvd-news
---
To unsubscribe from this group and stop receiving emails from it, send an
email to nvd-news+unsubscribe@list.nist.gov.

--000000000000eed41f0601016651
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>We might see some difficulties in the <span class=3D"=
ng" style=3D"background:rgba(0,0,0,0) none repeat scroll 0% 0%!important">n=
ext days</span>.</div><div><br></div><div>Marta<br></div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarde=
d message ---------<br>From: <b class=3D"gmail_sendername" dir=3D"auto">nvd=
-news</b> <span dir=3D"auto">&lt;<a href=3D"mailto:nvd-news@list.nist.gov">=
nvd-news@list.nist.gov</a>&gt;</span><br>Date: Fri, Jul 21, 2023 at 5:57=E2=
=80=AFPM<br>Subject: [nvd-news] Keyword and Keyword Exact Match Searches Te=
mporarily Disabled<br>To: nvd-news &lt;<a href=3D"mailto:nvd-news@list.nist=
.gov">nvd-news@list.nist.gov</a>&gt;<br></div><br><br>
<div><b><u><font size=3D"4">Keyword and Keyword Exact Match Searches Tempor=
arily Disabled</font></u></b></div><div><b><u><font size=3D"4"><br></font><=
/u></b></div><div>The NVD has been experiencing issues with website and API=
=20
availability. We have identified the root cause, however,=20
				due to the particular complexities and other operational needs, a=20
larger scale solution must be put into place. This will=20
				take time to implement and resolve. In the interim, to ensure=20
continuity of services that are not impacted, we will be disabling=20
				both the keyword and keyword exact match capabilities of the=20
vulnerability search page and APIs. We are aware that this will impact=20
				the daily efforts of many that make use of our data and request=20
understanding and patience while we move towards a viable solution.</div><d=
iv><br></div><div>For questions and concerns you can contact <a href=3D"mai=
lto:nvd@nist.gov" target=3D"_blank"> nvd@nist.gov </a>
 . Please refrain from requesting timelines=20
				on resolution, we will notify all users through the various channels
 available when we have information to share on the topic. <br></div><div><=
br></div>
V/r, <br>The National Vulnerability Database Team
=20

<p></p>

-- <br>
To unsubscribe from this group, send email to <a href=3D"mailto:nvd-news%2B=
unsubscribe@list.nist.gov" target=3D"_blank">nvd-news+unsubscribe@list.nist=
.gov</a><br>
View this group at <a href=3D"https://list.nist.gov/nvd-news" target=3D"_bl=
ank">https://list.nist.gov/nvd-news</a><br>
--- <br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:nvd-news+unsubscribe@list.nist.gov" target=3D"_bl=
ank">nvd-news+unsubscribe@list.nist.gov</a>.<br>
</div></div></div>

--000000000000eed41f0601016651--

