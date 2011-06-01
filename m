Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1QRf1k-0004pT-B9; Wed, 01 Jun 2011 08:35:36 +0200
Received: by wwb17 with SMTP id 17so4827984wwb.24
	for <multiple recipients>; Tue, 31 May 2011 23:32:00 -0700 (PDT)
Received: by 10.216.141.1 with SMTP id f1mr6860679wej.35.1306909919863;
	Tue, 31 May 2011 23:31:59 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g2sm427173weg.14.2011.05.31.23.31.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 23:31:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=mR7KKfXxiwiF1ZFA6epxx8hfaug@mail.gmail.com>
Date: Wed, 1 Jun 2011 08:31:56 +0200
Message-Id: <129A9155-4B39-48EA-86A6-39EFB55D5AE6@dominion.thruhere.net>
References: <BANLkTi=mR7KKfXxiwiF1ZFA6epxx8hfaug@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: Parsing errors
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
X-List-Received-Date: Wed, 01 Jun 2011 06:35:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jun 2011, om 00:45 heeft Khem Raj het volgende geschreven:

> Hi
>=20
> In slugos when I updated to today's snapshot of oe-core  and meta-oe
> its giving me this
>=20
> ERROR: Information not available for target 'all-linux'
>=20
>                                                  | ETA:  00:00:37
> ERROR: Error parsing
> =
/home/kraj/work/slugos/meta-openembedded/meta-oe/recipes-core/systemd/syst=
emd-compat-units.bb:
> Failure expanding variable SITEINFO_ENDIANESS, expression was
> ${@siteinfo_get_endianess(d)} which triggered exce


ENDIANNESS is spelled with 3 Ns, so that might explain your problems. =
See

=
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D87dc166bad=
e8722af4076c8644cac6a0a437826f
=
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D45fc36a32f=
b23c513833d7e27fb4b9cd8be68fb5

regards,

Koen=


