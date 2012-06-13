Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SeoED-0004Fg-Tl for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 16:07:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5DDukE4021756
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 14:56:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21571-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 14:56:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5DDudS3021750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 14:56:40 +0100
Message-ID: <1339595798.8065.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jun 2012 14:56:38 +0100
In-Reply-To: <1339586425-702-1-git-send-email-laurentiu.palcu@intel.com>
References: <1339586425-702-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v3 0/2] Bug fixes
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
X-List-Received-Date: Wed, 13 Jun 2012 14:07:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-13 at 14:20 +0300, Laurentiu Palcu wrote:
> Version 3 - bump connman PR. Thanks Ross for reminding me! :)
> 
> Version 2 adds comments in connman.inc and xserver-nodm-init.bb to inform
> that xuser's USERADD_PARAMs must be in sync, as suggested by Ross.
> 
> This patchset contains two bug fixes for:
> 	- Yocto #2467
> 	- Yocto #1465
> 
> Laurentiu Palcu (2):
>   sanity.bbclass: warn the user if BBPATH contains wrong entries
>   connman: make useradd parameters consistent with rootless X

Merged to master, thanks.

Richard



