Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPbIN-0003Kd-E8 for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 16:12:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QE9BF5016138
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 15:09:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15732-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 15:09:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QE91nA016132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 15:09:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306415229.2525.340.camel@phil-desktop>
References: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
	<a24e8ddae8f503f60c9151aab0f35627393ed285.1306401007.git.lianhao.lu@intel.com>
	<1306411147.2525.326.camel@phil-desktop>
	<C10D3FB0CD45994C8A51FEC1227CE22F232DBFB10B@shsmsx502.ccr.corp.intel.com>
	<1306414026.2525.337.camel@phil-desktop>
	<C10D3FB0CD45994C8A51FEC1227CE22F232DBFB114@shsmsx502.ccr.corp.intel.com>
	<1306415229.2525.340.camel@phil-desktop>
Date: Thu, 26 May 2011 15:08:59 +0100
Message-ID: <1306418939.27470.183.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/5] conf/bitbake.conf: Added variables for PR service.
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
X-List-Received-Date: Thu, 26 May 2011 14:12:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 14:07 +0100, Phil Blundell wrote:
> On Thu, 2011-05-26 at 21:02 +0800, Lu, Lianhao wrote:
> > Maybe all the recipes are using the PKGV default value (?= ${PV}, so
> > this just happens to make EXTENDPKGV equal to EXTENDPV. 
> 
> Yes, could be.  The most common situation where PKGV != PV is when
> something like gitpkgv.bbclass is in use, which doesn't happen all that
> often.  The main effect of using the wrong vars would be to make the
> -doc/-dbg/-dev packages of gitpkgv-using recipes uninstallable, and I
> guess I could believe that this might be happening without anybody
> having noticed.
> 
> > In what situation we should use EXTENDPV but not EXTENDPKGV then?
> 
> Good question.  I suspect the answer is probably "none".

For what its worth I agree with your conclusions, it probably is broken
and nobody has noticed.

Lets keep this simpler and just have one variable :)

Cheers,

Richard



