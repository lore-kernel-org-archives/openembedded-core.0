Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RKg6b-0005mL-Oq
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 01:52:02 +0100
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Mon, 31 Oct 2011 08:45:54 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Mon, 31 Oct 2011
	08:45:52 +0800
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 31 Oct 2011 08:44:51 +0800
In-Reply-To: <4EAABF76.7080703@windriver.com>
References: <1319780499.10032.46.camel@localhost.localdomain>
	<CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>
	<1319785517.10032.48.camel@localhost.localdomain>
	<CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>
	<4EAABF76.7080703@windriver.com>
Organization: Insigma
X-Mailer: Evolution 3.0.3 
Message-ID: <1320021891.10032.56.camel@localhost.localdomain>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 31 Oct 2011 00:52:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'd like the 'system level configuration' solution.

the /etc/localtime/ link can be done when packaging rootfs (using the
system level configuration).

On Fri, 2011-10-28 at 22:43 +0800, Mark Hatle wrote:
> Setting the default TZ for the image is something that should be done in a post
> install script for the tzdata package or something similar.
> 
> Since the /etc/localtime is usually a copy/hardlink or symlink to the timezone
> data we don't want to package it up.  Instead we want to perform the actions
> that a program running on the target system itself would use to change the timezone.
> 
> So I think the easiest approach is to add a system level configuration variable
> (set the default).
> 
> Then use this variable to populate the configuration file that specifies the
> system timezone... and then use the post install process to check the contents
> of a text file.
> 
> Alternatively do this via an initscript -- but for folks w/ read-only
> filesystems I'm not sure that will work.
> 
> --Mark
> 
> On 10/28/11 3:22 AM, Andrea Adami wrote:
> > On Fri, Oct 28, 2011 at 9:05 AM, Ni Qingliang <niqingliang@insigma.com.cn
> > <mailto:niqingliang@insigma.com.cn>> wrote:
> >
> >     THANKS!
> >
> >     I still want the native support by oe-core/yocto:-). If no, I will try
> >     by myself.
> >
> >
> > I've asked three or four time the oe-core crow to improve the recipe...last one:
> >
> > On Wed, Oct 19, 2011 at 12:24 AM, Joshua Lock <josh@linux.intel.com
> > <mailto:josh@linux.intel.com>> wrote:
> >
> >     Per mailing requests, here are updates to the tzdata and gst-plugins-good
> >     recipes.
> >
> >     Joshua
> >
> >     The following changes since commit 95d0ff5e070c690314ab87665200099a52d37ebf:
> >
> >      tzdata: updated SRC_URI and update to 2011k (2011-10-18 11:16:58 -0700)
> >
> >
> > Thanks for the tzdata fix.
> > Now, we have the same recipes in meta-oe with a slightly different do_install
> > and packaging: I'm referring to /etc/localtime and /etc/timezone: which package
> > do provide those in oe-core?
> >
> > (We'll remove the tzdata/tzcodes from meta-oe once the recipes are matching)
> >
> > Regards
> >
> >
> >
> > Andrea
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Yi Qingliang
niqingliang@insigma.com.cn
http://niqingliang2003.wordpress.com




