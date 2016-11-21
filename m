Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8A871987
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 16:26:40 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id w194so24865627vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 08:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hHTpXUj4OOf7fLAzSgapeYImsXj63L5LXNzUqmQARs0=;
	b=U0bTxEgJ+445ncnXjj8ffeamRO0Qnch3aIvfFs1Ur7BmE//5espF2T/mxXgzIeEoN0
	1qkTLcZgKH1oCbzDWDEBLOvr8WnAJ2pb6NJphPmFl388g8Cz5Wuy42DJGJMMIazDALpY
	MD0v1pm7d0tfVEwF3P509j8V8OanbWHznc2jpMGvhd5tFh3eG5ZM2jxxtuwJqIPL84pM
	BKDeX7sbFcCECi7/k//6O2/+V42A9EiRPRkPYjQh7+B0+qhEa4FqWkri8GvDuZ4GJyP1
	4QJv81J9OrgmJsMxngjmjuAwQIUolhVCFVecL9aDoa2qLGRslmEIKZuc0bVmkOXYNUN/
	PIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hHTpXUj4OOf7fLAzSgapeYImsXj63L5LXNzUqmQARs0=;
	b=buucGO6KgO3SiIKi3oxIFaRTE7VGHJSa7ZsmNeQDCw+VcSBRYbOjLt1VdBlQmGCGqc
	0dl9zve0WLtCcfVHb6kegqdccQUwh1qzOahYgpmZH0yvoYBDsC+j3BuQ9ixAMPzyysqD
	0oUQ71PP+bUGzX3Qa6YuyQQSjCBbI+Rw6xu9IWNOw5GMrHgWKbzeK6QrzzBd6xP/DsWG
	HQ5rWhfBQGJpWuEsq0FykgbsCOvO6Cy5rM5azmNNIgwXqeHzoZm5hOsGND9HVZpGBZu4
	9hu9loPM0MR5m3HG8HsqsbJdNWBhdBKM/gsI9vD1XI9IOwq0RFLNu3ZeMpKd3C6N9rhJ
	FIBg==
X-Gm-Message-State: AKaTC035yk/LLnypXThnPYB+PQR1QKqVhOeKZTXCkOJsEdxXx0erM8kllQcblsORtMVLsR0EoOclVW1e0yB0qA==
X-Received: by 10.31.168.7 with SMTP id r7mr6903865vke.148.1479745601579; Mon,
	21 Nov 2016 08:26:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Mon, 21 Nov 2016 08:26:11 -0800 (PST)
In-Reply-To: <1479733029.29591.30.camel@linux.intel.com>
References: <20161110061149.20570-1-raj.khem@gmail.com>
	<1479733029.29591.30.camel@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Nov 2016 08:26:11 -0800
Message-ID: <CAMKF1sqz1rYBG0Hg5r0QVe1g-4P2O1ZtCZ5gtpnty6WGofdagw@mail.gmail.com>
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] systemd: Upgrade to 232
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
X-List-Received-Date: Mon, 21 Nov 2016 16:26:40 -0000
Content-Type: text/plain; charset=UTF-8

Thanks, I have added it will be part of V2

On Mon, Nov 21, 2016 at 4:57 AM, Dmitry Rozhkov
<dmitry.rozhkov@linux.intel.com> wrote:
> Hi Raj,
>
> Could you please add this change
>
>
> diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-
> core/systemd/systemd_232.bb
> index 892a109..def6e05 100644
> --- a/meta/recipes-core/systemd/systemd_232.bb
> +++ b/meta/recipes-core/systemd/systemd_232.bb
> @@ -275,7 +275,7 @@ python populate_packages_prepend (){
>      systemdlibdir = d.getVar("rootlibdir", True)
>      do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s',
> 'Systemd %s library', extra_depends='', allow_links=True)
>  }
> -PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
> +PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
>
>  PACKAGES =+ "\
>      ${PN}-gui \
>
>
> to the patch, so libnss-resolve would be packaged properly.
>
> BR,
> Dmitry
>
> On Wed, 2016-11-09 at 22:11 -0800, Khem Raj wrote:
>> * Drop support for rcS.d SysV init scripts.
>>   These are prone to cause dependency loops, and almost all packages
>> with
>>   rcS scripts now ship a native systemd service.
>>
>> * Drop mount propagation patch, it only happens with libseccomp, OE
>> doesnt
>>   enable it
>>
>> * kdbus option has disappeared from configure
>>
>> * Ignore dev-so for PN now since systemd introduced private .so see
>>   https://github.com/systemd/systemd/issues/3810
>>
>

