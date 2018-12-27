Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCC56C14B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 11:32:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m1so16532968wml.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 03:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=uSLeAItZMuTc6NXToMpUJW/x1H4VDT2QEzXvvlmmyaE=;
	b=HRp9VipyoJjL7sXa0d0gRj3j2967oM7k4BIqedlUcp87u93uw4paNMjTS5blIrmMgC
	BHONNO2eAIiNdDp6+ow4lTrOdbvFU3e5LLOI4Ca1rPlfNX/ncb7p5i6AxKJc5SAmj+vu
	EvwZvtbDCnuTiAGK2NhJwGYAdCSx2YCRk/3V4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uSLeAItZMuTc6NXToMpUJW/x1H4VDT2QEzXvvlmmyaE=;
	b=GvutEvKUlQfJ3jO4cTCpChQ1f6Qom2zK8UwjH6xjIc4Ae888UIQh+e8vcO2wS7RgHK
	VCUXI7yQ30UukQwDAGPpsXaoU4/DI3IZIhPKWuvAaDeXSeL9/pH3acsJwt9NLqmPZhM4
	WI1E6cGMRYBQc16Hxs7OhWGoPc6kjPuY2ppxbdCy61KTnvTA47X+yOBkYZbKyGNzQKSR
	BKzbhRSD1maLIEVW6DAbh4uvCgtx+dFl45MUngiifcO7HOp+2YTXeGYRoTaME/L7kGoX
	bOutBhh2OUdI2W/W15RIxkUlDJuDO6r8gicg+8KmZgOnJ1u+WI/bYeNE4ompAPHIFCYm
	5iYw==
X-Gm-Message-State: AA+aEWaX6ZlYegPHZC/J4eVRKYsClg9jCw/SAmYcknp2CwIUDc+kFLNa
	5TR3qrVnX3iW97n6068vKYHOxQ==
X-Google-Smtp-Source: AFSGD/WToPSbNZyNM4k6b8zL/mf3iRSZuFq4th9epv6aLsyE+seC/mt92J4MBKbdcxzs2s598mIPsA==
X-Received: by 2002:a1c:2547:: with SMTP id l68mr20961665wml.11.1545910363797; 
	Thu, 27 Dec 2018 03:32:43 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z12sm27723517wrh.35.2018.12.27.03.32.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Dec 2018 03:32:43 -0800 (PST)
Message-ID: <892f9927cba8a7f4d4e260144e4257f96af469c1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2018 11:32:42 +0000
In-Reply-To: <97c9fb76d7d46684593fe7b1c7786bdd1344b165.1545901142.git.liezhi.yang@windriver.com>
References: <cover.1545901142.git.liezhi.yang@windriver.com>
	<97c9fb76d7d46684593fe7b1c7786bdd1344b165.1545901142.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/3] runqemu-gen-tapdevs: Allow run --help without sudo
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
X-List-Received-Date: Thu, 27 Dec 2018 11:32:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-27 at 00:59 -0800, Robert Yang wrote:
> Then we can get user's UID and GID rather than hardcode to 1000,
> e.g.:
> 
> $ sudo ../poky/scripts/runqemu-gen-tapdevs 15220 100 4 tmp/sysroots-
> components/x86_64/qemu-helper-native/usr/bin
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/runqemu-gen-tapdevs | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

This fixes the help output without sudo but breaks the help output
under sudo. How about we check SUDO_UID and SUDO_GID? Something like:

uid=`id -u`
if [ -n "$SUDO_UID" ]; then
    uid=$SUDO_UID
fi

?

Cheers,

Richard



