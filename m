Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4E00076FDE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 22:46:44 +0000 (UTC)
Received: by padhy1 with SMTP id hy1so9810616pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 15:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=QTs/rirYoXhHWpND2/HkaDXdeP86N2WKJj16W82ZS8Q=;
	b=hi0j4cDzOpWhxr0C/K5UAyTO5Nr5ZRbs6ItiYSwq/Plm1TA16iIr4uXhwhzH9zvy4R
	5H4P2w+mIv95hAZ++/e3SmMjvDWxSDco4UIcBrbcmy26gY1TxZwsUxw0epht140PJJGB
	Nb3Us46aUxXhq6cZgCHjs3uK+GgvxgFJCu1pZ+bnQ6086A1CHnL0UgKIrYxn+kvpnj8Z
	LQkKpxXN79Ou6lHXhft0cChqg4fWFNBX/o2ISYVDiioyYvP3mtb9o8cUW2p8khnR8HSN
	jfKIzb9rhGGdDtaY1Ah0s4DAlBdc8KqBQpP2bOHDElR1t09SBbNg2AZHMoGt9l8QkCw4
	RJrw==
X-Received: by 10.68.221.198 with SMTP id qg6mr50285704pbc.147.1441147605202; 
	Tue, 01 Sep 2015 15:46:45 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:49fd:b69d:583d:d543?
	([2601:646:8601:4580:49fd:b69d:583d:d543])
	by smtp.gmail.com with ESMTPSA id
	lg7sm12108369pbc.1.2015.09.01.15.46.44
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Sep 2015 15:46:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
Date: Tue, 1 Sep 2015 15:46:43 -0700
Message-Id: <255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<20150901215512.GE2458@jama>
	<CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Tue, 01 Sep 2015 22:46:48 -0000
X-Groupsio-MsgNum: 70450
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B390EBA7-FC16-40CC-B4AF-B20FCEB9ED02";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B390EBA7-FC16-40CC-B4AF-B20FCEB9ED02
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 1, 2015, at 3:05 PM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>=20
> On Tue, Sep 1, 2015 at 6:55 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> I hate to say it, but for meta-oe and meta-qt5 I would like to use
>> gerrit - it's great to see all related information (all revisions of =
the
>> patch, all review comments, all results of verification builds) in
>> single location from where you do the actual submissions to official
>> branch when all criteria are satisfied.
>=20
> Me too; we have been using Gerrit for patch management for a while and
> it works very well.
>=20
> If you want, we can host it at our server, by the way.

hmm can we use gerrit.openembedded.org or review.openembedded.org ?
may be redirected to a different hosting area underneath.

>=20
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


--Apple-Mail=_B390EBA7-FC16-40CC-B4AF-B20FCEB9ED02
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXmKtMACgkQuwUzVZGdMxRfXwCgiWMMDrHOFu/VO2WvmIQ9+uSy
sbAAoIfFHUQ/RhRy067e4ns4KNnlhmOW
=Fpz+
-----END PGP SIGNATURE-----

--Apple-Mail=_B390EBA7-FC16-40CC-B4AF-B20FCEB9ED02--
