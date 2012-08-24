Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4woU-0007p9-JP for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 18:32:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OGKdqc014423;
	Fri, 24 Aug 2012 17:20:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12212-06; Fri, 24 Aug 2012 17:20:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7OGKVDo014417
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 24 Aug 2012 17:20:32 +0100
Message-ID: <1345825233.14369.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Fri, 24 Aug 2012 17:20:33 +0100
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6160FE@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1345747597-18078-1-git-send-email-msm@freescale.com>
	<CAJTo0LZNhPx5Fj59mSnGudsmMQxDxNefZi+98HWuiSqdFoTJdQ@mail.gmail.com>
	<20120824062509.GR3029@jama.jama.net>
	<70CC66F5C30A414DADDA6973E4CA391A6160FE@039-SN1MPN1-001.039d.mgd.msft.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 24 Aug 2012 16:32:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-24 at 16:06 +0000, McClintock Matthew-B29882 wrote:
> On Fri, Aug 24, 2012 at 1:25 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Thu, Aug 23, 2012 at 11:13:08PM +0100, Burton, Ross wrote:
> >> On 23 August 2012 19:46, Matthew McClintock <msm@freescale.com> wrote:
> >> >    ${PYTHON_SITEPACKAGES_DIR}/.debug \
> >> >    ${PYTHON_SITEPACKAGES_DIR}/*/.debug \
> >> >    ${PYTHON_SITEPACKAGES_DIR}/*/*/.debug \
> >> > +  ${libdir}/${PYTHON_DIR}/.debug \
> >> > +  ${libdir}/${PYTHON_DIR}/*/.debug \
> >> > +  ${libdir}/${PYTHON_DIR}/*/*/.debug \
> >>
> >> I thought packages that used distutils generally put their files under
> >> sitepackages, and not the python base directory...  Are some packages
> >> doing it wrong?
> >
> > Yes, almost all python-* recipes after this patch
> > http://git.openembedded.org/openembedded-core/commit/?id=3b23feca31480cc56f55301fd0274e622c40b522
> >
> > I have 9 such recipes in my dep tree.
> 
> Martin,
> 
> Can you look at:
> 
> http://patches.openembedded.org/patch/35245/

This gets so far but breaks python-argparse which uses setuptools. I've
posted a patch which fixes both.

Cheers,

Richard




