Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id C7B1D61C60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 16:06:05 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id ca13so2851359pjb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 09:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=xP9GZfva+6jtI7VYlY5XpE95casQx8JJsoqAaA+chyM=;
	b=RxG8PgVFlDzxuaLFEfoTbBIFlZMtiW4P9UDKCnyk/owi1gq9/jVpLOYvPHreOh7gyK
	Hv+nlaqT7P5AuSjZjXXUDo7dKAB9Bm/flw9f5cDn5cyFk+7LrmeJR/UElhkj18mHpeBs
	JkNJCgD87s2aHFlr4BJiFdYHg6ZZtaOq1oKmj0SRiK8MnapCUELPLARmfQQNLETmY0zO
	Kt8R6s0Mwa3M/p3Z8/o0SQDqB5YCikXpGqqVJKnHUa2yHYJOXoOzzFfj8Ht2CvisoDVw
	ysnxFP9IQocoJUe5bcM2x5Gkbx8hYOQU5jVhXVaLMDiz/t8gMGlMgQ6nqnwtUQwnvbk+
	YoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xP9GZfva+6jtI7VYlY5XpE95casQx8JJsoqAaA+chyM=;
	b=TaDOkCH3PnGCasNfpbo8C9JGRc1bASH0Vq9UNueRAq169eC1ickMYlZA3p4gJdfxr2
	oBKLPQZ07Jj0hfSNoRyyPioYmBp9F4rNshUGwDaas5oVdoIuXVmcz2aeVs0gUYtcutB4
	SdiaZ+a3GqTz4+LToyRXloN4f/hQRMxyBB7FYKICo/2NzIy0QSWmRsXTsLXV933u8EmO
	gpHhiSem2/c0K13SODfnTrKbq69e7cKw0qcFI6PJmDELJ/gTQp2lN1bt4QRWkQmSBTtN
	lCVO0f8o4lfeaZck+UIM0QmsbrN27OotnW+j4A4fbJgi+15o5KvTMXgK3FH9DkG9WoCj
	nWkg==
X-Gm-Message-State: ANhLgQ1nRafrH91MWXWqR7A90jR3tp7xas9jCchMICpIRLWrAxVbFfPL
	n54tvPd1eTiPLjxCNgWfb68S82hNeVY=
X-Google-Smtp-Source: ADFU+vvS1HgDj+MgxK3RgsgVkRfnYEClP4++A7UlflQ3x4B2ePfqRcNv4o58YSaymzc12DnpS2zYTA==
X-Received: by 2002:a17:90a:4d43:: with SMTP id
	l3mr4654396pjh.165.1584029165724; 
	Thu, 12 Mar 2020 09:06:05 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0:d558:25ee:538d:b97a?
	([2601:646:9200:4e0:d558:25ee:538d:b97a])
	by smtp.gmail.com with ESMTPSA id
	q13sm54080385pgh.30.2020.03.12.09.06.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 12 Mar 2020 09:06:05 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1583983272-116095-1-git-send-email-mingli.yu@windriver.com>
	<CANNYZj8uQeTRf4n1rkCkKkGc7n4KWrH5MdT13uAzivrBHDAsZA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <35d02004-68f2-eac7-16e5-8e51d98d7a1d@gmail.com>
Date: Thu, 12 Mar 2020 09:06:04 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8uQeTRf4n1rkCkKkGc7n4KWrH5MdT13uAzivrBHDAsZA@mail.gmail.com>
Subject: Re: [PATCH] netbase: use snapshot.debian.org
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
X-List-Received-Date: Thu, 12 Mar 2020 16:06:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/12/20 1:25 AM, Alexander Kanavin wrote:
> On Thu, 12 Mar 2020 at 04:22, <mingli.yu@windriver.com 
> <mailto:mingli.yu@windriver.com>> wrote:
> 
>     -SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
>     +SRC_URI =
>     "http://snapshot.debian.org/archive/debian/20200311T090704Z/pool/main/n/${BPN}/${BPN}_${PV}.tar.xz
>     <http://snapshot.debian.org/archive/debian/20200311T090704Z/pool/main/n/$%7BBPN%7D/$%7BBPN%7D_$%7BPV%7D.tar.xz>"
> 
> 
> This will break version checks and automated upgrades. Is it possible to 
> build from git instead?
> Specifically: https://salsa.debian.org/md/netbase

That repo is debian build metadata sources for netbase.

> 
> Alex
> 

