Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4637F2F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 15:54:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l2so4467684wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 08:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=nS8SNJKtQsk2FSEJCRKDsLkJeFZP8kf5ZuMC9ZcILS8=;
	b=TH6s2HV1dbVKxRMhmlfvNr7pWgGHZnfve/JSJtJRekiTs8mMdebloiCOrCBq8ZFu0H
	8d0gBHT5e+r4FVWFUS0SitleQzvrLoq0n+nz6N/dTJ3mCSR1Hvb2ykj31+eD6w7P0Aaf
	vK2etBHxcCGEqbbsppoJedh1TlQKYr6YTSHxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nS8SNJKtQsk2FSEJCRKDsLkJeFZP8kf5ZuMC9ZcILS8=;
	b=Elk6gtPDet3KphHjtZTL27wGovnzpk0ylhWvzvyw/WQ1A3y24ZvZ1KgVeCghj766fZ
	l6acVBkyxb4+687JxnfAECWGZGDz4n5y1ChRpXxDlXtzM9iJS/erW0TPoeyMmNe3vjo+
	awHbiljm3E/+YE47Vpng3ukpH8NErP0KVLQwkw3hCzoPNpjXzJY2+YXnf6SVVGkzNB1J
	vN8t+fr1d7BNTvllonLpvh3jpsRcsS3NSkFTcCntVtTcTqjIBRGMuhncT2XvFMlGrXbx
	061RLIJMf7P+RnDXsGxoLGfZBzyFWtIo6wuBLDURrzWuSWJzlX+leA560CO60cDiJ4wQ
	FEPw==
X-Gm-Message-State: APjAAAUBxSB+PbnrKQ9zM6JfpmXJte+gCmxlUVzbUXqCf0UC1eMnzSM6
	072l/5/W14D+Ie1qMJremXz6oA==
X-Google-Smtp-Source: APXvYqwoDEbbW6luOe5SiMaT2E+JWgg1Ip4rvJaz/wFxkjPUNIR/XPnqJ3y12XRGHOwP1NJ2/qslBA==
X-Received: by 2002:a05:600c:d9:: with SMTP id
	u25mr8354307wmm.26.1565970890255; 
	Fri, 16 Aug 2019 08:54:50 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a18sm8124409wrt.18.2019.08.16.08.54.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Aug 2019 08:54:49 -0700 (PDT)
Message-ID: <cad2ebcaf8102857799d0c0a3e921b04348c8515.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Aug 2019 16:54:48 +0100
In-Reply-To: <CA+chaQdS_QHpe2jmr6Epqc_CBBHTwbtA5beg1rjD4kwMHbhycA@mail.gmail.com>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<20190815150548.GA1515@jama> <20190816102441.GB1515@jama>
	<CA+chaQdS_QHpe2jmr6Epqc_CBBHTwbtA5beg1rjD4kwMHbhycA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Fri, 16 Aug 2019 15:54:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-16 at 17:00 +0200, Martin Jansa wrote:
> > Will try to bump BB_NUMBER_THREADS from 8 to 72.
> 
> I've tried to remove icecc.bbclass inherit (because it does things
> while parsing and RP probably doesn't have it inherited), but that
> didn't save much time.
> 
> All 3 tests were with bitbake
> 18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7
> 94m19.081s  8 BB_NUMBER_THREADS and icecc
> 82m59.574s  8 BB_NUMBER_THREADS no icecc
> 68m3.556s    72 BB_NUMBER_THREADS no icecc
> 
> Still don't know how to get to sub 10min world runs RP was seeing,
> but at least it's as slow as it was before runqeueu changes (or even
> a bit faster in lastest master).

Just thinking out loud, other things which can influence timings:

Is SSTATE_DIR on NFS or local disk?
Are sstate mirrors configured?
Is there an existing build or not, if so, how much is valid?
Underlying filesystem of the build?

Your build seems especially slow at executing through the tasks which
is effectively a test on how fast the system can fork() and return in
some ways. It would be interesting to block dry-run on the server side,
skip the fork and see how the numbers compare.

My build manages some parts of the tasklist faster than others, perhaps
because there are more "free" tasks to execute at some points in the
task graph than others.

Also, I have some patches which improve performance a bit which I'm
still testing.

Cheers,

Richard



