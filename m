Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S35am-0005VA-Le for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 13:58:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21CoFWk015774
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 12:50:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15367-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2012 12:50:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21Co5ok015764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 12:50:06 GMT
Message-ID: <1330606209.31767.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 12:50:09 +0000
In-Reply-To: <8F7AFDB0-51BE-4C02-AAEF-5C82EE7ED671@dominion.thruhere.net>
References: <cover.1330587785.git.sgw@linux.intel.com>
	<8166980a5f0696c1f88bce1fb9bdcff7089690b8.1330587785.git.sgw@linux.intel.com>
	<C2C41049-7169-4851-B07A-9CDDD5A5ED45@dominion.thruhere.net>
	<1330602916.31767.3.camel@ted>
	<8F7AFDB0-51BE-4C02-AAEF-5C82EE7ED671@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libx11-trim/diet: Add RPROVIDES for libx11-dev
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
X-List-Received-Date: Thu, 01 Mar 2012 12:58:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-01 at 13:11 +0100, Koen Kooi wrote:
> Op 1 mrt. 2012, om 12:55 heeft Richard Purdie het volgende geschreven:
> 
> > We have things that depend on libx11-dev, this patch ensures the -trim
> > and -diet versions provide it. This resolves some multiple providers
> > warnings.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > 
> > Koen/Saul: This is how I think we should be fixing the libx11 issues...
> 
> I'm going to say something shockingly out of character: I think the
> trim/diet/normal seperation should be done with DISTRO_FEATURES +
> PACKAGECONFIG. Due to shlib naming the 3 recipes cannot coexist in the
> feeds anyway.

I agree although in this case, PACKAGECONFIG should be enough. 

I propose we fix the immediate problem as per the patch and then look at
converting to PACKAGECONFIG.

Cheers,

Richard



