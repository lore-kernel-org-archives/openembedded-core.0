Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 428307F945
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 18:09:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z19so12616309wmk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 10:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=mAMHNyPZWkwS0WoNheNqooqGErYQNwYTQ1HJUoyMEhk=;
	b=Pa92Rcq90LHF0Wrb5SD2kRLsAKOoEc356EzQWOEHysc1ZwbsmO4NA8OvDE/mch7D+U
	/PJgWj8OPn4VVIOViNOMZrWOovNegyBT+NvNk8oDy5CTvTrl25XSpJKLetxYyIy+rX9i
	hAMUgO4Xbui3Is1xh8NM1kQoKe7CTGYfePSIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mAMHNyPZWkwS0WoNheNqooqGErYQNwYTQ1HJUoyMEhk=;
	b=l3uB7n7okknfNwww0p4w0H2T/xdfuhNDnRW9s1vtWucDNHAusej9ZrQDXzlptKyoK4
	CVrpkTX/fA+xQuAmMaUwhvIdU4ndljBI6E341OLmqR+DmQOK/WxquQ1kvoT/X7EiEPd0
	//MzHwRpHs2oIcGrEpqqUrH5S/ZRFZdu2il9/nIcoB5N8t4yhM6tFtC8I+vJrDV2oiyl
	k8tzL7sX5DBqvOL9yYT09wQO6O7j36lc33jsYAn/bCFKSX7yYFIU/ODnzRivz3siCxgl
	PX/Vvvr1+oGJcoLi3gf7SG73XIW8pRyTLErGH4AX2Mli7Dv/5t98nKtlmKnCy1gtXzEA
	FwKQ==
X-Gm-Message-State: APjAAAVn9eIY++m1jD4yeKeCAfcRMdRsFZJjQ7wJq4fZmrSGlCHSP/eB
	azqbOj6wtgz4srw//p7qperx3fkwH+w=
X-Google-Smtp-Source: APXvYqwhZzOb2YvxYyuBxVQD2/19aAbxsqDE50CRikyycXAipCGcHxiSmV9YuG8F5V8h84cBqiafmA==
X-Received: by 2002:a1c:560b:: with SMTP id k11mr11564846wmb.153.1574964595973;
	Thu, 28 Nov 2019 10:09:55 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	72sm24807863wrl.73.2019.11.28.10.09.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 28 Nov 2019 10:09:55 -0800 (PST)
Message-ID: <19c01871bece378f73254ead8953c24f9f3b3180.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Nov 2019 18:09:48 +0000
In-Reply-To: <20191123221854.1656-1-Trevor.Gamblin@windriver.com>
References: <20191123221854.1656-1-Trevor.Gamblin@windriver.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 0/2 v2] add coreutils ptest to oe-core
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
X-List-Received-Date: Thu, 28 Nov 2019 18:09:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-11-23 at 17:18 -0500, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> Sample test results:
> 
> core-image-minimal:
> MACHINE    | PASS | FAIL | SKIP | TOTAL | TIME (m) |
> qemux86-64 |  483 |    0 |  132 |   615 |      3.8 |
> qemuarm64  |  483 |    0 |  132 |   615 |       70 |
> 
> core-image-sato:
> MACHINE    | PASS | FAIL | SKIP | TOTAL | Time (m) |
> qemux86-64 |  484 |    0 |  131 |   615 |      3.9 |
> qemuarm64  |  484 |    0 |  131 |   615 |       70 |

I do like this patch but I think this is causing the reproducibile
builds selftest to fail:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/515

as coreutils ptest is in the list.

I think there are other patches in master-next contributing to this too
but this one is an issue.

Its also causing a size overflow for genericx86-64:

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/1298

but I believe Anuj and Ross are working through changes which would
address this issue.

Cheers,

Richard


