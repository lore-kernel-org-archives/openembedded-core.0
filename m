Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66FAECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:43:53 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.12386.1662039823584365131
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a8gkBIzU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id s23so9040643wmj.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=Z3F+JwWP66hlagKBZ475QJ8chUaKw4Ag2Lg2J79+peM=;
        b=a8gkBIzUCaVnZA8KPQZ5alTe3EtY+FMNoW5GVhguCn5s0cQFG014XiUSvEc15WiAXS
         FqMJC+QGxJrsf9pAlfzHLjpiyJulD8ko+Sz+lZWcS2JyFaNtXS4WyATo7sfpxq9ecpS9
         sRNg8Wls1fDX0c6+nxLC4++XKTgd8l5OzmnuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=Z3F+JwWP66hlagKBZ475QJ8chUaKw4Ag2Lg2J79+peM=;
        b=oBIODwYgjTTKbD7JSEPYxVQGUDG18FSVgjMQbpQw5nRMwUxaXyarRQRhXUa4Y2oc8B
         2p+y9bxkL0NjEmOkPK4Vb7tuzl8KvSpNCxe/K4LzGM+uwTEEpn8Uc9+8ztty0EA7Fk92
         EuuGE7/lc/8cSQQ2EDNXEX7h8mKPY7rbW/UF955+C/V32Do1qXP51iUyq9kv0N3cijXT
         v2j96pEpzLUcTeraSx7lhNvZRLTitQivMNIWwBR2/4w3APm23iJ4GY/xJ3DhIDwGx+6W
         FaZL6THyGE4KGan2pQhfTGWMn1LT6sdUldBfyNrXLIFsvuO/lXYlBR3tJzsfK6CV4tyV
         rAzQ==
X-Gm-Message-State: ACgBeo3Z9l2twmovEnivbJcXdLrlhTseWedlLlODZPXos+L35lxOCewh
	zvUuOf3l/Qk67UV1RpiKg/XoXw==
X-Google-Smtp-Source: 
 AA6agR58bgqpDsv5Vlrg5hwPIFPNFqxjmT8iHmWhxxdh/j3XYL9/vIHfUg/54QbfnQS9fV2G40Z7uA==
X-Received: by 2002:a05:600c:1f11:b0:3a5:3df9:4859 with SMTP id
 bd17-20020a05600c1f1100b003a53df94859mr5150793wmb.175.1662039821976;
        Thu, 01 Sep 2022 06:43:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:417:930f:844b:d765?
 ([2001:8b0:aba:5f3c:417:930f:844b:d765])
        by smtp.gmail.com with ESMTPSA id
 r129-20020a1c4487000000b003a35516ccc3sm5345936wma.26.2022.09.01.06.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 06:43:41 -0700 (PDT)
Message-ID: 
 <4bab9a949e5f6766e6dd611a21803851881ee972.camel@linuxfoundation.org>
Subject: Re: [OE-core] Error with TEMPLATECONF value
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Jacob Kroon
	 <jacob.kroon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Sep 2022 14:43:40 +0100
In-Reply-To: 
 <CANNYZj9wiX4MPLwqrtMXtPqwMMWrQPmrDZ186vahPcDpmZk9pA@mail.gmail.com>
References: <1710BA34037FD8E9.1438@lists.openembedded.org>
	 <dd196c7c-93e5-2854-1479-8e51996929fd@gmail.com>
	 <CANNYZj9wiX4MPLwqrtMXtPqwMMWrQPmrDZ186vahPcDpmZk9pA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:43:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170164

On Thu, 2022-09-01 at 14:14 +0200, Alexander Kanavin wrote:
> On Thu, 1 Sept 2022 at 14:11, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> >=20
> > On 9/1/22 13:49, Jacob Kroon via lists.openembedded.org wrote:
> > > Hi,
> > >=20
> > > After updating to master branches I'm getting:
> > >=20
> > > > Error: TEMPLATECONF value (which is
> > > > /home/jkroon/Projects/codab-linux/openembedded-core/meta/conf) must
> > > > point to meta-some-layer/conf/templates/template-name
> > >=20
> > > What is the proper solution to this ?
> > >=20
> >=20
> > After wiping build/conf/* and rerunning bitbake the problem seems to
> > have resolved itself.
>=20
> You can also adjust build/conf/templateconf.cfg without wiping, just
> append /templates/default to what is in there. I have moved the
> default templates to meta[-poky]/conf/templates/default/ and added a
> check that enforces the location. This does break existing builds.

Ideally, the checks in sanity.bbclass would migrate existing builds for
this issue...

Cheers,

Richard

