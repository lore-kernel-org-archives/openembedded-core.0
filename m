Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C92CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 15:08:34 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.16883.1755616113801028353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 08:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CHwZfu0F;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-244580523a0so48115245ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755616113; x=1756220913; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KwYWOGg+8NK6j4i0mP/U0YYgG8wwW6ku3rw72zHQ8S8=;
        b=CHwZfu0F1Zpk1o7y3kMv/kjfcCNV7M5oePekq4y+jGoEJAP8sSwZ4MTJg4loQve03/
         zuE4Z9NXn7a8oKwm5xf1loNfy5vQAGm7GmBH/EooqWqqEgndG8NCaqbB187bfBBhag5r
         bJUk1g2WrWhIN2zdr6WE1Y3XktLtljRcuAPC06RzmN81F8N3hqNJ5He7c50+TTH8+Iu+
         V5RQdNCC0jU2rpJlmx/hUphAbThyoZ2U/Xm/Lw13Jdm5T3votKtvl+TMUkYSZXY18CVE
         gzJdrvoG5mVBsJO+mdsTOL1hPx2eo11fG0XUusRSLVNR9QlLWQW8IFilsmbpHy5MsGfp
         dkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755616113; x=1756220913;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwYWOGg+8NK6j4i0mP/U0YYgG8wwW6ku3rw72zHQ8S8=;
        b=VNduhY5X6S+hoirMccRkyM+dyZxYCBl1EBL7ohZOVIWWc1u4eoZ7QvbOxj29HZMKDH
         yM7wSFloPsb01U616C8oHr9UI9yNsZPlk/ebBEMbgbpb3OlaKEuWgZJDNfmw0TwaLDnY
         lP+fXSTdRxhxUkcHd4vxjSfp9CmcByim/95Bhddcxfk7HB7Wu8fh+BPs/kFcfQAV5Nf0
         Vm2kfvchu3wySHo5PG6G13FLI5M8BJN8lXNETxkjicc5l4fQbQT7obF+qicnSzSQSGSC
         hjL2BNe9aj6Z5a0qDg6/tBE8gpoQy+I6oMqv7rzhm4IenFTThBFD7BC0oCsHQPCKC1jl
         3prw==
X-Forwarded-Encrypted: i=1; AJvYcCWyGUTbG2UB5X87/lMT0dtDZVeAnyfjWXVDjIteVir/sKhfx95D2NNDRWbDd+zWV3bq3eO1nkLHkgqAy0LmrpHHsw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBNBuLowoC3JSJUpVF+Cbhndz3WrojLnnho5fcvpRdAZf2gdir
	Wwm0AS7r0ztRl9PTt/fyKLru/UZvXjWNcXsC2YJZ7SnCI4hb+jMlqEQBBzbs/a7IV/lYyi5mrGE
	Rsj01uCnF4XF+nKwBLEADsM6/2s4IBEOf/Q==
X-Gm-Gg: ASbGncsLxjGdK3y2Sl+pyZ9Uy/Aodo4itZ+29QWtXFkosFWdYUkvWRPbyRvUtds0yvW
	mLyPfFbZt4tywzqooeUN6GbaMe78uar4tzYodQr7hRjVvwu29ZRkS7BU1SEIO6cXygqFbteroNr
	Vbpd+EhHShZuX/IIH2bmJFgVaOhSmYcZgNzxPzMaSo/suQspRbKYRRlXL+2QlNAzcYcXtlmmdgZ
	YdQb1OU
X-Google-Smtp-Source: AGHT+IHZ1bTk9y3B1+6kEWzFiFNoEa/O2wV47eGsqBX45LPo1kuxsnNZxlQPJcyq8zbq6afYKAqoUCQDk/vv9/75gXA=
X-Received: by 2002:a17:903:2f0d:b0:234:8ef1:aa7b with SMTP id
 d9443c01a7336-245e04a6f7emr29572535ad.20.1755616112766; Tue, 19 Aug 2025
 08:08:32 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 19 Aug 2025 17:08:21 +0200
X-Gm-Features: Ac12FXwE2cAHsWIHx47kmot7HF7jdvtgXCl6mdxb5qFp_7R7gPF-ZQOz6guNYHo
Message-ID: <CAApg2=TZnJGDvBN8LBEoVbRcTJ6k1fGdOXVzss3bQmjZH4WknA@mail.gmail.com>
Subject: Renaming the yocto-security mailing list
To: yocto <yocto@lists.yoctoproject.org>, yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c373c8063cb93ac0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 15:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222117

--000000000000c373c8063cb93ac0
Content-Type: text/plain; charset="UTF-8"

Hello all,
yesterday's incident confirms that yocto-security has a confusing name that
might cause confidential reports to arrive there.

What about renaming the list to yocto-security-discussion or similar? And
eventually redirect yocto-security to the private security list.

My reasoning: we shouldn't rename the private list as people might use old
versions of documentation and we want them to address the correct private
list when needed. It is less critical if a message expected for the public
list reaches the private one, than otherwise.

What do you think? What is the process to do the change?

Kind regards,
Marta

--000000000000c373c8063cb93ac0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>yesterday&#39;s incident confirm=
s that yocto-security has a confusing name that might cause confidential re=
ports to arrive there.</div><div><br></div><div>What about renaming the lis=
t to yocto-security-discussion or similar? And eventually redirect yocto-se=
curity to the private security list.<br></div><div><br></div><div>My reason=
ing: we shouldn&#39;t rename the private list as people might use old versi=
ons of documentation and we want them to address the correct private list w=
hen needed. It is less critical if a message expected for the public list r=
eaches the private one, than otherwise.</div><div><br></div><div>What do yo=
u think? What is the process to do the change?</div><div><br></div><div>Kin=
d regards,</div><div>Marta<br></div></div>

--000000000000c373c8063cb93ac0--

