Return-Path: <matthias.schiffer@ew.tq-group.com>
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id C2D30744F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 08:38:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.54,471,1534802400"; 
   d="scan'208";a="5001442"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 06 Nov 2018 09:38:50 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Tue, 06 Nov 2018 09:38:50 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 06 Nov 2018 09:38:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1541493530; x=1573029530;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=FLc9w4kzRa1mxEYXsaxpiWzcdmJZ6Le68F3YqTrsd6c=;
	b=Mkph0oKL09kHmidW6mS8LCfsNM7PM9ydm9b+zU5kep2psV+U2typBsMp
	BN41IP+8YlYujh5OWtHR6z1EGCwU0Ei4QkxHwyWN37yWEQzaOhr0V0kHy
	+BSO+QEqiEn9NzDb13afQ4gh84ZbP12o0Hx8JJzp2m68QRI4PTXl8w+Oh
	scHIeLxgHNGHG16c2gAtmpLNPqRDPXbNGcSu+nFcfoT5Odu2R2AyMUszL
	gtX+RoD6GrBYBLaFHn+/GWRs3229Kus2mpgJiwREizwzjFZKliJqQxJDh
	IIfsIfhz7cOX6Xd/WjwYe53D+jdleWn53vtWgWp3cubNZxDKP2xZPWWJd Q==;
X-IronPort-AV: E=Sophos;i="5.54,471,1534802400"; 
   d="scan'208";a="5001441"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 06 Nov 2018 09:38:50 +0100
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 15ADC280065;
	Tue,  6 Nov 2018 09:39:03 +0100 (CET)
