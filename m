Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A1DECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 09:09:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.4308.1662714579544137479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 02:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S/ZCpL/G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so798225wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=9rJiGp2B5vC8ExOleFXUcNSsKu6njAIlquxpxe1J0fU=;
        b=S/ZCpL/GndGqkL64PtVmOEaEy6gU99aBXznXFYgOgKoXND+w2jpMBms3AxeSImNOkL
         2PU4BZ1dK+z2n2KfZCwKB++DJSsDAjCGU9CqU8rFSQYoJS9pj1zFkImTi2T1d69qP/lb
         zYsbDC6LljjDGXgYyF4N5PrZY5Sczycd8JRzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=9rJiGp2B5vC8ExOleFXUcNSsKu6njAIlquxpxe1J0fU=;
        b=NARC4o7Ob92Ae/+rzCGQ+GGZCBiv1XU54OnbxRQSbSou0rN9/TZF7TOejclYPVxB4O
         94tTet0RxP0H5wq59BLpO8ckLzFmcubheVNehkPpiaYZ32P2Vf3OImbqiiE6vE6XRrBX
         ghqIva8mxAideaSvDNOO3YPPdDuiKpm4fCQ6QWLN5tTsyXLhmtsPsZw+UjjMslDuMd6q
         IegLW6zhlhUnQpLMx0PAwQeaO9xg39STRILU0ikHyQT+8eekLzIE9RgrWXAwqBEoxoij
         dCS4yvZs16IheH4YyxkaIZd0T2lPBq2DtBPCNo4S6lFLeGh/3/W5NHQpAeyOxbaFhBNO
         6ygQ==
X-Gm-Message-State: ACgBeo0FS5JrA0+Ju5vPaT0Le7rSRVlg65adhMbAT/u3WmoyQajursQ1
	t61dwQpdwENAfBrq5ivXHWGWxg==
X-Google-Smtp-Source: 
 AA6agR7AAjL+W9tTx32LdbClG7FnBDvrwkEL4utnV0171X+Jogbi0L9l88o0BTVbZLV+KTw895qK/g==
X-Received: by 2002:a05:600c:3541:b0:3a6:28e4:c458 with SMTP id
 i1-20020a05600c354100b003a628e4c458mr4859541wmq.188.1662714577724;
        Fri, 09 Sep 2022 02:09:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992?
 ([2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992])
        by smtp.gmail.com with ESMTPSA id
 n16-20020a7bcbd0000000b003a5bd5ea215sm1416004wmi.37.2022.09.09.02.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:09:36 -0700 (PDT)
Message-ID: 
 <6a3b182c1f737086fbf398bcf191865c00a4fe10.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 1/3] oe-setup-builddir: Correct when
 validation of the templates dir is run
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 09 Sep 2022 10:09:35 +0100
In-Reply-To: 
 <PR2PR09MB310090AC0EFFE5E72CC30942A8439@PR2PR09MB3100.eurprd09.prod.outlook.com>
References: 
	<PR2PR09MB310090AC0EFFE5E72CC30942A8439@PR2PR09MB3100.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 09:09:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170480

On Fri, 2022-09-09 at 10:42 +0200, Konrad Weihmann wrote:
> A general remark from my side about this patch is that this limitation=
=20
> isn't mentioned in the documentation at all [1].
> I would have been in favor of just dropping this piece of code, esp as=
=20
> the check wasn't run for years now - but here we are with another=20
> undocumented and breaking change (at least for me, as the template confs=
=20
> in my projects weren't located under templates, until everything fell=20
> apart in CI over night)

The tone of what you've written here isn't great but let me comment.

The project can and will make changes and try to improve, it has to.
Some of these changes will break things. We usually try our best to
minimise disruption but change is what happens on the development
branch. We usually do a reasonable job of documenting things as part of
the release notes and the migration guide but this isn't in a release
yet.

We do have LTS branches and we are not in the habit of pushing breaking
changes to those.

For reference, I would ideally love to have a team of engineers I could
work with to make sure all changes had strong migration code and
nothing every broke. We have to manage with what we have.

If you expect your CI never to break running against master, that is
not a realistic expectation.

Cheers,

Richard



