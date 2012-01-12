Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RlRSb-0002I0-B2
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 21:41:21 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RlRLM-0002BD-6P
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 21:33:52 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4F0F42D9.4040501@linux.intel.com>
References: <cover.1326355020.git.xiaofeng.yan@windriver.com>
	<d3939f8f64b50aca9bf23e9c017160d32cd814f6.1326355020.git.xiaofeng.yan@windriver.com>
	<4F0F42D9.4040501@linux.intel.com>
Date: Thu, 12 Jan 2012 20:33:44 +0000
Message-ID: <1326400424.3360.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 3/3] pango.inc: add directory "/etc/pango"
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
X-List-Received-Date: Thu, 12 Jan 2012 20:41:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-12 at 12:30 -0800, Saul Wold wrote:
> On 01/12/2012 12:12 AM, Xiaofeng Yan wrote:
> > -FILES_${PN} = "/etc/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
> > +FILES_${PN} += "${syscondir}/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
> Is this too general?  Should it be ${sysconfdir}/pango?

"${sysconfdir}" is in the default FILES_${PN} anyway.  (Also,
"${syscondir}/*" won't match anything since there is no such variable.)

So this change is largely benign but it won't accomplish much.

p.