Message-ID: <66021f79b63b6f4ac098263c100df4d12f87ac08.camel@ew.tq-group.com>
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 06 Nov 2018 09:38:47 +0100
In-Reply-To: <CAJ86T=WzkZ6zkEykAA4v_2dQ23kF=SkxHK1Q8Dh6h-+Xx-f=ow@mail.gmail.com>
References: <20181102143927.15387-1-matthias.schiffer@ew.tq-group.com>
	<8ba204af82c54d23805deefb5197dd6f@XBOX04.axis.com>
	<8897ab754bea0fda7195a851b2d19695dd7553e9.camel@linuxfoundation.org>
	<CAJ86T=WHs0P3+o8_k=FJvM4PTkQT9ggWZfc0Hejieg+zzBH+Tg@mail.gmail.com>
	<71b9588f36d8a6932687bace51faab7b64e13a7c.camel@ew.tq-group.com>
	<b56e02a25bf0bd1b833769fe0b0142655a4ee233.camel@ew.tq-group.com>
	<CAJ86T=WzkZ6zkEykAA4v_2dQ23kF=SkxHK1Q8Dh6h-+Xx-f=ow@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: avoid 'find -ignore_readdir_race -delete'
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
X-List-Received-Date: Tue, 06 Nov 2018 08:38:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-11-06 at 00:25 -0800, Andre McCurdy wrote:
> On Tue, Nov 6, 2018 at 12:23 AM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> > 
> > On Mon, 2018-11-05 at 09:36 +0100, Matthias Schiffer wrote:
> > > On Fri, 2018-11-02 at 20:28 -0700, Andre McCurdy wrote:
> > > > On Fri, Nov 2, 2018 at 8:43 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > 
> > > > > On Fri, 2018-11-02 at 15:19 +0000, Peter Kjellerstedt wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: openembedded-core-bounces@lists.openembedded.org
> > > > > > > <openembedded-
> > > > > > > core-bounces@lists.openembedded.org> On Behalf Of
> > > > > > > matthias.schiffer@ew.tq-group.com
> > > > > > > Sent: den 2 november 2018 15:39
> > > > > > > To: openembedded-core@lists.openembedded.org
> > > > > > > Subject: [OE-core] [PATCH] base.bbclass: avoid 'find -
> > > > > > > ignore_readdir_race -delete'
> > > > > > > 
> > > > > > > From: Matthias Schiffer <
> > > > > > > matthias.schiffer@ew.tq-group.com>
> > > > > > > 
> > > > > > > Until recent versions of findutils, -ignore_readdir_race
> > > > > > > did
> > > > > > > not
> > > > > > > work
> > > > > > > correctly with -delete. This led to spurious build
> > > > > > > failures
> > > > > > > when
> > > > > > > files
> > > > > > > disappeared; specifically this was seen due to
> > > > > > > do_configure
> > > > > > > and
> > > > > > > do_populate_lic running concurrently for packages with
> > > > > > > ${B}
> > > > > > > ==
> > > > > > > ${WORKDIR}:
> > > > > > > 
> > > > > > >    find: '.../sstate-build-populate_lic': No such file or
> > > > > > > directory
> > > > > > > 
> > > > > > > As the find command of the host system is used here, we
> > > > > > > can't
> > > > > > > ensure that
> > > > > > > the used version contains the fix. Work around the issue
> > > > > > > by
> > > > > > > passing
> > > > > > > the
> > > > > > > output of find to 'rm -f' instead of using -delete.
> > > > > > > 
> > > > > > > Signed-off-by: Matthias Schiffer <
> > > > > > > matthias.schiffer@ew.tq-group.com
> > > > > > > > 
> > > > > > > 
> > > > > > > ---
> > > > > > > 
> > > > > > > It would be great if this patch could be backported to
> > > > > > > all
> > > > > > > versions
> > > > > > > back to Rocko, as our current setup is still based on
> > > > > > > Rocko.
> > > > > > > 
> > > > > > >  meta/classes/base.bbclass | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/meta/classes/base.bbclass
> > > > > > > b/meta/classes/base.bbclass
> > > > > > > index df11c8b270..5ffd8396e3 100644
> > > > > > > --- a/meta/classes/base.bbclass
> > > > > > > +++ b/meta/classes/base.bbclass
> > > > > > > @@ -303,7 +303,7 @@ base_do_configure() {
> > > > > > >                     if [ "${CLEANBROKEN}" != "1" -a \( -e
> > > > > > > Makefile
> > > > > > > -o -e makefile -o -e GNUmakefile \) ]; then
> > > > > > >                             oe_runmake clean
> > > > > > >                     fi
> > > > > > 
> > > > > > You might want to include a comment here explaining why rm
> > > > > > -f
> > > > > > is
> > > > > > used instead of -delete, or someone might come along and
> > > > > > optimize
> > > > > > the
> > > > > > code...
> > > > > 
> > > > > We should detail which versions of findutils have the issue
> > > > > as
> > > > > ultimately it would be nice to use the simpler command. I'm
> > > > > curious
> > > > > how
> > > > > many of the distros we support have the problem.
> > > > 
> > > > There's a test case in the patch proposed to fix the issue:
> > > > 
> > > >   https://savannah.gnu.org/bugs/?52981
> > > >   https://savannah.gnu.org/bugs/download.php?file_id=43119
> > > > 
> > > > Regarding the proposed patch for base.bbclass, xargs should
> > > > generally
> > > > always be called with --no-run-if-empty, unless there's a clear
> > > > reason
> > > > not to.
> > > 
> > > Do we generally assume that we have a GNU xargs with --no-run-if-
> > > empty
> > > support? Calling rm -f without further arguments at least doesn't
> > > cause
> > > an error, so --no-run-if-empty is only a minor optimization in
> > > this
> > > case.
> > 
> > 
> > I've grepped bitbake, openembedded-core and meta-openembedded for
> > --no-
> > run-if-empty, and there is only a single instance in the whole code
> > base - which is conditionalized so that the option is not passed on
> > Darwin. I take from this that --no-run-if-empty is not acceptable
> > in
> > OpenEmbedded to ensure portability.
> 
> Did you grep for the short form too, ie -r ?

Thanks for the pointer; including the short form, I've found a second
instance. Still, in the vast majority of xargs commands it is avoided,
so I guess I should the same to stay consistent with the existing
scripts.

> 
> > > 
> > > I'll send an updated patch with the proposed changes later today.
> > > 
> > > Kinds regards,
> > > Matthias
> > > 


