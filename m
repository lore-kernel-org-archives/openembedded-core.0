Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id E271C6FFC4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 09:35:18 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 17 Jun 2014 11:35:16 +0200
Date: Tue, 17 Jun 2014 11:35:04 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20140617093504.GC6479@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <5399151E.3050306@linux.intel.com>
	<1402562639-60930-1-git-send-email-y>
	<1402562639-60930-2-git-send-email-y>
	<1402690716.11584.62.camel@empanada>
	<A1661D2DDD942248A02617DE63569A0125CBF373@SESTOEX04.enea.se>
MIME-Version: 1.0
In-Reply-To: <A1661D2DDD942248A02617DE63569A0125CBF373@SESTOEX04.enea.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCHv2 1/2] Add wic support to generate rootfs image for uboot
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
X-List-Received-Date: Tue, 17 Jun 2014 09:35:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Adrian Calianu <Adrian.Calianu@enea.com> [140616 15:19]:

> > As for the patch itself, it's huge and needs to be broken up into
> > smaller pieces.  In fact, it seems to be a combination of two
> > completely separate things at least - a new mechanism for creating a
> > rootfs from packages, and a new plugin for creating uboot partitions
> > (which just happens to use the output from the new packaging step.
> > So at minimum I think you need to break it up along the lines of
> > that functionality, and it would be good to break it up even further
> > e.g. 'Add a new do_pkg interface hook', 'Add an implementation of
> > do_pkg for ipk', 'Add a new source plugin for uboot partitions',
> > 'Add a new canned wks for a default uboot image', etc.  The more you
> > can break it up into logical chunks without going overboard, the
> > easier it is to review and apply/revert.
> [Adrian Calianu] I agree that there are two main features but the
> reason of not break it in small pieces now was to provide a fully
> functional patch for community to test it and be able to provide a
> feedback for this patch, since those features cannot be tested
> independently now.  So, is it acceptable to provide patches that
> cannot be tested?

Well, if you split this into two or more patches, and you then submit
this as a patch series, then I don't see how they couldn't be tested?

Remember, no one forces you to send single patches.

So I'd say, try to split them up. That'll make them easier to review,
comment on, and to test.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

