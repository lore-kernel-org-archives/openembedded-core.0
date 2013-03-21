Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UInq0-000399-E2 for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 23:20:00 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LMCPR6006601; Thu, 21 Mar 2013 22:12:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wnmKcwhjIuzQ; Thu, 21 Mar 2013 22:12:24 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LMCImE006578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 21 Mar 2013 22:12:21 GMT
Message-ID: <1363903367.16482.149.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <clarson@kergoth.com>
Date: Thu, 21 Mar 2013 22:02:47 +0000
In-Reply-To: <CABcZANmPy+-XyBcsFEPYaAEZm0rJZnrrippKjJeXJjXmuff0XQ@mail.gmail.com>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
	<CABcZANmPy+-XyBcsFEPYaAEZm0rJZnrrippKjJeXJjXmuff0XQ@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 21 Mar 2013 22:20:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-03-21 at 11:30 -0700, Chris Larson wrote:
> Out of curiosity, what's with the pn-pn- overrides?

Erm, yes. I suspect a search and replace gone wrong. 

I'll fix that and retest. Been staring at failures for too long...

Cheers,

Richard




