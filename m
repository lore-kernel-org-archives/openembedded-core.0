Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPJiF-0001bG-9R for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 23:34:55 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38LSXZt019476; Mon, 8 Apr 2013 22:28:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ou0lsG3wzs1p; Mon,  8 Apr 2013 22:28:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38LSQ4O019459
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 8 Apr 2013 22:28:29 +0100
Message-ID: <1365455838.12407.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 08 Apr 2013 22:17:18 +0100
In-Reply-To: <CAP9ODKpRz1VtMewDO92D2XdbZS5DF+s8pURJt6x=SmX8trKhdQ@mail.gmail.com>
References: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
	<25B01A83-A45B-4614-97B0-CB8E434CA168@dominion.thruhere.net>
	<CAP9ODKpRz1VtMewDO92D2XdbZS5DF+s8pURJt6x=SmX8trKhdQ@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>, Patches,
	the oe-core layer <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 08 Apr 2013 21:35:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-08 at 17:40 -0300, Otavio Salvador wrote:
> On Mon, Apr 8, 2013 at 5:32 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >
> > Op 8 apr. 2013, om 18:29 heeft Radu Moisan <radu.moisan@intel.com> het volgende geschreven:
> >
> >> Along with v182 upgrade udevd was moved to ${base_libdir}
> >
> > By upstream, yes
> >
> >> making scripts like init-live.sh to fail in finding udevd
> >
> > So you should fix those scripts, not mess around with udev.
> >
> >> Fixes [Yocto #4046]
> >>
> >> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> 
> This move has been done long time ago so I agree with Koen here: the
> scripts needs to be fixed. Another thing, it should also be tested
> with systemd feature enabled as udev will be called systemd-udevd in
> this case, IIRC.

It is not the scripts, see the previous discussion that was sent out and
Koen at least replied to. The scripts are the least of the problems.

Yes, the commit message here could be more accurate but that doesn't
change the problem of the issue reported in #4046 and previously
discussed.

Cheers,

Richard





