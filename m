Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 905BC6E3EB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2014 12:20:45 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s18CKR4G011269; Sat, 8 Feb 2014 12:20:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QnK6pz1plXCO; Sat,  8 Feb 2014 12:20:27 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s18CKKBK011240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 8 Feb 2014 12:20:21 GMT
Message-ID: <1391862015.32614.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laszlo Papp <lpapp@kde.org>
Date: Sat, 08 Feb 2014 12:20:15 +0000
In-Reply-To: <CAOMwXhM8FgqC+z-fo9VNDyn=imUhomLmm+hQUSX4k9r7AsXJyA@mail.gmail.com>
References: <1391598835-1631-1-git-send-email-lpapp@kde.org>
	<52F25D84.6060501@linux.intel.com>
	<CAOMwXhMUuS2-dV1xe0YWFxOeD08ByUHHm8DPaqeT=4jAFzHXVA@mail.gmail.com>
	<1391860744.32614.52.camel@ted>
	<CAOMwXhM8FgqC+z-fo9VNDyn=imUhomLmm+hQUSX4k9r7AsXJyA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/recipes-core/base-passwd/base-passwd/noshadow.patch: Split it into two parts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Feb 2014 12:20:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-02-08 at 12:07 +0000, Laszlo Papp wrote:
> Why is it a nightmare? For instance, maintainers in other projects
> leave a "Pushed, thanks" note.
> 
> See how much discussion this generates already, instead of two words.
> While you are at the change to merge it, you are already in place to
> leave the comment. However, contributors need to go and find the
> corresponding url, etc. Please note that contributors may want to know
> whether their voluntary work got merged without even a checkout, for
> instance double checking from mobile, etc.
> 
> ... or is the real problem the lack of maintainer man power?

Its both a man power problem and the process isn't as simple as
described. 

The changes get batched together into large units, those get tested on
the autobuilder. If they work out ok, the changes go in, if they fail,
we pull out patches until we get a successful batch, then merge.

Upon failures, we do aim to mention those on list. Having to go back
through emails to find the ones which merge and "ack" them is a pain
though since we are "not already in place" as you put it.

There are only two people in general who do this on OE-Core, myself and
Saul. We do have a ton of other pressures on our time, we do the best we
can. If someone wants to ack patches that merge I'm happy for them to do
so, it would be just as much work for them as it would for me/Saul.

I am aware there are patch management tools out there which can show
status of patches. We've looked hard at them and in general they impose
more overhead and process onto people who don't want it.

Cheers,

Richard


