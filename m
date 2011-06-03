Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QSTrN-0007Pd-Dr for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 14:52:17 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QSToI-0003bN-UY
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 14:49:07 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE83048.1030100@linux.intel.com>
References: <cover.1307042670.git.otavio@ossystems.com.br>
	<21881aba9031cefb72fcc33cca9d146169f344e9.1307042670.git.otavio@ossystems.com.br>
	<4DE83048.1030100@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 03 Jun 2011 13:49:03 +0100
Message-ID: <1307105343.2529.262.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/4] xf86-driver-common.inc: remove .la files to	avoid unpackaged warning
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
X-List-Received-Date: Fri, 03 Jun 2011 12:52:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 17:52 -0700, Saul Wold wrote:
> On 06/02/2011 12:25 PM, Otavio Salvador wrote:
> > +do_install_append () {
> > +    # driver's la files are not packaged
> > +    rm -f ${D}${libdir}/xorg/modules/drivers/*.la
> > +}
>
> Would it not be better to package them in the -dev package instead of 
> throwing them away?

Not really.  The .la files for the drivers aren't good for anything: you
aren't ever going to link against them.

p.




