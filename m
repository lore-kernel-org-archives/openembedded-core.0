Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1F57CCAE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 17:46:29 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id 10so952194eds.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 09:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=n1zp7pdtfFfyVJep9RmROOMkvXee0s3seNnzGRXNEcs=;
	b=WhzrCHuFhqrpGCb/PGMQstJR4BBBrLBMqU6ua9etkEDE6hHXrw63HNrfSqEnfnpak2
	a5WIl6kUnhhbQwf41vLNBbMo/yfHsByALN8Y6Ti69D2PtOD9l6hEZuUi8/O39FXJ9FoK
	/lQ3vr6XIRfYVJvNzs6lvgNOVPUi6jvoXRaxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=n1zp7pdtfFfyVJep9RmROOMkvXee0s3seNnzGRXNEcs=;
	b=bAQa9RthorUt40NpwoZ13FOyE7minVGJ0oyRFo/Ps2xL2Bp37HGMf98GVNJpR492fa
	0sN6w7V9ViIG12dOUvyDYdfnt//fMLOs43MAycgbc9At9Py71JBWIA5wGjpIbGFWfQf9
	aDHSTyrhjUb89mImWrq1rIdJgD34U1N6J0FoO+MBCILoH1L0ix5SqgWNtlWDwuQiI24w
	73wWSVHvUR/OGEq6kMkZl1z2txtOXixg1qlary+dRotrZysDjfigDmDja3/eJcDqSOmT
	U70OTT4bqspxnL2E+wCmiIZJAcfO9D7ypbBHgjlxccz34hqoi+RZSkEyoxF2wKvn3CC7
	azog==
X-Gm-Message-State: APjAAAU2H0yMVgEqakZL5+eVjprf81tebTzZpS/8YQnvTlve3pQu3YXg
	VS1PRMeYSmMyk7EBOiNDSKw1fA==
X-Google-Smtp-Source: APXvYqyRUzwR3jltUlB4h3oCVUpbrPxJaStZouD+Rlq6faQVHoOIfYWAdyxVNkwxZ+3s2X/WT5o+VA==
X-Received: by 2002:a50:9908:: with SMTP id k8mr8549466edb.246.1551548790537; 
	Sat, 02 Mar 2019 09:46:30 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-118E-86C-E9FB-6784.dyn6.twc.com.
	[2606:a000:1401:880d:118e:86c:e9fb:6784])
	by smtp.gmail.com with ESMTPSA id h47sm506474eda.47.2019.03.02.09.46.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 09:46:28 -0800 (PST)
Date: Sat, 2 Mar 2019 12:46:24 -0500
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190302174624.GH5026@bill-the-cat>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<1551479212-28944-3-git-send-email-trini@konsulko.com>
	<e44ab9ad197708fae61fefb6b235e62ae59f0dcb.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <e44ab9ad197708fae61fefb6b235e62ae59f0dcb.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] inetutils: Import version 1.9.4
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
X-List-Received-Date: Sat, 02 Mar 2019 17:46:30 -0000
X-Groupsio-MsgNum: 121833
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zGQnqpIoxlsbsOfg"
Content-Disposition: inline

--zGQnqpIoxlsbsOfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 02, 2019 at 05:00:18PM +0000, Richard Purdie wrote:
> On Fri, 2019-03-01 at 17:26 -0500, Tom Rini wrote:
> > In order to have more robust stand-alone network tools in oe-core,
> > bring
> > in vim from meta-openembedded/meta-networking.  This imports the
> > recipes
> > as of git commit:
> > commit 408204073e6bdcd8ac586e05d5b75213417673f2
> > Author: Martin Jansa <martin.jansa@gmail.com>
> > Date:   Thu Aug 16 20:39:15 2018 +0000
> >=20
> >     inetutils: fix build with glibc-2.28
> >=20
> > Signed-off-by: Tom Rini <trini@konsulko.com>
>=20
> vim and inetutils will need entries in maintainers.inc else we'll see
> selftest failures.

Ah, OK.  Does that generally involve more than ack'ing the automatic
upgrades (that one gets CC'd on I assume) and answering questions?

--=20
Tom

--zGQnqpIoxlsbsOfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcesFwAAoJEIf59jXTHXZSeL4QAK1w8tsmQsv/Jzs9cFzHdeYY
BKM+GtVJJyHsNPHABVPS107cWya41DD2BAiHO36BpiuKQm23SIKfiTzWYEfjJXr8
l70b8Yq+9mgXjSYvw60zrFONoo7zpDdupDtdeRKBlwy41eC5xitetrgcjB0u9ipc
cl4p7rauxiUVr+aiBs60NCGdNqv3qj3UwOvyTllMHhBK5OX38SsW/kUYhJFLlg1H
uhOePM8vFqNoKavxsYbSiWOhIqvNHI1yx9zeEuU4S2EpMQCj/MVnltBTFURAkbSU
TV6PJmj+0vbk1Jzt+aN+VJzcMlV7kp1s8vRNkqASwFQL6kwrTt8KMWkmILFDcuAm
IuA/tw0uc8BYM2gJDQwUkHrt/ocGD/dpXqAR6spLQ8kEQjzaGYZrAyk8Kh6ulO/F
QSpsldNOZuV9eitIBZmUADXa4lX9DlTFoy9v9HuRWRQaEVhlzk/fybxZgoDkHiFp
Tx7Hn3NIwgUA6S6ROI6D13sjgf/ROO13XJCNw/x+GBmTaiqORDbawKcxehqUCKal
/y8DZxmUmGfEfbXWbLGP2JAe5GAZFhAVfWIF3zWfmqhjs8RTFNb20d8HG+XSeQzU
yvnWHwjd2vfR4iqH8oE4aNmqCLlFpgWcGgYjsb1nQ+uSniMVe70Qe1IKHttEyZFM
GHTPIgkpKPGdghd2KCFN
=wMYV
-----END PGP SIGNATURE-----

--zGQnqpIoxlsbsOfg--
