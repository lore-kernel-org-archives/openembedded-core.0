Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiqOS-00068v-BH for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 17:42:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05GYwAe006715
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 16:34:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05894-10 for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2012 16:34:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05GYoNd006709
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 16:34:51 GMT
Message-ID: <1325781290.20759.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jan 2012 16:34:50 +0000
In-Reply-To: <20120104172828.GA32676@sakrah.homelinux.org>
References: <1324044340-21898-1-git-send-email-eric@eukrea.com>
	<4EF19E06.6030004@eukrea.com>
	<C6510F6D410BB64A8C15398EDC6B847C2401D155@ORSMSX102.amr.corp.intel.com>
	<4EF266E0.8040302@eukrea.com>
	<C6510F6D410BB64A8C15398EDC6B847C2401D1A6@ORSMSX102.amr.corp.intel.com>
	<20120104172828.GA32676@sakrah.homelinux.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gdb-cross-canadian: build gdb with	python support
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
X-List-Received-Date: Thu, 05 Jan 2012 16:42:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 09:28 -0800, Khem Raj wrote:
> On (21/12/11 23:52), Zhang, Jessica wrote:
> > Hi Eric,
> > 
> > Yes, understand the usage and advantage, but still think apply the patch in meta-oe first then if later on there's strong demand for this feature we can pull into oe-core is the right approach.
> > 
> 
> what are your reasons for it to not be in oe-core/master ?
> python support is useful in gdb even on commandline
> Or are you aware of any bugs that will destabilize gdb ?

I think there are going to be two groups of people on this, the people
who want it and the people who don't. How about a PACKAGECONFIG option
for this?

I suspect over time the request will come in for gdb itself too which is
why I'm thinking ahead to that...

Cheers,

Richard



