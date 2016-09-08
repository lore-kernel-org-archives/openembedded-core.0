Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0221960017
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 11:02:00 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id i184so4418428itf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 04:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JRTmhvXBEB0B0ITKuG6BCFiAzsz/Yr5XPCjrxYLCZbM=;
	b=CJLa/R0PYWBRMmBjw8DDucmd3Smyaf6V4QhC87zeCD27eW38n5/MsYb3CMJiiWznUk
	xRZiO2JqpByIjgHyHdUh3zMj3KYZWQCzdKLIN7vJ1/MR+A4j43myfZzAY3ed3ePOF9IG
	4YqniKap+xE0kVQKyDiVtmhOywTIyXLRR3NhxTbRdd9TXwACSYiNl0RCW/Zc0rbhO5G+
	58I4OPoX2icxHzfDv2OR+Z75LcILxMZEcfZjd5mnzcsbU4/6DzPsimwSXg9sRjAz0oB7
	iFdajr2dFXyEinQcuW3AnUwm5l0AONIum4ouxFvALm4Xs/p6ZtmqGDQGD15whOaxQAjp
	CLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JRTmhvXBEB0B0ITKuG6BCFiAzsz/Yr5XPCjrxYLCZbM=;
	b=Jb+/LM8wX3eOagsxebTW6vbbhp1I2ey+weHpeQyIyp/zw3NcOtdyQ1Eu49ZatnKiGC
	3or2c+s4bnBcPMWqrHrGtIgGEbi05S/NCCaDyMsZM3UD53UfceC3mz7khuLtbrCIfvEj
	aECu6ZlCRQcKHqyhemaogpmHZd3IetqM6ZLmunA7NCe89jgjCzgJ7iH9fzj9Y/CcarHh
	R7dSErJnyztjgMWsvgDsn0/HQbltP8iUP34FDplLzzOo/0y07FsyNryucYexEbDoxWSK
	Q6njc+ZTF6xSNuYuhbuuwRlrBwZL49iUH8qs6CoGNDNWi36vtmFQlmUfg/Bkx0T943lH
	5UEA==
X-Gm-Message-State: AE9vXwM7pjeRUaHhTysqjOfdAZyhpf35EtL2FtyEZP1xXP9JGSqPXdKUMkkpiG7jIYdUjl3A455OKEmKt7RGr6h4
X-Received: by 10.36.124.141 with SMTP id a135mr13531888itd.25.1473332521334; 
	Thu, 08 Sep 2016 04:02:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 8 Sep 2016 04:01:41 -0700 (PDT)
In-Reply-To: <20160908012645.25324-1-edwin.plauchu.camacho@linux.intel.com>
References: <20160908012645.25324-1-edwin.plauchu.camacho@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Sep 2016 12:01:41 +0100
Message-ID: <CAJTo0LbLkXAJ_+EzA8MSWjpgNLX6Qqps0Kw5EtRkuv3MjQeYjA@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa: Remove linux user utilized for rpm test.
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
X-List-Received-Date: Thu, 08 Sep 2016 11:02:01 -0000
Content-Type: multipart/alternative; boundary=001a114a967a920cc7053bfcf594

--001a114a967a920cc7053bfcf594
Content-Type: text/plain; charset=UTF-8

On 8 September 2016 at 02:26, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:

> When trying to re-test smart rpm tests. A fail arises
> due to a linux user previously created upon the image.
> W've added a few lines to delete such user and his home dir
> when finishing test.
>

Also as part of a belt-and-brances approach the test should not create a
new user if it already exists.

Ross

--001a114a967a920cc7053bfcf594
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 September 2016 at 02:26, Edwin Plauchu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.p=
lauchu.camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":30d" class=3D"a3s aXjCH m157076699ff3e4f4">When t=
rying to re-test smart rpm tests. A fail arises<br>
due to a linux user previously created upon the image.<br>
W&#39;ve added a few lines to delete such user and his home dir<br>
when finishing test.</div></blockquote></div><br>Also as part of a belt-and=
-brances approach the test should not create a new user if it already exist=
s.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a114a967a920cc7053bfcf594--
