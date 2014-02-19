Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5316E7D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 11:37:15 +0000 (UTC)
Received: from ad.chargestorm.se (2.71.239.117) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Wed, 19 Feb 2014 12:37:13 +0100
Date: Wed, 19 Feb 2014 12:37:06 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20140219113705.GA9147@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1392807290.14081.267.camel@ted>
 <20140219112630.GC3854@jama>
MIME-Version: 1.0
In-Reply-To: <20140219112630.GC3854@jama>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: RFC: systemd version - release or git?
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
X-List-Received-Date: Wed, 19 Feb 2014 11:37:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Martin Jansa <martin.jansa@gmail.com> [140219 12:26]:
> On Wed, Feb 19, 2014 at 10:54:50AM +0000, Richard Purdie wrote:
> > Any objections to defaulting to a git version?

> I think we can wait few more days for new release:
> https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg16738.html

I was just about to reply with the same e-mail link...

> but otherwise I don't have strong objections for switching to git
> version temporary (if it really makes QA test results better).

Otherwise, I don't have any strong feelings against a git version. Not
as long as it works as it should.

One objection might be that it's easier for someone to update it to a
strange version in between the regular releases. As long as we try to
avoid making a release where systemd is too far of from a regular
release, that shouldn't be any issue, though.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

