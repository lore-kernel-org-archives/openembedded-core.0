Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBAB60107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 11:38:56 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id n64so2998284wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 04:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fILxBr2vMN9zwre62nK7PUdaT42LLGIPpXhRVT1KWQY=;
	b=HBYpUvZG/2r75MV5sq8ANY4tk1L6MvAypnENyjzwUGjmR2qvYuSuKV4QyI6kitHrnH
	B+ZVDcZJ5zVC8mvcStzIRHOezd74jgvaHmxLp2374Wu88oNerxDVR36qy/tlmmrzF8Fs
	B5+6yHZmCVdJuU3JeM+buOTLwX5p/NjD+op91lSOBM48pLc7/XoItMuDGMUUwe1nHHEP
	mCgj7hKpvtVCFYpdEZXTBF6laBCprmB1SXNpx0+8FPuljeDwNAV2XvmImtGD+eL3SxYW
	2wyWyF2YbwEw8OUCpmVwUTI8GIHdN8K6gj/gkyD1aTyX4Imj25oz1wZCzLHbdigLXZ1A
	jhOA==
X-Gm-Message-State: AHPjjUjhxIzali5d5yOcThLGMeQFNsMNaEAOTS5JGEUJhn2ebjQPtL0/
	FmCTCNYP67hKifg9na2cuFo65etz
X-Google-Smtp-Source: AOwi7QD28QFeXo366uizue8nhnyqPgMyEjF8usJ2W6sJWz3jJbAftBxjq5lc6GprFw+UyVt5Z0jUjw==
X-Received: by 10.223.171.206 with SMTP id s72mr1633642wrc.27.1505993937791;
	Thu, 21 Sep 2017 04:38:57 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s196sm1238497wmb.26.2017.09.21.04.38.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Sep 2017 04:38:57 -0700 (PDT)
Message-ID: <1505993936.19222.15.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 12:38:56 +0100
In-Reply-To: <20170921112952.17395-1-git@andred.net>
References: <20170921112518.16132-2-git@andred.net>
	<20170921112952.17395-1-git@andred.net>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] uboot-extlinux: fix extlinux creation race (take 2)
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
X-List-Received-Date: Thu, 21 Sep 2017 11:38:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Thu, 2017-09-21 at 12:29 +0100, André Draszik wrote:
> From: André Draszik <adraszik@tycoint.com>
> 
> Alternative solution to original commit
> 60c90398580998b2379bb438f0f75b29285135a5 ("u-boot: fix extlinux
> creation race")
> 
> (Untested)

I am not in a position to test this patch, but I believe that it should
work...


Cheers,
Andre'


