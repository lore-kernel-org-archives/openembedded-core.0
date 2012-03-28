Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SD2RS-0006my-JG
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 01:38:14 +0200
Received: by obbwc20 with SMTP id wc20so563644obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 16:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=amdh+eF93xyZjFV9IdkdKyD4W070e7+s4T6yIThXY4s=;
	b=SiPE/Cz6nqLPr3fWFymtAMtoyKKXO9mlXUMG+pc+zMlZjftLEK1P5YxwmpPNS6CFf4
	7IqoRfAFVe5g8Ln42nSiOo7UabL9Y1X7YnpVBpZit45UTmnHFL5WZeR2oXxrRNC99565
	4wrx3Z67VzMufPgmRYoUmbk/8fdegQaiEFMxpg4fe3eiNDGWEea6q1TTRTnXJUXnSx/i
	AjFcKGLIrrclJksjiG0pAGHPI2K3uiRFPy3aP1XyGNMerWa1v22ztwLaY4T8FQHSJ7Ym
	a9VYq2+qoHg7u8l+ewa3Enb5Lh5bUot2R1VSZLr5SUPc3nspN3BK83EF0KZbG1NLSsFI
	sSRA==
Received: by 10.182.14.34 with SMTP id m2mr28022527obc.38.1332977351218;
	Wed, 28 Mar 2012 16:29:11 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id xh3sm4464561obb.13.2012.03.28.16.29.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 16:29:09 -0700 (PDT)
Date: Wed, 28 Mar 2012 16:29:08 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120328232908.GA4080@bill-the-cat>
References: <1332524132-24689-1-git-send-email-trini@ti.com>
	<1332753313.28414.91.camel@ted>
	<20120326162531.GD21518@bill-the-cat>
	<1332780976.28414.130.camel@ted> <20120328185458.GB32193@denix.org>
	<1332969104.28414.206.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332969104.28414.206.camel@ted>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] qemu.inc: Use '=' for IMAGE_FSTYPES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 28 Mar 2012 23:38:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 28, 2012 at 10:11:44PM +0100, Richard Purdie wrote:
> On Wed, 2012-03-28 at 14:54 -0400, Denys Dmytriyenko wrote:
> > On Mon, Mar 26, 2012 at 05:56:16PM +0100, Richard Purdie wrote:
> > > On Mon, 2012-03-26 at 09:25 -0700, Tom Rini wrote:
> > > > On Mon, Mar 26, 2012 at 10:15:13AM +0100, Richard Purdie wrote:
> > > > > On Fri, 2012-03-23 at 10:35 -0700, Tom Rini wrote:
> > > > > > As per
> > > > > > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019772.html
> > > > > > a machine conf file should use '=' to set IMAGE_FSTYPES.
> > > > > > 
> > > > > > Signed-off-by: Tom Rini <trini@ti.com>
> > > > > > ---
> > > > > >  meta/conf/machine/include/qemu.inc |    2 +-
> > > > > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > > > > 
> > > > > As someone pointed out, what I mentioned in that email sadly doesn't
> > > > > work although it would be nice if they did. I suspect this is why we're
> > > > > using += since:
> > > > 
> > > > We aren't using += today.  We (openembedded-core) use ?=.  meta-intel
> > > > uses += and meta-ti is mixed (and I don't have meta-fsl-* handy).
> > > > 
> > > > > > - The machine needs to say 'I need or support the following formats'
> > > > > 
> > > > > so the machine ensures those formats exist at a minimum:
> > > > > 
> > > > > IMAGE_FSTYPES += "xxxx"
> > > > > 
> > > > > > - The distro needs to say 'I always want format X'
> > > > > 
> > > > > so the distro can do:
> > > > > 
> > > > > IMAGE_FSTYPES += " yyy"
> > > > > 
> > > > > > - The user needs to say 'I know best, give me only format X'
> > > > > 
> > > > > This one is the problem case so the user has to use overrides:
> > > > > 
> > > > > IMAGE_FSTYPES_override = "X"
> > > > > 
> > > > > (where override can be MACHINE or forcevariable)
> > > > > 
> > > > > > - The user needs to say 'I know best, give me what you support + X'
> > > > > 
> > > > > IMAGE_FSTYPES += " X"
> > > > > 
> > > > > 
> > > > > Whilst I think that is less than ideal since it forces use of overrides
> > > > > in local.conf to override, changing the += in machine conf files doesn't
> > > > > gain us much, it just breaks += in local.conf.
> > > > > 
> > > > > I'm open to other feedback though...
> > > > 
> > > > Well, I suggested ??= / ?= and posted some results from bitbake -e...
> > > 
> > > Ok. += plays out as above. I realise its not what is in qemu.inc, it is
> > > used in meta-intel though which I looked at after qemu.inc and I guess
> > > has confused me.
> > > 
> > > With ?= in machine.conf:
> > > 
> > > The user defined IMAGE_FSTYPES would override the machine ones. Distro
> > > can still append to it. The downside is a user append would not work out
> > > as expected.
> > > 
> > > So the question is which is the more user expected behaviour?
> > > 
> > > =+ makes overwriting IMAGE_FSTYPES hard
> > > 
> > > ?= makes appending IMAGE_FSTYPES hard
> > > 
> > > I suspect a user is more likely to want to append than overwrite.
> > > Getting an append to work with ?= is extremely non-obvious, even worse
> > > syntax than the =+ overwriting case with overrides.
> > > 
> > > So bottom line, I'm tempted to recommend we use =+.
> > > 
> > > Further thoughts?
> > 
> > Richard,
> > 
> > So, what is the subtle difference between += that we started with and =+ that 
> > you recommended at the end? I realize those are for append and prepend, but 
> > are they handled any different? Was your recommendation to use =+ at the end, 
> > instead of += that was used originally, based on some specifics? Thanks.
> 
> I'm using += and =+ interchangeably. The contrast was with ?= which I
> argued against. Order in this case doesn't matter and I have no
> preference over += or =+, it simply doesn't matter.

So I guess I'll spin everything one more time and drop the meta-intel
version and we'll just use += since that's the common one.

-- 
Tom


