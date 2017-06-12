Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id CC9E478234
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 21:05:22 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id y77so62259373ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=r/ohYpTwh3vWZBYTnEuS+bTzzbJeLSYWtZT+jsPW0Jw=;
	b=rbw6mKn1Nj1ldD95uBtD05HxSjaKNojCBklsWoFgky416AjdKCA4BWa+dzeNiQea0/
	HlmDvjkWHdzrtRiOLCVAkzKm1Fi3nXyw2GhMPgUayahoKxZ9hTiN1AFuxiV1ybzfk4Kh
	PuHvem6BbX7SxBUyR60VMRTQeeazAkhSJhzCAbrME+1e3cA7P99uLxbehDk5yFGJwx1B
	5WwofJtalSBOQTeEFfWjbR1OHaFakqMMUuD34WrnuS7NlHJUfd0g0jjgzFie7/bqziWF
	i8onAUy+Yrk5+58K5se+5hBGDlLI/x5wQ9BmvwTMZi8KwGOpFslM/SF3QqmPeftJAakT
	JRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=r/ohYpTwh3vWZBYTnEuS+bTzzbJeLSYWtZT+jsPW0Jw=;
	b=Y619Km1jsrPtRiYiLoWH2zRKUxu4RXge6zTaaKuK/1KrxxA9kOrW1+P+6nzBjYjVFM
	gx2Xwl9gRNVVOy9QfpXah7ggMR22daOlEr4OoW7qH6N45QLiOnBg1/mG/nPaKwdxLxUY
	Y4BbXVfBaLwzmKbGZhi0AHYTsGVvUgCYJpNdupw0l7hPxEbdIgvFsFzYP4PLUzAUnIOz
	DrTodgQMvuhGUMeAGYU5sHV9oXI8kHGZREvemH6FsWwcOETjcYkeJIer3M1AR+TvyoH9
	BrAGdh3pUmkCXKVeFwVOl4cDHGmZcoOhue9kcyVYcoFKMwRWzahX+qGM6grTN0qXq+/m
	/8ww==
X-Gm-Message-State: AODbwcCTiRuWd0PCqQUCsXHQdv+A6sMtJuLnfONZe/WWsM2lxVABfRIa
	LBcxIZ6bXez6Dj7u
X-Received: by 10.107.137.83 with SMTP id l80mr37661566iod.215.1497301523656; 
	Mon, 12 Jun 2017 14:05:23 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DFA4.dip0.t-ipconnect.de. [93.232.223.164])
	by smtp.gmail.com with ESMTPSA id 21sm658322itz.6.2017.06.12.14.05.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 14:05:22 -0700 (PDT)
Message-ID: <1497301519.30163.288.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Mon, 12 Jun 2017 23:05:19 +0200
In-Reply-To: <20170612194635.GX28053@denix.org>
References: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
	<9dfd9eff13b3831c7e88c97318f97d2daeac9a78.1497013310.git-series.patrick.ohly@intel.com>
	<20170612194635.GX28053@denix.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Mon, 12 Jun 2017 21:05:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-06-12 at 15:46 -0400, Denys Dmytriyenko wrote:
> This now breaks parsing my distro config on these lines:
> 
> ENABLE_SYSVINIT ?= "0"
> DISTRO_FEATURES_append = "${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)}"
> 
> 
> Here's the log:
> 
> ERROR: Unable to parse /OE/arago-master/sources/bitbake/lib/bb/data_smart.py
> Traceback (most recent call last):
>   File "/OE/arago-master/sources/bitbake/lib/bb/data_smart.py", line 426, in DataSmart.expandWithRefs(s='${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)}', varname='DISTRO_FEATURES_append'):
>                  except Exception as exc:
>     >                raise ExpansionError(varname, s, exc) from exc
>      
> bb.data_smart.ExpansionError: Failure expanding variable DISTRO_FEATURES_append, expression was ${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)} which triggered exception NameError: name 'base_conditional' is not defined

base_conditional() seems to come from utils.bbclass, which gets
inherited by base.bbclass. Looks like DISTRO_FEATURES and thus this
DISTRO_FEATURES_append end up getting expanded before these classes are
fully parsed.

I'll need to discuss this with Richard tomorrow.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




