Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5155B79435
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:34:38 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id s12-v6so9431751wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XUcMB0vrScvA3tb6WLTq39dCrbnl4bmmo5tDdKUe+Fc=;
	b=eV3RCyz4q972JrKj98ROkPugdIW4mtOPEN2OUVdupMQLHgbujKqXXp97iwu7gmOTzf
	d4a9iI9l3DYMQj7fSY5P7rWuVx2KePAaMwQh6lkD+J8lZimGmNHRtNbdxRQ2xGBCwJbD
	o1KVYB5Vvus4wxM+zRCbAH88gz78to1zxMYRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XUcMB0vrScvA3tb6WLTq39dCrbnl4bmmo5tDdKUe+Fc=;
	b=XfY5Qunzv/kZAey9hr87xUIrapwSsCwx/kV1vpjB/RIwDyIUqSIxWhXOFbpWhxL8ZU
	diK0QEx54bHigICXSltvXUwGScyBHIktU6Vpd1Yjh1Zzf40uN87oCuvOvtHJWzryb4zy
	T0SJpkOPwLJiTHfEg/FTF3NflztoTcQttbWk50zamt1W3YSMMOj2GDZzckWnvzoQntkk
	m02jSLyEkBTay6y235/djK86TWjes+QFa9DrymMuTnxazIq1pIFMRO04UWbMgcG2KaqH
	aEUZ4segn+emodAcxcpHA1AL0ZhdFhz9Z0sJ7Ggk5wdIgW/vBhFCtq4K8+w4i5DAlqZl
	r2Yg==
X-Gm-Message-State: APzg51A8H2y+lAz90mQzMhUUpgO9cCkir/o3VPQwM783mgA6lrtAIM9h
	BHV8jeHFs4rUqi5TRBlh6PBHNa6p22E=
X-Google-Smtp-Source: ANB0VdaAmlzLFH15wEtlcVnpjfisROr4SfXU4oG2obshRID/72YIv67zO4lOJzyr3HtRx7CYgs9LUA==
X-Received: by 2002:a1c:7814:: with SMTP id t20-v6mr170476wmc.38.1536183279103;
	Wed, 05 Sep 2018 14:34:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f18-v6sm2789453wru.51.2018.09.05.14.34.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Sep 2018 14:34:38 -0700 (PDT)
Message-ID: <9cbb0ca59f603d641792931d1ab41f9c5fa12b6f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kang Kai <Kai.Kang@windriver.com>
Date: Wed, 05 Sep 2018 22:34:36 +0100
In-Reply-To: <81594ab4-f5b8-d811-8fca-cab2a5070d0e@windriver.com>
References: <cover.1535288685.git.kai.kang@windriver.com>
	<00a09c8156afc325f1b30392b66caf08e0310b38.1535288685.git.kai.kang@windriver.com>
	<98fc089f8be135c19a0210df09b5a755f03d5112.camel@linuxfoundation.org>
	<81594ab4-f5b8-d811-8fca-cab2a5070d0e@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] allarch: disable allarch when multilib is used
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
X-List-Received-Date: Wed, 05 Sep 2018 21:34:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-05 at 10:52 +0800, Kang Kai wrote:
> I searched oe-core for which inherits allarch and bbextend nativesdk
> by:
> 
> $ rgrep 'inherit.*allarch' -l meta | xargs grep -l 
> 'BBCLASSEXTEND.*nativesdk'
> meta/recipes-devtools/autoconf-archive/autoconf-archive_2018.03.13.bb
> meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
> meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
> 
> And I checked one of them:
> 
> $ bitbake -e nativesdk-autoconf-archive > be.nativesdk-autoconf-
> archive
> 
> The var PACKAGE_ARCH will be set with value from nativesdk.bbclass
> and 
> overwrite the value from allarch.bbclass:
> 
> # $PACKAGE_ARCH [4 operations]
> #   set /buildarea/kkang/yocto/poky/meta/conf/bitbake.conf:150
> #     [_defaultval] "${TUNE_PKGARCH}"
> #   set /buildarea/kkang/yocto/poky/meta/conf/documentation.conf:304
> #     [doc] "The architecture of the resulting package or packages."
> #   set /buildarea/kkang/yocto/poky/meta/classes/allarch.bbclass:5
> # "all"
> #   set /buildarea/kkang/yocto/poky/meta/classes/nativesdk.bbclass:18
> # "${SDK_ARCH}-${SDKPKGSUFFIX}"
> # pre-expansion value:
> # "${SDK_ARCH}-${SDKPKGSUFFIX}"
> PACKAGE_ARCH="x86_64-nativesdk"
> 
> It seems update of allarch.bbclass doesn't affect nativesdk. Or did
> I miss something? Thanks.

Sorry, I think its me that is confused. I could have sworn there was a
noarch-nativesdk package class. I think we abandoned it due to is not
giving much benefit but high complexity and you're right, looking at
the code, it doesn't exist now.

Cheers,

Richard

