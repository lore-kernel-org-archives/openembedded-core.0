Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3A465F25
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 20:55:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s46Kt3wg000997; Tue, 6 May 2014 21:55:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZmrtSi9ZLQIB; Tue,  6 May 2014 21:55:03 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s46Ksxd2000980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 6 May 2014 21:55:01 +0100
Message-ID: <1399409693.31891.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sean Hudson <sean_hudson@mentor.com>
Date: Tue, 06 May 2014 21:54:53 +0100
In-Reply-To: <536943C2.3040800@mentor.com>
References: <20140506200046.GC11339@denix.org> <536943C2.3040800@mentor.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Recipes erroneously marked as "commercial"?
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
X-List-Received-Date: Tue, 06 May 2014 20:55:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-05-06 at 15:19 -0500, Sean Hudson wrote:
> On 05/06/2014 03:00 PM, Denys Dmytriyenko wrote:
> > So, long time ago we had a short list of "commercial" packages in a global 
> > variable COMMERCIAL_LICENSE:
> >
> > COMMERCIAL_LICENSE ?= "lame gst-fluendo-mp3 libmad mpeg2dec ffmpeg qmmp"
> >
> > Then, at some point, the packages that depend on commercial ones were added to 
> > the list, to allow wold builds to be successful:
> >
> > http://cgit.openembedded.org/openembedded-core/commit/?id=c69453fe94a649c518b0e6d79616f05579b864ce
> >
> > So, the list was appended with this:
> >
> > COMMERCIAL_LICENSE_DEPENDEES ?= "gst-plugins-ugly libomxil gst-openmax"
> >
> > Then, later on, the feature was changed from a global list to a per-recipe 
> > flags:
> >
> > http://cgit.openembedded.org/openembedded-core/commit/?id=a2760661b8c7a4a1b6f2e556853b3a9ae38cbcb5
> > http://cgit.openembedded.org/openembedded-core/commit/?id=43410523a07d9eb52a7d57ae3dc1cc320cbbc6f9
> >
> > And all those recipes got marked with LICENSE_FLAGS = "commercial" 
> > automatically, even if they are not really commercial.
> >
> > The question is - should we clean those up now? I can send a quick patch, if 
> > my understanding above is correct.
> >
> I encountered this issue recently and raised it in IRC.  As an
> interested party, I'd love to see these updated.
> 
>   (Thanks Denys for sending it to the list so quickly.)

If world builds don't break I'm open to patches.

Cheers,

Richard


