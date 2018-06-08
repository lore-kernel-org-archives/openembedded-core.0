Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 21DA47523F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 22:28:48 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id w17-v6so9041062pll.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 15:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+TVlaJ3HuyOBAUfZ1voWW2+WiwF/tDtfxq/hx3hj8/E=;
	b=rtBZvf782JmHGDqV2MnI8qhFke6TlxJjkJSxUfm3YjqguLAg3TFZHqynDCkDqbxjel
	X/Kwe8CFpwKQ2P+WY908nPETzcK43512yT2yCB5h6pwMgW3BHj1uoiSjC5b+mUJAoouD
	XbJoWr5lUQ7AS8m/+cIQRErc9JXZbMOJxOLlaW4nWGSSTG1PQlcR27DsuxKTw34pJuxp
	Qe4jEzlY6uan9p59pqMCaj9TKKfrJeh/tvGUJRvf3D2ZFcE7H5tSLOb4qAwopTmM9H84
	/DcmjJz7XIysYMmXEjp+Mhb9xicvP2cX5MjP/a/D01svoWDvbiT/H6OTFh+gLfCoUrOZ
	wlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+TVlaJ3HuyOBAUfZ1voWW2+WiwF/tDtfxq/hx3hj8/E=;
	b=bbKW7sqZHc4U2qhp0yIutfL1yQjfIl/8UupTDF/8UjQOC7RrUBj9Xrv+V/vg4ClpPP
	qmnzPiyjTCnCDmkVvqQHrUG4dwhk8/HzRnzPoCfkuEjZ6/2z3+nDda5GmwbAUF4Mw93G
	KHAcEipfcvrqZlt5plEV7Ks/cqnvxUyy0HhyeK7taYkjL9DG7k9lOQwB3rcV/nPWUwtk
	/A0DgXJQDdB+DlOe12z12pX7VO7MPk5SWjnuIVfj1ad2ckL80k2UOzInpMCT6b3vxqrf
	Mlrvt8rA1ZOPb3EICnkII417Pc/AalIgaSh05vXlcO6HIX0wr36MJED9gNBRrFGOtzcK
	dTsA==
X-Gm-Message-State: APt69E3Sq1Ku8630uhVorZVjPn+u+g9rOKOP5Z95eMMlrN0BNKTDJWMg
	0PciB4e9fZLxipy2riz0zO3yRtL0
X-Google-Smtp-Source: ADUXVKLSSA96P7hAihidxEBOEDfptRPG2Uv7pb3+4Q4ZsQBlAI7TkTy/nu/3H98awylfvOdIW4CDOA==
X-Received: by 2002:a17:902:8347:: with SMTP id
	z7-v6mr8315098pln.290.1528496928745; 
	Fri, 08 Jun 2018 15:28:48 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:45cd:78c5:1629:a1d4])
	by smtp.gmail.com with ESMTPSA id
	y16-v6sm2613749pfm.141.2018.06.08.15.28.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 15:28:48 -0700 (PDT)
To: Dan McGregor <danismostlikely@gmail.com>
References: <cover.1528442551.git.raj.khem@gmail.com>
	<5cd02eb482d16a30056d860dc3ef24b365eedc88.1528442551.git.raj.khem@gmail.com>
	<CACS+7ZSGxyfMhN0SRti8m1h9t1n_HCGfQC1-myiFj+UnkjAGbA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ca098509-8af1-4fa8-f037-ba4f93142998@gmail.com>
Date: Fri, 8 Jun 2018 15:28:42 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CACS+7ZSGxyfMhN0SRti8m1h9t1n_HCGfQC1-myiFj+UnkjAGbA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] tcmode-default: Switch to gcc 8.0
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
X-List-Received-Date: Fri, 08 Jun 2018 22:28:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/8/18 3:26 PM, Dan McGregor wrote:
> Should the subject read switch to gcc 8.1?

right or better just gcc 8,
Richard do you want a new rev ?
> 
> On Fri, 8 Jun 2018, 01:29 Khem Raj, <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     ---
>       meta/conf/distro/include/tcmode-default.inc | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
> 
>     diff --git a/meta/conf/distro/include/tcmode-default.inc
>     b/meta/conf/distro/include/tcmode-default.inc
>     index 8e15f694d0..cb17061706 100644
>     --- a/meta/conf/distro/include/tcmode-default.inc
>     +++ b/meta/conf/distro/include/tcmode-default.inc
>     @@ -22,7 +22,7 @@
>     PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =
>     "${TCLIBC}-initial"
>       PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?=
>     "nativesdk-glibc-initial"
>       PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
> 
>     -GCCVERSION ?= "7.%"
>     +GCCVERSION ?= "8.%"
>       SDKGCCVERSION ?= "${GCCVERSION}"
>       BINUVERSION ?= "2.30%"
>       GDBVERSION ?= "8.1%"
>     -- 
>     2.17.1
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

