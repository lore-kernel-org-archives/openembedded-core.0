Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
	[209.85.217.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD857D711
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 12:56:30 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id b20so13385130vso.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TNErAWccmJj3gr59Givw+oYnzQEMFLtdAjKLl61ifak=;
	b=H6Db1byrR+Ft0SV0QldaKl+DD73cL9fmYghzYHLYPBiX0602zjkJ7T/Ux8vtnapB01
	KcSMXVNAXl80gaMHlDpbInHKA5Jtwvfs2oE0001U/SK9khUPbnAAYNe4q3BU7e6akg1b
	qgEKNRI9q2LHWUFx4DgUXl04429gVU2UUNY3/HYVjcEEnnwz11SiIE2JkLDrzCCtkdsb
	JHWQHjZrRh72b7II68l7wPQvSmP/up9OfWL/cOF38jBGbOWNaxBWlueDyT/dwGrfcBcf
	F4bEmWCHBRwBAQ8ZwriG3abS+ai5Wjpt5SB/D+gXlF3sWRV1BXajEE58NR5kE0h8/OqX
	I7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TNErAWccmJj3gr59Givw+oYnzQEMFLtdAjKLl61ifak=;
	b=LtjAZ7bMrhkzs04yVJwQP7SAI06VxeM+TxaM/tHs5/jdT6s836Whj0c+oWmsmXwa/I
	0wi3q0MkI/1jPnpBthaXXw5ytURUnuYj6E4HAHnfsN5yOQ233G8F19aQQ7wdzBLBV3Cu
	W0WtW9EEeUsH36zz1l0m2l4enLLsdo2sr9Ei6w9agV9v8GTJHWPWfYH+Z5Q9WPHvDo2+
	ibO73MS0T8zQEZaf/sInqHM/saEloAdW/taGHHyKnkd/6BAEquDSPKL94pe078KYePJT
	FG0e2XOr3oTGOaa5I0aPacAMwX2q2zJefBVfB15nd6BcAqH/w0lF6bB/aHoXAE5zw0J1
	8ahg==
X-Gm-Message-State: APjAAAUWqv9H06uKnNU5OMsamaANtRipXMUbKdrGT261V0bCwe43zebW
	YYrNlpT9m1tPLBvtjOt9Yu0Ry4uWQnYLDNP9raA=
X-Google-Smtp-Source: APXvYqwoxhkZkQtwHcY0q+4Uk38QJHd7OU6gXgEvKNxnHCAji1TJdWXRoYmoRz8ZI58ursqe3GUDdn02r/6pj2XUtgw=
X-Received: by 2002:a67:e45a:: with SMTP id n26mr13160726vsm.94.1566910591623; 
	Tue, 27 Aug 2019 05:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190827124617.18207-1-JPEWhacker@gmail.com>
In-Reply-To: <20190827124617.18207-1-JPEWhacker@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Aug 2019 14:56:20 +0200
Message-ID: <CANNYZj_zr9+LbbGfhtd46pnUBYgpSW5LL5pE_fuvhxwne6yPrA@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix documentation DEPENDS
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
X-List-Received-Date: Tue, 27 Aug 2019 12:56:30 -0000
Content-Type: multipart/alternative; boundary="00000000000035654f059118cddd"

--00000000000035654f059118cddd
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Aug 2019 at 14:46, Joshua Watt <jpewhacker@gmail.com> wrote:

> perl is required to generate the OpenSSL documentation, and therefore
> should be present at do_compile. If not, OpenSSL will skip the
> documentation generation, which isn't reproducible
>

I'm not sure I follow you. If perl is present, documentation is generated.
If perl is not present, documentation is not generated. Where is the
non-reproducibility in this?

Alex

--00000000000035654f059118cddd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 27 Aug 2019 at 14:46, Joshua Watt &lt;<a href=3D"mailto:jpew=
hacker@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">perl is required to generate the Open=
SSL documentation, and therefore<br>
should be present at do_compile. If not, OpenSSL will skip the<br>
documentation generation, which isn&#39;t reproducible<br></blockquote><div=
><br></div><div>I&#39;m not sure I follow you. If perl is present, document=
ation is generated. If perl is not present, documentation is not generated.=
 Where is the non-reproducibility in this?</div><div><br></div><div>Alex<br=
></div></div></div>

--00000000000035654f059118cddd--
