Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id E69C56FFCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 23:42:19 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id n128so107446738pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 15:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=lIW2WiyAti22/Q8PchBc4iQzN3pOI977IoeAHgf7A68=;
	b=RzCjENnJbgNBrJLesrUQ5/V9RwSk0X1dDxNa4SKJ8SvIp3ydL5H6/NRR5O/sUoP7Ie
	8L7y4aMh56XnEKGOrFxza8s7j49JfpRbzKQIr0HG2RkONN3Ur/hQQWiHEQH9UgYLIPVr
	CK/glRHFUtUKDztm+TgTsLBCmWuPkDm90LHW7YfM+vWpcNy7wkrkP3Hk631Y/odTv9cF
	QovFyhnnbPcorZI0Df/3z3UFfHItovpujmY0Tti6yDlKcQTfy6a401Xq+sKsitIAWAws
	kAXqX5sFNL0DSgDWwG0Bo4jsolxos5UV55mD2xFxPu6HRkyXluip7fuschDbBxEgOPip
	DQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=lIW2WiyAti22/Q8PchBc4iQzN3pOI977IoeAHgf7A68=;
	b=e6IVWvmkLVCDEGgHJeHQEjlDXBy8v+NJec3epJdpq9ugn8a1FHQM1AR0HnIqSi4LqJ
	O4+Z1hMgs+LDCiCRq/uqz675I1O5z8gfTzZHK5aG2NCIW6CYPCgYEy2g8wFZdP7m2yxv
	RyPpe0R/eFQYM/wMAEZNCE9mQGNNRy9N6zUj5Sd2HfE5HTOW9rTjOhluThU5QiB9KHza
	n+rRik9kXFgoHgfe5FlxANOfdjOnIok9J1Sac84qGo/2z56pNwHzQV1fG8RolXeMpIVv
	zgl2GIHJ4n2/GDkQKx7GnjfXKPiBpAP2y68vYt5hp8c5vohpICZCDO989mV+afdt74cZ
	39Ng==
X-Gm-Message-State: ALoCoQlqQpcTcQf/V0U449HDnfm+l58Cbp5gLFbpZ9mX/Q1ncCoQlVgIcuQ6F/ZAS70MMF3viBNvtIgAMIS7qmyQBIHGGP0gNQ==
X-Received: by 10.98.71.130 with SMTP id p2mr10273148pfi.99.1452814940346;
	Thu, 14 Jan 2016 15:42:20 -0800 (PST)
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com.
	[209.85.192.169]) by smtp.gmail.com with ESMTPSA id
	b84sm11677012pfj.25.2016.01.14.15.42.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jan 2016 15:42:18 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f169.google.com with SMTP id e65so107766483pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 15:42:18 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.16.72 with SMTP id y69mr10198476pfi.95.1452814938255;
	Thu, 14 Jan 2016 15:42:18 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Thu, 14 Jan 2016 15:42:18 -0800 (PST)
In-Reply-To: <201601142241.39038.marex@denx.de>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<201601142215.19475.marex@denx.de>
	<CAP9ODKptS3b30mw8ZDZ1Pd2gLsN+wj8aJxxz+X4xWAr7qiAZCw@mail.gmail.com>
	<201601142241.39038.marex@denx.de>
Date: Thu, 14 Jan 2016 21:42:18 -0200
X-Gmail-Original-Message-ID: <CAP9ODKocSQ0D4wRo-XpD9kYJ-V5hPSoWY+Yg2zFhv_Lp=vhjKw@mail.gmail.com>
Message-ID: <CAP9ODKocSQ0D4wRo-XpD9kYJ-V5hPSoWY+Yg2zFhv_Lp=vhjKw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Thu, 14 Jan 2016 23:42:20 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 14, 2016 at 7:41 PM, Marek Vasut <marex@denx.de> wrote:
> On Thursday, January 14, 2016 at 10:37:16 PM, Otavio Salvador wrote:
>> On Thu, Jan 14, 2016 at 7:15 PM, Marek Vasut <marex@denx.de> wrote:
>> ...
>>
>> > Taking a look at u-boot.inc and uboot-config.bbclass makes me wonder how
>> > all that could work at all. It's either a stackpile of legacy cruft or
>> > just poor design.
>>
>> I think it is a mix of both.
>>
>> How would you address this in a clean way?
>
> I would have one U-Boot build per package. Debian doesn't do it that way tho,
> so their rationale might be something to consider here too.

This is what we do in uboot-config class, isn't it?

Without going deep on the minor details, could you describe how you
think it should be done?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

