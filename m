Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SFEQF-0007ba-CO
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 02:50:03 +0200
Received: by qcso7 with SMTP id o7so192732qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2012 17:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Jl96LrdnoAYboeSObm5GzB7bRHGTFOhEjYQH4FDQQPw=;
	b=V2bed3h1mrGai9auw4OoWWmJ1L1f3NUlHoLelPGdt+0etD7boo77XYoaFCOppI/crE
	Bz0wrhWCKTT2JgGIDikp4bxD4Nj45Ou0BB3t5iCiwteOl8aOJOXa99CQLxNDkwUZvYsc
	NJMI82/Q6SYMXv5dZOy7hFgRdlDyxhBrL290wAXTiizKPUtDNYTy479chXcCFNa1A6uM
	11SMDCypXcsWKpg3H0YBLsOQCd9WEq2hmeWzFKA3Z1Xu96nAfI3kNcnjNSZNcBCh3+dq
	Y1UTyBL/B6pLwjbrjw4pd0RNtqImD/PXYAgH1a+R9q5YKEpV4+WWl98bAXojIRVEqn7a
	ip+g==
Received: by 10.229.111.199 with SMTP id t7mr5996461qcp.84.1333500052818; Tue,
	03 Apr 2012 17:40:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.24.196 with HTTP; Tue, 3 Apr 2012 17:40:32 -0700 (PDT)
In-Reply-To: <558f20b409b75d18d426a471c3aa5bd296df9aa7.1333481624.git.mark.hatle@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<558f20b409b75d18d426a471c3aa5bd296df9aa7.1333481624.git.mark.hatle@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 3 Apr 2012 17:40:32 -0700
X-Google-Sender-Auth: yCYwQykBGC5wbs3j1y6XUsC7yEU
Message-ID: <CABcZANmri96mAVWO+bPubUTb2eY4s7Cy2msMPrb9EGCQ=O4kAQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] conf/machine/include/README: Add readme to explain cpu tunings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Apr 2012 00:50:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 3, 2012 at 12:47 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> Add a new README that covers the basic items used with various cpu
> tunings. =C2=A0The goal is to better help people understand the various
> settings and where things should or should not be defined.
>
> Corresponding architecture README files will also be generated to
> explain the particulars of architectural tunings.
>
> Also remove the default TUNE_PKGARCH setting in bitbake.conf. =C2=A0This
> was done to ensure an error occurs if an invalid tuning is defined.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

This looks great, nice work on all of this. One question I have, which
isn't answered in the documentation you add, is when/where
ABIEXTENSION is utilized.
--=20
Christopher Larson


