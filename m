Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 229D8731E9;
	Wed, 13 Jan 2016 17:36:49 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id q63so87059451pfb.1;
	Wed, 13 Jan 2016 09:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=eGfglY0MT/VUrLLWlg9ntuNqZ9fQdvbKn+UnVB/W9XI=;
	b=aY0/iu8rH1VN+26BRqZ93q06f0+wF5onLuDMGnNrKq3z89B4kj9y0gDS/23uYk9LIG
	CL0k5SMl1OwmlholdTzfLeOKhJyolIGn6qa3kPDagj8iVtjWVtKDVoNPM6YcHYwX0ApL
	ktscJGyxntBiSWaJkadot95HLKgVgAxz25QytIFfDLNyTMlDBxzl4sIhXLNTVOpFpT2j
	XKB1ocLSK9hLYgnFSWZigTUs/EQGAMGh7/7qo+Fhpd5pI2/ORasMmkFJaZJEK0TkI4HG
	qvJBo0Nrq0eoOO3t2Z5o+amByOvpyMNUruqskEUVBs0PhFlNce4b7flN5iukPhLCJdz7
	pJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:to
	:mime-version;
	bh=eGfglY0MT/VUrLLWlg9ntuNqZ9fQdvbKn+UnVB/W9XI=;
	b=VxtXw4Ju8fY0vdKIRdC3RLF2g0WMbS2sIpvXopuf7TX5wgv6QLPmiTgCWRt3cCvsp3
	EB43OOLZfLAXEQs+XTXzd0qC08+4dKKokOWLFVegwDIbChglZosbPFQmAX8DbIR24VWG
	Jp0MW113xfTTHLk9ht1GcaAiEsG/J0/kUs4eqapYZzIp59WpfyTqM1MWtQAxr4dqgHUv
	B3fcD1yprkdYN5NHQ+beR2HhcFvb20iQs7V7PlyXCEh5VMGz8yngUj6NqvCR6VMHyroz
	Wwv7dJ9ghev4aQvm0gJdmOqoTzGZRcpyxM6ZqRHicsXwnKcfoDQaRn9sLwTgde5XYypA
	bSog==
X-Gm-Message-State: ALoCoQnxZbI3HrMnPI2ZVB2X+6ISeJyDbI07dz7xxxt9OZUE1w/UTJyFDey4WkosDpnxmcAdo3MDvEsfRmQb8FLUZ+WOZ0WR+w==
X-Received: by 10.98.71.211 with SMTP id p80mr43840755pfi.135.1452706610207;
	Wed, 13 Jan 2016 09:36:50 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:e406:58c9:b337:c1d9?
	([2601:646:8802:5d5c:e406:58c9:b337:c1d9])
	by smtp.gmail.com with ESMTPSA id
	s19sm3953830pfs.62.2016.01.13.09.36.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jan 2016 09:36:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Wed, 13 Jan 2016 09:36:44 -0800
Message-Id: <2EB9392C-58FE-4807-9E1D-41738D761079@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: Remove pth recipe
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
X-List-Received-Date: Wed, 13 Jan 2016 17:36:51 -0000
X-Groupsio-MsgNum: 76014
Content-Type: multipart/signed;
	boundary="Apple-Mail=_51FB96B4-101C-4C75-8F89-FF7748EABF5F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_51FB96B4-101C-4C75-8F89-FF7748EABF5F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi All,

We are carrying pth recipe in OE-Core.

1. There are no packages in OE-Core which depend on it.
2. pth is quite old ( last release was in 2006) moreover there is npth =
replacement available and we have recipe in OE-Core

I would like to propose a removal of this recipe but before doing so,
but wanted to find if there are any active users of this package

if you use it the please respond

-Khem



--Apple-Mail=_51FB96B4-101C-4C75-8F89-FF7748EABF5F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaWizAACgkQuwUzVZGdMxSuZgCeLqju8ouXTzETZ/3GwU1woS17
OMQAnjC27UJ2fPOCOjUDZAVagzFxj7rX
=/l5N
-----END PGP SIGNATURE-----

--Apple-Mail=_51FB96B4-101C-4C75-8F89-FF7748EABF5F--
