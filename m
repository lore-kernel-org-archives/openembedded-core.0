Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPaQN-0007vp-MC for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:25:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39FJHKI026459; Tue, 9 Apr 2013 16:19:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g5j0l9R7mYoH; Tue,  9 Apr 2013 16:19:17 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39FJ8hW026438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 9 Apr 2013 16:19:12 +0100
Message-ID: <1365520076.12407.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 09 Apr 2013 16:07:56 +0100
In-Reply-To: <BD05C246-767C-4B72-A7B7-0776A5E98355@dominion.thruhere.net>
References: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
	<1365510909.12407.79.camel@ted>
	<CAP9ODKqEJCS56UaKT3M1cPpA-escn5f7d_kEBL2kasnLYN2avQ@mail.gmail.com>
	<3528EE5E-C07B-4EBC-83E2-B425A1DD5F22@dominion.thruhere.net>
	<BD05C246-767C-4B72-A7B7-0776A5E98355@dominion.thruhere.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Patches, Otavio Salvador <otavio@ossystems.com.br>,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] udev: Move udevd back to /sbin
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
X-List-Received-Date: Tue, 09 Apr 2013 15:25:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-09 at 16:44 +0200, Koen Kooi wrote:
> Op 9 apr. 2013, om 16:41 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
> 
> > 
> > Op 9 apr. 2013, om 16:36 heeft Otavio Salvador <otavio@ossystems.com.br> het volgende geschreven:
> > 
> >> On Tue, Apr 9, 2013 at 9:35 AM, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >>> On Mon, 2013-04-08 at 19:29 +0300, Radu Moisan wrote:
> >>>> Along with v182 upgrade udevd was moved to ${base_libdir}
> >>>> making scripts like init-live.sh to fail in finding udevd
> >>>> 
> >>>> Fixes [Yocto #4046]
> >>>> 
> >>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> >>>> ---
> >>>> meta/recipes-core/udev/udev.inc    |    3 ++-
> >>>> meta/recipes-core/udev/udev_182.bb |    2 +-
> >>>> 2 files changed, 3 insertions(+), 2 deletions(-)
> >>> 
> >>> We needed a decision on this. I've rewritten the commit message and
> >>> merged it. Most of the feedback was about the commit message, not the
> >>> patch itself. There were also no better proposals for how we could
> >>> actually fix the bugs we were seeing.
> >> 
> >> If I read the thread right, it had two NACK's. So it wasn't a cosmetic
> >> commit log issue.
> > 
> > 4 replies to the patch:
> > 
> > 1) me asking about the commit log
> > 2) me NACK'ing the patch

Without any constructive way of fixing the issues. As I've said,
"fixing" the other scripts does not work. Nobody has proposed any
reasonable realistic way of unbreaking the multilib support which worked
prior to the udev upgrade. Nobody has actually taken the time to even
understand what is breaking as far as I can tell.

> > 3) Otavio NACK'ing the ptch

Again, not constructively. People saying "no" just because they dislike
it doesn't really work.

> > 4) RP mentioning other discussions
>
> And by the way, does anyone actually bother testing patches to important infrastructure like udev?
> 
> [koen@rrMBP udev]$ git log --oneline -1
> a866e1e udev: Move udevd back to /sbin
> 
> [koen@rrMBP udev]$ git grep /lib/udev/udevd
> udev/init:[ -x /lib/udev/udevd ] || exit 1
> udev/init:    /lib/udev/udevd -d
> udev/udev-cache:[ -x /lib/udev/udevd ] || exit 1
> 
> So the patch broke the sysvinit script, congratulations!

Patch screw up :(. This will get fixed shortly, sorry about that.

Cheers,

Richard




