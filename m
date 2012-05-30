Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZhlV-00049x-DU for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:12:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UC2J24021807
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:02:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21338-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:02:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UC2As7021801
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 13:02:11 +0100
Message-ID: <1338379329.20169.134.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 13:02:09 +0100
In-Reply-To: <1338184080-18892-1-git-send-email-laurentiu.palcu@intel.com>
References: <1338184080-18892-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Package updates: fontconfig, fontsproto, libpciaccess
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
X-List-Received-Date: Wed, 30 May 2012 12:12:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-28 at 08:47 +0300, Laurentiu Palcu wrote:
> This patchset includes some leftovers from a previous commit that weren't merged because there were some
> suspicions that some packages (especially libpciaccess) might have some problems compiling/running on some
> architectures.
> 
> This is what I tested:
> - that the packages compile fine on x86/ppc/arm/mips;
> - basic functionality in qemu for all architectures;
> 
> Laurentiu Palcu (3):
>   fontconfig: upgrade to 2.9.0
>   fontsproto: upgrade to 2.1.2
>   libpciaccess: upgrade to 0.13.1

Merged to master, thanks.

Richard



