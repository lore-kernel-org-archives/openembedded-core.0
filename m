Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 835C46F902
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 12:56:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2ICuHwC025857; Tue, 18 Mar 2014 12:56:17 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oBQ28FFM2gMj; Tue, 18 Mar 2014 12:56:17 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2ICuBen025848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 18 Mar 2014 12:56:12 GMT
Message-ID: <1395147366.3808.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 18 Mar 2014 12:56:06 +0000
In-Reply-To: <23BFBADE-120F-4DBC-AABF-A9F802B8222C@dominion.thruhere.net>
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
	<23BFBADE-120F-4DBC-AABF-A9F802B8222C@dominion.thruhere.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] linaro-pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Tue, 18 Mar 2014 12:56:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-03-18 at 13:29 +0100, Koen Kooi wrote:
> Op 18 mrt. 2014, om 12:56 heeft Chase Maupin <Chase.Maupin@ti.com> het volgende geschreven:
> 
> > * The power management test utilities from Linaro can be used
> >  to test multiple PM features such as cpufreq, cpuidle, thermal
> >  control and suspend operations.
> > * These utilities are not platform specific and can be used by
> >  a broader base of users.
> 
> PN should me 'pm-qa' or 'pm-qa-utils'.

Agreed.

>  And it would fit better in meta-oe since it's not 'core' enough for oe-core.

I'm open to discussion on that. Certainly if there is just one user,
meta-oe would be appropriate. If these are generically useful and the
plan is we integrate these into the larger automated test picture,
oe-core may make sense.

So if there a bigger picture plan here? Would these make sense in the
broader picture?

Cheers,

Richard


