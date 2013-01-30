Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U0XYc-0003kP-Jx for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 14:18:31 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UD7J4E002461; Wed, 30 Jan 2013 13:07:20 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rdPYVFhpW7g6; Wed, 30 Jan 2013 13:07:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UD7BY1002452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 30 Jan 2013 13:07:14 GMT
Message-ID: <1359550943.28244.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 30 Jan 2013 13:02:23 +0000
In-Reply-To: <alpine.DEB.2.02.1301290439030.12651@oneiric>
References: <alpine.DEB.2.02.1301290439030.12651@oneiric>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "bitbake -c fetchall" doesn't process EXTRA_IMAGEDEPENDS
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
X-List-Received-Date: Wed, 30 Jan 2013 13:18:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-01-29 at 04:41 -0500, Robert P. J. Day wrote:
>   back in november, i whined thusly:
> 
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/031997.html
> 
> is this the *intended* behaviour?  since it seems that if i do a
> "bitbake -c fetchall", i should expect that i now have *all* software
> related to my target, and that's clearly not the case here.

Someone filed a bug in bugzilla about this. Bitbake is behaving as
intended and likely there is missing dependency information in the
fetchall case. This is a metadata level problem, not a bitbake one.

Patches naturally welcome to add the correct dependency information.

Cheers,

Richard



