Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger@moiji-mobile.com>) id 1U7SZl-00033c-5y
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 16:24:17 +0100
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 47E0E2543431;
	Mon, 18 Feb 2013 15:24:24 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger@moiji-mobile.com>)
	id 1U7SK8-00056E-IM; Mon, 18 Feb 2013 16:08:08 +0100
Date: Mon, 18 Feb 2013 16:08:08 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130218150808.GB12835@xiaoyu.lan>
References: <20130218102402.GA15710@xiaoyu.lan>
	<CAJTo0LbOcDd5N6Be=sYrEEJdPoPtX5Cw+tnze=0DAhjp53M7hg@mail.gmail.com>
	<CAJTo0LZ5iGazfVfmu225HShMJ7AeLWSixtkkGmEwKU0XYMQhKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ5iGazfVfmu225HShMJ7AeLWSixtkkGmEwKU0XYMQhKA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: State of systemd from an integrator point of view
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
X-List-Received-Date: Mon, 18 Feb 2013 15:24:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 18, 2013 at 01:14:47PM +0000, Burton, Ross wrote:

> Just noticed that the disabling of syslog isn't working for me, it
> disables syslog-busybox but there's a syslog symlink to it, which is
> being started. :)

I haven't gotten to the part to get it started again. The symlink
probably exists to deal with a real syslog package being installed.
I am not sure how to deal with that. The way forward is probably to
have syslog package install some kind of /etc/default/* that inhibits
starting the busybox one.

regards
	holger


