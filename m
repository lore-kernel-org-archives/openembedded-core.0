Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B17C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:44:57 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.25222.1646653494058447212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SXl7N/Nk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 k8-20020a05600c1c8800b003899c7ac55dso1592792wms.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bg8p325tMjHVEvcIBA5caYYEeHyaO7UGTYmj53RR5lU=;
        b=SXl7N/NkL2U+MRbASIAmgoDAlM72uqyCHikZANmtXA7Ub2AYdDuKFrIUkueYow0ZBV
         owIHxZK4tNyFDMwRShkigPzNAciTgZ9dwKRcsSd+1MSAQcDNzPgndlS+JgJ65Q0OvIRt
         Pp7REOY3v0kQJM/l5TQ59rOthgP+uNOHK/RGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bg8p325tMjHVEvcIBA5caYYEeHyaO7UGTYmj53RR5lU=;
        b=jzblnZ+olvl5KMJ4nWsAnMTdnl7LG2HzI925usfu0nQuHVY5P/yAPvYoYi2tYivAek
         TqK5WTxhCDd8FQeRdK2cG623dPw2sM1R3IYeh9BVz6JghW1EEJ7l3sFf/VWpudA1rYf3
         SQgWEsZOMN4nAh+FQd2BNVG/4Df1M4sn7/Y0e0Hs2gXct4xTwbwoe+097Fe36o1WPfKY
         0Dv4mAjNcyAyyLKv7JnogMgmXgKIbqaUs9gGMs/E3t7L8D6Xzgxtk+81n65hlDviKE9z
         Tn8etG35x4pLHFfh11kilOltGxyx0w02wURa72inndnyRyEt9QKTLND+/jyVIBMzjEL8
         19XQ==
X-Gm-Message-State: AOAM5306rOhWuSMEa5XSv8hhGOG9Em6AAgeEuxEYbbjjq/1nHXvKAN+T
	XpvrU8ClyLwPt7EW2c3UmSVkkg==
X-Google-Smtp-Source: 
 ABdhPJyyElSVB5A07UdhyOkwwADrlHsBmSAL/hbiL9q84ZWh+TxpwGodWGlV1GXgMvqrg5dRMjXzgw==
X-Received: by 2002:a05:600c:500f:b0:389:a4a6:b5e1 with SMTP id
 n15-20020a05600c500f00b00389a4a6b5e1mr3940283wmr.128.1646653492453;
        Mon, 07 Mar 2022 03:44:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bb31:2700:8490:fdf8?
 ([2001:8b0:aba:5f3c:bb31:2700:8490:fdf8])
        by smtp.gmail.com with ESMTPSA id
 h188-20020a1c21c5000000b00385699a8993sm13492074wmh.11.2022.03.07.03.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 03:44:52 -0800 (PST)
Message-ID: 
 <cdbe8623d35c2ebf943806de4fd4400a8636f4f0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [honister][PATCH 2/2] util-linux: upgrade 2.37.3 ->
 2.37.4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com,
	Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 07 Mar 2022 11:44:45 +0000
In-Reply-To: <62fd97c4-b5e5-42d5-cc13-ae0883184210@theobroma-systems.com>
References: <20220307112127.21538-1-quentin.schulz@theobroma-systems.com>
	 <20220307112127.21538-2-quentin.schulz@theobroma-systems.com>
	 <62fd97c4-b5e5-42d5-cc13-ae0883184210@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 11:44:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162811

On Mon, 2022-03-07 at 12:26 +0100, Quentin Schulz wrote:
> Hi all,
> 
> On 3/7/22 12:21, Quentin Schulz wrote:
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > 
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 6a3289c4786c4d278e2bf0ec1a5e04363772d8bc)
> > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > ---
> 
> https://www.spinics.net/lists/util-linux-ng/msg17037.html 2.37.3 fixes 
> two CVEs (not listed on nvdist database for some reason).
> 
> https://www.spinics.net/lists/util-linux-ng/msg17087.html 2.37.4 fixes 
> one CVE (not listed on bvdist for some reason).
> 
> I think it might be useful for release maintainer(s) if we mention in 
> the commit log or commit title if it's a security bump or not when 
> sending patches for version bumps to master? What do you think? (FYI, 
> Buildroot seems to do it regularly and it helps me with keeping my 
> vendor tree somewhat up-to-date security wise).

I'm happy if people do mention it (I did for expat recently) but I'm not going
to block upgrades on the information being missing (how would I tell?).

We're struggling to get people to submit upgrades so I'm reluctant to make it
harder for them.

Cheers,

Richard


