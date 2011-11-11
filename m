Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1ROr1M-0008Jv-As
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 14:19:52 +0100
Received: from ad.chargestorm.se (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Fri, 11 Nov 2011 14:13:31 +0100
Date: Fri, 11 Nov 2011 14:13:32 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20111111131331.GB6853@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1320998007.git.anders@chargestorm.se>
	<cc21f9c195a7c79de19f0f59e41735cbbaa7f434.1320998007.git.anders@chargestorm.se>
	<4EBD1D1B.2090805@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4EBD1D1B.2090805@eukrea.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC PATCH 1/1] busybox: update to 1.19.3
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
X-List-Received-Date: Fri, 11 Nov 2011 13:19:52 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Eric B=E9nard <eric@eukrea.com> [111111 14:04]:
> Hi Anders,

> Le 11/11/2011 09:17, Anders Darander a =E9crit :
> > The updates to patch busybox-udhcpc-no_deconfig.patch is not fully veri=
fied.

> > Signed-off-by: Anders Darander<anders@chargestorm.se>

> you may also need to add the fixes for 1.19.3 :
> http://busybox.net/downloads/fixes-1.19.3/

Thanks for pointing this out.
I might add the getty-patch in a later respin of this patch. (In case
someone build without CBAUD being defined. I haven't check in which
circumstances this might occur, though).

The only other patch there is only adding an extra line to a comment.
Might be nice if someone actually wants to use the information in that
comment, but not necessary to add for us.

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB / eStorm AB


