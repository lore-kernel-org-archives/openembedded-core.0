Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TyVqu-0007bb-MP for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 00:05:01 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0OMrXtm031031; Thu, 24 Jan 2013 22:53:33 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rmXmhaPZuYob; Thu, 24 Jan 2013 22:53:33 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0OMrQD8031025
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 24 Jan 2013 22:53:29 GMT
Message-ID: <1359067749.3616.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <clarson@kergoth.com>
Date: Thu, 24 Jan 2013 22:49:09 +0000
In-Reply-To: <CABcZANmaExGvf_4Vm-+00nkk905an8atzPPR946KOsOWGpwYvw@mail.gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
	<2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
	<1359064215.3616.20.camel@ted>
	<CAMKF1spCF8ZQ86skFu_V0PHy7_r4n=h3d_6cNF5t3-x36dkoRA@mail.gmail.com>
	<CABcZANmaExGvf_4Vm-+00nkk905an8atzPPR946KOsOWGpwYvw@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH 01/11] libpcap: Add missing libusb dependency
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
X-List-Received-Date: Thu, 24 Jan 2013 23:05:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-24 at 15:42 -0700, Chris Larson wrote:
> 
> On Thu, Jan 24, 2013 at 3:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>         On Thu, Jan 24, 2013 at 1:50 PM, Richard Purdie
>         <richard.purdie@linuxfoundation.org> wrote:
>         > Do we need libusb support in libpcap? What does this
>         dependency buy us
>         > and couldn't we force it off instead?
>         
>         
>         its needed to support canusb in libpcap, I would say yes we
>         should
>         support it but disabling it would be ok too although all my
>         builds
>         were silently using libusb so I think unknowingly may be but
>         we are
>         already shipping with canusb support.
> 
> I'd personally prefer it disabled, but I'd think at the very least it
> should be a PACKAGECONFIG entry, whether its included in the default
> value of PACKAGECONFIG itself or not.
> 
Agreed, PACKAGECONFIG, default off is the way to go with this IMO too.

Cheers,

Richard



