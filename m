Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPJ8y-0004uy-DX for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 21:53:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41Ji9Nu016659
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 20:44:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16443-02 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2012 20:44:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41Ji1eT016653
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 20:44:03 +0100
Message-ID: <1335901444.7415.129.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 May 2012 20:44:04 +0100
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0309FA16@ORSMSX106.amr.corp.intel.com>
References: <cover.1335480719.git.nitin.a.kamble@intel.com>
	<385b9b6d43ea3d98d355edc50989d2e0ab488cd7.1335480719.git.nitin.a.kamble@intel.com>
	<4F9ABCEC.60403@linux.intel.com> <1335563534.7232.0.camel@ted>
	<ADD6A3980E8C39419A432FF422031B4C0309FA16@ORSMSX106.amr.corp.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] eglibc: package mtrace separately
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
X-List-Received-Date: Tue, 01 May 2012 19:53:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-30 at 15:14 +0000, Kamble, Nitin A wrote:
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Richard Purdie
> > Sent: Friday, April 27, 2012 2:52 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 1/2] eglibc: package mtrace separately
> > 
> > On Fri, 2012-04-27 at 08:36 -0700, Saul Wold wrote:
> > > On 04/26/2012 03:53 PM, nitin.a.kamble@intel.com wrote:
> > > > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> > > >
> > > > And install it only for nativesdk images
> > > >
> > > I think this needs to be in the -sdk images also, not just nativesdk.
> > 
> > Why? Do we need mtrace in the nativesdk?
> > 
> > I'm not sure why we're adding this.
> > 
> This was in response to this bug:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2374
> 
> If I understand it correctly, Saul wanted to package mtrace separately
> to avoid the perl dependency issue on fedora 17.

Right, but lets just not install the mtrace package unless people want
it.

Cheers,

Richard



