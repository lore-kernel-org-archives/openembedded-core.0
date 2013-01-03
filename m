Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tqjgv-0005VT-Kn for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 13:14:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r03BxPcN012332;
	Thu, 3 Jan 2013 11:59:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32489-02; Thu,  3 Jan 2013 11:59:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r03BxCUs012326
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 3 Jan 2013 11:59:14 GMT
Message-ID: <1357214354.28649.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 03 Jan 2013 11:59:14 +0000
In-Reply-To: <CAJTo0Laa5CJzuEOCpZ_ksXf-fxCdQWKfEOJBTtwJD-9FLeGnBw@mail.gmail.com>
References: <cover.1356626500.git.sgw@linux.intel.com>
	<1356947154.28649.21.camel@ted>
	<CAJTo0Laa5CJzuEOCpZ_ksXf-fxCdQWKfEOJBTtwJD-9FLeGnBw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/26] Next batch, mostly updates
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
X-List-Received-Date: Thu, 03 Jan 2013 12:14:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-03 at 11:51 +0000, Burton, Ross wrote:
> On 31 December 2012 09:45, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >> Noor Ahsan (1):
> >>   cairo: Adds libxext in X11DEPENDS.
> >
> > No, we shouldn't be depending on libxext. Ross will not be happy about
> > this. See Ross. Ideally we shouldn't have libxext in the images at all.
> 
> Cairo actually uses Xext, because that's where the SHM headers are.  I
> suspect you're thinking of libXt, which as you say should almost never
> be pulled in.

Yes, I knew there was something like that but evidently misremembered.
The patch is fine then.

Cheers,

Richard



