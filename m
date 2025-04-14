Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2400C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 12:32:32 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.48657.1744633943122882597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 05:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rm5E3pHl;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so4038431a91.1;
        Mon, 14 Apr 2025 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744633942; x=1745238742; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GLL3BDMUxPlZe//hUOhod797UFFSE1YaEO6fhuH1IE8=;
        b=Rm5E3pHlyfxtw3ICeNVQNAoVHIjSY/u3ONnoyXTwD4a4PuxPvK2NTaNpx8F0XJZw12
         WoOmYhXlHTLLT/JM5pov5XHiaykFR6JvS+4Cs2jljD3vMjVDDnGC376JYPOTprgcSUwR
         EQ78IwvPweFKqcoW7KWafXKS9tg9XnPIBNx+fXxEr+01hIHts+oE0f9hZTQZrNBrzY1S
         77UUkGwqVWHSPeBhtek8n0PED1sXBIDUZUVMQIBuUMw7UYSQ7SZ0sGZdjwX59uWMnBB+
         W72aTBtaIEVbKxuTT3OuEDAPRU2FANB9Y4L10a/+NPs9r+pVsNQ2s7EGQqcUlf1UEjcN
         Chvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744633942; x=1745238742;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLL3BDMUxPlZe//hUOhod797UFFSE1YaEO6fhuH1IE8=;
        b=TrmTZKSWPvsp3wl8GHwxLAiE3cxUqcTUZ2Fy66a9AvT5I41aSlFH0x5WzgIQDc83Ql
         NIlow8JpATsSH9UmnLY3YVvjzBpnjt1WFCJR1shV3jGiecHO5EgIGeTcO0gmMUcRxvKK
         nb8AGx8oFYIBa6TipB4NVZSTTeIP8/8H+jL8j4G5wmpEw8OirB2S1+PAnRvACIh0zjFD
         f0cIbuCxzURNg6FIb0lxS7l8Us97wp0KjWfisyjitQKsdyDew6nWaF+0YJ4meJt5dsOF
         UCI8kIrhAvQNFhI2l2jXIgSMZCrjpLIqt03ULPguTgVKNratsMlWzVrT10WbZCAbWWNI
         5QGg==
X-Forwarded-Encrypted: i=1; AJvYcCXGVhMtB2h8UeJMD7mTpZdHBc8s/WdG1crdfUkN5VfK3zOesZ+Cj6OQ4U4tx3UP2I7L+6NxAkpsto1R2rCH6cLvQXdsRUBjn5ka@lists.openembedded.org
X-Gm-Message-State: AOJu0YxOciXpVxYAcvaXStO+iCKPJmQh581lywMVTERrXNQwVgJhTc71
	5pWJ5ohimQLLiby7Xp2E/IaGc/25DfmbB4N1bG1kWUIV4stEP8brs7pIo3En/GAsZ1i3GFopNaB
	RDDaF8Y2LMh+GqnWDKyEDuJ7SjTV5RCIV
X-Gm-Gg: ASbGncuLtGgB6FYrjHJ2ch+XoXMBmMUvKFjdHIWXdR/yl1pYcWlPZRI1jpLAYSDrHFD
	QsMHRSVwot98pFR3AFZ6PuXNibJlH/MCzXrMLbb0N+cFQ6yGkEAJPGujsZ4WWV369+VV22ghsZb
	BFri0oqimtZK+m3X5I4CLo7Mo6KyepgJ9783OyhNNy3k2D7Et43fS49hbJ7EehbS9WX9Q=
X-Google-Smtp-Source: AGHT+IGI9kUaa+kWATu1UFHCNd3SWpPumDAIML8rQej9QN51f6SEGJSj8SnStq9jYDRQh1DfwxOdUppBlfR7nTqssOg=
X-Received: by 2002:a17:90b:3cc6:b0:301:1c11:aa83 with SMTP id
 98e67ed59e1d1-3082367df8dmr17706122a91.28.1744633941361; Mon, 14 Apr 2025
 05:32:21 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 14 Apr 2025 14:32:09 +0200
X-Gm-Features: ATxdqUHRF8Y103Mk_qc7UQeqO-oMMAwr67dFCUFe3eq-1lbYH1XuwIVrg0sh5oA
Message-ID: <CAApg2=TOMG98YN3=ijm5cogNYEwJwSV6zFT133s_+NpEzJ7kJg@mail.gmail.com>
Subject: Cyber Resilience Act: the definition of "Operating System"
To: OE-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005691420632bc3ede"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 12:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214802

--0000000000005691420632bc3ede
Content-Type: text/plain; charset="UTF-8"

Hello all,
Under the Cyber Resilience Act, there are requirements for all types of
products, but some categories have more than others. They are on the list
of important and critical products. "Operating Systems" is one of them.
Now, the European Commission has drafted a version of definition of those
categories and asked for comments.

The ORC working group is collecting feedback from the open source community
and the definition of Operating Systems is discussed here:
https://github.com/orcwg/cra-hub/pull/213

The limit date for the feedback is this week, if you haven't seen it yet.

If your company has not yet submitted your feedback (either directly or by
a group), I strongly recommend you to have a look. You can start reading
here for more context:
https://github.com/orcwg/cra-hub/tree/main/product-definitions

Kind regards,
Marta

--0000000000005691420632bc3ede
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>Under the Cyber Resilience Act, =
there are requirements for all types of products, but some categories have =
more than others. They are on the list of important and critical products. =
&quot;Operating Systems&quot; is one of them. Now, the European Commission =
has drafted a version of definition of those categories and asked for comme=
nts.</div><div><br></div><div>The ORC working group is collecting feedback =
from the open source community and the definition of Operating Systems is d=
iscussed here: <a href=3D"https://github.com/orcwg/cra-hub/pull/213">https:=
//github.com/orcwg/cra-hub/pull/213</a></div><div><br></div><div>The limit =
date for the feedback is this week, if you haven&#39;t seen it yet.</div><d=
iv><br></div><div>If your company has not yet submitted your feedback (eith=
er directly or by a group), I strongly recommend you to have a look. You ca=
n start reading here for more context: <a href=3D"https://github.com/orcwg/=
cra-hub/tree/main/product-definitions">https://github.com/orcwg/cra-hub/tre=
e/main/product-definitions</a></div><div><br></div><div>Kind regards,</div>=
<div>Marta<br></div></div>

--0000000000005691420632bc3ede--

