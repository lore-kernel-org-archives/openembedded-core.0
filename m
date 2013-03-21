Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UIp4Y-0005G2-Uy for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 00:39:11 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LNVW7i011241; Thu, 21 Mar 2013 23:31:32 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id m4xNhmG1uOn7; Thu, 21 Mar 2013 23:31:32 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LNVNET011233
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 21 Mar 2013 23:31:26 GMT
Message-ID: <1363908112.16482.151.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 21 Mar 2013 23:21:52 +0000
In-Reply-To: <13d8f28b861.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
	<13d8f28b861.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/16] distro: Add separatebuilddir.inc
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
X-List-Received-Date: Thu, 21 Mar 2013 23:39:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-03-21 at 23:54 +0100, Bernhard Reutner-Fischer wrote:
> On 21 March 2013 16:55:14 Richard Purdie 
> <richard.purdie@linuxfoundation.org> wrote:
> > Going forward its going to be useful to separate build data from source data
> > in those autotooled projects which support it. Unfortunately there is a lot
> > of breakage so for now, this starts the creation of an opt in list which
> > we can iterate over enable more recipes over time.
> 
> 
> This does not yet seem to cover the 'O=' family, right?

Correct. autotools seemed like the best place to start with that and the
trick I mention above with the configure checksum change is only
currently enabled there anyway.

We could extend this to other places if it makes sense although I'm not
sure how many O= recipes we have...

Cheers,

Richard



