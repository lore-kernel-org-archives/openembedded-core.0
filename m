Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1S8NEO-0004yp-CD
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 03:49:29 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Fri, 16 Mar 2012 10:40:19 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Fri, 16 Mar 2012
	10:40:10 +0800
Message-ID: <1331865488.1041.65.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 10:38:08 +0800
In-Reply-To: <4F621801.4000308@windriver.com>
References: <1331799506.1041.55.camel@localhost.localdomain>
	<4F621801.4000308@windriver.com>
Organization: Insigma
X-Mailer: Evolution 3.2.3 
MIME-Version: 1.0
Subject: Re: LSB support?
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
X-List-Received-Date: Fri, 16 Mar 2012 02:49:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

first, thanks your reply.

Because I can't use task-core-lsb on my device (flash space is not
enough), I have to make a custom lsb-base image (without
perl/python/graphics).

I have checked the "linuxstdbase", and it will change the configure
option of some packages.

Indeed, I think the daemon/failure/warning fuctions should be considered
in package lsb's RDEPENDS.

what I want to know is the rdepends or where is the
daemon/failure/warning.

thanks again.


On Fri, 2012-03-16 at 00:25 +0800, Mark Hatle wrote:
> On 3/15/12 3:18 AM, Ni Qingliang wrote:
> > Hello, I'm working on custom lsb-base image using oe-core.
> >
> > and when using the lsb script, found error:
> >
> > lsb_start_daemon line 44: daemon command not found.
> >
> > similar thing happend on lsb_log_message: failure and warning command
> > not found.
> >
> > maybe these function should be defined in /etc/init.d/functions?
> >
> > but there are not these function in this file (belongs to initscripts).
> 
> Did you enable the LSB distribution settings?  Without this, various components
> may not be available.
> 
> In Poky, there is a "poky-lsb" distribution type:
> 
> DISTRO = "poky-lsb"
> DISTROOVERRIDES = "poky:linuxstdbase"
> 
> DISTRO_FEATURES_append = " pam largefile opengl"
> PREFERRED_PROVIDER_virtual/libx11 = "libx11"
> 
> (as well as using the core-image-lsb and/or task-core-lsb components.)
> 
> If you've tried this and those items are still broken, let me know and I can
> help investigate further.  (One final note, only LSB 1.4 is currently supported.)
> 
> --Mark
> 
> > Any idea?
> >
> > thanks!
> >
> >
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



