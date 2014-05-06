Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id E819765F25
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 20:57:26 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id y20so49055ier.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ls3rj4U5ynZDG5vmMJJrWECbWE26kS0uw7WFGAdqCO4=;
	b=lwFJeYJale0XOD9wPzEHQrnMe5VfRB8wwcI01m9Q1lfr6BtKvXusVM19OLNIQDu9v6
	VsIeuDOV3CNqJeTNKi7alfnmCp63J/Vpy76YxL1tIbp70oP8CpdppfEsTxiDwx8K7oHv
	OcXi8OjABCmkgrnXHaZwSaoDFcNQuddYBEIhGBp4xau7uxAggMwFfpDNcAuWL3QQZlLC
	Zk+A30IJHZ0yUUEeQHYCj+YvAoTtjyimFMG7mZJ3SBvDdc6q7oKSqCwmMZu8KCm/RrrS
	n8KjdafXO5f1ke+AHteCEZDJJsuX3DEIVbirul+SJHkrl2Z7XtrNKkkgTtRTvmdArmTz
	igMg==
X-Received: by 10.50.49.109 with SMTP id t13mr36244400ign.2.1399409847718;
	Tue, 06 May 2014 13:57:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 13:56:57 -0700 (PDT)
In-Reply-To: <20140506205518.GE11339@denix.org>
References: <536899F5.1030104@gmail.com> <20140506205518.GE11339@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2014 13:56:57 -0700
Message-ID: <CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Tue, 06 May 2014 20:57:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 6, 2014 at 1:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Do you know that OE toolchain is not relocatable?

is that true ?

