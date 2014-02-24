Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF5A6F282
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:43:47 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id p10so2159576pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 09:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-type;
	bh=SgfZ/zJh2QoCLvKW73Y7Z/nBf/Yyazs+3gr9bGHxNgU=;
	b=vb/ddy/ZSDHFjwYaORa4ZMKhsRAx3rvgeqL91fI/q5vzI135qTeP8cahulXDnpKBNk
	/r5/O7MUseAqDcatEhHAOwVeOWro2kTdB2KQhzaaHfG5sKKPFlqjHuCGUAsvl3+BiqSe
	ZlbLI9FcKAPaBtlwhV6zFLi2OKqMPGdKDkSmLd9heFxNHD2t3taJqmNyFapgtbDnMRRh
	Zm2hw57WwON+OdOCWSLtQFoCsipcpWbahBvLo6QxxymbpiYDzUfWso0P8lqrwrEStuey
	8+wYvjVsNnShTv8zBe4iD9feFfAKIhIYKKokoMq285sYXoPjmZrzg4RIpSQBpRJI3LkC
	OhCQ==
X-Received: by 10.68.198.97 with SMTP id jb1mr1081707pbc.104.1393263829176;
	Mon, 24 Feb 2014 09:43:49 -0800 (PST)
Received: from leo.localnet (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id op3sm1968846pbc.40.2014.02.24.09.43.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 09:43:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 24 Feb 2014 09:43:47 -0800
Message-ID: <3494527.IIsCsm8vOt@leo>
Organization: Himvis LLC
X-Face: "r2#Te[Vd[r&41P}v3a{\jUcEEz4&|KRK5|)5HC&!!$q5nGWwa.D_?oxdsx1~me-5G$n}g
	*fLiTNxg"wR4~UUl3NN~Ru/un!"UQt%M5%+(NUYxFxw(vcF.@Poe\&K9jFrC'v=A/;
	KGGF 7?b>`5Ehi,RB\-_t{J;
	bdUatO'v?{A}hIsi?tJg3rk.E"EM-VhpPxUH-'5$&/Ap*i!CCTh
	L:,oj1O_K7FFGdo/^i4IL<_ZwA]W#9hRXp&T$+SYBB~7k\#:+NnU*FQ7TjQE~mVm<P
User-Agent: KMail/4.12.2 (Linux/3.13.0-12-generic; KDE/4.12.2; x86_64; ; )
In-Reply-To: <CAMCfZKFTSApvWqUpETLN1G3zYXF-dhNEoO+MKNTsu2n1iGFeGA@mail.gmail.com>
References: <1392745755-20315-1-git-send-email-diego.sueiro@gmail.com>
	<CAMCfZKFxAb22jjAQbkzA_UfjxjDK__i7KbnQ_vwNZN+BxGJkHA@mail.gmail.com>
	<CAMCfZKFTSApvWqUpETLN1G3zYXF-dhNEoO+MKNTsu2n1iGFeGA@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Mon, 24 Feb 2014 17:43:48 -0000
X-Groupsio-MsgNum: 50539
Content-Type: multipart/signed; boundary="nextPart2060634.crqvjUCdRU";
	micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart2060634.crqvjUCdRU
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, February 24, 2014 07:33:03 AM Diego Sueiro wrote:
> Khem,
> 
> On Tue, Feb 18, 2014 at 4:16 PM, Diego Sueiro <diego.sueiro@gmail.com>wrote:
> 
> > I think is a choice.
> > This is what the header says:
> >
> >
> > /****************************************************************************
> > **
> > ** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
> > ** Contact: http://www.qt-project.org/legal
> > **
> > ** This file is part of the Qt Designer of the Qt Toolkit.
> > **
> > ** $QT_BEGIN_LICENSE:LGPL$
> > ** Commercial License Usage
> > ** Licensees holding valid commercial Qt licenses may use this file in
> > ** accordance with the commercial license agreement provided with the
> > ** Software or, alternatively, in accordance with the terms contained in
> > ** a written agreement between you and Digia.  For licensing terms and
> > ** conditions see http://qt.digia.com/licensing.  For further information
> > ** use the contact form at http://qt.digia.com/contact-us.
> > **
> > ** GNU Lesser General Public License Usage
> > ** Alternatively, this file may be used under the terms of the GNU Lesser
> > ** General Public License version 2.1 as published by the Free Software
> > ** Foundation and appearing in the file LICENSE.LGPL included in the
> > ** packaging of this file.  Please review the following information to
> > ** ensure the GNU Lesser General Public License version 2.1 requirements
> > ** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
> > **
> > ** In addition, as a special exception, Digia gives you certain additional
> > ** rights.  These rights are described in the Digia Qt LGPL Exception
> > ** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
> > **
> > ** GNU General Public License Usage
> > ** Alternatively, this file may be used under the terms of the GNU
> > ** General Public License version 3.0 as published by the Free Software
> > ** Foundation and appearing in the file LICENSE.GPL included in the
> > ** packaging of this file.  Please review the following information to
> > ** ensure the GNU General Public License version 3.0 requirements will be
> > ** met: http://www.gnu.org/copyleft/gpl.html.
> > **
> > **
> > ** $QT_END_LICENSE$
> >
> 
> What is the verdict? Should I have to add any notes on commit message?
> 

Document the licensing in the commit, intent is to make it noticeable by and the consumers of QT SDK
so they are aware of compliance.

--nextPart2060634.crqvjUCdRU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEABECAAYFAlMLhNMACgkQuwUzVZGdMxQUvwCgi19vDWIciNSpPeHQeA8sWhao
cysAn3g0NTAbs4Ih0j03Oyhdiih7bc7v
=uDY9
-----END PGP SIGNATURE-----

--nextPart2060634.crqvjUCdRU--
