Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2BECA7E9A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:49:55 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d18so3737339wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=vDXIOtkJm73BT/JYk50Q9/Gb3iYluw9ddSn9dqAh1Io=;
	b=gBP/Z+2uN3EJrrh2Vm3oN28OZR/v2LwvcdOou4fF46jYY8thDgVuuwxlpnstsNuXdt
	UtJcX9TlG5g93kov4K7yfVGl0vxBdlKzM7BDE8arZ0A9DuKW/zja+DqhkYBhIE6rDLQ3
	T+v/MZVL2TNHQQ3UV0K6tRVu55kXd3GvNRzcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vDXIOtkJm73BT/JYk50Q9/Gb3iYluw9ddSn9dqAh1Io=;
	b=pqnKTH88ZoSLRFnysBdkg6X8I/ZhA7gjojcLiTSA4EKBJBicEQTeLQfV/E0yvVbIlX
	BvYTOMbTeyvug4qjvhmaBKsv9paPG+nFcYV3oc7xqo96GtFXwvEAGbbwo0k7WCdyIWPy
	W2LRKJPSppcwXfUQfNDxIc/6D6FulWEXtizaB25L955xJ/NIbeebo5W6P9OG5VaYeqVz
	mJuBsA1M0DKltSWI+3SNnwSl3h0kOQ3BEq+7576CcDbwzRJleB7IfwzFUZgNrDiDbYm+
	o2zSKuyZbhbG0bSj1gJQT8nBRywl2Pk4rd/ZiFGayr0smDAin0OyaKioJqBqHW3eQrtO
	FPDw==
X-Gm-Message-State: APjAAAV26PapfxeOnM2C74HH9eV/B9FNKnlIxz0hlLzzfcfrXQ5ODq6W
	9fjqBxGKepMNPP4+AZx0BbpvtA==
X-Google-Smtp-Source: APXvYqwCK6OODw62K/6FO2rsicr0jEjTVD5ENcXvj9Na1P/ygm8eaCaLXJW4Ihiq1YHafE49SA52Hw==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr70164900wrr.5.1560955796813;
	Wed, 19 Jun 2019 07:49:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q20sm38759356wra.36.2019.06.19.07.49.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 07:49:56 -0700 (PDT)
Message-ID: <016a4c641fc8470972bd958308d6022222551b85.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:49:54 +0100
In-Reply-To: <7046486b-5479-5e52-330f-55e90f53f49d@gmail.com>
References: <20190619135643.23332-1-richard.purdie@linuxfoundation.org>
	<20190619135643.23332-3-richard.purdie@linuxfoundation.org>
	<7046486b-5479-5e52-330f-55e90f53f49d@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 3/3] uninative-tarball: Add libxcrypt-compat
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
X-List-Received-Date: Wed, 19 Jun 2019 14:49:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-19 at 07:45 -0700, akuster808 wrote:
> 
> On 6/19/19 6:56 AM, Richard Purdie wrote:
> > This avoids sstate/uninative relocation issues where a binary was
> > built against
> > a system with libcrypt.so.1 or libcrypt.so.2 and then run on the
> > opposite by
> > ensuring both libraries are in uninative.
> Does this affect stable branches?

Yes, we'll need to upgrade to the new uninative release, assuming these
patches test successfully, merge and we make a new release with these
tweaks in.

I was going to send you email about this.

I've cc'd Vineela+Tracy so they know too as I'd planned to give them a
headsup.

[Context is autobuilder failures with this issue which I root caused,
SWAT hasn't filed the bug yet so we're ahead of them!]

Cheers,

Richard


