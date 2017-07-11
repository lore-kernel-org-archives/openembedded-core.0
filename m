Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE6577E33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 17:04:36 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id z78so852385lff.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=B6fNVsw+P7S+X9FhGTgt4vBSN+CL7t4t5USPHaL+uUE=;
	b=dDjr8KI6qPxpwuqPHgB8VVsee0csGpdQ4zo5gWnz5PKXe7WRBhtN7ZExZeFtxVqhjg
	5lW+8TSE7RteG3TnS9tFPJcFIg6jdVnfyk6TReog6ZaFU9swHwhgzH2Bf+aHv91HQLNJ
	lOis0PaPBO1ox3jsmCORAWkea4yMeFxOqGDT39x1cYWGNbwCsF8XrvsXvUsPTh2Dd6Hw
	jblggvhwobmKRdK9b/TVwGWGXfLRZPDrx4D9ztUZcA5aNgwiYXOnuzpPeh1+qEJutYFm
	hmWO6H1gUDtnnBvmjc4ykC2uRcAwTaTnDjtYnzZLFKpfIUvFe6ndvBQI5PnEtZMX1thp
	K21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=B6fNVsw+P7S+X9FhGTgt4vBSN+CL7t4t5USPHaL+uUE=;
	b=giVvF9beMp1aWkze0MBHjPDX4+lR8gxE0yaZNyVQQ0iEWfE2m80Um3uomRFF2vib6f
	+I7vSTN4IbCCQj+cXtyHKVmJKsMRoiELZ5v+CLZ7z7cSXWJAnRRamNGhHq8/eerqRQwY
	ay4h+1nV/QFrXIM0+dYv3391brAz6i463vsNtQ2+boQ1C8/ZC2qWabG2jrKfiLXJ6ole
	kt2r3DhI7zCkB4o3caE9dPeKM6PhsGipwU0p88ciekGLGebMlliv/h5v6Qcmsli5R9/p
	2cjkIkz3qdFnLjclXAgNwOG6Jaq6s+41wX26q77H1bEo6hw6gbKJVBwiX7+qfiuxhrMb
	gFng==
X-Gm-Message-State: AIVw113qwkY2CO392pY/yb0Mkmz4ekauVVpNgTZmauv84oXyM/IEUo+J
	TwZKkMB6kKjsVCisdrw=
X-Received: by 10.28.23.1 with SMTP id 1mr12659679wmx.106.1499792676546;
	Tue, 11 Jul 2017 10:04:36 -0700 (PDT)
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com.
	[209.85.128.180])
	by smtp.gmail.com with ESMTPSA id r40sm523434wrb.37.2017.07.11.10.04.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 10:04:34 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f180.google.com with SMTP id 77so7515876wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 10:04:34 -0700 (PDT)
X-Received: by 10.28.132.13 with SMTP id g13mr3469046wmd.58.1499792673771;
	Tue, 11 Jul 2017 10:04:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.73.84 with HTTP; Tue, 11 Jul 2017 10:04:32 -0700 (PDT)
In-Reply-To: <CAHiDW_GV0z+8u6YG0wujroEbnAHnXueWWizDXpjBOkQp+FHwHg@mail.gmail.com>
References: <20170703200210.32229-1-otavio@ossystems.com.br>
	<20170703200210.32229-2-otavio@ossystems.com.br>
	<CAHiDW_GV0z+8u6YG0wujroEbnAHnXueWWizDXpjBOkQp+FHwHg@mail.gmail.com>
Date: Tue, 11 Jul 2017 14:04:32 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpw-+ek32du_1NybtmEM2NsbUBVg-P4wd2c-1TfVnobCA@mail.gmail.com>
Message-ID: <CAP9ODKpw-+ek32du_1NybtmEM2NsbUBVg-P4wd2c-1TfVnobCA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] mesa: Upgrade to 17.1.4 release
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
X-List-Received-Date: Tue, 11 Jul 2017 17:04:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 6:00 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 3 July 2017 at 23:02, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>
>> This includes following upstream bug fixes:
>>
>> Bug 77240 - khrplatform.h not installed if EGL is disabled
>
>
> Saying this here as well for visibility:
>
> This conflicts with userland from meta-raspberrypi  because both mesa-gl and
> userland now have khrplatform.h
>
> Since mesa-gl provides no GLES or EGL, it shouldn't really need to ship
> khrplatform.h.

I am not sure I follow you, could you explain it more? or if possible,
send a patch and add me on Cc so we can discuss it.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

