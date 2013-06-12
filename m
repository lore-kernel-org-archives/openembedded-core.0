Return-Path: <andy.voltz@timesys.com>
Received: from exchange07.timesys.com (exchange07.timesys.com
	[209.114.137.116])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3BE6AA47;
	Wed, 12 Jun 2013 16:13:35 +0000 (UTC)
Received: from timesys.com (192.168.3.27) by exchange07.timesys.com
	(192.168.1.221) with Microsoft SMTP Server id 8.1.436.0;
	Wed, 12 Jun 2013 12:13:35 -0400
Date: Wed, 12 Jun 2013 12:13:56 -0400
From: Andy Voltz <andy.voltz@timesys.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130612161355.GG17357@timesys.com>
References: <20130607154357.606025038F@opal> <20130608091020.GO22710@jama>
	<20130608091556.GP22710@jama> <20130610155044.GS17357@timesys.com>
	<CAMKF1spvVOLu5uKFWXC=yqzHV73N61sOqUwj=gg1ZUVK=uN7OQ@mail.gmail.com>
	<20130611134543.GZ17357@timesys.com>
	<CAMKF1srJ1-dzfa3AhrEAJRiNG3krvBoJy78sLbc+me8YExK16A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srJ1-dzfa3AhrEAJRiNG3krvBoJy78sLbc+me8YExK16A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Andy Voltz : tune-cortexa.inc: create a common include for cortex-a armv7a tuning
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
X-List-Received-Date: Wed, 12 Jun 2013 16:13:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Khem,

> On Tue, Jun 11, 2013 at 6:45 AM, Andy Voltz <andy.voltz@timesys.com> wrote:
> > I understand that. I sent an updated patch which reverts to mtune, but I'm getting
> 
> mtune/march is small issue with this patch. I would recommend to send
> a revert of the patches
> since all arm architectures are broken as of now in OE-Core

I see the issue now. It seems that overriding the tunes with a variable
reference does not work for all the tunings. With the tune test script, I'm
seeing that these tunes are broken:
log.fake-cortexa9.cortexa9*
log.fake-cortexa8.cortexa8*

I see that variables can be assigned with a reference based on stuff like 
FILES_${QT_BASE_NAME}-fonts = ...

(From recipes-qt/qt4/qt4-embedded.inc)

I'm not sure why it works there and not in the tunings, or how to fix.

For now I have a revert patch which removes tune-cortexa.inc and restores the
previous contents of the a7,a8,a9,15 tuning files. 

It also adds the tune-cortexa5.inc file I had sent on the list originally
which led to this code-reduction experiment. That thread is here for reference:

http://lists.openembedded.org/pipermail/openembedded-core/2013-June/079452.html

Thanks for pointing out this issue. Patch is on the way.

Regards
-- 
Andy Voltz
Timesys Corporation

