Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3E52B6A467
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 17:06:04 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id if17so1575990vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 09:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2VtRZBSOIY56duAFRkpaRpDp6vZKFI2jW6Hzj0431mM=;
	b=BsVgJnRgp5WBSL0gv3L2vb/tjYDyf/GU6dCUnkb1x5C6CSc+LeqUmNGoKknXIDHJHS
	uNJR0GCRn3UwEGT1VFKFKdAH//NVx2OneKSRDf3DronVq7nL0Aackurh9hhCXw4gxiA7
	6ah5MoIaUJvAAIWtax1SJ7FmevnPSx8FYb1dKmQOErKQD1crUoO0S9cdIsh0DRqsM4cz
	ph9yyjQrmIw8+Niuhu5nGDgJC43/qPDeRX7/f+QiNsUWpcYhRTsKNidZr9Tbkadi7JNG
	BI9CjqYSuwFNG6xFfaBippiQEmuYHa3W/sD8dfApc/5czC1iDczmmBbIEEUGp01AH/mA
	LB1w==
X-Gm-Message-State: ALoCoQkdfGthdgMMbLn+cLWSDqfR9iDfegIGbQhBEGIMPSyG1nvOoOZjiuEAgfjjMymaxP+eEZ7z
X-Received: by 10.58.255.233 with SMTP id at9mr12939666ved.20.1383930365568;
	Fri, 08 Nov 2013 09:06:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 8 Nov 2013 09:05:45 -0800 (PST)
In-Reply-To: <1383930151.2345.15.camel@ted>
References: <CAGDS+nkupBrwgBBTbZzSnnB9pjaf2P6gMuQHn6QAZjfkFqi7ww@mail.gmail.com>
	<1383930151.2345.15.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Nov 2013 17:05:45 +0000
Message-ID: <CAJTo0LYQv7SmLa-Bhyuy03oijit4yJ0MhU65o-jp4ARxTYYcuA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] wpa-supplicant - enable CONFIG_CTRL_IFACE_DBUS_NEW in config
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
X-List-Received-Date: Fri, 08 Nov 2013 17:06:04 -0000
Content-Type: text/plain; charset=UTF-8

On 8 November 2013 17:02, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-11-08 at 07:33 -0800, Steve Sakoman wrote:
>> I've begun using Yocto 1.5 (dora) for several client projects over the
>> past few weeks.
>>
>> I noticed that images that included connman and wpa-supplicant always
>> failed to enable the wifi technology properly.  The visible error
>> indication in the log:
>>
>> src/technology.c:technology_get() No matching drivers found for wifi
>>
>> After many hours of debugging I finally figured out that this was due
>> to a missing option in wpa-supplicant (CONFIG_CTRL_IFACE_DBUS_NEW)
>>
>> Adding a bbappend for wpa-supplicant with this option enabled fixed
>> the issue and connman now handles wifi interfaces as expected.
>>
>> Was there a particular reason CONFIG_CTRL_IFACE_DBUS_NEW wasn't enabled?
>
> This sounds like a default that should be enabled. Please send a patch!

Sounds like our QA needs to test wifi more...

Ross

