Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsDGV-0005YJ-7V for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 15:01:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07DkCNK004906;
	Mon, 7 Jan 2013 13:46:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04100-04; Mon,  7 Jan 2013 13:46:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07Dk3SM004900
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 13:46:04 GMT
Message-ID: <1357566365.25855.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 07 Jan 2013 13:46:05 +0000
In-Reply-To: <CAP9ODKq2UVEmG11WFNHNdvE5+-X5NW6azhaQsxxGPbC05+j8og@mail.gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357559941.25855.7.camel@ted>
	<CAF6bG8eMo0c=e8G2zd_Y4ST0hG-S2Zx4f4f7hhO8PPML7Ozs7Q@mail.gmail.com>
	<CAJTo0LYXWwLEwmz+oWT4Lo6PL1naJxP0NV5DKcEBbJvyLPh0cw@mail.gmail.com>
	<CAP9ODKq2UVEmG11WFNHNdvE5+-X5NW6azhaQsxxGPbC05+j8og@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: the oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH v2 04/15] file: replace obsolete automake macros with working ones
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
X-List-Received-Date: Mon, 07 Jan 2013 14:01:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-07 at 10:18 -0200, Otavio Salvador wrote:
> On Mon, Jan 7, 2013 at 10:16 AM, Burton, Ross <ross.burton@intel.com> wrote:
> > On 7 January 2013 12:11, Marko Lindqvist <cazfi74@gmail.com> wrote:
> >> What's the correct status for fixes that are not really backports,
> >> but have happened independently in oe and upstream?
> >>  - If practically identical, still mark as "Backport"?
> >>  - If different solution, "Inappropriate [not needed]"?
> >
> > If you did it and then later discovered it's happened upstream
> > independently, it's essentially a backport.

The best thing is to consider how we use the information. I'd happily
accept "Backport" in this case as meaning "the upstream latest version
has equivalent functionality". You can note the status after the word to
give specifics if needed.

> Maybe it'd be better to not patch at all and update to the newer 
> recipe version?

I don't think that is a reasonable policy in all cases. I'm not going to
block automake on all upstreams making new releases for example.

Cheers,

Richard



