Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 21E9160722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 15:22:46 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id k74so156672861qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MGkviw+Q1bw+SIb1CmYig+QhDmiQL829sumSR1Cx31s=;
	b=EHIPd5WqFWfa+DwSE0EiORkhdEVuQ14qCgj+JBDeltA0Hp9/geeA6BzuhyLEffEG/s
	kZskypQo4WSnAWraNk+89IrK9flwiz3WZ90Je20V012SgJHGIc9tQA22QLw6HshcN2b1
	x8W8e6Wzv9APITQjk43GKBYrORIuqa47dIKJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MGkviw+Q1bw+SIb1CmYig+QhDmiQL829sumSR1Cx31s=;
	b=IeH4H7iJ6Zlts7y4MGNBiVK4xc7vwC6SiZSsjZZVARTdjE+rheJqL6JIABMzvr52hC
	rfWomKOUoQS1ebEC+q7wbS8S82ZTNXXMaE1ew172ksQQHnY5jAqa08sriMQA7sJH1hdJ
	qzAXr81Y40NTl30VPC9IAPBOw1gR57ailM4FN2FJvL5yUmuO6VbNqsu1m+g+2coyDxJe
	My6ObSmR6xzP4ED5lLe+HUNVXODQo9ZKiDLfRpFUmCjygDdDYygonHncWb2OhUmzWtBx
	NmNzplEB99HIfH3JJRe3kTXxsvgY+5jkStmuQuba67JbQyk38nkkSfAtFBNtIerSm/cF
	C6CQ==
X-Gm-Message-State: AODbwcCDHGrcDmCphPljA05ImBX/2PPhcssN3RjACIRbVmDCVILuU9QW
	1JuArvltP8cmTx2s7bPMl1OgABaQTvIP
X-Received: by 10.55.26.153 with SMTP id l25mr34651786qkh.9.1495639367547;
	Wed, 24 May 2017 08:22:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Wed, 24 May 2017 08:22:27 -0700 (PDT)
In-Reply-To: <CAMKF1spmBTseFWvZokZT-BxnjQgzzdSWj+Y7LWH0+iaLSqOpcQ@mail.gmail.com>
References: <20170522092622.14761-1-nicolas.dechesne@linaro.org>
	<CAMKF1spmBTseFWvZokZT-BxnjQgzzdSWj+Y7LWH0+iaLSqOpcQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 24 May 2017 17:22:27 +0200
Message-ID: <CAP71WjzSCeZeHRKF=eXXX=6kfrTx0O4bjRgeQ-ayopiot43T0A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] [RFC] Add support for 'fastboot images'
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
X-List-Received-Date: Wed, 24 May 2017 15:22:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 22, 2017 at 7:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> its in meta-oe, what do we get if we bring it to OE-Core. ?
> how much prevalent is it ?

the android-tools recipe is in meta-oe, i believe that fastboot images
are widely used, and having a generic 'fastboot' image type in oe-core
would be helpful. Having image type outside of oe-core is possible but
cumbersome, since we need a custom class, which needs to be inherited
and creates additional dependencies to meta-oe.

