Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SkZd7-0003l8-4I for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 13:44:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TBXw3Z001791;
	Fri, 29 Jun 2012 12:33:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31331-08; Fri, 29 Jun 2012 12:33:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TBXlRZ001785
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 29 Jun 2012 12:33:48 +0100
Message-ID: <1340969629.23146.144.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 12:33:49 +0100
In-Reply-To: <1515296.CLmyHfUsyt@helios>
References: <cover.1340908084.git.paul.eggleton@linux.intel.com>
	<1fb664d76463830cf80997e2e13891adfff7a6eb.1340908084.git.paul.eggleton@linux.intel.com>
	<4FED1743.4050203@gmail.com> <1515296.CLmyHfUsyt@helios>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] apr: fix incorrect size of pid_t
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
X-List-Received-Date: Fri, 29 Jun 2012 11:44:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-29 at 11:50 +0100, Paul Eggleton wrote:
> On Thursday 28 June 2012 19:47:31 Khem Raj wrote:
> > I think this may not be correct thing for 64bit targets. You are
> > better of adding this to appropriate site files.
> 
> pid_t is apparently always an int on Linux and our siteinfo files state that 
> ac_cv_sizeof_int is 4 for every target. Nevertheless, if we see the need to 
> define ac_cv_sizeof_int even though the value isn't currently different 
> anywhere, it seems at least consistent to set ac_cv_sizeof_pid_t there as 
> well.
> 
> However, I can't help feeling that these files are a bit of a mess and it's not 
> totally clear to me where I should be putting this value. Should it go in 
> common-linux? Or do I have to add it to the specific site file for every arch?

common-linux sounds like the right place to me.

Cheers,

Richard



