Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVlpe-0000t0-H2 for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 18:49:10 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVlYU-0006je-ND; Fri, 26 Apr 2013 18:31:26 +0200
Message-ID: <1366993885.14512.118.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Apr 2013 17:31:25 +0100
In-Reply-To: <CAJTo0Lagt8VJQ-ru_OE07XUPKo-JP8tHL2TEEdqEahj0tUt_ZQ@mail.gmail.com>
References: <1366976132.14512.100.camel@phil-desktop.brightsign>
	<CAJTo0Lagt8VJQ-ru_OE07XUPKo-JP8tHL2TEEdqEahj0tUt_ZQ@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: Avoid build failure if no modules were installed
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
X-List-Received-Date: Fri, 26 Apr 2013 16:49:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-04-26 at 12:43 +0100, Burton, Ross wrote:
> On 26 April 2013 12:35, Phil Blundell <pb@pbcl.net> wrote:
> > If pango is configured --with-included-modules then the modules
> > directory may not exist.  This leads to python traceback spew and
> > a build failure when trying to run do_split_packages().
> >
> > Fix this by passing recursive=True to do_split_packages(), which has
> > the side-effect of making it ignore nonexistent directories.
> 
> I thought I fixed this:

Oh yes, so you did; apparently I somehow failed to notice that.  Please
ignore my patch then.

p.




