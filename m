Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYfxP-00078c-58 for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:32:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8FPU7v029574;
	Thu, 8 Dec 2011 15:25:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29151-06; Thu,  8 Dec 2011 15:25:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8FPNgf029568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 8 Dec 2011 15:25:24 GMT
Message-ID: <1323357934.5309.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Beth Flanagan <elizabeth.flanagan@intel.com>
Date: Thu, 08 Dec 2011 15:25:34 +0000
In-Reply-To: <cover.1323286080.git.elizabeth.flanagan@intel.com>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] License Consolidated Pull
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
X-List-Received-Date: Thu, 08 Dec 2011 15:32:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 11:34 -0800, Beth Flanagan wrote:
> These are the changes from the RFCs Chris Larson and I sent out this
> weekend merged into one branch along with a gettext minimal fix from
> RP. I've trimmed the diffs in the PULL down some as there are a number 
> of license text diffs that cause send-patch-request to choke.
> 
> 
> The following changes since commit f17e0ae38b2e6c4cbe7f0f9d76c3e1a386335fd1:
> 
>   conf/machine: Don't poke around providers which aren't machine specific/safe (2011-12-06 22:47:09 +0000)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib eflanagan/consolidated_license
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/consolidated_license
> 
> Christopher Larson (4):
>   oe.test_types: move into an oe.tests package
>   license: split license parsing into oe.license
>   oe.license: add license flattening code
>   Add copyleft compliance class
> 
> Elizabeth Flanagan (3):
>   [YOCTO #1776] license: manifest and license path
>   OECore license fixes: meta/*
>   package.bbclass: Adding license collection
> 
> Richard Purdie (1):
>   gettext-minimal-native: Fix License

Merged to master, thanks.

I appreciate there is some feedback but I think Chris' plan of building
upon this set of commits is a good one.

Cheers,

Richard



