Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKTOW-0008Ho-9a for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 13:49:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IBeU54000945
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 12:40:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00502-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 12:40:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IBeO6p000939
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 12:40:25 +0100
Message-ID: <1334749226.24091.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Apr 2012 12:40:26 +0100
In-Reply-To: <4F8EA5CC.6010101@opendreambox.org>
References: <4F847380.6000401@windriver.com>
	<4F8489DE.1050905@opendreambox.org> <4F8C24CB.3080607@opendreambox.org>
	<1334587325.616.4.camel@ted> <4F8C379A.3070903@opendreambox.org>
	<4F8C3B19.40400@windriver.com> <4F8EA5CC.6010101@opendreambox.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
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
X-List-Received-Date: Wed, 18 Apr 2012 11:49:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-18 at 13:30 +0200, Andreas Oberritter wrote:
> now, after having repacked all binary tarballs that had mipsel or
> mipsel-nf in their name and contents, and after having changed all
> occurrences of mipsel and mipsel-nf in my local recipes (where
> appropriate), and after having rebuilt everything from scratch again, it
> came to my attention that "mipsel" in PACKAGE_EXTRA_ARCHS breaks opkg,
> because no mipsel packages are being generated. That's what I told
> before, right?

How is this breaking opkg? We often have architectures listed in there
for which there are no packages generated (all, noarch and any spring to
mind)?

Cheers,

Richard




