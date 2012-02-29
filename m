Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1S2jfs-0004H8-R1
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 14:34:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1TDQ4Qw030493
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 13:26:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30161-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 13:26:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1TDPvmN030487
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 13:25:58 GMT
Message-ID: <1330521961.24508.43.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 Feb 2012 13:26:01 +0000
In-Reply-To: <CAP9ODKpPUtNpV0Wc91kvehnf=1OpYtKdJ411-+kV8Z=GADOKiQ@mail.gmail.com>
References: <cover.1330520324.git.paul.eggleton@linux.intel.com>
	<9f75e5f43a30ed6e154f299ead955588c98de5c7.1330520324.git.paul.eggleton@linux.intel.com>
	<CAP9ODKpPUtNpV0Wc91kvehnf=1OpYtKdJ411-+kV8Z=GADOKiQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] More quoting fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Feb 2012 13:34:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-29 at 10:19 -0300, Otavio Salvador wrote:
> On Wed, Feb 29, 2012 at 09:59, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > -export VERBOSE=1
> > +export VERBOSE="1"
> 
> I fully agree with the change but here it doesn't raise a parser
> error. Isn't it expected to happen?

No. I added something to bitbake a short while ago and these are parser
errors now!

Cheers,

Richard




