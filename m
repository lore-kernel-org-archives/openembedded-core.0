Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SukZK-000605-3Z for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 15:27:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RDFUGD006308
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 14:15:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06244-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 14:15:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RDFNmJ006302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 14:15:24 +0100
Message-ID: <1343394922.9574.135.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 14:15:22 +0100
In-Reply-To: <CAAQYJAvVkEcV=Bjfwp7JZWeXcrss6vUC3Amts5GGzdUrRBWwEw@mail.gmail.com>
References: <alpine.DEB.2.02.1207261904590.18831@oneiric>
	<1343388304.9574.118.camel@ted>
	<alpine.DEB.2.02.1207270801210.14507@oneiric>
	<CAAQYJAvVkEcV=Bjfwp7JZWeXcrss6vUC3Amts5GGzdUrRBWwEw@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: image.bbclass: Update outdated reference to "export IMAGE_BASENAME"
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
X-List-Received-Date: Fri, 27 Jul 2012 13:27:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-27 at 14:53 +0200, Andrea Adami wrote:

> 
> By the way,
> 
> we have followed pedissequally and re-introduced 'export
> IMAGE_BASENAME' [1] when we adapted our initramfs image for oe-core,
> even though we had built whitout until then, both in oe-classic and in
> oe-core. 
> 
> Regards
> 
> Andrea
> 
> [1]
> http://cgit.openembedded.org/meta-handheld/commit/?id=3021e1fc380067666a63fa5b2bdfc5fd16282973

At this point I don't know if this is necessary or not. It might be
unnecessary but we would need someone to confirm that before we remove
it.

Cheers,

Richard



