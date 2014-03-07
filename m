Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 940D46F62B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:46:39 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id i57so4945943yha.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Mar 2014 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=WojnoUNnuCIXv+rS77Q7eATSEEkrKyU2kg7QRps4e7Y=;
	b=r0daforZ6yYVNizLJD+t4TnuASIzXaQEybWHPORhJfxjUPrC0Sk9Qu6ySMUN3cvj6R
	BrF/omWY5MhWqC35aW/iYMMcBCFPGKEuHjm1qQZgeTxEPE37BgNTciffSfB3f102sMew
	li3BFyduB8qP/ggozQY9jOc95OHcmITrF7tMteZBO+nCAFRHCQYeydbgkZ1+VGycrWGN
	0pYDVXYoMpN6pM4uRHJ2eyXqgKyoMOK2dYvD9NQbMq8g0MnbjBP44tIY0doGHxG2p6M3
	IDB/qDE+heQrJ+u7jpLPXzibDAku6qR1ZsMNiRrZC7SGR4izIvuxsbkaizt7gcwnxXY/
	cO4w==
MIME-Version: 1.0
X-Received: by 10.236.130.138 with SMTP id k10mr25345729yhi.31.1394228800301; 
	Fri, 07 Mar 2014 13:46:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 7 Mar 2014 13:46:40 -0800 (PST)
In-Reply-To: <1394203728-12471-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1394203728-12471-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Fri, 7 Mar 2014 18:46:40 -0300
X-Google-Sender-Auth: Sha2CwOBMcCTC7RofwAwVm_-xq0
Message-ID: <CAP9ODKrnP8FURwZt1mrN5Ly3jiPkZ8u7xqP5KvmjsTBiSQf=0w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/uboot-config: ignore doc varflag
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
X-List-Received-Date: Fri, 07 Mar 2014 21:46:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 7, 2014 at 11:48 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> The doc varflag on UBOOT_CONFIG should be ignored by this code; without
> this the recent addition of the UBOOT_CONFIG[doc] to documentation.conf
> causes errors when UBOOT_MACHINE is used.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

