Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYhMd-0001cL-Pj for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 18:02:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8Gth90031021
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 16:55:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30454-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 16:55:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8GtZ0O031015
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 16:55:36 GMT
Message-ID: <1323363345.5309.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 16:55:45 +0000
In-Reply-To: <67C6F211-C6C2-4655-889A-A254F4E0D7D9@dominion.thruhere.net>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323327959.git.xiaofeng.yan@windriver.com>
	<67C6F211-C6C2-4655-889A-A254F4E0D7D9@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Thu, 08 Dec 2011 17:02:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-08 at 11:14 +0100, Koen Kooi wrote:
> Op 8 dec. 2011, om 10:34 heeft Xiaofeng Yan het volgende geschreven:
> 
> > From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> > 
> > gtk run over x11 at current OE-core. If gtk want to run over directfb, then \
> > the configuration related to x11 should be disabled and directfb should be enabled.
> 
> Since I still can't get an answer to "what happens when you enable
> both x11 and directfb as distro features", let me ask a different
> question:
>
> Why don't you do it like we did for gtk-directfb in OE-classic? add a
> cairo-directfb and a gtk-directfb, done.

This comes down to a policy decision I guess and I'm not sure there is a
clear cut answer.

The question is whether it makes sense to have directfb and X based gtk
in the same builds and package feeds or not. I can see that it might be
desired and that it likely is possible.

My personal take on that is that it depends how ugly the result is and
what demand there is for it. I do consider having the separate -directfb
recipes to be ugly and if we only need a cairo variant that might be ok,
if we need a ton of recipe forks I'd be much less keen. Doing separate
recipes like that is error prone and often not done well.

So can anyone tell me for sure exactly how many recipes would need
-directfb variants?

Cheers,

Richard






