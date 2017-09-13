Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9377B71C69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 21:02:47 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id r85so3284406ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=NOhlNXIC901cVjL24aOB+gHC0LHCafrC9CjfwM2r4Ls=;
	b=SmbvKDQ6VSDqyISJ/jE0kX63YQOSW73z6/ujAFLgtVUZUkc/cSfTmCQ++irEXqlhKa
	pxaC4xp94yxIXHN5iNuqfwryLs/xjnM1uBK5PG0ouqLBHWJuieR0hJs99noI3xFAa8cd
	ccR6rNCSQ8udZd7xNEwMM5fC4+E4cGattDdMdBzVtgVi+7imoCnpigZ1wz1heuBMzAjl
	70YsdY6FpJvbwjaxDpXMIuGFMNeTiXkpgPp2/Qge54h2mnQHPLaaycjF02Rlxd2MgWgy
	5949nOwrJezmhiynny9TKGodB6rAXdj1lc5JdSNcDJqwYRfAzzn0n9hXhZgBSiUFCsnY
	cDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=NOhlNXIC901cVjL24aOB+gHC0LHCafrC9CjfwM2r4Ls=;
	b=CVU7u90lbW/63k7x9z70x8MqNjT/nkeUgoDl+rIpXEzwXPWtqbO5uYR1wkyzlipLzc
	oOWhkaDlpZ4VZ0kAgO1TUWF9D16aOdEwyL9PD3aFH915/wuv2tcrKS9tENX2fvAGZ2Wn
	0ghyAU1ly0lO1Bpx+ucEVGS/k7oI5tLtOfFTMno9+M2ZEqiHdgetR69YmuEtWAInCzg6
	biqbS6UqloYcVbEhk7/gCZZ41yFuqf1ih0Vm3plqy0jIwX/PZ0DdXQVdENrSvYELVM11
	dmQcOx+HS+zE7+yxbVGzrIAgOUI0Umam7EA5YWNuOHmF8WPR9MhOLG+v+A/jCtBD4nmc
	JerA==
X-Gm-Message-State: AHPjjUi66ucsnaPOQs9/ZaGDWJwlbYI9QGlg0hxaLrcWT7SIG8vMSDkn
	xK0mOHAziUkQgrWDm4A=
X-Received: by 10.37.217.194 with SMTP id q185mr15167848ybg.21.1505336568207; 
	Wed, 13 Sep 2017 14:02:48 -0700 (PDT)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com.
	[209.85.223.175])
	by smtp.gmail.com with ESMTPSA id h7sm4937465ywf.92.2017.09.13.14.02.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 14:02:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f175.google.com with SMTP id k101so8576543iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:02:46 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCvVRk8UqQfMdK2YoUZsDAhdgsAgu16jngWZl6d7q1iVULhGAotZdvOAXLvmxuxOxpIvE/T01G4EOXzgE+pNGQ=
X-Received: by 10.202.186.7 with SMTP id k7mr5426963oif.25.1505336565456; Wed,
	13 Sep 2017 14:02:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.86.129 with HTTP; Wed, 13 Sep 2017 14:02:44 -0700 (PDT)
In-Reply-To: <e1470e87-bf69-850e-5666-eba2f4faedf9@gmail.com>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<26a8ac54-41bc-d74b-6545-5c13f67296d5@gmail.com>
	<CAP9ODKpmqtGUt7jiqww6=9QcN_0Ou2Dc+THAqbYH6F-KsW45YQ@mail.gmail.com>
	<e1470e87-bf69-850e-5666-eba2f4faedf9@gmail.com>
Date: Wed, 13 Sep 2017 18:02:44 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpq19Ni8D7Rra73LU9-KA9LNHgiqjpPXTeHfi97MSUZsA@mail.gmail.com>
Message-ID: <CAP9ODKpq19Ni8D7Rra73LU9-KA9LNHgiqjpPXTeHfi97MSUZsA@mail.gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, Tom Rini <trini@konsulko.com>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Wed, 13 Sep 2017 21:02:47 -0000
Content-Type: text/plain; charset="UTF-8"

Marek,

On Wed, Sep 13, 2017 at 5:20 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 09/13/2017 10:11 PM, Otavio Salvador wrote:
>> On Wed, Sep 13, 2017 at 5:05 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> ...
>>> What is the status of those dangling patches ? They were apparently
>>> posted, but didn't make it into the last two (?) releases.
>>
>> I am confused. Are you asking for U-Boot community or OE community?
>
> How does that matter ? I am asking about the status of those patches and
> why they didn't make it upstream yet. Something should be done about that.
>
> Automated update of the U-Boot recipe version is great and all, but
> that's not all that should be done when new version is released . The
> outstanding patches need to be rechecked every now and then too so they
> get upstream and don't start piling up in OE core.

You are the maintainer, so step up and do it. I did the upgrade as I
had it here for testing so I thought it would be good to send it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

