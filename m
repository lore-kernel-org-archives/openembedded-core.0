Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id C41AB78AA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 13:07:15 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id d5-v6so17788421oib.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 06:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3tI/0itAHlZvHgS4q3Kg9xLDiCz+1SaLxP9Vr5koG2Q=;
	b=XxhxLhwfZFUA3QQcJl3i08KfRLmjzgWKAipCkUfsTA46/uy8sqY7vW9rXoBE0I873b
	ZqY+IkQDvjC748dVHfOCWGJHaZsaFUuUniiEhOJmpsj3NFPqQf1a6lVFf17KfA0qZjwh
	4Zex5Onf2sZUpMtywYMzUQtXP+J4BHcc3/JAhc5Fc8lURfIdgkwGGK61cGbcFeBkRB1Z
	N5BC9xNErNPvn41pV0hSYghnONyIuWvJCYArfBa4oFJfL2QfaRVgqP6XT65Hv7xvDKhS
	Z9mcXlcnwb0F1/YQt0M60tdLcMkXPWQRWUnK1Tdv1IuRF2WniolDD1N7TLc9xRNIgf7g
	MQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3tI/0itAHlZvHgS4q3Kg9xLDiCz+1SaLxP9Vr5koG2Q=;
	b=hE70bdUuJMIrc+P0OtqKoRqANLCnqhHJWRPO303pFrlXymMcmGXVBPaEjgk68tiTV5
	EXVC8CcIPyiaCWoWpJ9yFuI7GdAqUtFjliP2jp2C2ilL+icNLuqKhfhd06yGEsSdX6nW
	7HvOWzH8fTDwaflsA23yui7esvK52aX502DdbGXfWfZrsR/kSwmjvlg5bJ11nE6tEU6N
	ckgVdq9r+m7HgA13JS8DXuMZFof/2Ib+QmvFtGK4OArZSyv0x9l1+9DxVamCxsrCD5Dk
	ZQBEP6mz8VefVjE47rPAYgKwidjjSZCQR0VCxweTT5m6h8K8B8xZ3vF0ZCmU2gyULBNQ
	0wlw==
X-Gm-Message-State: APt69E0k/yY0J6mtB8XkzsCdaMHcJCKL1RYNAE6Wyjr57Y3r94NcdDZa
	pdazZd70yBBhkeJmVIVn1jo9YL4Ab3/apUdIhOOhyw==
X-Google-Smtp-Source: ADUXVKI+ZJUTF/h3DH2EtIifHYao1BuHSLh81qfDQSk6Vcy/gbFhaqw5NqqSxbn+u8mG7W1LABN+H1pm5lSSq/Sdd78=
X-Received: by 2002:aca:acd7:: with SMTP id
	v206-v6mr8626187oie.320.1528722436608; 
	Mon, 11 Jun 2018 06:07:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 06:06:56
	-0700 (PDT)
In-Reply-To: <1528574447-21755-3-git-send-email-akuster808@gmail.com>
References: <1528574447-21755-1-git-send-email-akuster808@gmail.com>
	<1528574447-21755-3-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jun 2018 14:06:56 +0100
Message-ID: <CAJTo0LasaDVfZ04i-EYoi8Es7Jw6VLPbejtpCFvWKQXPE8WfCw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] selftest: add cmake oeqa portion
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
X-List-Received-Date: Mon, 11 Jun 2018 13:07:16 -0000
Content-Type: text/plain; charset="UTF-8"

On 9 June 2018 at 21:00, Armin Kuster <akuster808@gmail.com> wrote:
> add boost

Explain what this test is meant to do so in two years time we're not
struggling to understand why.

>  create mode 100644 meta/lib/oeqa/selftest/cases/cmake.py

Squash with the previous commit.

> +from glob import glob

Not needed.

> +from oeqa.core.decorator.oeid import OETestID

Not needed becase...

> +class CmakeSelfTests(OESelftestTestCase):
> +    @OETestID(3000)

https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=3000
"Test case 3000 does not exist"

Don't invent test IDs.

Ross

