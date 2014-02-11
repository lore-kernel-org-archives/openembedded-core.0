Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id CFC156B8D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 16:56:02 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k4so12171347qaq.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 08:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bFTh08bqh6StgHFpFoKPAIZZXkNry5vitE/sfdvEsJM=;
	b=ddHOtXqzFJU4XcTNdh1G/nUvZbjpZA33QFIl/7KCjRReBAx6f+tVcA/lblo79ibogW
	B1zoR51Zm56efQLv0YpCi00YGcf8GQotjHz8YXTlH/njFmOgPR0EvvGSxcOAvdR7QuRY
	PZMSRdd2LWy5DSpdIEJKZeLPQ+1hj5hvh943g+CdFAi45stNV5GenV8Tb2HfKr9Pjw20
	HxzD5ZNwyHqoLVsy/OEiK9CYoyc+0l+x3+QrCYAmXT8AMW8aKOhfoTEQBpktHP3nwa27
	BHy1Euh30KVFPQLL0i8pW7IObq97RcMsrok0PPcBQM9pB/9JmTODuPjQoUmoQcD2jPHo
	FSPQ==
X-Gm-Message-State: ALoCoQkIi+r2fYgVB0usH/exor+u98PRSvjzAevaXaxVwvkhoZUNCDSc5S6TAeGHnn45mwo6OoVA
X-Received: by 10.224.127.129 with SMTP id g1mr24303747qas.22.1392137763077;
	Tue, 11 Feb 2014 08:56:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Tue, 11 Feb 2014 08:55:43 -0800 (PST)
In-Reply-To: <CAMKF1srqDy1YzE992x_ersQ9FrcX0quqrhn3gevn5cU7OMNEiQ@mail.gmail.com>
References: <cover.1392089446.git.raj.khem@gmail.com>
	<5eeeedfcaec0bd520449d7926da70085eb033991.1392089446.git.raj.khem@gmail.com>
	<CAJTo0LYuEX-3iYUVcwKu_pppBN5o9bPDSwaJ870zHr1uZ_mjCg@mail.gmail.com>
	<CAMKF1srNpswQ2doGgkAeHDHnS=JuK1E4MGKqjOYRbP+TK3qSVw@mail.gmail.com>
	<CAJTo0LaD4=NZTeLRKD=pOfi5sqGBVacKA-ObWmXkT0JbT2=Xwg@mail.gmail.com>
	<CAMKF1so-_a8437RrW9FYbENVys5D6Qv8dxd1kNDF9TzZ0OKyng@mail.gmail.com>
	<CAJTo0LaB9HsxiYxRH3yA=f1pa5Xtp+EW2ofgwGHH3Uok-35v_Q@mail.gmail.com>
	<CAMKF1srqDy1YzE992x_ersQ9FrcX0quqrhn3gevn5cU7OMNEiQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Feb 2014 16:55:43 +0000
Message-ID: <CAJTo0LZ6iSUkJHKj5bTi1zM0YuRerww2FM0e=APOBhyy+N3n_A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: Enable building microhttpd
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
X-List-Received-Date: Tue, 11 Feb 2014 16:56:04 -0000
Content-Type: text/plain; charset=UTF-8

On 11 February 2014 16:46, Khem Raj <raj.khem@gmail.com> wrote:
> We already had --disable-microhttpd in EXTRA_OECONF so I removed it from there
> and moved that piece to PACKAGECONFIG and pushed the patch to pull
> tree, take a look.

Yeah, that. :)

Ross

