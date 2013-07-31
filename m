Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id E5B256ADE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 22:51:43 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so1279262pdj.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 15:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=LkTWWqhLD+m3y6yeBCuroOO+3jkygQUYCCvsQK3nTLc=;
	b=Ai/9LSl8TTvYO1aJ/khnkyZ9LZBA0T5w/WOMAjX5oo7b3tmXPaWwo1KGfWdhGTqRIe
	sWMwcJPPJ8MN79TebTN+XMMf6qHdxQOxMiVnnGogbLK9H2uEDjImTSeqLXX8OWARRvRy
	ZILzYxMYpZQK7XzoApc/k9anMho4b/SrFcdleDJc6bESoWuS6TLWXhS8feXlzFX4HaJZ
	vPN7pdvTWqTbM+vQ0efwnBDi6yN2+qVE4477LLm1cYn+PqA5FcBIJxVgSg1RW4JLgZF8
	haQ2nMsErZxfcsp2m27WI6fbOgpwC3j4SLYMwtoQSn9Dgw4ccrPGAk5vtR1zNREyhdXW
	tBmQ==
X-Received: by 10.68.170.4 with SMTP id ai4mr66874413pbc.86.1375311104754;
	Wed, 31 Jul 2013 15:51:44 -0700 (PDT)
Received: from sa-nc-spg-213.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id y6sm483261pbl.23.2013.07.31.15.51.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Jul 2013 15:51:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51F9948F.1000908@linux.intel.com>
Date: Wed, 31 Jul 2013 15:51:42 -0700
Message-Id: <08E217DF-FA59-4DAB-BB7F-0369A4BB3165@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
	<7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
	<13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
	<51F9948F.1000908@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Wed, 31 Jul 2013 22:51:44 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jul 31, 2013, at 3:49 PM, Saul Wold <sgw@linux.intel.com> wrote:

>=20
> Still seems to failing in Jinja, I wonder if the dependencies are =
correctly sinec it's nooking for native bits and the python3-native had =
not been installed yet.
>=20
>=20

in my build from scratch several times, I never had this issue. Did you =
do an incremental build to get to this issue ?=

