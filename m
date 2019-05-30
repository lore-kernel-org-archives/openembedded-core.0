Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id A776F7E3FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID;
	bh=4bJIUOvAgb/H0uD1sDm29k5QRw3Vqw/qwb+v4IYMFR8=; 
	b=cpuDnTnTf6z1twl9O4+NJTf0gKZ3oN1614uhY/dxTpfoxYiNTG1k62m5M42sMTYQx7WkZDL4349ClgbPnq6Vjojg9OrVesCPeeB/pWqpR9XFW6bxXUluAr46Xs5nwqV2H+G5mVKcOzuJl1c45QCG2xpVgjDZhLx1hY1MIVfsLWD8EBxwzgYUBdF9cmX5iPg0+3/awd/xeu89SSCxnirr2AlYODr26d9Rc+caFGCJ6jqRPFZksUCfi0C1DcbcFgvs7MbAHJnrRUBhhk2ESC4QX4NpueIptN5eakEQ5K7Su9QtNYsE3fliHJS6Ymdw0Oex6suEgZu1JNvQnTAvd6bgig==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=[192.168.1.41]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hWJnN-0003oy-2J; Thu, 30 May 2019 14:04:33 +0200
Message-ID: <0b3f3478c903d888de0a6142dbf336632e46488d.camel@igalia.com>
From: Philippe Normand <philn@igalia.com>
To: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 13:04:23 +0100
In-Reply-To: <8137b5badadbc46db18fc7b4bafd0734f90586ee.camel@linuxfoundation.org>
References: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
	<9891ffe8291ac7ac5d5e5be5289436b7290160c4.camel@linuxfoundation.org>
	<7383a1c593e41083fa4123cd1341b1505373806c.camel@igalia.com>
	<8137b5badadbc46db18fc7b4bafd0734f90586ee.camel@linuxfoundation.org>
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
X-List-Received-Date: Thu, 30 May 2019 12:04:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 12:46 +0100, richard.purdie@linuxfoundation.org
wrote:
> On Thu, 2019-05-30 at 12:43 +0100, Philippe Normand wrote:
> > On Thu, 2019-05-30 at 12:38 +0100, Richard Purdie wrote:
> > > On Thu, 2019-05-30 at 11:12 +0100, Philippe Normand wrote:
> > > > Since version 2.60 the glib-networking TLS database relies on
> > > > GnuTLS's system
> > > > trust store, so not enabling it leads to TLS errors in
> > > > applications
> > > > depending on
> > > > glib-networking. The raised runtime warning is:
> > > > 
> > > > process:500): GLib-Net-WARNING **: 09:14:09.321: Failed to load
> > > > TLS
> > > > database: Failed to load system trust store: GnuTLS was not
> > > > configured with a system trust
> > > > (app:490): ... TLS Error: TLS certificate  has unknown CA.
> > > 
> > > Doesn't this mean we should enable it by default as well?
> > > 
> > 
> > Yes, I would likely support this decision. :)
> > 
> > I didn't do it in the patch because I don't know all the
> > consequences
> > of enabling this by default. I would rather defer the decision to
> > the
> > recipe maintainer.
> 
> Given we're seeing issues without it enabled, can you send a v2 with
> it
> being enabled by default please? 
> 
> We try not to do that where it adds dependencies we don't need but it
> seems to make sense here to me (I can take repsonsibilty for asking
> for
> it!).
> 

Alright, I'll update the patch then. Enabling this new option requires
the p11-kit option to be enabled as well though.

Philippe


