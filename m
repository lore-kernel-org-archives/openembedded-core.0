Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RF7j0-0001LI-4z for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 19:08:42 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9FH9aoN031852 for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 18:09:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kSJXTsI+nMbE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 18:09:36 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9FH9VH6031847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 18:09:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 15 Oct 2011 18:02:47 +0100
In-Reply-To: <1318675132-9265-1-git-send-email-Martin.Jansa@gmail.com>
References: <363ECAF1-8602-4139-ADC9-2044FCB5456C@dominion.thruhere.net>
	<1318675132-9265-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318698176.2342.77.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Sat, 15 Oct 2011 17:08:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-10-15 at 12:38 +0200, Martin Jansa wrote:
> * this way we can use
>   EXTRA_DRIDRIVERS_armv4t += ",glamo" in meta-openmoko layer and
>   EXTRA_DRIDRIVERS_armv4t += ",foo" in meta-bar layer without knowledge
>   of other modules in other layers in stack
> * actually it's like old MACHINE_DRI_MODULES from OE-classic but renamed
>   to indicate that it should be used for architecture not machine

This is way overcomplicated. Just do:

DRIDRIVERS_append_armv4t = ",glamo"

With the other approach you should be using .= to avoid spaces anyway.

Cheers,

Richard



