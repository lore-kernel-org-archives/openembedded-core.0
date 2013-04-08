Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPKCK-0004nA-67 for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 00:06:12 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38Lxep6021953; Mon, 8 Apr 2013 22:59:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UI7Df-sgX1uq; Mon,  8 Apr 2013 22:59:40 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38LxW3p021948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 8 Apr 2013 22:59:35 +0100
Message-ID: <1365457704.12407.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michel Thebeau <michel.thebeau@windriver.com>
Date: Mon, 08 Apr 2013 22:48:24 +0100
In-Reply-To: <51633682.2030305@windriver.com>
References: <1365454473.12407.51.camel@ted>
	<1365456279-30162-1-git-send-email-michel.thebeau@windriver.com>
	<51633682.2030305@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Bruce.Ashfield@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] kernel.bbclass: do_strip: allow recipes to strip the kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 22:06:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-08 at 17:28 -0400, Michel Thebeau wrote:
> 
> On 13-04-08 05:24 PM, michel.thebeau@windriver.com wrote:
> > From: Michel Thebeau <michel.thebeau@windriver.com>
> > 
> > Allow recipes to specify sections to be stripped from the kernel output
> > using KERNEL_IMAGE_STRIP.  For example:
> > 
> > KERNEL_IMAGE_STRIP = ".comment .unwanted"
> 
> s/KERNEL_IMAGE_STRIP/KERNEL_IMAGE_STRIP_EXTRA_SECTIONS
> 
> Throughout

So are you resending this with the appropriate changes, tested? It looks
much better this way to me than the first version anyway, thanks.

Richard





