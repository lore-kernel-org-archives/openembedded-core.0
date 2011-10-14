Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REjj8-0000KO-EY for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 17:31:40 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EFW6Bf021920 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 16:32:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ft3-44i1E7qz
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 16:32:06 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EFW0n4021917
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 16:32:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 16:25:16 +0100
In-Reply-To: <CAP9ODKod1GCk5gFPq0YkEPb0rZ3NHsD6YBu7cAQVDPLW0PN7xA@mail.gmail.com>
References: <1318603356.2342.20.camel@ted>
	<CAP9ODKod1GCk5gFPq0YkEPb0rZ3NHsD6YBu7cAQVDPLW0PN7xA@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318605925.2342.24.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] mesa-dri: Enable swrast only by default and intel drivers only on IA platform
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
X-List-Received-Date: Fri, 14 Oct 2011 15:31:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-14 at 11:46 -0300, Otavio Salvador wrote:
> +1
> 
> Just another thing, I'd prefer to have DRIDRIVERS as ?= so machine can
> override it.

I really wouldn't recommend overriding this on a per machine basis, it
needs to be on a per arch basis. This is because the recipe is not
machine specific (nor should it be).

Configuration therefore falls to the distro, not machine.

Cheers,

Richard



