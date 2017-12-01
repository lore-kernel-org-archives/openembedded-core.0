Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2558871BF0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 19:30:15 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k61so11201629wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 11:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gXWeMIa0gnlKkXBrBumvH1fKuFVVbtGGj2BRGbIyZag=;
	b=DRbzdKyIUp8hpQbnYGivceR1S0VcJpVbsrsbNhK1PBLsajNM5BIrguDx7Bfe4nZOPP
	1NCr15Hpk8R0PzA7xTCrh0mmbp7VNydw1NmBeYpRZ8+pWTF+8kGEF7v6sgI9NNIJuia+
	HGJpC3WlPCivqdEMvqWJe8w/3I7EA1RT2Fie/UbBaWCF2WBD3/6xMTESYJZZHaCboqco
	4YaMvtsep2GsXsO6h01aQNZJ6SHs3LP7yzdpE8mi4uVSU5L/DdW7Cw4foYeLYxRecBo9
	KdM6oXykxyoOlpg2vTBr6ldS+tlUwUxnbrcHX3JR9ceLZJn1CZD9jzn1p83ClLH4V4le
	J4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gXWeMIa0gnlKkXBrBumvH1fKuFVVbtGGj2BRGbIyZag=;
	b=AK1cGNa+rW+JtPg7ItagmQgZRkIT5ilEu7bXkcaySt0LcweKHIFAZnyKEdWs72Tt1O
	spWUTu6OSuKJcQoGuuLjES8Wplm5RDLHaWHUR05I13HX/zcTiyKgm/EFc8ZXdPJqtoLi
	ebKr+90ZF+Hem+fcLE71uY2yZg+aspOpaOjzA56tpgED4B6qPL/Z9SkcHiWj641rKjiB
	eommTrhis/Y4mu0awddMvwLgHelHruOmlbFVUgoJt3qK7XsCZKJcF4DeMxrezrSF4pxQ
	h7j/yGBGYxUeCJQvwnoTJgghinMW1dXLJQiT8UHyiept3IfuEIvrRQm5pMW1gJK212NG
	mtBw==
X-Gm-Message-State: AJaThX5OjKfYtFz0qLBO9F8TP0BfOKk7q6NTHCV3LgV//848yhKomHR0
	YvdU3KKoqyfpdGrkGCXSNifogCIF52pRaSKbnC8=
X-Google-Smtp-Source: AGs4zMbnmiCTqJvIgzSt2uaDgXQVnBVbw3JcaCWFX7wFJ8iodrDnjLzIaPSGWIf0rwn6pz0giaq/nGREZqe2Gopeb0A=
X-Received: by 10.223.176.194 with SMTP id j2mr5950392wra.62.1512156616744;
	Fri, 01 Dec 2017 11:30:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Fri, 1 Dec 2017 11:30:15 -0800 (PST)
In-Reply-To: <CAJTo0Lb4VsORo9110=Q8JSgQytcfoHpsRRSTWiJJ_BiPfYxvvA@mail.gmail.com>
References: <1512073240-3830-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1soVy677jtDR5GNF-x7MdxVM7H=QhONKiZrgw9GgZp74=g@mail.gmail.com>
	<CAJ86T=VX0up-q-CSOafSno14+frTM3NxzwngffCkggMOTd6vCA@mail.gmail.com>
	<CAJTo0Lb4VsORo9110=Q8JSgQytcfoHpsRRSTWiJJ_BiPfYxvvA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 1 Dec 2017 11:30:15 -0800
Message-ID: <CAJ86T=UsiK40aCLw-4KeY3LdOCHKXw_r-h2NTwAG7QjA5kQfJQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: prevent errors if do_install is run more than once
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
X-List-Received-Date: Fri, 01 Dec 2017 19:30:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 1, 2017 at 3:07 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Extend lnr to have a --force option?

Is there ever a case where we want lnr to fail if the target already exists?

There are plenty of existing examples in oe-core where rm is run
before lnr (and in the cases where it's not, it's perhaps just a bug
or an oversight).

So I think either leave the v1 patch as-is and run rm before lnr in
musl do_install as we already do elsewhere, or update lnr so that it
unconditionally removes any pre-existing target?

