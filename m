Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 19201600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 17:22:09 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id e4so119335590pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 09:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=IGg77W+eA1pDSH0nZpPvQzK9VRG6YkkrmuEFFVuANO0=;
	b=VQUcrIf3wxYf4ar9CIr4DNGfB9VT83EvfJs3X5QBQhlZaaU7+9PCX/8FhUv1O38Evv
	W/LTJu57lkYh0y8N+abCDw/z5+uyC4Px/W1+GUoXTODu2kF5MUcLjPiJXEgsSRU7sYto
	32iyu1Zqvo33kWIx1706ST2BESSeu2k0WuuBTT3QkvJAV6jiUR60jQWFD7v5QynMaxk7
	Z3jySfKQRLQEWhZ+Qqw8eOB+qft9Fcy1JTN1yBCiaF+D/RFqAi9wDhKcjGvFOQGrX0l+
	S+b7WiTvGBb6dLpWu/VQXCuLvqgMvcY390X9vHskOtk943X7G2FfooKzAedJBywSn1g3
	HJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=IGg77W+eA1pDSH0nZpPvQzK9VRG6YkkrmuEFFVuANO0=;
	b=hc5D2uPvymxcuGBPlOSE+nE3NOBrQ384erVXN2e6XZVXPp4MulsqFqtNyRMKsVELLW
	s5AW9KFvnBQ+NdO56omgGXlUoZ7NTtWOgBL3yhchMO3I+M3feDmK5Z7PN3UmOuXL3zQw
	rYJUvx5zK9eMK/+NA9rm4vr8Hp6n7cC8SAD21/Xe5nQMECzGxcSrmFtPqwz8m/urlhRK
	h6+glFLBwstLKTtn+nyYkX0H9FCe9oNW4dHqRTackSYS7M1Nnx3tEAkCXJOK330XMaw9
	4oN7a66M0QpSIi1c+j2W/IB6zukPR+EgHEx58r9dWo6i8GGeSHi4E4RJSVPX9525lbN/
	5xgw==
X-Gm-Message-State: AIkVDXItvI3Twv3rsvtGljusr0SDtxds7zG5O+u5RD6WDzruI5x98Vp+PNFVZfUXSKiTZw==
X-Received: by 10.98.207.193 with SMTP id b184mr5041916pfg.12.1485969729489;
	Wed, 01 Feb 2017 09:22:09 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:8ce9:48a5:c3c4:adfc])
	by smtp.gmail.com with ESMTPSA id
	m20sm51530254pgd.17.2017.02.01.09.22.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 09:22:09 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1485912129-4012-1-git-send-email-tom.hochstein@nxp.com>
	<CAHiDW_ESMwJK3xaE3sBUYXuhioBa51=QQ+aXudmFM0bSZ_ewuQ@mail.gmail.com>
	<AM5PR0402MB2817DA6F90A494FC671385A6E24D0@AM5PR0402MB2817.eurprd04.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <8b05112c-f6a0-f928-b3bd-decb7250f856@gmail.com>
Date: Wed, 1 Feb 2017 09:22:08 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0402MB2817DA6F90A494FC671385A6E24D0@AM5PR0402MB2817.eurprd04.prod.outlook.com>
Subject: Re: [PATCH v2] xserver-xorg: Fix X server 1.19 crash
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
X-List-Received-Date: Wed, 01 Feb 2017 17:22:11 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

It seems this should be submitted upstream as well.

On 2/1/17 6:41 AM, Tom Hochstein wrote:
> https://lists.yoctoproject.org/pipermail/meta-freescale/2017-January/019980.html
> 
>  
> 
>  
> 
> *From:*Jussi Kukkonen [mailto:jussi.kukkonen@intel.com]
> *Sent:* Wednesday, February 01, 2017 5:38 AM
> *To:* Tom Hochstein <tom.hochstein@nxp.com>
> *Cc:* Patches and discussions about the oe-core layer
> <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH v2] xserver-xorg: Fix X server 1.19 crash
> 
>  
> 
> On 1 February 2017 at 03:22, Tom Hochstein <tom.hochstein@nxp.com
> <mailto:tom.hochstein@nxp.com>> wrote:
> 
>     Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of
>     useSIGIO option:
> 
>     xfree86 SIGIO support is reworked to use internal versions of
>     OsBlockSIGIO and OsReleaseSIGIO
> 
>     The check for useSIGIO is no longer needed.
> 
>  
> 
> Can you explain what the crash is or how to reproduce, I can't figure it
> out from the patch. Link to possible upstream ML discussion is fine as well.
> 
>  
> 
> Thanks,
> 
>   Jussi
> 
> 
> 

