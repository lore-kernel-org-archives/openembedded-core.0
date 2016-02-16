Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3578065CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 16:40:51 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id y8so101295746igp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 08:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Lkj9YlY8+6gGS8ZOAAJ6FpB1gmtQt3zMgMhzFR+P09s=;
	b=nPfaYdcva0jAelRTJxLQiHMojcslamvLhKk0Vd90ZjxxdKWaGX0v5M60CeK9lW5tyl
	ayD2MU3p4ScdurOFRGAOJkmluaK8FzTwI54Xo9DLpNviH3g44/NShOItVskQMmM2qfwO
	jc+IY2JCJhluYllEAa7JIVwI2lmI2N6UoSh+oCJvog6rvWfruH58PcgoAXNzjeiabTFH
	2s3xL7lASvVnhTWsUFFVVwaeqFH2KpdKoHz1mbxfp2YkeibCdmStQq8ArSX/Al1LHKMK
	GYoGFLUgy3TT3hfc5wTk46YW/X6FuZQqmjtHE5/2Hu2yU0ANGX3KupEfSiDjd8fkaCcU
	lzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Lkj9YlY8+6gGS8ZOAAJ6FpB1gmtQt3zMgMhzFR+P09s=;
	b=bv9CCUO4e8U8Rg6f2UsAC9o+cr+M9kqv0+j+191VX3YEm6OaUA3BC0YkRvCazVHd6x
	GfVj/+0wcRR1Az7J3vMLxKs2wrxymDoMOjkJCo3O9rJgR8Q0fBKLR9k2SNGpK/2gYQ/F
	b1cnbuMpfEYB/w29wowYVKjWbmdPKKFnHWZdtldrgHzGgyVTcv3RH+sBLUqI4I+yShdh
	BrUDMR+BXI7sfxAJwdlwCNlT3ib/ae7D0lik24dtbsISG+smWefpjd8Axm42aPTLVwl2
	6DSKeVNxqrxzEwNwhdKLkVYsv50h8lN1AchL5InNobT8Bb45r1+puKGPMfc4nj9H9aFn
	+djw==
X-Gm-Message-State: AG10YOTfvsEkm6Rsp1S5tY87Js3HBs2CgtD3ePje0NAX/SIp+HaEoOuxUl70Z14qzmLE3LRA275+Vc08fdcrQg==
MIME-Version: 1.0
X-Received: by 10.51.17.34 with SMTP id gb2mr16533679igd.71.1455640852396;
	Tue, 16 Feb 2016 08:40:52 -0800 (PST)
Received: by 10.107.8.81 with HTTP; Tue, 16 Feb 2016 08:40:52 -0800 (PST)
In-Reply-To: <5659F2A0.7070003@gmail.com>
References: <56451D46.50707@gmail.com> <20151113115958.GD2567@jama>
	<056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
	<564658A0.60609@yoctoproject.org>
	<DC4D8315-D63D-495C-B3AF-2932584B319C@gmail.com>
	<564659EF.8070606@yoctoproject.org>
	<447B01D9-C528-4B24-9B45-812CA1C6685D@gmail.com>
	<56465E1B.8040900@yoctoproject.org> <20151116205235.GB2240@jama>
	<CA+f-kVLqbm=TpPiG5WyxmQuLbg1qgD8dSSdPsmPT-dcOwRG4Yg@mail.gmail.com>
	<5659F2A0.7070003@gmail.com>
Date: Tue, 16 Feb 2016 11:40:52 -0500
Message-ID: <CAHUNapQyuQ9zSVdMsSnvempu4edsHTgih5QcwjjjTv55fhWB3A@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: oecommit ml
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
X-List-Received-Date: Tue, 16 Feb 2016 16:40:53 -0000
Content-Type: text/plain; charset=UTF-8

It's great to see the OE Commit mailing list is being updated again, thanks! :-)

