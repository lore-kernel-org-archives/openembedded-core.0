Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE5860053
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 17:45:10 +0000 (UTC)
Received: by ioii196 with SMTP id i196so69756815ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 10:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=27fPABKL7llf6KnZhlbx3xFFguhpRwCQyJ9hntxtYQU=;
	b=OnPN578ISiCoD9KrpnE9GlHW9EM9Hzbr6WRYhcesZKaJdyK7mZdFrVUyg2GpO/0GHf
	yg7FnJ3MWPBf1M+Dxsp2mToQse+B9VIlD+SLsWzJ7kdY/CXDb87LBDlaouZ98HDWAh8P
	udOcsAEXeq0+TpUlQu0bqG/eQsyRAObTipwH4TL9UDNDZowv2otifnoYehU/6qvrMawX
	BSxfNEtZO3bV3Kn7kb+Bc9XDQ32bTCLFVWpIigEtbZYjTHMYwrcQtfi1NnImpDDtmrxV
	Z6EO1Ee5bcVopJcRto4h/Ic4UGbIy6XNHAAMzVdjsEotlTmfQf+NtZQQKtrrRh7ubM28
	Fo3g==
X-Gm-Message-State: ALoCoQkcDGbDRmJgM6SPNaiCwHgHJlVmRvjvfBjw0r/9X/6VHO/Xo5IrWYslgH3hI+KAurd1bdBi
X-Received: by 10.107.25.71 with SMTP id 68mr34761294ioz.46.1441907110403;
	Thu, 10 Sep 2015 10:45:10 -0700 (PDT)
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com.
	[209.85.213.171])
	by smtp.gmail.com with ESMTPSA id 67sm7540662iol.7.2015.09.10.10.45.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 10:45:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcrk20 with SMTP id rk20so22561892igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 10:45:08 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.72.19 with SMTP id z19mr8223429igu.19.1441907108784; Thu,
	10 Sep 2015 10:45:08 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 10 Sep 2015 10:45:08 -0700 (PDT)
In-Reply-To: <1441904073-26776-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1441904073-26776-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Thu, 10 Sep 2015 14:45:08 -0300
Message-ID: <CAP9ODKpUU+2dShV0P6Do_rGXrqLhGezoxwZN6x1PX5kGBiHHuw@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: filter out non -j from PARALLEL_MAKE
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
X-List-Received-Date: Thu, 10 Sep 2015 17:45:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 10, 2015 at 1:54 PM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> 'waf' supports only simple '-j' and fails when parallel make flags
> contain extended options like '--load-average'.
>
> Patch uses the method from 'boost.inc' to filter '-j'.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

