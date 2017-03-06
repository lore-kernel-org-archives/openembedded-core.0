Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 76C5A730EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 13:32:48 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v190so13767103wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2vlHOD6GNbT1Jf3RNomPUMLKbKnjQFjRX4OcU19MCuM=;
	b=OcDYhtYPFSrM/G3HP58Gx8oeHSriRni22pBNc97yOoqylMEN5/Df1tzffpBy2pjm0p
	x+H8HfP+LKivQhSA+MPABx2ecQaO7C2YR8QREbU30I/9x3SNGNp0J6RIGCwYezQP1z6j
	KyfS/L8KZQ4R2+vg+0DfPYmjpk4vYLa+BV+aA+Pz8ZNPpKNlfd0P1noDXIgVL1W2B315
	F7+Djj9E2XkILG7K259hKKFyvEe4KGmbYqkl4YxjN/LH+1GY6bGTO/jqtBmZfw8rRPhy
	Ann+ih0+9Ued6RZTFXX0v20jW1da5npPhizRRWjqDbCr7dfbgxeezy8P1lulyHVYa4Bx
	R5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2vlHOD6GNbT1Jf3RNomPUMLKbKnjQFjRX4OcU19MCuM=;
	b=RuNN/zBKTX7U/9Xmjmq6DPaj0klsJO3Velm0/LKpUgeWDS0W8iF8KVb80CzLhxWvoO
	s91GGk1Y2smoBT3xMOERCl2juesuuFbOe8LainyKtT5TjrHEs+3V9XJeIDS9pPB6Ofbf
	kIl01yWtG2J6YS4fp/Ig3B67ISGcvKzZ6KJFU+qkL4HqJu8CYUllCo3yogZGObDf8yTd
	n2SzVUSbc3Yi9+KjDMCBF/yh5T+RJkhkie0Sl6OcXGZwIMdGoftxv/uPWm+Sc6DEeeg0
	0CpcCCK7iFafSV1SpwV4QeisctqIkHfarajzaB3LmrsUV2l9quth2fT27W63vfqqg1RY
	UMsg==
X-Gm-Message-State: AMke39mQdTY6oVAVy55DuHLQ5+4XiLF8ra0kDaS2hzYWAYlOZEPH+u8YbAanmqyVvNkJGA==
X-Received: by 10.28.211.200 with SMTP id k191mr12839861wmg.137.1488807169791; 
	Mon, 06 Mar 2017 05:32:49 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	q5sm27149530wrd.32.2017.03.06.05.32.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 05:32:49 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 06 Mar 2017 14:32:34 +0100
Message-ID: <1877025.kTC8mT0UNC@crde-port-20.cahors.local>
In-Reply-To: <CAJTo0LZaxR+jMiyc21N3fPGANzANkiP0x3F4o952TwmWCnKmxw@mail.gmail.com>
References: <4236179.UN52qSrgop@crde-port-20.cahors.local>
	<CAJTo0LZaxR+jMiyc21N3fPGANzANkiP0x3F4o952TwmWCnKmxw@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: conditional inclusion of login utilities
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
X-List-Received-Date: Mon, 06 Mar 2017 13:32:50 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On lundi 6 mars 2017 13:48:22 CET Burton, Ross wrote:
> On 6 March 2017 at 08:31, David Vincent <freesilicon@gmail.com> wrote:
> > +           ${@["", "file://login-utilities.cfg"][(d.getVar('VIRTUAL-
> > RUNTIME_login_manager') =3D=3D 'busybox')]} \
>=20
> VIRTUAL_RUNTIME can be set per-image, so you can't do this.
>=20
> Ross

I just copied the lines already present in the recipe (and I also forgot to=
=20
modify the git version on a side note) :

${@[=E2=80=9D=E2=80=9D, "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_=
manager', True) =3D=3D=20
'busybox')]} \
 ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager', True) =
=3D=3D=20
'busybox-mdev')]} \

So, what should be the proper way to conditionally include these fragments ?

I don't know for init and dev managers, but for login-utilities, my use cas=
e=20
is that I don't want busybox to provide adduser/addgroup/... if I already h=
ave=20
these provided by another package (e.g. Shadow).

David

