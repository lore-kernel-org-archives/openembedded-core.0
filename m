Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTjK3-0006qt-9y for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 01:07:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP00lsd032416
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:00:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31749-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:00:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP00epr032409
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:00:41 GMT
Message-ID: <1322179246.10928.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 00:00:46 +0000
In-Reply-To: <CAP9ODKrBxULKL=3ZHhGiOU4g7+uM=ke+43sDU=h67CvU_q7bAA@mail.gmail.com>
References: <cover.1321969615.git.otavio@ossystems.com.br>
	<65caf0c80f03e4fd3710b708541b0a7dd8f310ba.1321969615.git.otavio@ossystems.com.br>
	<1321982105.29435.302.camel@phil-desktop>
	<CAP9ODKrBxULKL=3ZHhGiOU4g7+uM=ke+43sDU=h67CvU_q7bAA@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] xserver-xorg: do not disable-dga as VESA driver requires it
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
X-List-Received-Date: Fri, 25 Nov 2011 00:07:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-22 at 15:24 -0200, Otavio Salvador wrote:
> On Tue, Nov 22, 2011 at 15:14, Phil Blundell <philb@gnu.org> wrote:
>         On Tue, 2011-11-22 at 13:47 +0000, Otavio Salvador wrote:
>         > Xorg VESA driver calls DGAInit enforcing this symbol to be
>         available
>         > to the driver to work.
>
>         Maybe it would be better to patch vesa.c to not require this
>         symbol
>         rather than forcing it on in the server for everyone.  Or
>         alternatively,
>         if you genuinely want DGA, maybe make it a PACKAGECONFIG
>         option.
>
> What worries me is that this changed lately as it were working fine.
>
> When xserver-xorg were update to 1.11 this has changed behind the
> scenes. This used to be disabled on lite flavour only.

Looking at vesa.c, there is quite a chunk of code in there depending on
DGA.

Is there any harm to building DGA apart from an extra package? Its a
self contained module isn't it?

If so, we should just be able to turn it on, package it separately and
forget about it?

Of course the ideal solution would be for someone to convert the vesa
driver to use the xrandr API...

Cheers,

Richard








