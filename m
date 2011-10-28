Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RJgc1-00066W-D9
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 09:12:22 +0200
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Fri, 28 Oct 2011 15:06:03 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Fri, 28 Oct 2011
	15:06:02 +0800
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Fri, 28 Oct 2011 15:05:17 +0800
In-Reply-To: <CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>
References: <1319780499.10032.46.camel@localhost.localdomain>
	<CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>
Organization: Insigma
X-Mailer: Evolution 3.0.3 
Message-ID: <1319785517.10032.48.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to set time zone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 28 Oct 2011 07:12:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

THANKS!

I still want the native support by oe-core/yocto:-). If no, I will try
by myself.

On Fri, 2011-10-28 at 14:32 +0800, Samuel Stirtzel wrote:
> 2011/10/28 Ni Qingliang <niqingliang@insigma.com.cn>:
> > Hello All:
> >
> > what is the right way to set timezone?
> >
> > I have added tzdata into my image, and can find some variables in the
> > etc, e.g. 'TZ'.
> >
> > on my archlinux, I can set TIMEZONE in the rc.conf, which is used in
> > rc.sysvinit (which will link the /etc/localtime using TIMEZONE).
> >
> > what is the right place to locate similar setting code (e.g. link
> > the /etc/localtime) in the yocto?
> >
> > thanks!
> >
> >
> >
> > --
> > Yi Qingliang
> > niqingliang@insigma.com.cn
> > http://niqingliang2003.wordpress.com
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> 
> Hi,
> 
> you could try the following:
> http://www.rwhitby.net/blog/nslu2-linux/setting-the-openmoko-timezone.html
> 
> Well this is the first entry when using google with "openembedded time
> zone", so please consider using search engines first next time.
> 
> Also this is the very same process like it is done on a desktop
> computer, googling for "set time zone linux command line" gives this
> result:
> http://www.cyberciti.biz/faq/howto-linux-unix-change-setup-timezone-tz-variable/
> Which shows more precise steps at the headline "Set timezone using
> /etc/localtime configuration file [any Linux distro]".
> 
> 
> (Sorry for cross posting, but this was carried over to the OE-Core list)
> 
> --
> Regards
> Samuel

-- 
Yi Qingliang
niqingliang@insigma.com.cn
http://niqingliang2003.wordpress.com




