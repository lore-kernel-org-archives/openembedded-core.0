Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RWAMX-0007ba-G6 for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 18:23:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1HHGD5018240
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 17:17:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18115-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 17:17:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1HHAvg018234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 17:17:11 GMT
Message-ID: <1322759839.17484.141.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 17:17:19 +0000
In-Reply-To: <1322758679.26081.242.camel@phil-desktop>
References: <cover.1322594901.git.nitin.a.kamble@intel.com>
	<48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
	<1322598026.3077.11.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E3D9E7EE@orsmsx504.amr.corp.intel.com>
	<1322604347.3077.18.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E3D9E9B9@orsmsx504.amr.corp.intel.com>
	<1322758679.26081.242.camel@phil-desktop>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Thu, 01 Dec 2011 17:23:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 16:57 +0000, Phil Blundell wrote:
> On Tue, 2011-11-29 at 14:51 -0800, Kamble, Nitin A wrote:
> > Thank you for the explanation. BTW where can I find official rules about signed-off-by line
> 
> The "Signed-off-by" idiom originated with the kernel people and
> Documentation/SubmittingPatches in the linux source tree contains a
> fairly good description of what it means to them.
> 
> I'm not sure that there are any official rules about its use in OE apart
> from what's in the Commit Patch Message Guidelines (see the wiki).

The yocto docs do mention what the specific meaning of the line is.
Nobody should be adding that line unless they understand what it means.
Its based off the kernel's model.

http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#how-to-submit-a-change

Cheers,

Richard



