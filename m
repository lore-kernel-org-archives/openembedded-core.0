Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41])
	by mail.openembedded.org (Postfix) with ESMTP id 132D279306
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 08:01:16 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id h26-v6so4825329otl.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UpV9jvhKUMuiCVR1pcXQDrgDW1qgiegTVyxaqs37VSM=;
	b=BtcHU56WWoCwW36iFh8m+qEImEi4xI15bpm4NK9ik2kV1e4eyIt2R8yrAt2ogLCjka
	9CnTOIa+jhDKlbuBp/70B0ceZvky84CRQMTMwFay1+FudPH01LRBGtSHrdEwq1u0RzUD
	lLyaCuopyyYiOLo65kMXLS4V0VKQWgS0ZHnQv9OyH46sZyBNhp3oFU4NwLGhJXSLkqUk
	erqKhWkb20NaIW9Xmmjjg/m1mVvR5SnQPXrWgQd2sEZuY+0aQpBGTQZmEpqMHJiq8KwG
	/WyLvcseNbY8qWXPwfWxv10x/Q7UVhUxGoTgQs5AXqSWtG2jAcHxiosnWLjFsC8DRPXh
	RIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UpV9jvhKUMuiCVR1pcXQDrgDW1qgiegTVyxaqs37VSM=;
	b=SGKtjsvE5+FCeKndWnprUd57P5MlCFzLgvIdrr3ew2E0zR1z2HECMSn9bnXA6+/51N
	6FQbXofPnWwXW0qeP9/tMe1Y8pqZ9WqUf02sBvTtnMwIOVFre6TbTyJ9UG5cPJadKveh
	2T9fALYNC94Fd+XaEDiZQm5f17OYMdXKjkqM3Gnu2UVMcDggcnsSEnjOMWJ65cL8UfRE
	aRGVG7wMw/8WB6+Y3/W3vyHmIz72UmWiJyAieciWsqL0Kk4i/R0iHMFob0WRgVn7Mw80
	oZ18n4LycqwoiQSA/C/Jv2zaHdAxt8Wtt7CMnT86XUJ54wGQwn/m96udPXIGcvLWj+ku
	sRHQ==
X-Gm-Message-State: APzg51DPL8oarr7bDkvS6v13ixdYrCEgEBW2SUMF3rQogIRNa/9Ze1Q6
	MaNZ9jPYyfAxE8s13GczaLrY4uf3AuC7j2t4OhI=
X-Google-Smtp-Source: ANB0VdY6ryHp6hJteMbxAyLNcEgTAvbcIitr5k7+HnCNmFYbP8YIiwpqiUkLFVWpBisZ9PHIg/qu2eGmru2bgb0tXjc=
X-Received: by 2002:a9d:2816:: with SMTP id
	m22-v6mr17223501otb.22.1537344077981; 
	Wed, 19 Sep 2018 01:01:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 01:01:17
	-0700 (PDT)
In-Reply-To: <1537327350-27510-1-git-send-email-hongxu.jia@windriver.com>
References: <1537327350-27510-1-git-send-email-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Sep 2018 10:01:17 +0200
Message-ID: <CANNYZj_hOv++eoQA1dfv8TntJw6LrG0xOTB964esa3sHKwjQKQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: upgrade 7.8p1 -> 7.8p2 to support openssl 1.1.x
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
X-List-Received-Date: Wed, 19 Sep 2018 08:01:17 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-19 5:22 GMT+02:00 Hongxu Jia <hongxu.jia@windriver.com>:
> - Convert from tarball to git repository which support
>   openssl 1.1.x
>
> - There is no specific minor version that contains the
>   openssl fix (it was merged to master a few days agao),
>   but their next minor version will be p2.

That version does not yet exist. We should not be giving the incorrect
impression that we are taking stable, upstream-tested code. 7.8p1+git
or something like that is better.

libressl recipe should be removed at the same time.

Alex

