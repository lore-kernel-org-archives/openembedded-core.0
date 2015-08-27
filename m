Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2655676C0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:33:02 +0000 (UTC)
Received: by iodt126 with SMTP id t126so56996064iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Dr8kQ9dSeG07LJ12DhoWHuHjLutVvbXKrxpFS+0JZ1M=;
	b=HN+I9F3ALqvFxwRdEz/a419CnOfyZSL+AI+zNRLxplH4o+l014V210w8vNHuqutaA9
	BsYfjUJUoPzN/kJeuAG0QAwSi8s8CgwKU8bml4bNzm/09PgOYIlHwvme0a1BFH0ZY5xs
	u6duhJ8r5fKQCQnPB9Hx+caTG5LyjMVt6AWIdG+Oy+x0TrVOUQIDDuHUnXnKS8472f7e
	bH9CF86IE3h2QdbzS4DX/voKWjXqXH2MQ70QheVCFI8moFJyY3E4tIfQfNIonz55XEf8
	c9UA5RfUbgOWUHdo+MHov3A9jhODlPc4qE9OfQwOm/zydw25z9QluRSwLiD69+xoTkWT
	PSFA==
X-Received: by 10.107.14.84 with SMTP id 81mr10937421ioo.195.1440682382671;
	Thu, 27 Aug 2015 06:33:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.135 with HTTP; Thu, 27 Aug 2015 06:32:33 -0700 (PDT)
In-Reply-To: <1440657827.20082.26.camel@intel.com>
References: <1440605035.20082.20.camel@intel.com>
	<f1fe5d98cb0737847778531368eab04778076750.1440603928.git.patrick.ohly@intel.com>
	<CAMKF1speSYjijUeuHAyVXRQf5DQtaWsCRjZ3=02dXPOeOdRb=g@mail.gmail.com>
	<1440657827.20082.26.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Aug 2015 06:32:33 -0700
Message-ID: <CAMKF1spMTUv-kZPS7D2wY5Y=h1PDMeDDn2aZUnY7=gVTXzGZpQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mtd-utils: add xattr PACKAGECONFIG and fix acl dependency
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
X-List-Received-Date: Thu, 27 Aug 2015 13:33:04 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 11:43 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> The one in bb.utils.contains()? That is there intentionally: it's for
> the "xattr enabled" case, in which case nothing gets added to
> EXTRA_OEMAKE.

is it required to have extra " ?
can it work without it

