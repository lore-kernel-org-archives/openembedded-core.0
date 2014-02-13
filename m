Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9E76E81A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 11:39:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1DBcveU026195; Thu, 13 Feb 2014 11:38:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id m-vHgEopGEDP; Thu, 13 Feb 2014 11:38:57 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1DBcrJG026185
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 13 Feb 2014 11:38:55 GMT
Message-ID: <1392291528.14081.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 13 Feb 2014 11:38:48 +0000
In-Reply-To: <20140212154001.GG10078@lpalcu-linux>
References: <cover.1392215552.git.laurentiu.palcu@intel.com>
	<f1d4b1de74f2c69b444ed50977263245440ed071.1392215552.git.laurentiu.palcu@intel.com>
	<1392216272.14769.270.camel@phil-desktop.brightsign>
	<20140212145552.GF10078@lpalcu-linux>
	<1392217651.14769.271.camel@phil-desktop.brightsign>
	<20140212154001.GG10078@lpalcu-linux>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] (image|rootfs_ipk).bbclass, rootfs.py: ipk multilib fixes
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
X-List-Received-Date: Thu, 13 Feb 2014 11:39:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-12 at 17:40 +0200, Laurentiu Palcu wrote:
> On Wed, Feb 12, 2014 at 03:07:31PM +0000, Phil Blundell wrote:
> > On Wed, 2014-02-12 at 16:55 +0200, Laurentiu Palcu wrote:
> > > * /usr/lib/opkg is where the alternatives go;
> > 
> > Isn't that a bug?
> I'm far from being an expert in opkg or update-alternatives, but,
> looking in /usr/bin/update-alternatives I can see:
> 
> # admin dir
> ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives"
> 
> Isn't that expected since the u-a provider is opkg-utils recipe?

Its certainly desirable to have one set of alternatives files on a
multilib system, not two. The variables/paths could probably do with
being better however I've prefer not to trigger autobuilder failures on
this until that gets resolved so I did take this.

Cheers,

Richard




