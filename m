Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2616F309
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 21:04:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1RL43nb030196; Thu, 27 Feb 2014 21:04:03 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uhL6aOrOqGgv; Thu, 27 Feb 2014 21:04:03 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1RL3vSl030181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 27 Feb 2014 21:03:59 GMT
Message-ID: <1393535030.31769.160.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Feb 2014 21:03:50 +0000
In-Reply-To: <CAJTo0LYoCqic_4OwwMHJdwMwwMDC-ARyu1e_5PdV0+HnqNxLzg@mail.gmail.com>
References: <1393524104.31769.148.camel@ted>
	<CAJTo0LaG9SeGd2Pi3-dksPd_FHH4TEWK2MGJU-d=2kte6aTg7Q@mail.gmail.com>
	<CAP9ODKrpyH-R4LYRt6kt0SiQEfAmaVUPHZq0XEzcYJxXY7BuRQ@mail.gmail.com>
	<CAJTo0LYoCqic_4OwwMHJdwMwwMDC-ARyu1e_5PdV0+HnqNxLzg@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools-brokensep: Mark recipes with broken separate build dir support
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
X-List-Received-Date: Thu, 27 Feb 2014 21:04:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-02-27 at 20:13 +0000, Burton, Ross wrote:
> On 27 February 2014 20:06, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > On Thu, Feb 27, 2014 at 3:52 PM, Burton, Ross <ross.burton@intel.com> wrote:
> >> On 27 February 2014 18:01, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >>> +inherit autotools
> >>> +B = "${S}"
> >>
> >> Why is this preferable to directly setting B in the recipe, which
> >> seems more obvious to me.
> >
> > I see one benefit for it being easier to grep for; so we know this is
> > one recipe which ought to be fixed and that rely on autotools.
> 
> I'm apprehensive of adding a class whose sole purpose is to set a
> variable that can be set in the recipe itself, and will be another
> class to explain/document for the future.  Grepping for an assignment
> to B is almost as simple too.

I ended up doing it this way as:

a) its easier to change in the recipes than typing the magic B=...
   incantation
b) its easier to search for (sure you can grep B= but how do you know 
   they're autotools recipes? This is particular hard when the inherit 
   is in a common include file
c) it means we can set (and change) policy globally from one place
d) it contains the word "broken" nice and clearly

Cheers,

Richard


