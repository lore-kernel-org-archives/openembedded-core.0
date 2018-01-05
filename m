Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9D668786D9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 11:29:08 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id t8so1859189wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jan 2018 03:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=JYjKZtTMIf2Td/xbhm96JcfW6xKs7IXO8zHZak+2QGo=;
	b=w053Je87iOnvatRymgdCZBWrkvU0WcoNzLRk9n7JVUda1dw3VFXDnD4TT61TpeXovN
	IxOLDa/aBrUOdb1T281Vp/fFOIB0k4ZcaJAVX1oN6EB3/blHrBctD0DNOBkTjVhONwlz
	lj/nurI383cODXC4cGR06D8Ju0+gNzXAmkVtx0hBNvhdL9ERpT9U5xXF3qP1D8lelght
	9of/Iw+J2i0RvtWj6aEeT9VamPcAJdEn112PGu7v00x/8zm1K5L1wa1m7dWzttRIF25i
	HW0H0Ycdd+MA3TWQJjKRjJ86fgf3u63gjRsbJBVxq13C7wt6HbDYEia7C5og/CVeN4Lr
	bFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JYjKZtTMIf2Td/xbhm96JcfW6xKs7IXO8zHZak+2QGo=;
	b=kK6ol/CyWjM7waqBys9pmSiEs6fJ9khOvSMpON6ghBj1OsVkQuO+SrpjYg1SE16tiq
	qkR9xa5PmUQ/gVWLR85bIlHJ4905L/O9+cWPdI4dw9twd/jYxKkwd898FUl5w0BMQ5k1
	Eyc3wWeDIdCoPgC5TXwMVCdx1kn5sW4gb/zAMIsaVnvcPlxlYBCgzU7PrH4kg/Y1imLw
	xzK9eDj9340SDjVCawuRZo5bJ25eZNGfKoslW6tCFgg+nAL5Wmu0xkg4XCphTWIXoTiy
	BE/hatHFOQNc5xf2ozJpgnBRQMgvp0ljGMKxCHq+m+46gJJ5O0zKhRg/ujpiiinZJqdm
	Nf1A==
X-Gm-Message-State: AKGB3mL7LZ3On3T2Y/LpKRGYRzolGt17g4eQ+LEHy/ho/kB0ghb0pZa0
	s/8VF7WNnuEuaD/c/pd6gDD4tg==
X-Google-Smtp-Source: ACJfBovldWCrXJ1PSiM6CmnKf/XiBMof97x8+bfi/tUjI4QPIZAZ55bxIQZ5uA3MNdw1O2vR0u196g==
X-Received: by 10.80.205.73 with SMTP id d9mr3689405edj.107.1515151749243;
	Fri, 05 Jan 2018 03:29:09 -0800 (PST)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	a5sm3596728edm.47.2018.01.05.03.29.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jan 2018 03:29:07 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
	<CAJTo0LaHXJMMNg8VmqFNne_8rgEV9TER5saUzUXudRgvzggWNw@mail.gmail.com>
	<6d1905cf-26d2-49cf-d0bb-248cbf4a071d@dresearch-fe.de>
	<CAJTo0LYWwMnj4Wb6JC1y7uw4ZrPv6=SynfkSc0TU0dwi9Dezjw@mail.gmail.com>
	<8926eabe-78fe-dfaa-d123-5d4ed39e0001@dresearch-fe.de>
	<9d1c1e79-5eab-941c-0d30-314f9df51de1@dresearch-fe.de>
	<1515076794.5525.196.camel@linuxfoundation.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <cad1f9fe-e682-a5f6-72ab-71a7738ea46a@dresearch-fe.de>
Date: Fri, 5 Jan 2018 12:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515076794.5525.196.camel@linuxfoundation.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: MS Windows machine?
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
X-List-Received-Date: Fri, 05 Jan 2018 11:29:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

On 04.01.2018 15:39, Richard Purdie wrote:
> In basic terms, you need a machine which:
> 
> * Sets TARGET_ARCH to the right thing (i686 or x86_64)
> * Sets TARGET_OS to mingw32
> 
> and then some distro config which sets up the toolchain when mingw is
> the target os to the values like meta-mingw/conf/machine-sdk/i686-
> mingw32.conf sets.

Do you have a sample distro config which we can use as a template?

