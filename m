Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4wka-0007g1-OA for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 18:28:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OGGXdO014389;
	Fri, 24 Aug 2012 17:16:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12212-05; Fri, 24 Aug 2012 17:16:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OGGPdQ014383
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 24 Aug 2012 17:16:26 +0100
Message-ID: <1345824987.14369.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Aug 2012 17:16:27 +0100
In-Reply-To: <20120824062509.GR3029@jama.jama.net>
References: <1345747597-18078-1-git-send-email-msm@freescale.com>
	<CAJTo0LZNhPx5Fj59mSnGudsmMQxDxNefZi+98HWuiSqdFoTJdQ@mail.gmail.com>
	<20120824062509.GR3029@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Matthew McClintock <msm@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] distutils-common-base.bbclass: Pick up additional .debug folders:
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
X-List-Received-Date: Fri, 24 Aug 2012 16:28:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-24 at 08:25 +0200, Martin Jansa wrote:
> On Thu, Aug 23, 2012 at 11:13:08PM +0100, Burton, Ross wrote:
> > On 23 August 2012 19:46, Matthew McClintock <msm@freescale.com> wrote:
> > >    ${PYTHON_SITEPACKAGES_DIR}/.debug \
> > >    ${PYTHON_SITEPACKAGES_DIR}/*/.debug \
> > >    ${PYTHON_SITEPACKAGES_DIR}/*/*/.debug \
> > > +  ${libdir}/${PYTHON_DIR}/.debug \
> > > +  ${libdir}/${PYTHON_DIR}/*/.debug \
> > > +  ${libdir}/${PYTHON_DIR}/*/*/.debug \
> > 
> > I thought packages that used distutils generally put their files under
> > sitepackages, and not the python base directory...  Are some packages
> > doing it wrong?
> 
> Yes, almost all python-* recipes after this patch
> http://git.openembedded.org/openembedded-core/commit/?id=3b23feca31480cc56f55301fd0274e622c40b522
> 
> I have 9 such recipes in my dep tree.

That patch shouldn't have gone in, it breaks things. I've posted
something to try and fix things for everyone although python packaging
isn't my strong area.

Cheers,

Richard



