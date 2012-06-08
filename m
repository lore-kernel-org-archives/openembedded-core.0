Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Scwg2-0007ak-KW for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 12:44:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q58AXpVk014369
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jun 2012 11:33:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13899-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2012 11:33:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q58AXhGD014363
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jun 2012 11:33:45 +0100
Message-ID: <1339151624.27075.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jun 2012 11:33:44 +0100
In-Reply-To: <cover.1338658338.git.otavio@ossystems.com.br>
References: <cover.1338658338.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Fix build failure of openjade using newer host
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
X-List-Received-Date: Fri, 08 Jun 2012 10:44:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-06-02 at 14:34 -0300, Otavio Salvador wrote:
> This has been catch when building denzil on a Debian sid host; the fix
> and build failure are documented on the patch. Please evaluate this
> patch for inclusion on denzil 1.2.1 release as this will be catch by
> users later.
> 
> The following changes since commit e3113827810e98eb1b012f0b280fb917199704c1:
> 
>   webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-05-30 17:37:58 +0100)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/oe-core master
>   https://github.com/OSSystems/oe-core/tree/HEAD
> 
> Otavio Salvador (1):
>   openjade: autoreconf to fix building on newer host systems

Why can't we run autoreconf instead of having the huge patch? This might
be the right answer but I'd like to understand the problem here a bit
more...

Cheers,

Richard



