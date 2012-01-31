Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Rs8Uh-0006LU-3F
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 08:51:11 +0100
Received: from ad.chargestorm.se (81.170.208.98) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Tue, 31 Jan 2012 08:42:13 +0100
Date: Tue, 31 Jan 2012 08:42:17 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120131074216.GB4166@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1327957970-15159-1-git-send-email-steve@sakoman.com>
	<4F27108D.4090303@linux.intel.com>
	<4F2715ED.9030109@linux.intel.com>
	<CAOSpxdajJLZSuzZS5qb4UPpjuS55ZWB=RR3a0oi9hNDF8J++Fw@mail.gmail.com>
	<4F272E1A.6040702@linux.intel.com>
	<CAOSpxdZsOeOWuB5EcjFf5cN6kkMWzAaWXYue5m2OX_jwWQZEfw@mail.gmail.com>
	<4F275EB2.1020308@linux.intel.com>
	<CAOSpxdYTX7-CAxEe=7TiFV3QN_0M_LTFfgA8nq-YS3Q7zk+a3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOSpxdYTX7-CAxEe=7TiFV3QN_0M_LTFfgA8nq-YS3Q7zk+a3A@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH v4 0/3] zypper: support signed repositories
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
X-List-Received-Date: Tue, 31 Jan 2012 07:51:11 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Steve Sakoman <steve@sakoman.com> [120131 06:32]:

> On Mon, Jan 30, 2012 at 7:23 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 01/30/2012 05:39 PM, Steve Sakoman wrote:

> > I will wait to pull this until I hear back from you with another pull
> > request. =A0Thanks for digging into this, better to get it solved now t=
hen
> > figure it out later that we missed a GPLv2 dependency.

> I'll do a build with the libzypp RDEPENDS change and verify no issues,
> and then a test build with the gpg2 -> gpg change and verify that too.

> If it works, then that patch should likely get bundled with the
> introduction of a GnuPG V1.4.10 recipe import from oe-classic.

I think you'll have to modify the oe-classic recipe to use GnuPG v1.4.7,
as it seems that GnuPG was relicensed to GPLv3 in 1.4.8... At least that
was the conclusion I came to when I looked at this last summer.
(Unfortunately, I didn't have time to work through it).

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB / eStorm AB


