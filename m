Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 069F56C1CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 23:01:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m3so975050wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 16:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=69JzGnNgrC3t+yagXWqHyOXXdRclDd4Gt6K4USzFEkM=;
	b=elQNoAJ/rxc24bZAhFQTN25CClvucfC4st5AMWETPift3/Y5X/Xp/8DFaNQ6D+9fPD
	A9TUOWqIfXyafM/usCHvKDs7B2ShjIRbQgKlouxxDtiBMWkLKpfTf/P2IKfylPaJjBcF
	slGBM035Xcc48GuCoqtG54SLrj7DzL4c2+/7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=69JzGnNgrC3t+yagXWqHyOXXdRclDd4Gt6K4USzFEkM=;
	b=XXuPjWH1dVWxKaAzDfpW3wwUx5Bky99OycD3CnlR+YLINfnamT1HExF+wM8C38daWE
	V2wHs7wm4IOklGviAEcx03x6qc6qzF40jp5zjSSE2IXC5j0ScOqRbDi6SIjLLxRcdRzT
	ohCCIt6y4uISQVoD7SFOrzbEAqWOeFfAbvH3Ax79dcUe9F2hOQwM+p7YV6Ge2QTdO8cC
	+r/2IURFCIG5Jd3JpU89wMzcIXEiSEhnB7fa6RArlaMk0+88Qk65IfscF97krtnexN5w
	ssUrbm+Q6Pad1eP69cl496kuqulkiYGyBGojiixjABjPZ9+LyYPcgPttSSdHyFdsCkrK
	a2iA==
X-Gm-Message-State: APjAAAXF9CVG2l2I7vH1omveDNYRjtvUtMc8kyVIU0hTwDn9gxb7JbFY
	BXa7oqHCQNOJQHGTezV39PBFMQ==
X-Google-Smtp-Source: APXvYqyFapjeypxxsEpoErqXLlqnIcPu3Am+ldBeZOeoEZS/iAsIcZH9FFdBT93hHNd+6PRZeGC/vg==
X-Received: by 2002:adf:e9c6:: with SMTP id l6mr10852559wrn.216.1560985281829; 
	Wed, 19 Jun 2019 16:01:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s9sm1680840wmc.1.2019.06.19.16.01.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 16:01:21 -0700 (PDT)
Message-ID: <1a099e3f61a1ac6bbdc282390ef5099335d26a8b.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Slater, Joseph" <joe.slater@windriver.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2019 00:01:18 +0100
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84FA80EEAD@ALA-MBD.corp.ad.wrs.com>
References: <20190619212647.23685-1-joe.slater@windriver.com>
	, <4613a7cbefe6f6a342f33e129834e5cc10f30fc1.camel@linuxfoundation.org>
	,<007BD92917A2324FA403BCF9A464CF84FA80EE62@ALA-MBD.corp.ad.wrs.com>
	<007BD92917A2324FA403BCF9A464CF84FA80EEAD@ALA-MBD.corp.ad.wrs.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] parted: change device manager check in ptest
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
X-List-Received-Date: Wed, 19 Jun 2019 23:01:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-19 at 22:56 +0000, Slater, Joseph wrote:
> Hm, I searched for parted development, and it looks like the last
> release was five years ago.  We could have a long wait for this ptest
> fix.

They do still appear to be merging patches though:

http://git.savannah.gnu.org/cgit/parted.git/log/

so at least worth sending and then we can mark it as Submitted.

Cheers,

Richard


