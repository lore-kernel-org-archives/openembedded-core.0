Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7396C1BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:10:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 636E52229C;
	Mon, 18 Mar 2019 13:10:06 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Mon, 18 Mar 2019 13:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:cc:subject:content-type; s=fm1; bh=5Ys3qccJfKn7gLqyomTyj/jocDNo
	f2PiohYH3bkwh9Y=; b=IJCa6YSpq05v0/vmbdlVgMkJdGOTa1t0mi+1VEmwlM50
	FKbGMeE3pl+Y5Nurc1vegS+tmHHBY9dBSpjScj0t7y+cURwGETjQpaa/6IkBacq7
	4II4yC4NfdZdeDC6Abs0/Y+79kcRUNRkmFvhgiXxyre2iEiXVzjbpulWl+Sf4Piv
	iB7aAkZP7kZH5+/Ub6cbXtr5OSO28QMUtbNkFECqFuXU8qdDzmUehTpD76xmWhKF
	4G7vdpyMFLNr+BaoBv1cG5bwgN1IWfooE/OVuTt+P0ECyWHJCfFV8r3jSKYPLqD0
	9k9xeHkuu9uwebs1NGrR8j5Ghh1+YdKAQLTV/qlnxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5Ys3qc
	cJfKn7gLqyomTyj/jocDNof2PiohYH3bkwh9Y=; b=j3bVl6ij26IrXqjH6TK4sh
	nqmGMrEZT4jSWVF84kYW92DIr60K7zItsWQXenQzuli7tJI3XS8t1bnNJEpFnfsE
	rZ5yMPrlS4tAMyyERK4EaqmTUk2iYK+cVquxUmSzoevJAmtgCjO9bD0Y8IaHdZfm
	PN3MB/iH9hH1vttRe6eiLuf7Tqrg8LBDMWXgbbf0bQWotomrZKUYWjFKHipA0jJf
	1xNU50QIZdAdze0U0Z2xAOHcj7F+JgX1Kpv2xjDXJ1oqN2NKWMX3Zs2332u7nNEt
	n4lqq6UXPZ45pdyP2uzzwqIb2tWTlHITFy9bOEfJFrqDlB6rSShYFxQpA+RIi24Q
	==
X-ME-Sender: <xms:7dCPXJTqNnpKz3H-nNbLz_t64azMh_nXaBp4uAi9utRh2AtyS5dvgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddriedugdelkecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfrfgruhhl
	uceurghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecuffhomh
	grihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucfrrghrrghmpehmrghilhhfrhho
	mhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpe
	dt
X-ME-Proxy: <xmx:7dCPXHDOt5l8CxGtqgm7TzgrotONZpkq3hR42g4AiWdzkH36VE2XVw>
	<xmx:7dCPXJ1ypseng92K0yBSlRGd5Yk9sueZuhnMm4-eVMQmOKr9ZSW9fA>
	<xmx:7dCPXFXkkmp9VXSxz283QzFl3ajJiuCyV-0TRuzmU18580hlhs2uHQ>
	<xmx:7tCPXOdGz5GoWjhDbMUcOF4R0AxME-d1LTZqTQASg2f5vz51fLOryA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A3E0F7C651; Mon, 18 Mar 2019 13:10:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-976-g376b1f3-fmstable-20190314v3
Mime-Version: 1.0
X-Me-Personality: 84186096
Message-Id: <6d2b4813-483b-477e-8c20-5ebc2195a73d@www.fastmail.com>
In-Reply-To: <CAJTo0Lbbcaexxy-PXpbmZhicdrR0z1pfi7Qu0St6N7CNT0VgEA@mail.gmail.com>
References: <20190318165138.30402-1-paul@betafive.co.uk>
	<CAJTo0Lbbcaexxy-PXpbmZhicdrR0z1pfi7Qu0St6N7CNT0VgEA@mail.gmail.com>
Date: Mon, 18 Mar 2019 13:10:04 -0400
From: "Paul Barker" <paul@betafive.co.uk>
To: "Ross Burton" <ross.burton@intel.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: Add tzdata-all package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2019 17:10:05 -0000
Content-Type: text/plain

On Mon, 18 Mar 2019, at 17:02, Burton, Ross wrote:
> I'd prefer that installing 'tzdata' installed everything, and then
> there were other pieces for subsets.  We learnt this the hard way from
> people installing "python" and wondering why bits of the standard
> library were missing.

That is a good argument. I just checked the difference in image sizes though (from buildhistory):

core-image-minimal + tzdata = 8,868 kB
core-image-minimal + tzdata-all = 15,788 kB

So it's probably not an appropriate change for everyone.

> 
> Ross
> 
> On Mon, 18 Mar 2019 at 17:01, Paul Barker <paul@betafive.co.uk> wrote:
> >
> > The tzdata-all package provides a simple way of ensuring all timezones
> > are supported in an image.
> >
> > Signed-off-by: Paul Barker <paul@betafive.co.uk>
> > ---
> >  meta/recipes-extended/timezone/tzdata.bb | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
> > index 7542ce52d2..e419296530 100644
> > --- a/meta/recipes-extended/timezone/tzdata.bb
> > +++ b/meta/recipes-extended/timezone/tzdata.bb
> > @@ -82,7 +82,14 @@ pkg_postinst_${PN} () {
> >
> >  PACKAGES = "tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
> >      tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
> > -    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
> > +    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific tzdata-all"
> > +
> > +ALLOW_EMPTY_tzdata-all = "1"
> > +RDEPENDS_tzdata-all = " \
> > +    tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
> > +    tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
> > +    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific \
> > +    "
> >
> >  FILES_tzdata-africa += "${datadir}/zoneinfo/Africa/*"
> >  RPROVIDES_tzdata-africa = "tzdata-africa"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

