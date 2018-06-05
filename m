Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0880F7707F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 15:26:20 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id c128-v6so2432988oig.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 08:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VtWvWvOSGGu2HlF7XD0v6Ow64lJcRyDdtcRacoMX4W8=;
	b=BD4Ttn/38X6U/3U70YTrmzk3CL7V4jr2VVPn6q5oKVVt0xu8YkeN2Vt9hwmiPR5O/7
	J2xU2o0MB6umYn49z1YsU12CY4nJ4tKJvnaz3LP9dCetFRqATbzIzHtqpLRpAd34PcSi
	JjnPgGFfRnHUUtlwM05NJqLD8o87f3qAiLWFEPrcK/OMQYmRy7OaLAwJ4L0yVwlVWDAo
	OO62bep5bepj9vkZYqSJuUOaTO5sqjhjck3Yhh+w3OaYQdbbrihfIyHEYj6xUxqRNuOn
	c+FYnBAoMdPoEPksSRrwkbCC7L/R2qOVd5bnAQPnLPk8AJ22BWyX6VpjybPyUFQAzhm1
	iDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VtWvWvOSGGu2HlF7XD0v6Ow64lJcRyDdtcRacoMX4W8=;
	b=dBdcCbGTapMMwxyXtP8nz5li4thDcVZTnpfAclLWr7B6AFUg7EdWlkp99NSprWX47R
	kCGH8s5d4CjI5ukrQHMSokXCwQfl+rRAf9fqlYGPm7hbDuVThcqOiP3DbRd+IBi2st/5
	4JV9pcifk4bDDvOMdEm3HNPO6T7+7cz40Ri/05kj7b7eA8KzQPoyfqDvasSEHxNxar83
	/LhNhqunxH0u9NEHq5qMcBxiuwpERilxkmqKlCUWy9nOByVYMNFsoWbCyWiYPJRLjkOf
	g/FpQraD3fzFf2lk1xE/tAtgvrrW09qto4F4CiBll0jTwUHlb3m2h22SJbpKmvCUW37f
	6Frw==
X-Gm-Message-State: ALKqPweX+NNGV05/5NyJURcLa1BkvlwlXGHRK/iZMT9vOz0LE8dAQVc7
	cN4C0L4cwh2KVfnWC3+2dDMCDP6Yf7veBjTzCaY=
X-Google-Smtp-Source: ADUXVKIS3YBVnv/tAHSwaNQeCAw84eLoXbDBtIKd5rNGRRoAj9xTTlYEL5Jth5w+Ktf+dJoQQ6bQ4DcFEdrLg4bhN4M=
X-Received: by 2002:aca:47cb:: with SMTP id
	u194-v6mr15381326oia.45.1528212381928; 
	Tue, 05 Jun 2018 08:26:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 08:26:21 -0700 (PDT)
In-Reply-To: <20180605152213.28474-1-dev@sashko.rv.ua>
References: <20180605152213.28474-1-dev@sashko.rv.ua>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Jun 2018 18:26:21 +0300
Message-ID: <CANNYZj-tOz83ZEVDwLpFaPi9n92Ac63=UV8QvSONo_pCm=oLag@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] iso-codes: update to 3.79 and fix SRC_URI
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
X-List-Received-Date: Tue, 05 Jun 2018 15:26:21 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-05 18:22 GMT+03:00 Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com>:
> -SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
> -SRC_URI[md5sum] = "9d0d06cfb4634428b300845edcd7140a"
> -SRC_URI[sha256sum] = "21cd73a4c6f95d9474ebfcffd4e065223857720f24858e564f4409b19f7f0d90"
> +SRC_URI = "${DEBIAN_MIRROR}/main/i/iso-codes/iso-codes_${PV}.orig.tar.xz"
> +SRC_URI[md5sum] = "5875d7aa41b1acd7b218631ff7b85464"
> +SRC_URI[sha256sum] = "cbafd36cd4c588a254c0a5c42e682190c3784ceaf2a098da4c9c4a0cbc842822"

Please use the original upstream git repo. We take sources from
DEBIAN_MIRROR if the primary upstream source is absent or
inaccessible, but this is not the case here:
https://salsa.debian.org/iso-codes-team/iso-codes

Alex

