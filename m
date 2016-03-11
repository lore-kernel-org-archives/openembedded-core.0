Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id DD502731E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 21:36:09 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id z76so161591309iof.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=WgMucPtRFelXZwI1lfo9x+vc7KCxRGcMQJtV2xmVrhw=;
	b=V8GVdKw9NGDkeoviLc+SxhrVbhE4dwBOmCweK26Z07CizOktAOy+2beQHFE/dfLwWO
	sLW8XpfojjY54oU355twT4TB+Etyve2FDIZv8FxwLW0p3rErwcXAsQzuBmIxRj5ZnEUJ
	3nBSH5DEGOIF+0e4Ht9YoXCOinhKcTGR564DtAcCT42wtGebvJ5vpeg8t1DaBVniAeQn
	7hRKsdaMWUI2p5tLgsQsq5jbh/dm3yq2+w8KGb4//AjCsvKUovCqEW73G1BPXZ0ucgJW
	fN2gZFX4QeSQkEhGS/5hPgUp1BA4riPYVMVFsqFRWdeRndYN2cWirZynJSKCaZXofsAc
	czVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=WgMucPtRFelXZwI1lfo9x+vc7KCxRGcMQJtV2xmVrhw=;
	b=DfZ4SsvElCkWBWoiDCRAnI5eNdpZnfuof8PE40ES0P1v/scfYjkj5oooLkCwEieDxx
	sS8sTbod40QSHWDPXgyCCLqG01APWtGKxY5cQaZbG2XbmF8DWbslujkJxKRgkBMp6G5O
	llj7HC69EwNf+PlhPGj+F7v/cmRBZ84tjxsesSuattYuFBlmJNuoGWAQPAZfCnX/Vg/8
	6SSAEgt7xOqyamVy/yyn1jUIJ3OdnO9+5Z5ItVp1wxYauhEYtlcJpegMjHqU1mgxi2Zn
	3llXd8oC6ifR80qpWqUhhoDp3iogOUlnXRQiqeopx0OU8Odt+H5Hfz0Z3nkPCH+iDLsv
	hFYw==
X-Gm-Message-State: AD7BkJKugAbTJLSq1cGfriNzOc6m5sxgIeqmTCdtCir66wXIN9fwYJ9AAtoR/YA4CtDq2Q==
X-Received: by 10.107.4.10 with SMTP id 10mr15005531ioe.22.1457732170890;
	Fri, 11 Mar 2016 13:36:10 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	b13sm1420990ign.0.2016.03.11.13.36.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2016 13:36:10 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1456761746-419-1-git-send-email-ross.burton@intel.com>
	<56E32888.2000301@gmail.com>
	<CAJTo0LZCxp20cT-Te0mDW+X59Pgrr+MUtO1ArgOJoVzfc-rEmA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56E33A51.2020807@gmail.com>
Date: Fri, 11 Mar 2016 16:36:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZCxp20cT-Te0mDW+X59Pgrr+MUtO1ArgOJoVzfc-rEmA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro][RFC 1/2] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Fri, 11 Mar 2016 21:36:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

On 03/11/16 15:49, Burton, Ross wrote:
>
> On 11 March 2016 at 20:20, Trevor Woerner <twoerner@gmail.com 
> <mailto:twoerner@gmail.com>> wrote:
>
>     ERROR: Nothing PROVIDES 'virtual/nativesdk-nativesdk-libx11' (but
>     virtual:nativesdk:/z/dragon410c-repo/dragon410c-tw-jethro/layers/openembedded-core/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>     <http://libsdl_1.2.15.bb> DEPENDS on or otherwise requires it).
>     Close matches:
>
>
> That's an awesome comment.  Clearly my testing wasn't optimal, there's 
> another patch required.
>
> Can you verify that 
> cherry-picking 55ca1fb8f0e81ff739b3c46897e43356d1f760c3 solves this?

Yes, verified. Cherry-picking 55ca1fb8 solves the problem.

Thanks! :-)

