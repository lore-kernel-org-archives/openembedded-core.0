Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id C93486013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 17:26:20 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so52148821iec.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cK+kJ1/NJOuudcC6ZbOJNQqu2ZJsaMX3cj4g4foeYSU=;
	b=vybW+li++hAiS/B5Nxh2CVBQUkO8cMr3EdeZeRyQ60LKkI0b18L3hOruBL80A76vUx
	hzlADbL4mqGRo1f95lg3ZAu2EiM7LtbFA0CC65K1fzukQBAJTk/1VEmYs+1aBJ4uTVkS
	fUFtuunceXWuQw6QZl9NZHl8rOYMn9Adnzvz1zy8wWumfSa6V8gSIX0XcQTvlEm0pjLg
	W/I7fLg0Mq/U4yslAgeK7VURzpP0tPRLrXVMyV37mgpntH5oHsmZrK8jJnKwYaL9Si2c
	T4ZiEsR/A4mUWa3Bo7EzLlTLhaN5NPw0EFtjWi5Oh1DC2wz4Q/JbEa5i6mTKBUHlNRx4
	bukw==
X-Received: by 10.107.129.88 with SMTP id c85mr22655392iod.81.1427390781265;
	Thu, 26 Mar 2015 10:26:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Thu, 26 Mar 2015 10:25:51 -0700 (PDT)
In-Reply-To: <CAP9ODKr7QnmGCFfh+HnB1d_TE0CDCkqSgG75if11E_Z+CMq5sA@mail.gmail.com>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-4-git-send-email-bruno.bottazzini@intel.com>
	<20150326082923.GA7370@ad.chargestorm.se>
	<CAP9ODKr7QnmGCFfh+HnB1d_TE0CDCkqSgG75if11E_Z+CMq5sA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Mar 2015 10:25:51 -0700
Message-ID: <CAMKF1srFd1e_1H9N3YDHKRUr5MKTW1sAuVd3g_EdYw3-Umy+KA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: split modules into packages
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
X-List-Received-Date: Thu, 26 Mar 2015 17:26:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 26, 2015 at 4:56 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
>>>  PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
>>> -PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
>>
>> Why do you remove networkd as a PACKAGECONFIG?
>
> If there is a real reason for this, it must be recorded in commit log as well.

you just need udevd, systemd and journald as minimum for systemd to
work, so our approach should be to get to that point
and everything else could be a packageconfig. Does that answer your doubt ?

