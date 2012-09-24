Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>)
	id 1TG9JC-0003Ro-BE; Mon, 24 Sep 2012 16:06:50 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TG96q-0004Rx-Ie; Mon, 24 Sep 2012 15:54:04 +0200
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 24 Sep 2012 14:54:03 +0100
In-Reply-To: <20120924134810.GC3295@jama.jama.net>
References: <20120924103553.BC0E91038B@opal>
	<20120924134810.GC3295@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348494844.31293.39.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Phil Blundell : libcap: respect ${base_sbindir}
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
X-List-Received-Date: Mon, 24 Sep 2012 14:06:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 15:48 +0200, Martin Jansa wrote:
> On Mon, Sep 24, 2012 at 10:35:53AM +0000, git@git.openembedded.org wrote:
> >  do_install() {
> > -	oe_runmake install DESTDIR="${D}" prefix="${prefix}"
> > +	oe_runmake install DESTDIR="${D}" prefix="${prefix}" SBINDIR="${D}${base_sbindir}"
> >  }
> 
> This breaks packaging:
> 
> /sbin/capsh /sbin/getcap /sbin/getpcaps /sbin/setcap
> were moved from /usr/sbin/ and now are included in PN instead of PN-bin

Ah, looks like that should have been ${sbindir} not ${base_sbindir}.
Does it work for you if you make that change?

p.




