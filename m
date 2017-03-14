Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D8472776A3;
	Tue, 14 Mar 2017 08:49:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u132so13629479wmg.1;
	Tue, 14 Mar 2017 01:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=e6qXO4Il7Z5q+pGOjcxBr2NHlBRlW2d1z7y9Y0G1xcc=;
	b=Z66h5JmirNkfQRPh2FiSvwQ9a9s90SEKLRZZkRJIs57FexLM84AdCfYq2GRArUEKOI
	w+XZADgQPgkb73PlYRqVSrUMAJECEL9kJqSVeTmCm5eYyNOan7rIAPfYwqeNLPkcyRfJ
	kmDvI6oZq7LmaFyD6bCjTQFa+OGdDjqHLHCugLnIIVvb2SUUho11mD+Ffs6+VHKwDuWi
	T/pjqvowKYavPrVpQtuIaUmGka9+zTPMs7t1HsYkmOySfzyFGFonbdq15VV5YCJx9K/g
	ebcIvr+VJ3a0nn8duWPhh4I4IhT33Vbhqsm1NZvJXynp0NrZubde2nnpIfNB5Nr5+TSL
	MamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e6qXO4Il7Z5q+pGOjcxBr2NHlBRlW2d1z7y9Y0G1xcc=;
	b=HM5jV0xiXtDxN2uqQAXIx6rH9qTaQYecweexXFJJcQOM0SOLh4qmm1okpu/GMsJcsm
	pvaml8AcbbviCTJMfgmrghhkdzVFnMYyFx7uRSACsc1/E0uupdA0q5PPk1zIl5ehl1e+
	LCs/FODs6jW4zbr7KInffw6fjBj9AvOr/46zxWEjWFg5FbVLOeFH9sMU459i7F/wnXwr
	FKvUejSsMPS3jacEsS7sK9mrOGvqro4Xez/7ykFpDXNp0Hr9JdiSah39D1qB1beZk0Pu
	35Vxk9mM0VU5/npwSjRcH5wa2kI/xRyOXXAeN9LVIe1A31DRDI8blW0QQ0FS5UxI70HY
	0mwg==
X-Gm-Message-State: AFeK/H3iSEzdZC5LVDt4yi8pAozYzKXOD67kbZByoY9fgbW3gsiczk3KBhQVAfqJLShKUA==
X-Received: by 10.28.141.193 with SMTP id p184mr13846568wmd.122.1489481347751; 
	Tue, 14 Mar 2017 01:49:07 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	l45sm28220183wrc.14.2017.03.14.01.49.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 01:49:07 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Mar 2017 09:49:01 +0100
Message-ID: <6065347.R33Guik3lC@crde-port-20.cahors.local>
In-Reply-To: <CA+chaQc6r4y6uHFSvAO1FRtijABFpYuxdSd2vuneArywWnGKcw@mail.gmail.com>
References: <148914096789.20795.18204054413475576323@git.openembedded.org>
	<20170310101608.758BB236CDD@git.openembedded.org>
	<CA+chaQc6r4y6uHFSvAO1FRtijABFpYuxdSd2vuneArywWnGKcw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 13/29: openssl: Fix symlink creation
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
X-List-Received-Date: Tue, 14 Mar 2017 08:49:07 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On samedi 11 mars 2017 21:50:23 CET Martin Jansa wrote:
> Why not use update-alternatives for this file?

IMO, update-alternatives should not handle configuration files. I think tha=
t=20
using it can =E2=80=9Csilently=E2=80=9D apply a new configuration with high=
er priority and=20
things will break in some odd ways. Using conflicting packages ensures that=
 the=20
applied configuration has been enforced at install time and the administrat=
or=20
knows what is doing. Again, it is just my personal taste...

>=20
> That's what I'm using in openssl bbappend because we also use different
> provider for this file and it worked well .. until this change.
>=20

Sorry this change broke some builds, if I am the only one to use this=20
configuration, feel free to revert this patch.

OTOH, I have also provided the same kind of patch for OpenSSH configuration=
=20
(not yet applied), so tell me what would be the best way to handle=20
configuration files in Yocto, I may have missed it in the documentation.

David

