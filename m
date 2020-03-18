Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 53D3E60ADF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:07:53 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id h20so8225523qvr.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=FY4y6lOQhIxj+//kgwD0iWnJEizslavlkVftRprS9No=;
	b=Cpx2Lse+MwCx/GATMu1bo65Uy+1+ifk+bfu5JirSd0ArEVF9bIArfgGjY+le4RNyhq
	0pfXiUZB5AtGT3MSXqBwvn+6yzgcCdWSwY4z8McQWmm7VPxxCrDgKN5acAsY9dyTLB0e
	6pBbSv1Ad+QbLA3cbpW1qfj+8Q09s5Bzkllu6yRhb5mn/088VDhkt3wM3eX8kJ5aHtIi
	1Y/XWjU7eLhcEMdhkENa+psX2UYtM27z43MpiOSalv9LZfDE+6BO94NUe+JPVum78npq
	ZGDdCieqR/s2ragqrNq4K78EnJ71UMbBccFScjIiuzXIkeRThoy71bt4CmQsP1L+oUwf
	CcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=FY4y6lOQhIxj+//kgwD0iWnJEizslavlkVftRprS9No=;
	b=JW5RRpkzse2EAzoxc0QcdBJvq7PlMsX6Jl+K4UYJuiKxV2RFkWrPFagmiqtyFpE68e
	l5c0SjrRD7McsJ3owtrnDaDds3VgjFUDeKoL6BH4ZOcwKxCwPEwVolT3ED+lGuu72SNj
	/U6z5rjnV2Y0XA9st+RrKDGJwLXrL/UZM82ygAYPoz+6szO50svTrBuLZ42lKqr8sy13
	mM456xMOEEbckIN3lf5pF3uMM/utev27XsPDST5jK6mMNPPT04C/7v9PRdDgvPfgRV7U
	KRtAAC0oB5Fepveg+/odeQXW0iz1U+WJQhA4Hy4zYxub/7C5QaIq/lj1tRP5tWO+k9BL
	PUWQ==
X-Gm-Message-State: ANhLgQ2ui9L5o+QwViWCbGPns6zEONXtEC3fmdfFkagUmOYnTnYGNK2v
	BN9l2FOR9TTwlAWDCogLHxXA/VL5dNccww==
X-Google-Smtp-Source: ADFU+vs54u2lA3j2Zis2GwF3jplt7QTV+tJPkOL6Vlw3yY4t/w0sjrruugptTOti4Mi8jHXZnCaAFw==
X-Received: by 2002:a0c:db86:: with SMTP id m6mr2204764qvk.116.1584500874035; 
	Tue, 17 Mar 2020 20:07:54 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com.
	[209.85.219.51]) by smtp.gmail.com with ESMTPSA id
	a1sm3225143qkd.126.2020.03.17.20.07.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 20:07:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f51.google.com with SMTP id cz10so12146282qvb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:07:53 -0700 (PDT)
X-Received: by 2002:ad4:5427:: with SMTP id g7mr2253233qvt.23.1584500873016;
	Tue, 17 Mar 2020 20:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-10-alex.kiernan@gmail.com>
In-Reply-To: <20200317152303.4600-10-alex.kiernan@gmail.com>
Date: Wed, 18 Mar 2020 00:07:41 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrZg=DMZpNNd4kWk0MKAdoHHnZ-kyvmiFa8g2eG5AAkEg@mail.gmail.com>
Message-ID: <CAP9ODKrZg=DMZpNNd4kWk0MKAdoHHnZ-kyvmiFa8g2eG5AAkEg@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 09/11] systemd: Enable smack based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 18 Mar 2020 03:07:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 12:30 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

