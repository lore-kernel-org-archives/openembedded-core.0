Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id D60DB77E4A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 17:46:51 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id h70so8681259oic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 10:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=l8QV0ywcw3pnfEht6CPVAuLi8N1yFjD8DerD28wwVWE=;
	b=VRU1PcvG9H2EQx/u0upnVCYuLJfhZ2z85eWI/RevoCGjsxs7+r2gapvKGASSxkw2kg
	+TMZicqVPojG8kIjiTDyFqZhocfNrp3Bv+VP2UCyPYyUqxVjR2f+rY2Z7F6ZqagQKRm0
	RU4nITb4Z3EjCAdp237S4o4qL3U7Eno09wpjAq0AFmGzfnYZ4PyGp+69bLMmDGVQk345
	vvEjZFlq7LPxEJga/nRzL70p6W2x92IBFcQ/f4S+CmxjA2n7yQ3UvMIlwK7lO1IYp9r0
	hmKseFauhbul7y93uSs3gw4Bfs+Uktu4IcPrVBrJdA7KsmscGNsSBW2GisyC6GQM4aRG
	61zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=l8QV0ywcw3pnfEht6CPVAuLi8N1yFjD8DerD28wwVWE=;
	b=UfTKz/7fp8VOotCW6kSNDa2dR5OdhNxFFsCt9HY/Vwxae4PNF7ND8iy5HiqmdQZlGM
	EmjraIElHVoPwghvAfkVRgx6nU2JTI47zfZL4KabNVjnaLf1MLCD9nr+PAwrTu/rSzSz
	3Ip+gr6/Ws1ogagj8jrXMcgXGvFbhNkMDsKH2XnVTC3SG6KCq6saJSVahU3cf7ZsUoC4
	VudCPTMcpIOCs44pywVhmLr5ivNH67wByEPBoBKxvkenA92U8PkCoEnbZTuRh3Yd/yOQ
	q7GBiqQFq7Z4sfVBpQ0skaSUuj032vFRzpvUQLgGG9Mumj1G+r0ATOb2t2damveo8ly5
	h+5w==
X-Gm-Message-State: AHPjjUg2XxWKldbVnJ6zhdu6+1x5R5/WaxGKXgEyWFaizPqkaut/FdKm
	Neuk1GRV0a81lcurt1s=
X-Received: by 10.202.206.83 with SMTP id e80mr1272104oig.133.1504547212660;
	Mon, 04 Sep 2017 10:46:52 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41]) by smtp.gmail.com with ESMTPSA id
	r195sm1709927oie.47.2017.09.04.10.46.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 10:46:51 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id h70so8680648oic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 10:46:51 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4mY5C+tWKDMbUFXxaGjJj2bxR+Yfnp276v78JdBW2/W/VQk2IUqM4KEI4Td9IIWZn/rJfXPXZruLsgprOiUkY=
X-Received: by 10.202.185.8 with SMTP id j8mr1162120oif.294.1504547210873;
	Mon, 04 Sep 2017 10:46:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Mon, 4 Sep 2017 10:46:50 -0700 (PDT)
In-Reply-To: <CAJTo0LbPBn=TmjGb6ozkVjsMdF8H+MaYF32DhZi8Evs7N=n5sA@mail.gmail.com>
References: <20170903192536.491-1-otavio@ossystems.com.br>
	<CAJTo0LbPBn=TmjGb6ozkVjsMdF8H+MaYF32DhZi8Evs7N=n5sA@mail.gmail.com>
Date: Mon, 4 Sep 2017 14:46:50 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoTRR0e-7MrkN=u5rt928y=Weh2VV_wwdqBSzpV0rK7zA@mail.gmail.com>
Message-ID: <CAP9ODKoTRR0e-7MrkN=u5rt928y=Weh2VV_wwdqBSzpV0rK7zA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] go-dep: Add 0.3.0 release
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
X-List-Received-Date: Mon, 04 Sep 2017 17:46:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 4, 2017 at 7:09 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 3 September 2017 at 20:25, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> This is the Golang dependency management tool under development; it is
>> ready for production use and intended to be merged onto Golang
>> 1.10. Until that, projects are starting to use it and making it
>> available on OE-Core reduces the Golang integration work for new
>> recipes.
>
>
> ERROR: go-dep-0.3.0-r0 do_package: QA Issue: go-dep: Files/directories were
> installed but not shipped in any package:
>   /usr/lib64/x86_64-poky-linux/go/bin/dep
> Please set FILES such that these items are packaged. Alternatively if they
> are unneeded, avoid installing them or delete them within do_install.
> go-dep: 1 installed and not shipped files. [installed-vs-shipped]

I know and this is an issue with our Go toolchain support. It fails
when we are building for same architecture than our build host.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

