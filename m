Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD3B79C7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 15:43:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q7-v6so6384713wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 08:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HnB/+CtJKVqBti3i58UAwDXl3sxvDCXD2WakxV/aHI0=;
	b=FYGSvoF4aHdxA7pkomBKUk1qfFJEktMwZRmNhjbB71qEm5APYXIuqZdsKq4QbjIiDA
	nLiK76L6ngFXICngog5K10cQiaWj7krg2bwywKSgcvONX4tcj3jZtYSjnfi+019lIQPs
	8XKlyo9F3h41+3XQkoBeJbUidASkNV0AJZgM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HnB/+CtJKVqBti3i58UAwDXl3sxvDCXD2WakxV/aHI0=;
	b=rm5Oe2LCYUt5RifMD8K6dvY/eAF1YG/Rtk9suCkIcWT2QyEB1IhqR1CWq8tpVs9zKj
	3ZKBTP0k/osYIFr6s/cWsg5nnu2nnyz/TVOX9IWXXkbhgNPZMulNDC2T7tniEKhoxugD
	OByhFqnt/xQPOOD59Vrp1aBThOnG0JCJxIRPT9VttOSdjoUVRSMeWgjxVAOzY/k0E1Sd
	apvrhGFCcBP/ZnI0lbIz0mFuTylQXs05i2tWpCQYJ4ooZ4IPFcEhrVYI6V3PfBgsBeYv
	P+0c+/o3rcc96+V1h8iXHgXgCbXx2B4ht4q9ayBGYuhhyV09kQH+1Jm6YCKQGPNuU2DO
	ZMkA==
X-Gm-Message-State: ABuFfog4GMu3Dx6Tajq4YruFUMq5e9B3p6x1lHSFqhOIKf9L7M34yIKD
	859Xu5CLLClG0y44kGah7mExZQ==
X-Google-Smtp-Source: ACcGV63JecrjYRDnxkJ0ZlN19dlrieiCbCfOQp2IcYV/4JEn0hfo3E4sTpFiTuot4CRdW9reE4FLiw==
X-Received: by 2002:a05:6000:11c1:: with SMTP id
	i1mr29945238wrx.310.1539877399150; 
	Thu, 18 Oct 2018 08:43:19 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b8-v6sm716282wme.1.2018.10.18.08.43.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Oct 2018 08:43:18 -0700 (PDT)
Message-ID: <a15a465d714ee34a86f62da18e17972d40b15f00.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 16:43:17 +0100
In-Reply-To: <20181017230044.24098-1-anibal.limon@linaro.org>
References: <20181017230044.24098-1-anibal.limon@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] meta/classes/testexport: Use manfiest filenames for package and testdata
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
X-List-Received-Date: Thu, 18 Oct 2018 15:43:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-10-17 at 18:00 -0500, Aníbal Limón wrote:
> Is clear to know for what image and machine the testexport package
> manifest and testdata was build.
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
> ---
>  meta/classes/testexport.bbclass  | 4 ++--
>  meta/lib/oeqa/runtime/context.py | 9 +++++++--
>  2 files changed, 9 insertions(+), 4 deletions(-)

I think this breaks oe-selftest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/28/builds/132/steps/7/logs/step2d

Cheers,

Richard


