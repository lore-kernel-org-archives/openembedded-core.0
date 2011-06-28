Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbZ6A-0007Wv-0k for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 16:17:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SEDMC4025085
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:13:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24922-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:13:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SEDFjY025079
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:13:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E077597.5090607@gmail.com>
References: <cover.1308592651.git.josh@linux.intel.com>
	<909a6c756247a7a0f68f60a64477d4e8419ca74c.1308593086.git.josh@linux.intel.com>
	<4E068312.5090507@linux.intel.com> <4E069A74.1070402@gmail.com>
	<1309109868.2120.3.camel@scimitar>  <4E077597.5090607@gmail.com>
Date: Tue, 28 Jun 2011 15:13:01 +0100
Message-ID: <1309270381.20015.304.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] sanity: implement network connectivity test
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
X-List-Received-Date: Tue, 28 Jun 2011 14:17:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-06-26 at 11:08 -0700, Khem Raj wrote:
> On 06/26/2011 10:37 AM, Joshua Lock wrote:
> > On Sat, 2011-06-25 at 19:33 -0700, Khem Raj wrote:
> >> On 6/25/2011 5:53 PM, Saul Wold wrote:
> >>>> + # If no URI's set, fallback to some default ones we know of
> >>>> + if len(test_uris) == 0:
> >>>> + test_uris = ["http://yoctoproject.org/about",
> >>>> +
> >>>> "https://eula-downloads.yoctoproject.org/crownbay/crownbay-bernard-5.0.0",
> >>>>
> >>>> + "git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=HEAD"]
> >>>> + retval = ""
> >>
> >> imo this change is yocto specific doesnt belong to core
> >
> > Are you objecting to the feature (testing whether the fetchers can work
> > on a newly configured tmpdir) or the implementation (using
> > yoctoproject.org URI's)?
> 
> the latter

I'd just point out that this is a test URL and turning off a load of
checks designed to improve usability just based on the test url seems a
little counter-intuitive to improving new user usability of OE.

Cheers,

Richard







