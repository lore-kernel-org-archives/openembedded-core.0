Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8581973190
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 14:01:42 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id bx7so17599771pad.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 07:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=4aAKK3Sgx4nPjIgZgz6x5DWGfT+I8O8hpQeCSJkHsIU=;
	b=BZdKej3enbaVT8k3FDgZhY2PNUMRNCQ/LXLLzKQOm9bT+22djZaEX1DZnpkkgbWxVu
	y6m05yeFdGtmlJk1dZ4HTTXRKP8BIMJsGDedFSEK25ge/r0+45hpSW0BdNT5utUKSyI4
	LLt1oHXkq1XoNRh7aQnfhJqHMAm2sr6RsO1Qtc75utV58mr6PKH2EQ3Rat/LnL58o3HV
	8/26eri0xygYUq0x8n7nkVLlkwfmJ96zPlRbEybWeMnBATznDlKr/619x6siy6cftZZC
	NJDynSBDvTMKiD+6o5kLZ5ZpJh3JBxsvs5b7KylmVzPryo5I2qJ2i/4Bz5FG9hAUwQtr
	vlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=4aAKK3Sgx4nPjIgZgz6x5DWGfT+I8O8hpQeCSJkHsIU=;
	b=g0nWXplTbVsHSU2hdyuLlc60nBXnv1cCLNjk5hdXnd243rsfW5NDewtteqw+wqIK+3
	LA9uqJlOPUvXlXbt3Z+WrvJuU017l6dR427kOpueBG03Ss1etDWywnWWUSDNQq2S3V5f
	m1Ox+0NkINwMbH76Gz45dDQpyCtHjmgXmxmV6rAvKnCipeOhXvrzH14T01N3QgkUUkm7
	HUaAaRSuepAZ8HBrjaaZ0iRIamYDAKH0d+unr3KAm4XcvNXtDHegPMorZX38Yw9HtbFu
	WS1M9hYm9Wd7u3u1w5DALfbL8nzK8DTkegfRl6/PNzgnGG9PPBIB1wPejRLNXy7dFgUo
	QT3A==
X-Gm-Message-State: AD7BkJJY4j44dyaNwLRRkOcBrWkff/VGpx/kXGt1fSMQzzirYJnOqtxCtaknF8EmlmPeGw==
X-Received: by 10.66.65.228 with SMTP id a4mr70838575pat.4.1459951303579;
	Wed, 06 Apr 2016 07:01:43 -0700 (PDT)
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com.
	[209.85.220.41])
	by smtp.gmail.com with ESMTPSA id 87sm5360175pfq.93.2016.04.06.07.01.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Apr 2016 07:01:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f41.google.com with SMTP id fe3so33790875pab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 07:01:41 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.90.163 with SMTP id bx3mr71244126pab.59.1459951301570;
	Wed, 06 Apr 2016 07:01:41 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Wed, 6 Apr 2016 07:01:41 -0700 (PDT)
In-Reply-To: <1459950176-29324-1-git-send-email-jussi.kukkonen@intel.com>
References: <1459950176-29324-1-git-send-email-jussi.kukkonen@intel.com>
Date: Wed, 6 Apr 2016 11:01:41 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp0FjCbDXG2_CGoFsgYVwsOUj-LKjqcRvYR8n0KHmqg_g@mail.gmail.com>
Message-ID: <CAP9ODKp0FjCbDXG2_CGoFsgYVwsOUj-LKjqcRvYR8n0KHmqg_g@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x11-common: Add PACKAGECONFIG for screen blanking
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
X-List-Received-Date: Wed, 06 Apr 2016 14:01:43 -0000
Content-Type: text/plain; charset=UTF-8

Hello Jussi,

On Wed, Apr 6, 2016 at 10:42 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> when "blank" is not in PACKAGECONFIG, explicitly set dpms and
> screensaver off. The intention here is to make it easier to
> create builds that should not blank the screen (just remove
> "blank" from x11-common PACKAGECONFIG).
>
> Partly fixes [YOCTO #7278].
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

I like the idea and solution however we ought to make clear it is
using replaced strings. So please:

 - rename Xserver to Xserver.in in SRC_URI
 - add BLANK_ARGS="@BLANK_ARGS@" inside the file
 - change sed to accommodate the changes


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

