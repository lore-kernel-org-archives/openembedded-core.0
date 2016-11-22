Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 96CA4719E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 16:35:27 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id l126so2334219vkh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 08:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ijrrvANzSXeo9UlnJEykgiD/i/Lj6SMUmHCummiNdQE=;
	b=CtHC3/24oayQRIXtBjTRIMjvhBlmBhYp6StMv9pq29q8zRUQuvLlcYKKzA/s3NEh2y
	BMoeZ5YYio/cp/YcOz6Jy1tOMQf9klDdTXO9P5DRPBah1a8k+4eXjKVyuibfPyZDB/OG
	AJ2XILlTI68mppjz43K6pROdZjfGFN9bhHSihk1jdh4CAVIJEQil979O9Ldllzu1ntB/
	Rb4PVEmlQbEISeQ7cevsc4DKeJID3MnD8SSfpIRZ13eMO4X+Y5Z4uJqW/LXaHZ6uTOE1
	cPLRVBtlwF8vO7vTOz0hF0dsNbIcF4RTKLwyg39QF0XZVpVwNodBwG+8I28VtfAz+QZl
	EzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ijrrvANzSXeo9UlnJEykgiD/i/Lj6SMUmHCummiNdQE=;
	b=iBFE3+7Jf6kNCpYMIqrO4sDL6nRfNnY7cS6Cdr2sUCiyXhlKp4fsR3sSBrVepQt1/A
	PNuMqi3InnlvTboyDK84uKkudty1fP5MN+qvDyxintJpGce2j23+mzMMJmBIeDOOvqJT
	XXZjvm2idqCpfppKFA66G5iZ/Rp/I+kIiM3TCP7zdxI4EWKupPv6xc6GJUdYhP2xBwQM
	uWWA45QZ9jXjmcmzehSikonBkZ3z0rUTot1yLxDrig/ZlNTMPLbCTkowiTs+3a7YJY88
	wKUBKp23vaOfaOHgiHlm74REoDYJ1nWYVAGRMpeIkBjI9vxpFyxvAxutf2/nITOQu/Cu
	1X1g==
X-Gm-Message-State: AKaTC00RTIyoadE3h0bEjpsXaNkukB70IgRQrSz6cufyHV0ptXjF1MCluTrLKBJEhnL4BhDG7tl6Mrd4tMf4rg==
X-Received: by 10.31.108.144 with SMTP id j16mr8068790vki.93.1479832528734;
	Tue, 22 Nov 2016 08:35:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Tue, 22 Nov 2016 08:34:58 -0800 (PST)
In-Reply-To: <CAJTo0LZbASS4RinqtPaPk3bojynYD1jNFnE0y67ULzqO_pxJNg@mail.gmail.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
	<20161116174748.26994-2-raj.khem@gmail.com>
	<CAJTo0Laq+KdjYoNvTM3DV+X8aGGdfWyJM=1z830=8T1orbqaJQ@mail.gmail.com>
	<eb6aeb51-c0c5-fe39-f3e1-ac1dfede129b@gmail.com>
	<CAJTo0Lb7jorMUq-8D-tkBTK0bP45AOtP_tBS2PTGGxPrUWbc8g@mail.gmail.com>
	<CAJTo0LZbASS4RinqtPaPk3bojynYD1jNFnE0y67ULzqO_pxJNg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Nov 2016 08:34:58 -0800
Message-ID: <CAMKF1sr9h6f=evBq8NT2e+HoEVRswwHO_016oGjsnOvCGHF+wQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] taglib: Update to 1.11.1
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
X-List-Received-Date: Tue, 22 Nov 2016 16:35:27 -0000
Content-Type: text/plain; charset=UTF-8

HAVE_BOOST_BYTESWAP is infact the right fix if we want to disable
boost byteswap. It will then fall back to finding them in compiler
which should be ok for OE since we have new enough compiler. Thanks
for helping out here.

On Tue, Nov 22, 2016 at 3:20 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 22 November 2016 at 10:44, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> No but I've an example where boost doesnt build at all and this breaks
>> core-image-sato (IA x32)...
>>
>> Building all of boost just for a macro seems rather unfortunate.
>
>
> Found the magic -D options to convince taglib that boost definitely isn't
> present and verified that it does the same thing with and without boost in
> the sysroot so I just sent a v2.
>
> Ross
>

