Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RQy8y-0006Fm-L2
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 10:20:29 +0100
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Thu, 17 Nov 2011 17:13:49 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Thu, 17 Nov 2011
	17:13:49 +0800
Message-ID: <1321521168.1264.43.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2011 17:12:48 +0800
In-Reply-To: <20111117085730.GA4551@mail.familie-heinold.de>
References: <1321496999.1264.24.camel@localhost.localdomain>
	<CAEsOVNdL3bTKA9rv6p9SEpvoY+a3b5y6Ftn=ySMVdgkW3nMm3w@mail.gmail.com>
	<20111117085730.GA4551@mail.familie-heinold.de>
Organization: Insigma
X-Mailer: Evolution 3.2.1 
MIME-Version: 1.0
Subject: Re: how to exclude files when packaging?
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
X-List-Received-Date: Thu, 17 Nov 2011 09:20:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I still think that the 'exclude" feature would be better.:)

On Thu, 2011-11-17 at 16:57 +0800, Henning Heinold wrote:
> On Thu, Nov 17, 2011 at 08:14:06AM +0000, McClintock Matthew-B29882 wrote:
> > On Wed, Nov 16, 2011 at 8:29 PM, Ni Qingliang
> > <niqingliang@insigma.com.cn> wrote:
> > > Hello, All:
> > >        I'm working on opensaf, wrote a bb file for it,
> > > and found that the FILES_${PN} has included /usr/lib/${PN}/*.
> > > but there are some .a and .so(symlink) in /usr/lib/${PN}, which will
> > > result QA issue.
> > >        how to exclude some files (e.g. *.a, *.so) in FILES_${PN}?
> > >
> > >        there are some elf in /usr/lib/${PN} whose prefix is not 'lib', so if
> > > no 'exclude' feature, I must redefine FILES_${PN} like this:
> > >        FILES_${PN} = "/usr/lib/${PN}/*.so.* \
> > >                       /usr/lib/${PN}/saf* \
> > >                       /usr/lib/${PN}/open* \
> > >                       /usr/lib/${PN}/immload \
> > >                       /usr/lib/${PN}/nid_tipc \
> > >                       /usr/lib/${PN}/smf* \
> > >                       /usr/lib/${PN}/clc-cli/*"
> >
> > Explicitly list what you want in FILES_${PN}
> >
> > FILES_${PN} = /usr/lib/${PN}/saf
> >
> > Make another PACKAGE for other files
> >
> > PACKAGES =+ ${PN}-misc
> > FILES_${PN}-misc = /usr/lib/${PN}/saf
> >
> > Maybe someone else can chime in if there is a way to mask certain files...
> 
> No,
> 
> QA would always complain. For all files you do not want to package make a do_install_append()
> and remove them inside this function.
> 
> Another solution would be to tweak the buildsystem of the software, not to install the unwanted
> files.
> 
> Bye Henning
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



