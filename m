Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SCDdH-0003GA-1e
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 19:23:03 +0200
Received: by yhjj56 with SMTP id j56so3976641yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 10:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=XZQ7oUt7cVNeNVsUTr+VgLirl73q/mGaamcKO4Tshwo=;
	b=a2jiZKpWmC66I310ipmH0EWuTTtyV1rJVdt8ZxSZZ/7Nguj2XJEbFvX2oGCwza/1Uc
	hrd6kmxV7nfPK/U89MuDDT7B+D+fjL1ENgDOv3JSv382A+Ef0fc1+2NJY/Z7FSdRjJia
	9RBGUnTWhx1WjsA+bLYaoZ788epMXvDURYEImkWOQfv4pqJL9se4xrICMl8Eyrx+hx24
	AMo2DplLPXUvkeEjyCr9gHeTohr0kt+/eK+2vtPVvh5M7hQCTbAxY9OpFLe6JjChVVV8
	JADcBslXH+AvuNssMzUceaGQDHEN3lBAG2+Xb2k4mXvdXwyY0zI3YpYsyN/3pwF6vBh7
	0qFw==
Received: by 10.60.3.9 with SMTP id 9mr27679746oey.49.1332782042518;
	Mon, 26 Mar 2012 10:14:02 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id v9sm16915235obo.9.2012.03.26.10.14.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 10:14:01 -0700 (PDT)
Date: Mon, 26 Mar 2012 10:13:59 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120326171359.GE21518@bill-the-cat>
References: <1332524132-24689-1-git-send-email-trini@ti.com>
	<1332753313.28414.91.camel@ted>
	<20120326162531.GD21518@bill-the-cat>
	<1332780976.28414.130.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332780976.28414.130.camel@ted>
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
X-List-Received-Date: Mon, 26 Mar 2012 17:23:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 26, 2012 at 05:56:16PM +0100, Richard Purdie wrote:
> On Mon, 2012-03-26 at 09:25 -0700, Tom Rini wrote:
> > On Mon, Mar 26, 2012 at 10:15:13AM +0100, Richard Purdie wrote:
> > > On Fri, 2012-03-23 at 10:35 -0700, Tom Rini wrote:
> > > > As per
> > > > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019772.html
> > > > a machine conf file should use '=' to set IMAGE_FSTYPES.
> > > > 
> > > > Signed-off-by: Tom Rini <trini@ti.com>
> > > > ---
> > > >  meta/conf/machine/include/qemu.inc |    2 +-
> > > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > > 
> > > As someone pointed out, what I mentioned in that email sadly doesn't
> > > work although it would be nice if they did. I suspect this is why we're
> > > using += since:
> > 
> > We aren't using += today.  We (openembedded-core) use ?=.  meta-intel
> > uses += and meta-ti is mixed (and I don't have meta-fsl-* handy).
> > 
> > > > - The machine needs to say 'I need or support the following formats'
> > > 
> > > so the machine ensures those formats exist at a minimum:
> > > 
> > > IMAGE_FSTYPES += "xxxx"
> > > 
> > > > - The distro needs to say 'I always want format X'
> > > 
> > > so the distro can do:
> > > 
> > > IMAGE_FSTYPES += " yyy"
> > > 
> > > > - The user needs to say 'I know best, give me only format X'
> > > 
> > > This one is the problem case so the user has to use overrides:
> > > 
> > > IMAGE_FSTYPES_override = "X"
> > > 
> > > (where override can be MACHINE or forcevariable)
> > > 
> > > > - The user needs to say 'I know best, give me what you support + X'
> > > 
> > > IMAGE_FSTYPES += " X"
> > > 
> > > 
> > > Whilst I think that is less than ideal since it forces use of overrides
> > > in local.conf to override, changing the += in machine conf files doesn't
> > > gain us much, it just breaks += in local.conf.
> > > 
> > > I'm open to other feedback though...
> > 
> > Well, I suggested ??= / ?= and posted some results from bitbake -e...
> 
> Ok. += plays out as above. I realise its not what is in qemu.inc, it is
> used in meta-intel though which I looked at after qemu.inc and I guess
> has confused me.
> 
> With ?= in machine.conf:
> 
> The user defined IMAGE_FSTYPES would override the machine ones. Distro
> can still append to it. The downside is a user append would not work out
> as expected.
> 
> So the question is which is the more user expected behaviour?
> 
> =+ makes overwriting IMAGE_FSTYPES hard
> 
> ?= makes appending IMAGE_FSTYPES hard
> 
> I suspect a user is more likely to want to append than overwrite.
> Getting an append to work with ?= is extremely non-obvious, even worse
> syntax than the =+ overwriting case with overrides.
> 
> So bottom line, I'm tempted to recommend we use =+.

I think for the upcoming release, =+ is good enough and we can talk
about adding further variables after if it's still too complicated.  So,
now where's the repo that documenting these examples should go in?

-- 
Tom


