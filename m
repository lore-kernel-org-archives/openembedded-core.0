Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 037696FFAB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 19:21:14 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so75775816pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 11:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=q1ekyQ9NtkXJsIjR0PxElXxPLYlKbQtTKJJrvYY5Gw8=;
	b=hwI2FHT9JcR2ltMuW3LZmX5N0zg17TzYyj8wILgBvjRDHlUufqwAK7cc4oY1LSpE6e
	cjlGo1ad0jjeL3k06BlkfZUiRCFy7Rl9nC0d4l1P9oO9ft54E1UndSD+RF8N/fP8vtLA
	sokGNsKWmZqZ8u4jSwC3xeuVr1FhK0ORtEoRoEh+1lMV2J0NPD3OE7Iz7JfC1T5G86ya
	nxLu1+B+j9m6B45rJEZrFJRd+Q9FYyBbjy0d1eSl/NqpGICOrExGKG1Dw/ct+Hq9I2lF
	3lVem4fmk+COE91pakOPZOMPM66VcFEh8t6WSSi2yi8KXyORBSOXScZCBzI93aaX5c59
	KYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=q1ekyQ9NtkXJsIjR0PxElXxPLYlKbQtTKJJrvYY5Gw8=;
	b=UpxEXe0u10iufM3ZkSqDy2hefcH9xb+0q7iBqVuwGv+tTRvELjNYPXueMhJ6GtBt48
	lkfr0XjR9DjGGIp+OaM+ysJMkjOm2MXSIDQYOUCPYx9uQ7vJtOwLyXfWoVLVyewcIH6M
	0CJe49WLz8QIehPXDD35enqzm49tsOLTs7gokohRW6EdPdjQ2v8XtJYiW3D40sXp1i7p
	5ZIcxhGL3P3Gpocyu+M/SrSe8m3Aess7rbeNQBYeeHXXFQFqJX1zAPO8TIYeG+1QbwsB
	psKorbRCrz7oGV1kIx9FWgwv3Czl3PXTHTNkF+XKCtmSxPSw1jl9jAd1DKjZBH4XmFJ1
	rSiA==
X-Gm-Message-State: ALoCoQlmpcWlzPosy9nGAMgytb9Ukz4dJCfsI1nTGWsplGoYPEU46C5eQa+STJVKL0S5YvpGaKE3
X-Received: by 10.66.121.4 with SMTP id lg4mr15442006pab.22.1449170475065;
	Thu, 03 Dec 2015 11:21:15 -0800 (PST)
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com.
	[209.85.192.179]) by smtp.gmail.com with ESMTPSA id
	n88sm12284805pfb.26.2015.12.03.11.21.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Dec 2015 11:21:13 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pfdd184 with SMTP id d184so12935506pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 11:21:13 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.65.135 with SMTP id g7mr15616467pfd.141.1449170473120;
	Thu, 03 Dec 2015 11:21:13 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Thu, 3 Dec 2015 11:21:13 -0800 (PST)
In-Reply-To: <cover.1449152021.git.alexander.kanavin@linux.intel.com>
References: <cover.1449152021.git.alexander.kanavin@linux.intel.com>
Date: Thu, 3 Dec 2015 17:21:13 -0200
X-Gmail-Original-Message-ID: <CAP9ODKomNG8pbmjH=-k2qVOBrmnopeTjht6devfRJD=mH=NpZQ@mail.gmail.com>
Message-ID: <CAP9ODKomNG8pbmjH=-k2qVOBrmnopeTjht6devfRJD=mH=NpZQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] Move Qt4 recipes to a separate meta-qt4 layer
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
X-List-Received-Date: Thu, 03 Dec 2015 19:21:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 3, 2015 at 12:33 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Qt4 is reaching end of life at the end of 2015, and will not be supported
> upstream. Qt4 recipes are moved out of oe-core to a separate meta-qt4 layer
> available here:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-qt4/about/
>
> This patchset removes Qt4 from oe-core. I cannot send it to the list for review
> because it contains very long lines that SMTP cannot handle.

Personally I would prefer this to be done in a single patch. If
someone wants to revert it locally it is easier and it also makes
easier for people to understand why it has been done and keep
everything at buildable state across commits.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

