Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QMJ8K-0001lR-Hx for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 14:12:16 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QMJ5Z-0004YD-CD
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 14:09:25 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305633770.3424.229.camel@rex>
References: <1305633118.2429.188.camel@phil-desktop>
	<1305633770.3424.229.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 17 May 2011 13:09:24 +0100
Message-ID: <1305634164.2429.193.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] image-prelink: remove hardcoded reference to /usr/sbin
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
X-List-Received-Date: Tue, 17 May 2011 12:12:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 13:02 +0100, Richard Purdie wrote:
> On Tue, 2011-05-17 at 12:51 +0100, Phil Blundell wrote:
> > ---
> >  meta/classes/image-prelink.bbclass |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
> > index ee0951c..cefd983 100644
> > --- a/meta/classes/image-prelink.bbclass
> > +++ b/meta/classes/image-prelink.bbclass
> > @@ -21,7 +21,7 @@ prelink_image () {
> >  	fi
> >  
> >  	# prelink!
> > -	${STAGING_DIR_NATIVE}/usr/sbin/prelink --root ${IMAGE_ROOTFS} -amR
> > +	${STAGING_DIR_NATIVE}${sbindir}/prelink --root ${IMAGE_ROOTFS} -amR
> >  
> >  	# Remove the prelink.conf if we had to add it.
> >  	if [ "$dummy_prelink_conf" == "true" ]; then
> 
> I suspect this should be ${sbindir_native} there?

Ah yes, I guess it should.  I'll verify that that works and send a new
patch later.  

On a similar subject, image-prelink also seems to assume that
${sysconfdir} == ${sysconfdir_native} == "/etc".  That isn't actually
causing me a problem at the moment, because the assumption does happen
to hold for my configuration, but I guess it could do with fixing at
some point.

p.



