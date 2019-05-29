Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 95CE77E32C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 15:14:27 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z23so1873968wma.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 08:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=p6iL7Pu92/Otn2vCWFOd0vyNmP7Hk3x8hq5R7qaSOQQ=;
	b=O79KapiQWZpoquYjiQk1WE4RWeutJbXtbiaQQPSNHEfHRms0uJ12+6kwmm7eO2KWYf
	MO87lqyO+asQzfVU4mU7GTmvQ+RlkrXtMMG2Nn7SCk57EuxUqwJtyCxqa2rsiV1T/uDc
	BkwW5Ij03tlpBlztqn31hMJYTpMCViXbBy8mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=p6iL7Pu92/Otn2vCWFOd0vyNmP7Hk3x8hq5R7qaSOQQ=;
	b=NC85ycslDy5MrMAcKy8GfreRXLL2vqEixageJQZnKo9K73oqLV2NVGcM4q1y65S+57
	9UQ4GSHgndaRfMe9T49RD5ZNaFs/wMUzmgA8I5S0+eWAop/GHdJ5EpytaPaKoOhpjrQE
	hRI2Bq+lNiA9ZzzBTezFDM1fylRlG3Tu/xb+cH3kN9uxVHIqKJ1V7jgBTTGe01RtsW4r
	56aJhTN0ZNWPwaOOMn4Sgt4rqZ4i0Zk9Wg63eKxB9SzWSSHL5iBpJwr1P6WUMkLr2oK1
	PX4Je06B8xE38BGEemyWlIMWb0q1mrnXrggq1RnmD9fKKM+LIzQNzlg+BRhP9EASj1Ny
	Fyxw==
X-Gm-Message-State: APjAAAVrOcHqOf3sVHSvF3jXCg9FURXxRMO0XV0dBryiIqkRfj9QL+7E
	Ix2sORrr/gmxOPEP325KOZCkj/KKmFQ=
X-Google-Smtp-Source: APXvYqyjlzoJH0GIISRD0tFcVUOlRTJFP+w9/l3cT7cyJdRxyEWI+idFSbxjVHnAwO3HCUFR4rvK3Q==
X-Received: by 2002:a1c:6c19:: with SMTP id h25mr7265960wmc.176.1559142868226; 
	Wed, 29 May 2019 08:14:28 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l18sm18585867wrv.38.2019.05.29.08.14.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 29 May 2019 08:14:27 -0700 (PDT)
Message-ID: <bbe283e51705243f0ca8ae28f87c7181be1b21ab.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Andrei Gherzan
	<andrei@gherzan.ro>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2019 16:14:11 +0100
In-Reply-To: <03829522174840a6938a7dda8fe921fb@XBOX04.axis.com>
References: <20190528143030.2205-1-andrei@gherzan.ro>
	<efd8fab5c30823179cc418a855c6e660c0a534d3.camel@linuxfoundation.org>
	<03829522174840a6938a7dda8fe921fb@XBOX04.axis.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] ca-certificates: Fix openssl runtime dependency
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
X-List-Received-Date: Wed, 29 May 2019 15:14:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-29 at 14:29 +0000, Peter Kjellerstedt wrote:
> I assume the above can be fixed by instead using:
> 
> RDEPENDS_${PN}_append_class-target = " openssl-bin"
> 
> However, has there been any attempts at rectifying the situation
> where 
> runtime dependencies on packages are turned into recipe dependencies 
> for the native version of a recipe, which obviously does not work
> when the package name does not match a recipe name?

There is an open bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13355

Its rather difficult to fix. I'd documented the real underlying problem
in there (XXX-native vs nativesdk-XXX naming). There is an email from
me in the archives somewhere from years ago arguing why we had to have
nativesdk-XXX even though everyone preferred XXX-nativesdk.

Cheers,

Richard


