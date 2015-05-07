Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8AEB773D59
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 06:28:45 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so31436402pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 23:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PZ8uz1y9Tokcl7rKSfLvkf7ri7qZ9GNqK6y2PYgienM=;
	b=VrXLS+5xCJOFSg5uBPc5eollszA+Img01HppWokSHnvRyl1UPfNQi26ZZqi5vTDnNY
	vEMxeaEvXEZ3PHca1/2XbKDQ3Do/2KSswUMop5YSxwRmQRlijWaTs33SHxUnMK6KCZyf
	rMAxJqPKcepQNe+RfHCVSNNJotkk0oiq6NqvQbKRs5w5VUgR58iudpGgkCtE51RWLe52
	0oTzoUoGDXV808m5jC/IrYIWkMKDKvIAD1ZRzdgdV3/N4bteYeKC8ejPbOMV26cn4Mxa
	VlFOy/X82VbV6hEXvIKoYuDC15M+ot1GVuwbglXh20DlrPAwOzh+SZv5mOMJt1HOxtxP
	fYqQ==
X-Received: by 10.68.65.12 with SMTP id t12mr4263646pbs.118.1430980127146;
	Wed, 06 May 2015 23:28:47 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:2019:32dd:e815:cffd?
	([2601:9:3580:84c:2019:32dd:e815:cffd])
	by mx.google.com with ESMTPSA id ht10sm956417pdb.41.2015.05.06.23.28.45
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 May 2015 23:28:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1430948328-17891-2-git-send-email-igor.santos@aker.com.br>
Date: Wed, 6 May 2015 23:28:36 -0700
Message-Id: <3FF1E51B-2E08-4368-AC33-41D73EA2EDC6@gmail.com>
References: <1430948328-17891-1-git-send-email-igor.santos@aker.com.br>
	<1430948328-17891-2-git-send-email-igor.santos@aker.com.br>
To: Igor Santos <igor.santos@aker.com.br>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] ctags: add
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
X-List-Received-Date: Thu, 07 May 2015 06:28:48 -0000
X-Groupsio-MsgNum: 65230
Content-Type: multipart/signed;
	boundary="Apple-Mail=_826624CC-2648-4B4D-8DCF-E0E4ED794135";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_826624CC-2648-4B4D-8DCF-E0E4ED794135
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On May 6, 2015, at 2:38 PM, Igor Santos <igor.santos@aker.com.br> wrote:
> 
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 ${B}/ctags ${D}${bindir}/
> +    install -d ${D}${mandir}/man1/
> +    install -m 644 ${B}/ctags.1 ${D}${mandir}/man1/
> +}

you could just bundle whole function into two lines

install -Dm 0755 ${B}/ctags ${D}${bindir}/ctags
install -Dm 0644 ${B}/ctags.1 ${D}${mandir}/man1/ctags.1

--Apple-Mail=_826624CC-2648-4B4D-8DCF-E0E4ED794135
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVLBhwACgkQuwUzVZGdMxQT1gCeKmsvOZaE49orOBxVOwJK8iwg
F+IAn1nCBb3Ysjp3LplZp50byU1YWaV/
=MdNj
-----END PGP SIGNATURE-----

--Apple-Mail=_826624CC-2648-4B4D-8DCF-E0E4ED794135--
