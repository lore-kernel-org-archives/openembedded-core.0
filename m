Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD0C77180
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 04:18:45 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l66so98796774wml.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 20:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/zWP2J9y+H2RGqG5li+eqyTc9PAIff3CcscYnV2b0rw=;
	b=TvT9lsarMB/K0cKHS9ki3GN7sQdafZhOFZQ6FgcGn0paRBTUG81gL5bO14cExFWeBZ
	rwDvHwt+BN+5XfWGniGkRP6XfnmbEsfsFcJ48C4RnlW6vVGamjfXFdUPiqeANe1hGbtb
	SbiiN7I5sG9K1zmNRMLNU8gDTYIcrjs4tLimYikvtxJU/r4S29NxiPolzBEE4hskwrbz
	ZJS/H0IVR103C9TnlDlhTnldpe+0uhWr+pqa00UzvzKTpOM5oYKLHYeoEbfuCF02zjm2
	sNq9MBHQrSQ1TWoN4lXhuLIYBDRY3R2rnlhV5pHepDSC9OrbLE6aFBJI050zYk9MpOJq
	UiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=/zWP2J9y+H2RGqG5li+eqyTc9PAIff3CcscYnV2b0rw=;
	b=LphaBqxaV3jbP8WVjjsnGgj45DfptG41UvJ4zJ3w5/AxgBvgyTyCycAQZThOtmcGju
	zPXW58TBPmoFGUhLIWR1NfBM3UzmfayDw0ydaHz9W4ukrLP9R5f6Pci8/0h1OFBDYALA
	3BvYSx/1kZ4jLm36LQVGz3F5X4k9SOY5iedeU15fAAbUKwn4MlC8e8lDs+gll1gB8+S0
	OeRyZdN4hoxLb63qhCB2SfBefn43faOW90t8/b6DIqbnKlElP0WGrkXFhN4MXdlWKA6x
	vVyD2oHnX6T/iVjDXnWD5iRYJZ4iJC3TWZt3rk4RGxWcjyAPaRomUA9ihX5s3NahL7Nh
	wYOw==
X-Gm-Message-State: AG10YOTz3KkCZw1khgPfa/QOIOMkBdnWB3zBOHNvHFrPgd+fBZXpax0Cn6J/7eeK79JGVyeQjk63gHOYP7b9Ag==
MIME-Version: 1.0
X-Received: by 10.28.98.133 with SMTP id w127mr14849605wmb.4.1454386725771;
	Mon, 01 Feb 2016 20:18:45 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 1 Feb 2016 20:18:45 -0800 (PST)
In-Reply-To: <CAJTo0LbfKq2CtEj3Y8zBmgQiXPNJF4587R2httpbmsNHgG+mhA@mail.gmail.com>
References: <1454363382-13387-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LbfKq2CtEj3Y8zBmgQiXPNJF4587R2httpbmsNHgG+mhA@mail.gmail.com>
Date: Mon, 1 Feb 2016 20:18:45 -0800
Message-ID: <CAJ86T=XibuPtxUY2c+TQ35_KdBO47wRoCuSehgTbGfaR+tb8_A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] curl: disable curl-config binconfig file
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
X-List-Received-Date: Tue, 02 Feb 2016 04:18:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 6:23 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 1 February 2016 at 21:49, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> This works OK for me, but probably needs wider testing.
>
> python-pycurl fails in oe-core:
>
> DEBUG: Executing shell function do_compile
> Traceback (most recent call last):
>   File
> "/data/poky-master/tmp/work/corei7-64-poky-linux/python-pycurl/7.21.5-r0/pycurl-7.21.5/setup.py",
> line 743, in <module>
>     ext = get_extension(sys.argv,
> split_extension_source=split_extension_source)
>   File
> "/data/poky-master/tmp/work/corei7-64-poky-linux/python-pycurl/7.21.5-r0/pycurl-7.21.5/setup.py",
> line 497, in get_extension
>     ext_config = ExtensionConfiguration(argv)
>   File
> "/data/poky-master/tmp/work/corei7-64-poky-linux/python-pycurl/7.21.5-r0/pycurl-7.21.5/setup.py",
> line 71, in __init__
>     self.configure()
>   File
> "/data/poky-master/tmp/work/corei7-64-poky-linux/python-pycurl/7.21.5-r0/pycurl-7.21.5/setup.py",
> line 113, in configure_unix
>     raise ConfigurationError(msg)
> __main__.ConfigurationError: `curl-config' not found -- please install the
> libcurl development files or specify --curl-config=/path/to/curl-config:
> ERROR: /usr/bin/curl-config should not be used, use an alternative such as
> pkg-config

Thanks. Unfortunately I don't see a clean solution for this. The
setup.py script uses curl-config to determine which ssl implementation
curl has been built against and that information isn't available from
pkg-config.

It's probably fixable with some surgery, but I'm not sure it's worth
the maintenance effort just so we can disable curl binconfig...

Please drop my "curl: disable curl-config binconfig file" patch.

> Ross

