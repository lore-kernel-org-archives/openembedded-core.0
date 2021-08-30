Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web11.14263.1630312408316661344
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 01:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Fqosu/sM;
 spf=pass (domain: pbarker.dev, ip: 64.147.123.19, mailfrom: paul@pbarker.dev)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 61E7732003F4;
	Mon, 30 Aug 2021 04:33:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 30 Aug 2021 04:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	date:from:to:subject:message-id:mime-version:content-type; s=
	fm1; bh=yJqTYKZMeRqvRB/BRJdOEX/rg0j4bwRsPOF4gsgjaBo=; b=Fqosu/sM
	A1Q0EwVFkJ3XRo9Xeb4dB1pw0IAxAcAr2IlV7SPfidyU8taR/D9H3RR1nQqaB7zb
	2fseteu4LhxvefcDEhiF044ChrHv2flnypfhavPZo6zT/bbbibcMSE+JzznObWVb
	rW/6OcFdPixPCveAG6snsFH3a3LYqSgleVryT8H+91uRI2yKs0PKcRdn1WA+lTuc
	LeGVUFu0iq/jt6aUq4i1oJ5hZgZOkc7xYxdVbmEIFUlz+vibRYzX94xaHVDcNfuJ
	lmB+mICen59KeCRjiwIarH6oINId0mccEvQUpm8CQXuC1ff4k0QE3VMOFOJiveei
	P7lz4hXuCsNE9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=yJqTYKZMeRqvRB/BRJdOEX/rg0j4b
	wRsPOF4gsgjaBo=; b=MgkGjJcfH82P7Nsug/Elv2ZJtVjN2f4dyRJydOi+PLBpy
	ByiK7427XuPQvSGK2yg3BRNlVKZmnEhpCzQ6xFdx40hjTSY+QCn7oX9GmXGhU/r7
	AmaM8kgHO+Z7UCbxI4OCuYcbpsGsCyQgU3/VMsojC/NbgDZXXzYZXMkMndvDX5E+
	AgEO0A+CQ71SSp0QtJn9eRQVowhhqoZGV10eD7pBJU+BBB1YIHuJxo8pfGRn252E
	LvbIkbCbahIuow913eHWWU/vV0BhvYqFKBYYBuR6jz6pMPzHxp7P+AnhXl9Q4i44
	GPMRpBXbbB/U9cTGO9MtXnzDsknZ+ciRw1P2jzz1A==
X-ME-Sender: <xms:1pcsYUV07I9EiMoZ_T0h6mOJi1D4lKFurBtvt4gBiaJ2G_HXZEcSjg>
    <xme:1pcsYYmbtQWc1hE60-m3oa2w41cJbUtfBLryo-lRzuPFUTpMNiizvgufZrxiQNi9j
    fwxeT3yD2b0VG9AM_c>
X-ME-Received: <xmr:1pcsYYanvL87YM0V9CAczlawFFB0mEnUD_KyO4KfnaBzUcNsb_xSlCiZyb8dTlPtu2sOG0llNnDXVXbfj_lmgfa5zMI8OuCZ_hJAZB4sbOQ3HnUlKgsAggDkC20>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduledgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukffogggtsehgtderreertddvnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    eugfevhfehiefftedvhfelledtudetkeelkedvffeikeevhffgvdeludfgiedvfeenucff
    ohhmrghinhepphgsrghrkhgvrhdruggvvhenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:1pcsYTUkQQrHfDN3s3PDhplKbJmhtr3pDwXsO7c4fquH3p7iMNCzDQ>
    <xmx:1pcsYenMY3cgNowsbBO6aFFkNp6UXpjK2mXt0cidY2dPhLxjgn0pEQ>
    <xmx:1pcsYYcxSvVAqPFhM5e55UknW8-CAAq1_LaS7Opn0GFJEoU8S_Z3Ig>
    <xmx:15csYVvvCHyAz94J48Nsonto5_OcZ2bardIVJiBCuDEyWzvwKAN3xw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Aug 2021 04:33:25 -0400 (EDT)
Date: Mon, 30 Aug 2021 09:33:22 +0100
From: "Paul Barker" <paul@pbarker.dev>
To: Anuj Mittal <anuj.mittal@intel.com>,
 openembedded-core@lists.openembedded.org
Subject: [Hardknott backport request] kernel-yocto: Simplify no git repo case in do_kernel_checkout
Message-ID: <20210830093322.70e82a43.paul@pbarker.dev>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Groupsio-MsgNum: 155481
Content-Type: multipart/signed; boundary="Sig_/uNnOa==VxqSOHq95p8BJNCb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uNnOa==VxqSOHq95p8BJNCb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

Please could you consider backporting the following commit to hardknott:

  af2a9c92d449 ("kernel-yocto: Simplify no git repo case in do_kernel_check=
out")

This has already been backport to dunfell. The patch cherry-picks
cleanly to hardknott.

Thanks,

--=20
Paul Barker
https://pbarker.dev/

--Sig_/uNnOa==VxqSOHq95p8BJNCb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCYSyX0gAKCRCrY1Tsnbr0
br/ZAP4urzTSJKKWtI9DtTbBZOYBWam0TPnabSRNsFM8wb122wD/bKIeQ1vk5jhs
rsr34g9yco/Lfhp5ALjZFo3NdeTb5Ak=
=ahty
-----END PGP SIGNATURE-----

--Sig_/uNnOa==VxqSOHq95p8BJNCb--
