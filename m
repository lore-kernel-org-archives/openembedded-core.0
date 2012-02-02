Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RsyDj-0004OW-Ro for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 16:05:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q12EvCjb007850
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2012 14:57:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07784-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2012 14:57:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q12Ev2TB007843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2012 14:57:03 GMT
Message-ID: <1328194627.13744.188.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Feb 2012 14:57:07 +0000
In-Reply-To: <cover.1328127940.git.otavio@ossystems.com.br>
References: <cover.1328127940.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Pending patches in O.S. Systems tree
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
X-List-Received-Date: Thu, 02 Feb 2012 15:05:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-01 at 20:27 +0000, Otavio Salvador wrote:
> We changed the udev patch taking in account the suggestions done by
> Richard and also made a cuple of more fixes in meanwhile. The
> gitpkgv.bbclass patch has been dropped for now as it is in discussion
> on mailing list.
> 
> The following changes since commit d7b13cd42ab8d5f44f97e119b73ec2e363677d26:
> 
>   useradd.bbclass: Fix missing quote (2012-01-27 23:57:33 +0000)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/oe-core master
>   https://github.com/OSSystems/oe-core/tree/HEAD
> 
> Otavio Salvador (3):
>   udev: improve udev-cache robustness

I've taken this. Thanks for working through the details, I think the end
result is worth it!

>   dhcp: move dhcp leases files handling to postinst/postrm

This needs a install vs. mkdir tweak.

>   rootfs_ipk.bbclass: fix detection of script runtime requirement

I don't think this one is required with master now?

Cheers,

Richard



