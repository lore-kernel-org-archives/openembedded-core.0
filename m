Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id C426B60088
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 20:55:44 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id r129so43189200wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 12:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=l5sGRiNscPzHyinLfHUjkwBXgWBrEpORSb4xzXjmDPM=;
	b=Bq18uk+RPBmnMkymYylCTOUvjyoz4Epz9rJSn2U/b25gumuzUC/1wOCvZvYtucnvnk
	wGNGk1pWv22o49PTpD+ngyJeTL7doVWAMm9Xnibxs5kBsLsaWSK68gBDqhqqw3JSQEHp
	ze46OAkIL6LPtKa4vHp1jAQTRH1REdy13U71A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=l5sGRiNscPzHyinLfHUjkwBXgWBrEpORSb4xzXjmDPM=;
	b=SKls8YzzS1CJNBDHKUlublbwc22h9vlYbEYg29Ffy/RGiAof8yh/25mef6NZJlfFrf
	eBoEXHsxVSYfqz2iA5ax9yeymUFIaDKqpAtnLc+0gfZFC8bJS3WHWP7SwScqHzEtbHz+
	ASb+yKMFLnkM03wIHNI9sfldCZhLkga8J3eNHzFuDhkJk+vBto3/IIVxWV1IiG422jqq
	yjY1PZ0NduVXSePYW1TQnLH9JREx7/LDRQFBcNmdE2Ip8ssQiBwVg+baYJCBYUn9QhMc
	8QyW8/wL1ovA2BSwtCTjg/L7gFYaRATY1sXjnOYjwBkkMS6dqjI66DGTqAXyPip2hvc8
	VuOw==
X-Gm-Message-State: AG10YOSYwwY0lZ+6ZXYFDjNu4rgvIZAFgHDVcJ2UrFKKQRKDt1MNn/Aleiy2eP2OW0Ld3ulgm9lG12D1xOB+vm24
X-Received: by 10.194.114.164 with SMTP id jh4mr15845517wjb.153.1454705745395; 
	Fri, 05 Feb 2016 12:55:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.206.33 with HTTP; Fri, 5 Feb 2016 12:55:25 -0800 (PST)
In-Reply-To: <CAJTo0LZT0UFrabh1U5LOLF9qcuL7QGoVVXGvo0NWYM4Y5H83tg@mail.gmail.com>
References: <1454704804-11605-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAMKF1spmN7Y3bQVFhghUG80sYyuwbGAj6MMMm9oPKehhm-s3Sw@mail.gmail.com>
	<CAJTo0LZT0UFrabh1U5LOLF9qcuL7QGoVVXGvo0NWYM4Y5H83tg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 5 Feb 2016 21:55:25 +0100
Message-ID: <CAP71WjxGbyKN5d6+TM35TnhHn9JLksnxuWGgviw+KxCv+3Ka9Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Fri, 05 Feb 2016 20:55:45 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 9:46 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 5 February 2016 at 20:44, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> its added new to this version. May be packageconfig is better place
>> for --with-sha1 stuff
>
>
> Agreed - some may not want openssl at all and being able to switch it for
> another alternative would be useful.

sure. but, then I have some questions..

1. which one we default to? openssl?

2. which one we support, from configure.ac:

        [choose SHA1 implementation])])
case "x$with_sha1" in
x | xlibc | xlibmd | xlibnettle | xlibgcrypt | xlibcrypto | xlibsha1 |
xCommonCrypto | xCryptoAPI)
  ;;

3. is there a good way to handle 'multiple choice' with PACKAGECONFIG?
How can we prevent more than 1 PACKAGECONFIG to be set (nicely)?

