Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0iww-0008VV-1V for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 01:23:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1O0FSrV031040
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:15:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30295-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:15:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1O0FKdD031003
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:15:21 GMT
Message-ID: <1330042521.25226.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 00:15:21 +0000
In-Reply-To: <CAP9ODKomVXg1Ry=o3ao_yWdiOQK6f2ViG86xHgmsrfML9BvkHg@mail.gmail.com>
References: <1329992278.32110.54.camel@ted>
	<CAP9ODKomVXg1Ry=o3ao_yWdiOQK6f2ViG86xHgmsrfML9BvkHg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] sstatesig.py: Move package exclusion list to the layer config
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
X-List-Received-Date: Fri, 24 Feb 2012 00:23:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-23 at 08:46 -0200, Otavio Salvador wrote:
> On Thu, Feb 23, 2012 at 08:17, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > +SIGGEN_EXCLUDERECIPES_ABISAFE = "sysvinit-inittab shadow-securetty opkg-config-base netbase formfactor xserver-xf86-config pointercal base-files"
> 
> I would prefer one package per line here so it is easier to read a
> diff changing this, in future.

I'd meant to change this but when it came around to dealing with the
patches, I forgot, sorry :(.

We can change it as a subsequent patch...

Cheers,

Richard




