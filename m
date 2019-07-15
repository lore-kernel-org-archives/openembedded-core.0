Return-Path: <matthias.schiffer@ew.tq-group.com>
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id 567CC7ED6F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 09:53:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.62,493,1554760800"; 
   d="scan'208";a="8199941"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 15 Jul 2019 11:53:51 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Mon, 15 Jul 2019 11:53:51 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Mon, 15 Jul 2019 11:53:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1563184431; x=1594720431;
	h=message-id:subject:from:to:date:in-reply-to:references:
	mime-version:content-transfer-encoding;
	bh=ND0Xqan7GJnwcsKXgJe5AUoCdp2SU0FpTy9b1/5ag6c=;
	b=m+6KFcV2/MboW++umBiFAEgF5viND8bw1fnAghtLEsA0PX9S/i8YD+cU
	gIl2XEl/P/4orLMCZVXH/ipEOX3q0s+mbyvs5jrs3EGD1G5JJAJlCvBKc
	P+3dWFnHHB+MceeE83YmF3PkaLLoQWAiW/ErTmMqJlu1fwkCGdflO12iP
	Ccz4354aQR3v+PC4sATGymXvon9hx45huylOLP1d87B5Ro8x6S3mPrOTt
	RW08UDrYJT1iuN1h0iXgC4JoLMIcglci7Ufo9Zbd3Xv334fYRWTGYN4uo
	qsKDn6DpdN7sMURcVFaZqI68/bsT9SNFI/n8DRdmNKIF8v6zaz9JCTujp w==;
X-IronPort-AV: E=Sophos;i="5.62,493,1554760800"; 
   d="scan'208";a="8199940"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 15 Jul 2019 11:53:51 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id E5499280074
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 11:54:30 +0200 (CEST)
Message-ID: <75459a751fccd43086ea4917ae2b542092cac03e.camel@ew.tq-group.com>
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 11:53:51 +0200
In-Reply-To: <714432f19e29fc660170d05ff3907ff2e40b1e95.camel@ew.tq-group.com>
References: <20190710121353.32717-1-matthias.schiffer@ew.tq-group.com>
	<20190710123132.2332.61175@do>
	<714432f19e29fc660170d05ff3907ff2e40b1e95.camel@ew.tq-group.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHN5c3RlbWQ6IGJhY2twb3J0IHBhdGNoIHRvIGZpeCBzeXNjdGwgd2FybmluZyBvbiBib290?=
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
X-List-Received-Date: Mon, 15 Jul 2019 09:53:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-07-10 at 14:40 +0200, Matthias Schiffer wrote:
> On Wed, 2019-07-10 at 12:31 +0000, Patchwork wrote:
> > * Issue             Series cannot be parsed correctly due to
> > malformed diff lines [test_mbox_format] 
> >   Suggested fix    Create the series again using git-format-patch
> > and
> > ensure it can be applied using git am
> >   Diff line        Hunk is shorter than expected
> > 
> > * Issue             Series does not apply on top of target branch
> > [test_series_merge_on_head] 
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at 4cbb7392c7)
> 
> I'm not sure what is going on here, the patch applies fine for me.
> 
> Is it possible that the patchtest stumbles over unicode characters in
> the added patch file? I don't see how that could be avoided, as the
> patch touches a line where an emoji was used in a comment...
> 
> Kind regards,
> Matthias

Ah, the issue is patchwork, not patchtest - the mbox download is cut
off at the non-ASCII character. Should I try resending the patch with
something like --transfer-encoding=quoted-printable ?



