Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5C01B7F232
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 14:49:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so8095060wro.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 06:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=z2VzZLpZXUYMVvCrr5MHCl6fKaGW3X7hubYpFeisnjc=;
	b=GFSwMvULbAeLAY4i2h65uxhdD2XBYUNAaAATQqM17PrrolAKGqDmkOFoE2Uw2Cglrd
	ZXae9rNGPYZJILhBzFRbdvXCP27SD4m76Ldmd6lpvUkziTpPPtAbhadby+rILlQ75vzX
	U/sx1tXfGM/kFoJp0ldMLNau1Rtq9EsLr0Jcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=z2VzZLpZXUYMVvCrr5MHCl6fKaGW3X7hubYpFeisnjc=;
	b=ouf3M3aJI+3VE4dJFUaDjbsEpxgN5SQ3dLtJ3EtIOtbZo2EIHQrQzmFG9TBqrJBAGQ
	fbk0tXJ7hweSbDR0Lyi/nbFv4Dz45DVBXibs6aW6eAOrmmsD0JrLbUAwwdXrxy86loH3
	V3GNDwEdcAWZyIDtdhgXwDS3tlnbd95HdVAMGsaoYB8LRIxAlkSqDl5ne/34a8gXTirO
	h2RDiFShAwODSLFTgZMsotd2byg5NGVEIM/XQmLcl5CRpyVPG+SW6M8qwwJXLTGi+aPY
	1EFG1s0NK7sluIC21YdMzdvluiNDd9hG7ZvuDJ3ccDbaTsyPxkbxZVe7kTidwhMzZ1iR
	PZRw==
X-Gm-Message-State: APjAAAWAFr7lrpcBKfVk3OWY6lEtcBaTDgFbR+WwKTlfiJSyAM3PeuVg
	dqf8shfMo0Qpc/k/OojzlsYxVA==
X-Google-Smtp-Source: APXvYqz1LDqk5JK20/MYNu3CQrIBy4yZqKRFlaeBjakEAHkGAOe7Nx+wggbiVNFDOfaBIdcG7rzm+g==
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr17181940wrs.287.1575643768064;
	Fri, 06 Dec 2019 06:49:28 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u18sm16341869wrt.26.2019.12.06.06.49.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 06:49:27 -0800 (PST)
Message-ID: <76e1d18ee834fbc3e953f8e516a768ae80e9f304.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Dec 2019 14:49:26 +0000
In-Reply-To: <cover.1575599938.git.anuj.mittal@intel.com>
References: <cover.1575599938.git.anuj.mittal@intel.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [zeus][PATCH 00/10] zeus merge request - cover letter only
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Dec 2019 14:49:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Anuj,

On Fri, 2019-12-06 at 10:41 +0800, Anuj Mittal wrote:
> Hi Richard
> 
> Can you please merge these changes in zeus? They can be pulled from
> stable/zeus-next.

I merged the anujm/zeus branch since that's the one which has these
changes in! stable/zeus-next doesn't merge cleanly.

Cheers,

Richard

> Thanks,
> 
> Anuj
> 
> The following changes since commit
> b57ab03376fffd2546e55596ec03bc595e320fa1:
> 
>   oeqa: reproducible: Add option to capture bad packages (2019-11-23
> 12:51:37 -0800)
> 
> are available in the Git repository at:
> 
>   git://push.openembedded.org/openembedded-core-contrib stable/zeus-
> next
> 


