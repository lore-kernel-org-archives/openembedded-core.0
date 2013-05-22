Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 70EFC60810
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 12:51:15 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Uf8Vg-0001wX-1q; Wed, 22 May 2013 14:51:16 +0200
Message-ID: <1369227075.6695.89.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 May 2013 13:51:15 +0100
In-Reply-To: <CAJTo0LYC2Xa=31R=eCACZDFJkWT8NBSmHVkQnL+x7jausCkDbw@mail.gmail.com>
References: <1369220223-28298-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1369220302.6695.72.camel@phil-desktop.brightsign>
	<CAJTo0LYC2Xa=31R=eCACZDFJkWT8NBSmHVkQnL+x7jausCkDbw@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] guile: added runtime dependency on glibc-gconv-iso8859-1
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
X-List-Received-Date: Wed, 22 May 2013 12:51:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-22 at 13:05 +0100, Burton, Ross wrote:
> On 22 May 2013 11:58, Phil Blundell <pb@pbcl.net> wrote:
> > On Wed, 2013-05-22 at 13:57 +0300, Bogdan Marinescu wrote:
> >> +RDEPENDS_${PN} = "glibc-gconv-iso8859-1"
> >
> > That will make it unbuildable with anything other than (e)glibc.  Is
> > this ok?
> 
> Presumably in this case libiconv will be used.  Is there a standard
> way of depending on a specific encoding from either eglibc or
> libiconv?

I had thought we had virtual-gconv-ENCODING providers but apparently
that's not the case.  So I think the answer at the moment is probably
no.  I guess we should add something like that.

p.



