Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id B057D7192B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 13:06:57 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id q5so6360537wiv.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 06:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=pLvbEVLpgEUFp9OLacga978z2A3aMZnmKJfuGXQ+sbo=;
	b=foS88vEl6vhsbLs6FKL2azpTZKsTONWoFRawAgduLT30TeAHMD9vg6m4DuNVq5ABm0
	zYmHaq/jCOfvEI6J9L5PgtmlX5qGsQkHgFCFeICTqmGYetVobefmw9paZ+fyh/Sm4RFt
	nKwijClokbJZWLhYOTDgOjB06ljhIo7nwIELJ0DjGObB5Qwk0NFj3VJO3Mx8TNAzFqfd
	OJKE9jjAdJxVW7DX7R+G1G2LZSHltto2OueLMZeoSZQ3dCi4yG3FhqMM0QwyKcD8OByM
	KMbSuN7tCrT1FIpxUIcWWHIao5XUP3Pf3LRHoi9KVguv4U9W/WPukWIogWy8F6yXle5h
	vatw==
X-Gm-Message-State: ALoCoQkpcjzmgKCae1NtqQsBWOVxW1cE05cydcNU5/iVeI220wW4Z3Nilt25FVbls3Ai9yAvBLN2
X-Received: by 10.180.75.179 with SMTP id d19mr21054509wiw.21.1414415217876;
	Mon, 27 Oct 2014 06:06:57 -0700 (PDT)
Received: from ?IPv6:2001:610:612::ed65:2b5a:edaf:eaf8?
	([2001:610:612:0:ed65:2b5a:edaf:eaf8])
	by mx.google.com with ESMTPSA id p2sm11845026wiy.1.2014.10.27.06.06.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Oct 2014 06:06:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0Lam=wC-MBny66h-jC0ieb9tp9nTJUWEQ+KXvLDEqbk23Q@mail.gmail.com>
Date: Mon, 27 Oct 2014 14:06:55 +0100
Message-Id: <473E6E55-239E-4EC8-813C-8494BEF78CED@dominion.thruhere.net>
References: <1414336254-22707-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LagpRtefUvm_rrOcEyj6hTZRkySk9fVzcYGm+UFFYe_rQ@mail.gmail.com>
	<18631FB3-E9CA-4DD0-BF5A-DB114D3B7422@dominion.thruhere.net>
	<CAJTo0Lam=wC-MBny66h-jC0ieb9tp9nTJUWEQ+KXvLDEqbk23Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base bbclass: add support for tar.lz
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
X-List-Received-Date: Mon, 27 Oct 2014 13:07:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 27 okt. 2014, om 12:54 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>=20
>=20
> On 27 October 2014 11:39, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> > SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz \
>=20
> Not quite, 'lzop' is not the same as 'lzip',the problem is this:
>=20
> The problem is that the lzop SRC_URI contains the string ".lz", so it =
incorrectly gains a lzip-native dependency.


Ah, two different problems :/=

