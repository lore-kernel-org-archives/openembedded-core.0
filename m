Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D960578070
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 07:50:07 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id z62so31038969ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 00:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=8jwe6nYxUC1eyGKsImV0N6wzN96Mzx/ahwOfbv95EYc=;
	b=ZeYYjejAW1KwHeGMu0fwV/yUYyNWALBpUvQ5rchc0id/wFnKBkprl8HynDACzu3Y37
	fd8V/kFeyb72bharD+EQwxDgKMjamrMNZqog+gqCR0N+QJ/e74iQ2u2f4ntFSAsNM3kF
	lZjdciqFbfkyGuds+CBY6IyMVwEQkuE9L094EkO5aLYFbgprzECzvB98FxPKcNzSpBUO
	QCw1C3zNbemTIlacCSaEN9K+h2ch6r/2qL1lIEh+/yuKtdU7Yb4HPqACNs2/mOj/+s9p
	M0VddUm9NQeMJtF9qweqIb6nRcF90SgF4Wsy7E4TlAxT9K4U0eNmVTWvdsHzKTJGpj12
	QHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=8jwe6nYxUC1eyGKsImV0N6wzN96Mzx/ahwOfbv95EYc=;
	b=dL4+r9V560RvnlnlPRj4RlK4c7mZBrvsUTY2ZQmVWZxnDjc8f3fzHsWHNaDSlg8kDA
	1RwBUGlsQ/cxIS+Q5LPV15DON8/cIHrZcwBqMMZrrPTo50e0GK0bCcowKRl3H11qgq1K
	qP7tn590kCzHjIDdNLaJOmx+TtVK1bl8w5/rFIDqHHFb4e5aEwLuigYgy3BJ+/vqcsAU
	hBCozGjLIGO8REZHervUwKw7Sa0RSUNWa1Jz8f65wJ7FWYUfcXFWb+gDbyYARpKZo83b
	YWxf8OZHFm4wA3w9u7DRzdsjZV6VFK/OaILx/p0owzPWDEQ+yj9Wm8xQM/UUkKUBaFN2
	aT6A==
X-Gm-Message-State: AKS2vOwaGlKqi3NoHcflgjoH/rxgRYl4y8/b6wb0YBykJBcPedp9bQMj
	jQNiwBo44e03GZlh
X-Received: by 10.107.151.140 with SMTP id z134mr9574134iod.83.1498636209020; 
	Wed, 28 Jun 2017 00:50:09 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F1CD.dip0.t-ipconnect.de. [93.232.241.205])
	by smtp.gmail.com with ESMTPSA id
	g198sm2573373itb.29.2017.06.28.00.50.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 00:50:08 -0700 (PDT)
Message-ID: <1498636205.7464.107.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Wed, 28 Jun 2017 09:50:05 +0200
In-Reply-To: <CABcZAN=rnbDi8qX_y3AXMMoazp=5Qt2wMg72tyvRx1h0fDWzsA@mail.gmail.com>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
	<89eb4c1de58d2de44df217a62c9cd791da16a9eb.1498577501.git-series.patrick.ohly@intel.com>
	<CABcZAN=rnbDi8qX_y3AXMMoazp=5Qt2wMg72tyvRx1h0fDWzsA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/6] yocto-compat-layer.py: avoid adding layers more than once
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
X-List-Received-Date: Wed, 28 Jun 2017 07:50:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-06-27 at 15:46 -0700, Christopher Larson wrote:
> 
> On Tue, Jun 27, 2017 at 8:33 AM, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
>         add_layer_dependencies() might get called more than once, or
>         one of
>         the layer dependencies might already be present. The function
>         should
>         not add layers again because doing so can cause warnings like:
>         
>           WARNING: Duplicate inclusion
>         for .../meta-openembedded/meta-oe/conf/distro/include/meta_oe_security_flags.inc in .../meta-openembedded/meta-oe/conf/layer.conf
>         
>         Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>         ---
> 
> I’m curious about why this isn’t either just calling out to
> `bitbake-layers add-layer` or using one of the existing functions we
> have for modifying bblayers, rather than doing its own +=.

I don't know exactly, Mark implemented it like that. My guess is that
more control was needed over which layers get added. For example,
"bitbake-layers add-layer" only adds one layer, but does not recursively
add layers it depends on. This could be improved of course.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




