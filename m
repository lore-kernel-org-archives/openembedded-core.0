Return-Path: <ferlandm@amotus.ca>
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
	[209.85.221.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6D174758
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Oct 2018 01:53:54 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id v136-v6so3429610vke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2018 18:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amotus-ca.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gPuxYeOlno0/TXP1C/IBVVG2bIIIXGdIzCDzQuPhNuI=;
	b=RNo85KL+RI4l6kk4clordXjRkR780xzW49EL10Crjwh+jIfyNT8wF1ji+P1fgzeM7D
	rAIbktTx0GlxaBWKngC7jSTg2CkGOQoo7vheKWxemojoQq/lXLP9zqJjJZiZldezLHSF
	+u6IzqUw6sscrRO18Xak1ZTPNhqeKoTrgfrK8Cr8Qwxng2nbwa7gvlRDXjyfs/MX2V55
	VzHJHL5XWkviV/qsP/hFIlx8mrsH0lNPZMCE5my20kGc5RpFSfKHUBOIG3Adu6DkKl+c
	wALsqt1+6+g0Y9TQnvTtk2qYZzOlp/ymBoMpDGF6LFckDmOgwBfRbrpIwXpmdGDxbn0R
	Gr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gPuxYeOlno0/TXP1C/IBVVG2bIIIXGdIzCDzQuPhNuI=;
	b=j8V2CL7qaDK71PQwlC5BLpkGAOP8TPM6DhVX7hg8pyTPKb6Qpj7SWzgkiGjh1Qaa9n
	IT3vQZpHOx6kK4swNh94BYmEg/GZVlRo7d1NTsq0vstYP1b3kYy1MYPB1mdrINbldTnk
	hWUx9mXNNQh+l763FQT/93pjwN9ckY1TmShaW/BscRi2c6s3tnxnmWrTVM1APqQ8xDfJ
	1lbWjKWUfKsyjrjzVRTV0V1jdgdi6U7Tafr1qp2BuQWPAWsFnpm54Wshb5vNFn8n/afh
	FZerAA49ofLUAwsTXxE/IMAMwFVkPtn/uUnCHwamb28qiDYrWWbmBbJKe+b7qmlqodSS
	IvQQ==
X-Gm-Message-State: ABuFfogoVrc7Qk2/lDx2AtFdTN+Ehv3S7mnRf+VDpOBVD6jtidUoqNUQ
	pMWTH6JpD+xj356cbCZjy2MYwlxo+QU=
X-Google-Smtp-Source: ACcGV605FE+1PqCZMrkAm3oBcSy0C0qnlRWd2E00jaFmbVpnv3uHYJijK+fIQ0GAOBGk/NPwY3da+A==
X-Received: by 2002:a1f:c2d4:: with SMTP id
	s203-v6mr5133367vkf.36.1538790835483; 
	Fri, 05 Oct 2018 18:53:55 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com.
	[209.85.221.170]) by smtp.gmail.com with ESMTPSA id
	w187-v6sm2462512vkf.23.2018.10.05.18.53.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 18:53:54 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id s197-v6so3410493vkf.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2018 18:53:54 -0700 (PDT)
X-Received: by 2002:a1f:b7d3:: with SMTP id
	h202-v6mr5435705vkf.26.1538790834440; 
	Fri, 05 Oct 2018 18:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRMzCDLn8_0sh+PqoC=FnpspLm4o3gx=UULsRZiExOL7_YhMQ@mail.gmail.com>
	<CAJTo0LaopKzbbnUDR5fixoiE4pt=9S8T-f3JMCa6NL9U1kf5uQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaopKzbbnUDR5fixoiE4pt=9S8T-f3JMCa6NL9U1kf5uQ@mail.gmail.com>
From: Marc Ferland <ferlandm@amotus.ca>
Date: Fri, 5 Oct 2018 21:53:42 -0400
X-Gmail-Original-Message-ID: <CAMRMzCDi=7129TPUGmMtqgr9GdnANS7r4N2QDEc4Fz_iyRCtCA@mail.gmail.com>
Message-ID: <CAMRMzCDi=7129TPUGmMtqgr9GdnANS7r4N2QDEc4Fz_iyRCtCA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Python3 and HTTPS issue
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
X-List-Received-Date: Sat, 06 Oct 2018 01:53:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 5, 2018 at 5:22 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> Did you install ca-certificates?
>

Looks like it did the trick, thanks.

Just wondering: why isn't ca-certificates not RRECOMMENDed by openssl
or maybe python3?

Marc

