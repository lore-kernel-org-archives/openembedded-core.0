Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7292F7622A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 20:52:28 +0000 (UTC)
Received: by pachj5 with SMTP id hj5so11164470pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=GHlgc0hM3ec4AQ/UIX34V+06C6jYfnLRLqQ7uZvOLhA=;
	b=WN1mjGwi8doydummooCJI1Kt6CuhEfyrXDcO6J2lQZaBPWX+UhpsLSStV3VzQOePVz
	A3XV6FxzpTYcawxxnmYcpqjYIxtDxsedjt6l/hL0Nu+Rp+idNuBUhIeYRejDeDJc0ssi
	VM0RyCoPN7QZ3Q5X/A5Q2r3Fp4QAqDQW+W2mvz5nZBvKt/CpzsWBgBV00Aobv06kwHGD
	nVLsy4uGdbcTpg6IpTd0HsKfw0aF8lh0AZtGDWoX78qG6Uq/bDIJvDPtKF8eWHH3Gx+w
	Nn3KL59wjvdNIHBZZwVxpGiE854ZgmXGtDN1P+96mVn48LUTLhVRszFHPTC9SJBlbLB2
	yzZw==
X-Gm-Message-State: ALoCoQnyOUu34TYtcTBkM6qzSxNEwg/5OJjMlLCYvPbW/IqhNpbs5RSMuktk5hCTxF8wUpKLuwLh
X-Received: by 10.66.120.201 with SMTP id le9mr96632933pab.142.1438203149257; 
	Wed, 29 Jul 2015 13:52:29 -0700 (PDT)
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com.
	[209.85.220.47]) by smtp.gmail.com with ESMTPSA id
	bf5sm42656050pad.43.2015.07.29.13.52.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 13:52:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacan13 with SMTP id an13so11436560pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:52:26 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.251.135 with SMTP id zk7mr97153163pac.80.1438203146733;
	Wed, 29 Jul 2015 13:52:26 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 13:52:26 -0700 (PDT)
In-Reply-To: <1438202978.10150.16.camel@tkkaskin-mobl3.ger.corp.intel.com>
References: <1438213787-19374-1-git-send-email-b54851@freescale.com>
	<1438213787-19374-2-git-send-email-b54851@freescale.com>
	<1438202978.10150.16.camel@tkkaskin-mobl3.ger.corp.intel.com>
Date: Wed, 29 Jul 2015 17:52:26 -0300
Message-ID: <CAP9ODKq-wuT9AAYiw-gJ3sW8ysKLOs-qM7bhVED76TcSrOFfhg@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v4] pulseaudio: revert commit 42156d2b5ac797e5f28f8d0d38b691053f3f6fc7
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
X-List-Received-Date: Wed, 29 Jul 2015 20:52:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 5:49 PM, Tanu Kaskinen
<tanu.kaskinen@linux.intel.com> wrote:
> This is safe to apply, but I'd like to understand why you think this is
> needed. The commit message says that without this patch, "pulseaudio
> can't be opened in yocto". PulseAudio works fine in core-image-sato at
> least, so what is different in your setup? Have you disabled
> autospawning for some reason?

I prefer to not divert from upstream without a reasoning for it. This
is what needs to be clarified.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

