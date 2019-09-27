Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id 309097F351
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 15:58:32 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id h126so2342163qke.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 08:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8RKVc1mN/NFEWgS7djYScCqVNxi7Jdmoln6opulGGCk=;
	b=oUM0no0NdHRTxBqkuozN0nS1Z6oIMtboSYb2gfX4/dCzZ8kR9empGhd/cTHqthUj92
	zBNIzwVRW/u5Tp5CMzdUMUZjXy7imOJ3MjbhFEujSp39W2tNrwGCb8fUCYZXiVINVRp9
	lJeesWTEaQRiEaDjJ/J2L1v8Djr01uicqJc32fywvlfRFQZAuNyFj8gw/EFve/jz65de
	g5j1ugfk17XZPSyRil8Xxn++b4YHStVIyudYBEtDYKZzDrhpKsB+XDMgygxycgt9rbEF
	cOoqYMsFGT2o1O1nTC2totEiEAmWfBzT5MDtWJ9YPLiVw66HqzNwI59ZAlJHjtKu/i58
	YKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8RKVc1mN/NFEWgS7djYScCqVNxi7Jdmoln6opulGGCk=;
	b=qc8MFOCK6IcyxEF4BYUV2C7Mw/ysZUC3CfHKBe77VoCDl/L16wHP7Bv9Jf+26MQdxo
	U93v7ibxEbNuFH1rlpNwBhx+fqhcOPISA6Notua1Y58t5MDmUozSKsTaBUw2eTn1ePvi
	M568DIVbhg8Na7zbFmI0HQfDrqKuR4/6kvNbWxSL4gBdCUl6Ua4XibXmnafdBgfz1ChM
	xyRKEnQyT7TBGvv/WR3WFdjuWfxcJqdxLLbl1hyMgRpoL5qPU/NNu5L+1WvwN1qasfDy
	YS9ywxWydYbUMZHnXKa4K1tXF12brnTCoFii9083/D+Mo7cP+aYKRDbi7VnsxlBB29ED
	eSBQ==
X-Gm-Message-State: APjAAAUmCj0Coh8w81BS8bo+oiU4UuCR3Y1o1yy/nSE/AuThq2KapHGC
	yPMtlEpUVt70eCOgPdnuzpgz3pcV+Xd1wqFp6IZmznhWaSI=
X-Google-Smtp-Source: APXvYqxIe2rKRO4MsZie/1dH+F6ytx7ZKRPDVscNw/gzhnZKvFQu38EJVcY0uiNL2kOeP4wmWnmAqAI0OqtB4DEl0MI=
X-Received: by 2002:a37:5cc1:: with SMTP id q184mr5440004qkb.212.1569599912744;
	Fri, 27 Sep 2019 08:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <8qOLR3hEH6wWLGBdAwosadkVtTzsjACcBDJ7jxKUJKbIVJIzyXxEBy5JI-6-QtM8_w9muMkzgnnlyi-gRtTcwbvkKgfTNFYJVc2SO5GFpgY=@protonmail.ch>
In-Reply-To: <8qOLR3hEH6wWLGBdAwosadkVtTzsjACcBDJ7jxKUJKbIVJIzyXxEBy5JI-6-QtM8_w9muMkzgnnlyi-gRtTcwbvkKgfTNFYJVc2SO5GFpgY=@protonmail.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Sep 2019 08:58:05 -0700
Message-ID: <CAMKF1srZ0hJK5hWf1GoKrFKC8o7_efU9oTW1-+tDhznN3+YY4g@mail.gmail.com>
To: vygu <vygu@protonmail.ch>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Warrior, OpenCV, Python2, python-cv2 issue
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
X-List-Received-Date: Fri, 27 Sep 2019 15:58:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

maybe look into meta/recipes-support/gpgme/gpgme_1.13.1.bb it might be
helpful how its doing py2 and py3

On Fri, Sep 27, 2019 at 8:03 AM vygu via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
>
> Hello,
>
> With the warrior's serie, with poky and meta-openembedded layers, we have=
 got an issue about the opencv recipe, when we add the "python2" support to=
 PACKAGECONFIG. The recipe does not crash. But the issue happens during the=
 rootfs generation, because "nothing provides python-opencv needed by openc=
v-3.4.5-r0". The opencv recipe does not seem to provide correctly the pytho=
n-cv2 package due to the PYTHON_SITEPACKAGES_DIR variable definition.
>
> How can we obtain on our image python-cv2 and python3-cv2 with the opencv=
 recipe?
> Thank you in advance.
>
> Vygu
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

