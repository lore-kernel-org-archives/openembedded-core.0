Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RzpOd-00023v-92 for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 14:04:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LCuOCM013205
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 12:56:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11575-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 12:56:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LCuF2Q013199
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 12:56:16 GMT
Message-ID: <1329828974.15011.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2012 12:56:14 +0000
In-Reply-To: <CAMvUbCwy5UL3YWXS=2SkeKff2WDQE9EX7-CGUv9s5SH+9uSK1g@mail.gmail.com>
References: <CAMvUbCwy5UL3YWXS=2SkeKff2WDQE9EX7-CGUv9s5SH+9uSK1g@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bitbake parsing of IMAGE_INSTALL += # tslib mtd-utils" extremely user unfriendly.
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
X-List-Received-Date: Tue, 21 Feb 2012 13:04:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-02-20 at 23:00 +0100, Leon Woestenberg wrote:
> Hello all,
> 
> bitbake can really braindump on us when we insert typo's.  The result
> of bitbake 1.14 parsing this one wasn't pleasant:
> 
> IMAGE_INSTALL += # tslib mtd-utils"
> 
> (Yes, it's a typo. No, I wouldn't expect bitbake to give me that much
> output :) )

What was the output? (I realise I can find out)

With usability issues like this, opening a bug in
bugzilla.yoctoproject.org is a good idea, particularly as we've been
focusing on cleaning up this kind of problem. Reporting them with a
known reproducible test case helps a lot as when you're looking to try
and fix these things, you need a good set of reproducers. 

As a quick plug for the work that's been done already, we've now worked
through many of the issues that were reported so it is worth taking the
time to report them! :)

Cheers,

Richard





