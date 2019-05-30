Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 27EEF7E3BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID;
	bh=A3/nlLxGVvXa2lJjk6Y+bLM/1Zrk/P3gJmSjYRIz/EQ=; 
	b=Io/C0N+x5JFrECEAlFla/mZfmlPhB6GkmLd1jW1z+qEPIATVk2iQAo4lzekkzqCBcXW1DNTpvb8zTGpIuhSRrXjMu/AFalPPMdYnDhzefR0EXGhIGLf43g0H7laSSqvA/KXvIp8Ziud7K7yE7x17IVe0FvYmB+gCbjbZ3Xvoel0Pyia5APKwCvo9iLFoVkiqhk0SRzDyQwp5pSrhlA6RJAlEC7TAhCh++HgzlDEEcmRebL2/Gepqbz+wt1aplwW6t7+y6bpeOT7G/1ycK3dcuKaNzSyzTqSl2yMK4q2urWq1HOkW6T9/OyYwDLXct0O5jEhpOM1W9x/rmOvuIWRFYQ==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=[192.168.1.41]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hWJTH-0006v0-Di; Thu, 30 May 2019 13:43:47 +0200
Message-ID: <7383a1c593e41083fa4123cd1341b1505373806c.camel@igalia.com>
From: Philippe Normand <philn@igalia.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 12:43:36 +0100
In-Reply-To: <9891ffe8291ac7ac5d5e5be5289436b7290160c4.camel@linuxfoundation.org>
References: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
	<9891ffe8291ac7ac5d5e5be5289436b7290160c4.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH] gnutls: Add a config option to enable the pkcs11 trust store
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
X-List-Received-Date: Thu, 30 May 2019 11:43:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 12:38 +0100, Richard Purdie wrote:
> On Thu, 2019-05-30 at 11:12 +0100, Philippe Normand wrote:
> > Since version 2.60 the glib-networking TLS database relies on
> > GnuTLS's system
> > trust store, so not enabling it leads to TLS errors in applications
> > depending on
> > glib-networking. The raised runtime warning is:
> > 
> > process:500): GLib-Net-WARNING **: 09:14:09.321: Failed to load TLS
> > database: Failed to load system trust store: GnuTLS was not
> > configured with a system trust
> > (app:490): ... TLS Error: TLS certificate  has unknown CA.
> 
> Doesn't this mean we should enable it by default as well?
> 

Yes, I would likely support this decision. :)

I didn't do it in the patch because I don't know all the consequences
of enabling this by default. I would rather defer the decision to the
recipe maintainer.

Philippe


