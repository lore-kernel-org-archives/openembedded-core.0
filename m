Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtkL5-0000bT-9o
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 19:55:39 +0200
Received: from localhost (85.231.30.150) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	19:51:00 +0200
Date: Wed, 17 Aug 2011 19:51:11 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110817175111.GB2222@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1313503017.git.anders@chargestorm.se>
	<0723e2f710db1680c71a1f6f848563cfcc6b3cdc.1313503017.git.anders@chargestorm.se>
	<1313590095.13995.38.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1313590095.13995.38.camel@rex>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/5] qt4: allow a reduction in build time
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
X-List-Received-Date: Wed, 17 Aug 2011 17:55:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Richard Purdie <richard.purdie@linuxfoundation.org> [110817 16:09]:
> On Tue, 2011-08-16 at 15:57 +0200, Anders Darander wrote:
> >          phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
> >          phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
> > -        do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
> > +        try:
> > +                do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
> > +        except:
> > +                pass

> Please use some actual test here, not a general try/except/pass. This
> reason is that is some failure we want to know about happens, this will
> hide it as the code stands.

> The rest of the patch is ok, this just needs tweaking.

An updated patch is available at the same pull tree. I've also sent a
new pull request titled: [PATCH v3 0/1] Qt4: reduce build time.

In this updated version, I'll check if the path in phrasebook_dir
exists, and depending on this outcome, I'll call do_split_packages.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB	


