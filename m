Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7F973232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 17:50:18 +0000 (UTC)
Received: by ioii196 with SMTP id i196so69930771ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 10:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=kw3e36MX9PVFOTAe5x7l+iCmPbe87M7bpcKpN6tcIW8=;
	b=MB0EpNsjlioeOT+EATkSpgV3KaxhpF/mTYfya0lPnBRMZur20p3kLVOLwe3yugiIuj
	NWoWPW2pblblczLTEtYYxfcC/tqLeRgnxRfnkzhLbr4te2Vyt0oCwU9CTpGJYoRLTyx1
	sQtuIE7rVAgy4QbIutP2fjWLD3x94QjBb3N0jGj3G5ecQakCeh/bDOEebkz6VB4Zri0g
	4dzVe8MxOHzRcy0UwjeUzhK0J4yAoMv80h+XKGp24jD3u2Iwhc2EFhEyZIMkWK68z7iE
	zjagiVY0hMp1V5fPVymbspwXwoAoGj+pRPtQZ1A2zteV+hqwXnEusfTEXEzcfbkMxP8m
	xsMg==
X-Gm-Message-State: ALoCoQk+0gOkALEk264l3FZVlkohD4fuqEOXDdJz40vDCTSLrRaTjfuyAuKonGs+4MF0zME85Q2n
X-Received: by 10.107.157.80 with SMTP id g77mr57087229ioe.118.1441907418421; 
	Thu, 10 Sep 2015 10:50:18 -0700 (PDT)
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com.
	[209.85.213.181])
	by smtp.gmail.com with ESMTPSA id y6sm4643474igl.17.2015.09.10.10.50.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 10:50:17 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so22567688igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 10:50:16 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.17.67 with SMTP id m3mr8801315igd.5.1441907416861; Thu,
	10 Sep 2015 10:50:16 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 10 Sep 2015 10:50:16 -0700 (PDT)
In-Reply-To: <1441880652-12645-1-git-send-email-nathan@nathanrossi.com>
References: <1441880652-12645-1-git-send-email-nathan@nathanrossi.com>
Date: Thu, 10 Sep 2015 14:50:16 -0300
Message-ID: <CAP9ODKr=Sg2Gq8AghfQD-SFWWr2vF=wOo0VqStfjsjkYW2WDRw@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot.inc: Add host compiler flags and openssl-native dependency
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
X-List-Received-Date: Thu, 10 Sep 2015 17:50:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 10, 2015 at 7:24 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
> U-Boot will compile its own tools during the build, with specific
> configurations (aka when CONFIG_FIT_SIGNATURE is enabled) the host tools
> require openssl. This patch adds 'openssl' as a PACKAGECONFIG that
> enables the use of openssl-native as a dependency and also adds the
> HOSTCC flags that U-Boot uses when compiling the host tools.
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>

Ideally we ought to ensure U-Boot stops to build the native part when
doing the target one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

