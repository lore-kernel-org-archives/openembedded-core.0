Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7DFB87CBAE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:01:47 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n71so45096049ota.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 07:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M/VziQAcBb06qqQetdhrnWtvuGKZi1e5Z8rM0yT0N0A=;
	b=Qs8qiaqhSgRhzVUP6L5HEppVW4MokJcOCid3rJ9DQXWKOtY2NYl2vmUA+FJyIy7Qiq
	0vQ8iVoOsfy5CByDmqwSVuVzs/R89pCp7vmGSVA1SoCMYdM9cDWxOMhYiDSRXzqv+xjB
	Vi3OhFE1LyQtUIQuJQZjMw1WjwU0MQj6p4Y0X1GWbnuHCOZmq26hOupdztt6zRASR6KU
	KmsvlwOSrHUautn+YgYDIwxPtUDWtCnnYXDPG1dHwW+UfPj+2AfjLjZx5JakjRjPbcA0
	qT4NRTd6YhZq+F+Kj+I8Vfgld7s9tVjLVOHSjtvIz3txlymfhjWdIfOWy6NPO/zo4Y2A
	k9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M/VziQAcBb06qqQetdhrnWtvuGKZi1e5Z8rM0yT0N0A=;
	b=KoNz5eR9naG7gaRCNf75DgIPLt97jv52dAKajubEtm7z+pT1g6YroVS0pq2KTLeIJV
	idvGMkR5PU9oe8ZN7GR/ejk5MI2vlLMeHg9T1ARw1V0ougXEJJ/iPhbLtAQjSw+4eKPG
	aXCcTG6d6Ppj4aHiR0mM38MqW6daJUENRjH25pqx7Vip5jGbQRwYMChxAfDFggEDCJmR
	yv9TTbdflLd+T26TVVd7nYYbXGwziskuDkVrDsfxQLRHKIRtqaanboVqNfmkl2VJV0kD
	JzEE2dyEWsy1LGmoSgbtvxZs/AXNAwsdHJc7frI9mdAnNp7E3VRf34kIA1v2l+t40CVH
	noQg==
X-Gm-Message-State: AHQUAuZahW4C8LL6xDDlKP1Wf5SWaS8Pu9g6OrWHwmrvzADkHOjN12ZY
	xwOMndaDvKrQpMbvmvLoYcYWw9HtxeETYVSuSFQ=
X-Google-Smtp-Source: AHgI3IbgTthEAyjWeaOf6x6uMXcFYAvhcKk5li9e91VglKSmzD4H51spbEInvk1YqmJdBhEc+A7jlntvMvYrfFnd4iA=
X-Received: by 2002:a9d:640d:: with SMTP id h13mr24818714otl.153.1550761308191;
	Thu, 21 Feb 2019 07:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20190220211034.27159-1-fabio.berton@ossystems.com.br>
	<451a3c0d5250062208cb29a8e16e9c8373538ce6.camel@intel.com>
	<CAMKF1sqss0=crDQ0pGGA8FHXjjRYv+9tHE5i5ohZneipW6J7TA@mail.gmail.com>
	<CAMKF1srcbPFfGcEFWdNT+P=bmv+eweQN4d2uR_Cena8tvBvd1A@mail.gmail.com>
In-Reply-To: <CAMKF1srcbPFfGcEFWdNT+P=bmv+eweQN4d2uR_Cena8tvBvd1A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Feb 2019 16:01:28 +0100
Message-ID: <CANNYZj8v+j1r5pM_1kRS77PXzu6GkUCYkxYwg8zHmJjQvBRHsQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Subject: Re: [RFC][PATCH v3] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Thu, 21 Feb 2019 15:01:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Feb 2019 at 15:56, Khem Raj <raj.khem@gmail.com> wrote:
> > still seeing errors when building for rpi3-64
> >
> > | checking for xrandr... no
> > | configure: error: Package requirements (xrandr) were not met:
> > |
> > | No package 'xrandr' found
> > |
> > | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > | installed software in a non-standard prefix.
> >
>
> This is fixed with latest commit so we can move on but there is new one
> on aarch64/rpi
>
> https://errors.yoctoproject.org/Errors/Details/229582/
>
> seems to be due to this commit.
>
> https://gitlab.freedesktop.org/mesa/drm/commit/b541d21a0a908bf98d44375720f4430297720743
>
> probably a revert of the above patch is what can get us further.

Shouldn't we rather add a dependency on the component providing the
missing include?

Alex

