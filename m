Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UcIJb-0005lq-C1 for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 18:43:13 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UcI22-000642-1c; Tue, 14 May 2013 18:24:54 +0200
Message-ID: <1368548693.6920.70.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 May 2013 17:24:53 +0100
In-Reply-To: <CAMKF1srAGRK=9BP5VrqhH50VrtWb+PFL5G5P-EEBPefb16xxTA@mail.gmail.com>
References: <1368513918-16448-1-git-send-email-raj.khem@gmail.com>
	<1368525912.25898.15.camel@ted>
	<CAMKF1srAGRK=9BP5VrqhH50VrtWb+PFL5G5P-EEBPefb16xxTA@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pam: Add libtirpc to build dependencies
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
X-List-Received-Date: Tue, 14 May 2013 16:43:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-14 at 07:33 -0700, Khem Raj wrote:
> 
> 
> On Tuesday, May 14, 2013, RicharPurdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2013-05-13 at 23:45 -0700, Khem Raj wrote:
> >> libtirpc is looked for by configure and if found
> >> its enabled. So lets make it consistent and enable
> >> it always
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta/recipes-extended/pam/libpam_1.1.6.bb |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > What is the benefit of this dependency?
> 
> 
> When building from sstate the build of libpam would fail during
> configure if the machine who populated sstate had libtirpc staged
> before building libpam and with high parallelism its quite often 

Does this mean that every image which uses pam will also drag in tirpc?
What's the cost in space and time for that?

p.




