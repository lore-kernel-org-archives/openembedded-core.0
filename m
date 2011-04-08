Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q8BbF-0003gC-MB for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 15:19:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p38DHaS5007163
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Apr 2011 14:17:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06904-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2011 14:17:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p38DHQDN007157
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Apr 2011 14:17:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB68A77210FCB@shsmsx502.ccr.corp.intel.com>
References: <cover.1302256139.git.dexuan.cui@intel.com>
	<1865303E0DED764181A9D882DEF65FB68A77210FCB@shsmsx502.ccr.corp.intel.com>
Date: Fri, 08 Apr 2011 06:17:23 -0700
Message-ID: <1302268643.22904.121.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] PULL: fixes to bug 961, 964
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
X-List-Received-Date: Fri, 08 Apr 2011 13:19:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-08 at 18:04 +0800, Cui, Dexuan wrote:
> Dexuan Cui wrote:
> > From: Dexuan Cui <dexuan.cui@intel.com>
> > 
> > [YOCTO #964]:
> > A recent commit 25a6e5f9(sstate: use only unique set of SSTATETASK)
> > breaks the ordered mapping between SSTATETASKS and SSTATETASKNAMES.
> > As a result, in sstate_cleanall, the line
> > taskname = tasks[namemap.index(name)]
> > gets an incorrect result, and "bitbake -c cleanall" doesn't really
> > remove the files populalted by do_populate_sysroot.
> > 
> > BTW: the bernard branch doesn't need this fix since commit 25a6e5f9
> > wasn't pulled into it.
> > 
> > 
> > 
> > [YOCTO #961]:
> > lsbsetup: Fix LIC_FILE_CHKSUM
> > We need to pull this fix asap since nightly's lsb builds have been
> > blocked by this for 2 days.
> 
> Sorry, I didn't notice Saul had sent out a fix for this (bug #961). :-)
> Please ignore mine. 

I've pulled the sstate patch into master, thanks!

Richard



