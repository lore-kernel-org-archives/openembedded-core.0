Return-Path: <ticotimo@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 50931781CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 21:51:25 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 17so13944657pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 13:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=syxoQHWKrs3JIwpq63XqEm+2czbh18RyobjySazEnnM=;
	b=WQ12K8LgFsHPdDd/rmbTzvG6VayH4AhbZmDWYb+hm/z3I/R3lrp/v/N2ZV0deCz+YF
	qkh1xfFxjCCvDpAAeheJ6BdHFzNx2uJfH0pIvLhYPKxWsZQy9bVVktTseJ+x8yej6ihX
	i6Xt0T3mJrQvIMwUf6Og+eG+oekr4HFiS5+0N+oSHqhgpIejZgk+yYxIpMmJtKPqz2iq
	471rNFygLgEkAVFmd9CCosSHIM3B0LhsjbMEMeHNLVuQTE+AdgZ8s93qo7k5nF6SsDtQ
	Pylje9K1UnDXhr4jVSFoRfU98vERiRvtRI1l/ZQDd5/GVv3SigvlBclWVDui+EEPG54O
	YNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=syxoQHWKrs3JIwpq63XqEm+2czbh18RyobjySazEnnM=;
	b=sNHVbYOHqJi/pcL4+oPxnowI3V6YjGET6MOKt9Aqe/6bISLpGZz8Z8EQeVUevQ6CNg
	mAbh3g7RVud57oPtiLH0qgvnWshiZirPQUfWRbZ3dJXakqg+oJgL7dX2PJz1/c00WtdC
	Xe0H1cOW/0gEzamjemYbWHV2yrh+ZUMCefbsgQ5XVFyGnl5IBUX0gOJbW1PrjfFbuHyh
	zy+EBgdMD5beZ7kfomgCX2evMtyDIdc+HBcgdTSiF/R376QfGYO8bOfhy9JxWj7gk9jz
	lhHPyBE4hybj9vvv3H42rCjtJUBJ5bmhmhxrkVTBr/lJ3Ujdm6FH/4ZCyFXfd1QmtTeF
	EmpQ==
X-Gm-Message-State: AJaThX7ipphrFx/Uk+S4y/26F7uU7af7bbFNm/HuDZXb+aILCZ7pIeQ4
	cCJVHGMIKwh8SL2Ls+jvGbO9R7le
X-Google-Smtp-Source: AGs4zMassZrNZVISdzMizyipb00523y838qz0t265jQtPDieTmqCLT2lFRVkHcO01NpsEtQiDvePow==
X-Received: by 10.101.82.202 with SMTP id z10mr25429342pgp.404.1511473887109; 
	Thu, 23 Nov 2017 13:51:27 -0800 (PST)
Received: from ?IPv6:2607:fb90:724f:1f22:8cf0:e5ad:551b:f920?
	([2607:fb90:724f:1f22:8cf0:e5ad:551b:f920])
	by smtp.gmail.com with ESMTPSA id
	n24sm3536588pfi.33.2017.11.23.13.51.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Nov 2017 13:51:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
Mime-Version: 1.0 (1.0)
X-Mailer: iPhone Mail (15B202)
In-Reply-To: <20171123142555.69a1932d@lsandov1-mobl2.zpn.intel.com>
Date: Thu, 23 Nov 2017 13:51:25 -0800
Message-Id: <E61ED64C-C9F9-4B0B-AFC6-D41F3D54E337@gmail.com>
References: <cover.1511458497.git.timothy.t.orling@linux.intel.com>
	<20171123183755.2786.77539@do.openembedded.org>
	<51B97520-F81D-4567-A4EB-17D52CE2968A@linux.intel.com>
	<EE6427AE-250D-4EB7-A63A-14AAD7B226FD@linux.intel.com>
	<D9EA3C8D-7E13-452D-847E-70A8B45402B7@linux.intel.com>
	<20171123142555.69a1932d@lsandov1-mobl2.zpn.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEFkZCBweXBpLmJiY2xhc3M7IHB5dGhvbiBpbXByb3ZlbWVudHM=?=
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
X-List-Received-Date: Thu, 23 Nov 2017 21:51:26 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Nov 23, 2017, at 12:25 PM, Leonardo Sandoval <leonardo.sandoval.gonzale=
z@linux.intel.com> wrote:
>=20
> On Thu, 23 Nov 2017 12:48:32 -0700
> Tim Orling <timothy.t.orling@linux.intel.com> wrote:
>=20
>> I stand corrected. When I try to apply the mbox file from patchwork it th=
rows:
>>=20
>> error: patch fragment without header at line 147: @@ -172,6 +172,10 @@ SU=
MMARY_${PN}-png                                                             =
                     util=3D"Python package extension utility support=E2=80=9D=

>>=20
>> My guess is this is because the manifest files have lines that are 2500+ c=
haracters long.
>=20
> right, that is the problem.
>=20
> Did you have any trouble when sending this series through git-send-email? L=
ong patches are truncated (not really sure by who) but at the end patchtest g=
ets the truncated version from patchwork leading to this error.

Yes. I forced it with =E2=80=94no-validate. I=E2=80=99ll investigate fixing t=
he generator so the manifest file patches won=E2=80=99t blow up in email.

>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

