Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 87FCC7D217
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 08:22:30 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id u19so33219152ior.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=35DzD5jYubbNIDprtAOWDzzs6enuYm3gCbuEimPNMmE=;
	b=L61QDzrZVMUAE+SErWyNAviA/Aef9zIJQZnosagg3uJayxrdYvoFkncZi2pOrcnBYP
	1/m887GFJi0Krw8NS9gAGDcU56AKyxsPQwmNzCOLfE/rxadRU7BbJNLRPOaRJjxoRDtP
	DorxMUy/WMkA3V1aXfbzhVCH4HyhAsn9QHskx2CV82ElovLDtqBQRM3D0tFc6knCTadr
	pD4EAj/Uh7i+uH2dZBkeGEvsCl09V9aP5ZmHGohYCkiwuvu4q3AcIZVv0G3n5sVXVXOJ
	gHtxSGFocpQniegLW0iPuJ+NMX6GVSwqckJSseXpXn8IvNJRQLqIUZKfRcll+m1difXd
	6Q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=35DzD5jYubbNIDprtAOWDzzs6enuYm3gCbuEimPNMmE=;
	b=SEhHqPTcAleGs3ZL4DlnNz7CeC8N6N7+9u4Cgj89WGwwfx5v2+43YRIsm661BDzAqz
	q+7LazULVz3Rl3VGANXBwpGFuyNNYx3PCK6/K4d+K+xP6ovwBzrpqk+QtEoggWH7NOt9
	L7/SHvAh0VbBSMdmcUP9EZ+zvixlJ1uSm0P+06U3d1e1En58OhzKakpSIicRCCLcSQwF
	6LPTx8pk/XyzvnzGzcp7EjeAPtipz6LHfxMtk6ZzteF7RFhiyJHHlBOWCusHROs4yVSo
	Nwl/SkejY+nv3hbVvfi9q8U+/QLqz/fU/abkDONs6rru0gIX3ig7benJTQv1Me0RwjQ4
	Ipdw==
X-Gm-Message-State: APjAAAVIp0GyzU7AJm7agu7vZqLLcV+KGXH0oKgou5uiCs4oVymZxOUY
	TXcmaRe0EhV96smp/+tLA5EaqfAS1c6ybhtDKIA=
X-Google-Smtp-Source: APXvYqyUprpYxwqtyRwvakOefgBhuyAzXZQAFjxU72SOhT/VH/WpsGv4TpM55cMRo6oVz+5aAvVfDKzs1ID3+02XYPw=
X-Received: by 2002:a5d:8252:: with SMTP id n18mr12660068ioo.230.1562574151419;
	Mon, 08 Jul 2019 01:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190627145917.1774-1-lemagoup@gmail.com>
	<6ab87120-92d4-7cbc-e88a-8e9261037901@windriver.com>
	<CAEz4NHr9ZEEGM+VjemOApAR0MepPjjXdumWOQb8iHOCcdBBuQg@mail.gmail.com>
	<ecf261f2-ae5b-b2bf-0424-226526422595@windriver.com>
In-Reply-To: <ecf261f2-ae5b-b2bf-0424-226526422595@windriver.com>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Mon, 8 Jul 2019 10:22:20 +0200
Message-ID: <CAEz4NHpho4uUqEz2R9oa2fYZSycv0HqZeC1YA8RkWc4PEYL63g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v5] cve-update-db: do_populate_cve_db depends on do_fetch
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
X-List-Received-Date: Mon, 08 Jul 2019 08:22:30 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

> Did you try
>
> $ bitbake universe --runall=fetch
>
> Please? It still doesn't work on latest master branch.
>

I sent a patch to skip cve-update-db recipe if the cve-check class is
not loaded. This should fix the problem.

Pierre

