Return-Path: <jun.nie@linaro.org>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id EDA6B7EC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 08:21:37 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z3so44454127iog.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 01:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=PKi8qACTiWTLBCU8K/tjI3NNkCwFNm5a4BaLNNqdEoA=;
	b=pgu0+QaYkgQw1+svOHQ3KtsBKcSXTJj+uH6LWnu/Cq1hZ61pwonXfgBAi/XN67mwTY
	gW3kctuLYPFJOvZuocbTZNhVHykJ1Ccs1uaa5fdSJyuyu/QzHBKkmH+j2uA/IHuwPUMB
	EN05hQp5T0Byl4Nmvv7nkUpXr2fi2GnAa9juvpKj7aHlljk6SIQ4VVuS6F1NaHYZ+D9R
	jR3yNoAnBfznlFN4APRkFLjZ6NCcQ0+FiPeoPBLJtt4IELR0nD6BbZHdAFSAp7XSAn+1
	rRNQYyO9WzhY9NT0KfDTSkEK6RUqM9ibTl+LouNeNr1VNfZSOrPhHIKbV2fZ4ZqUyUNj
	N3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=PKi8qACTiWTLBCU8K/tjI3NNkCwFNm5a4BaLNNqdEoA=;
	b=VROgS/xEtR+ouHFX6KnVeFDg+y+coiHruL3GTSNmhLUwohA78X85p4lAn4Wyu0zHYZ
	7iMhcLGGhw5Zn+CW2WqKcN5v/NYoUPEE4n3ithM0Fw9W6fJamc+Yvo8zlqQi05hS/XjW
	xd/RInJfT0TV3A4iKppAvpGn3cLYXizUnU1oqDBwXfDASzK6idS6fwPjtsEcNMpBXkgJ
	4PoJbk7t8uz7TdZ4cA+LhNRID2VlR2xoibXJ7Kxsca0J2tRhb9+K540Om1ofsVwhOzTi
	OK4mLrqCnJuBY22cN1H+PrRjOm1alQ4iYpISLyIvLyGo7tPWDSi2R2qUXVz01f5kzrDA
	lQog==
X-Gm-Message-State: APjAAAVC323azQEbStiayLAa3/2HSeMYebOmqVJLN15nj2nEnNRXKGYi
	N17o3My2HC3F+eW71J6gzMvoQQCvAi2x0chRpLdrsA==
X-Google-Smtp-Source: APXvYqyc74RiDjNG+fyfvAO7lbHQ1eFIKVYALBaejhYrfiIQEuF9vx1z+eP9QlGrXcsfJfY3rlN4fnq51d1/WGh0K+0=
X-Received: by 2002:a5d:9e48:: with SMTP id i8mr34234908ioi.51.1563351698966; 
	Wed, 17 Jul 2019 01:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
In-Reply-To: <1562742656-23568-1-git-send-email-jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 17 Jul 2019 16:21:28 +0800
Message-ID: <CABymUCN0jnfamrfYmd5BRDYH+7mQ85wrYty4uvfWgV_wM2Bssg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	liezhi.yang@windriver.com, andreas.obergschwandtner@skidata.com, 
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage: uboot-sign: fix missing signature
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
X-List-Received-Date: Wed, 17 Jul 2019 08:21:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2019=E5=B9=B47=E6=9C=8810=E6=97=A5=E5=
=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:11=E5=86=99=E9=81=93=EF=BC=9A
>
> u-boot.bin with dtb & signature should be placed in ${B} so that
> it can be deployed by u-boot as expected. Otherwise, the version
> without signature is installed.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Does anyone have opinion on this patch? Or suppose it can be merged now?

Thanks!
Jun

