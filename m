Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B3DEE0AEF
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 17:31:14 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9298.1770485471441802753
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Feb 2026 09:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nQiG5+yp;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so33724995e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 09:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770485470; x=1771090270; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bom0ftUaimPFkSDL1t2Q67yi1ZIy0oMGdJYV5P+e1Fc=;
        b=nQiG5+yp2kO5pXDG7bvdwwOkTLpS5qKWhYxoxzGsfYu7p0Xxe84/nAG0OgDcPItAZy
         UOPDAKCUj3R1sVKJJQ6bJWICUFd7Wvo0ZQaoWfaRrgUJXaQK3LzxryTObJEs0m/tXX0s
         SWS/pniLlevhf6uWMaL11ALlubvp5vrv5dIl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770485470; x=1771090270;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bom0ftUaimPFkSDL1t2Q67yi1ZIy0oMGdJYV5P+e1Fc=;
        b=rtop1YeDpTOBBQzfSlRf4qXnubEDdoxJC67Jc4+oa6OB9OTsxHBNKhCgfX6p4wWWUm
         LX+ijvoprvPWoK7rpi+PT/Gw6zx8mJET++CxeaKDFjS4MwQ7L0bZDZvLSdoapClB01L+
         4MG2Jjark6txOKRRybJE4M+NrMf5hoOYdnWZvuETAwdPN5Zo+XTuZa/fRzsZQRH4buIL
         /bDDqzgDCEgY9CwtNhriYZlbxqe+Qjb3GGr00tDV0/p1rjtvryl8aSw+OOQjH//u7YNY
         MsECCrKXiFjFsya+VPNYxQFCGvqsxN0ZrE+yCnNihqQQmDDbOosmftinqBFJhOgu3sm5
         bYgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjjG5m9BPI4tiwaBg5fTrDHQn0xFvvgqsCo1d1Zsa2uf+wWR4W6+ofLPTtgctebFg9vhwJLnM+067yJB/g5ZYWcg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXApHmGPZLcgRk3yMxSFrYb1fGd9Tie7trru8lOesgSFa2az8n
	Uf2KheAogt1bJrz7FlBB4rqjUvospnmX4eNQ7nGp9JWwlZRVCNUvzcus3jNPeVuwANo=
X-Gm-Gg: AZuq6aIS+yMZ9jMvbwTEyDbnZbsa2ABxnwWga9nRILPeesgHbdJNK+Dp565hjXPhlqt
	c4GSWPsAtQkau9y5ZqsbB9XUqN8ciIqff+AwGFvn2G26reuWksZbJGF1kE/5sletFgX0xlpdHpo
	54ontdp2mcvkHzU43Q2W60wMPmzd88c1rfumd1JjQJPitI4mG/IDFlKxpx4v6zf4AusAtvSEzAe
	TPYuzt7Vndnm2XnF87JfMPdV+jWB6NlYekejHbjZ9WaVxzO8CcAKqppJmznUN5a2f6qH9SN2Qkk
	YPr/rZC2ZOILs1Beuwdbg2rNAnU+fu9hc7FCJwkQ9YbtV/VaAREPrz2E1ri1IrcRSQ9jHjX+YbP
	0F77Caz07zsCfD75Cv9FQ1EEH8cEp/SmGe+XtQlZjoXgfTFM2fG/1hfJjsAhFpChKRSP5h7PBvx
	52MD/9VALCvcACHz9Vvfa0vtgBl9WK91A2eKG/gOd9FruO6qLIB5YIDahTFv3yHEFazFnOiyAJk
	hI=
X-Received: by 2002:a05:600c:8b56:b0:480:3bba:1ca9 with SMTP id 5b1f17b1804b1-483201fff35mr84469455e9.4.1770485469748;
        Sat, 07 Feb 2026 09:31:09 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d2ba61sm318717885e9.1.2026.02.07.09.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 09:31:09 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2026 18:31:08 +0100
Message-Id: <DG8WPVV5Z90Q.3BZG4R1Y7ILZX@smile.fr>
To: <benjamin.robin@bootlin.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v2] meta/classes: fix missing
 vardeps for CVE status variables
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <antonin.godard@bootlin.com>, <kamel.bouhara@bootlin.com>,
 <jeremie.dautheribes@bootlin.com>, <jpewhacker@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260119084451.8559-1-benjamin.robin@bootlin.com>
In-Reply-To: <20260119084451.8559-1-benjamin.robin@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 17:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230673

On Mon Jan 19, 2026 at 9:44 AM CET, Benjamin Robin via lists.openembedded.o=
rg wrote:
> Several CVE helper functions (get_patched_cves() and decode_cve_status())
> implicitly depend on the CVE_STATUS and CVE_CHECK_STATUSMAP variables, bu=
t
> these were not declared in the vardeps of their callers.
>
> On Scarthgap, the upstream fix (2cc43c72ff28aa39a417dd8d57cd7c8741c0e541)
> cannot be cherry-picked cleanly, as it also requires BitBake changes.
>
> As a workaround, explicitly add CVE_STATUS and CVE_CHECK_STATUSMAP to the
> vardeps of all tasks invoking these helpers, ensuring correct task
> re-execution when CVE status changes.
>
> This keeps CVE-related metadata generation consistent without requiring
> BitBake modifications.
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
> changes in v2:
>  - provide a clearer commit message
>
>  meta/classes/create-spdx-2.2.bbclass | 1 +
>  meta/classes/create-spdx-3.0.bbclass | 2 ++
>  meta/classes/cve-check.bbclass       | 1 +
>  meta/classes/vex.bbclass             | 1 +
>  4 files changed, 5 insertions(+)

Thanks for this v2.  I appreciate it.

Regards,
--=20
Yoann Congal
Smile ECS


