Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id B3D8771C7E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 20:50:07 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id k123so3035745qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 13:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TXHQilxigcmzAuntQnDUkdDdxr9vuKIcD/qC+w/tKAc=;
	b=Ss0XP8/Tgny7Nme4m8aFbFAXJGZGLAGZoHyVWeP7tFT09vBdqZitJZt4tYSDTdcuuC
	GMKr55EGnkOlChoqYE8Wj7eNPTPOiDY1w2kyy7gkV2uC5CGE+xSo4bYycVLwjI6k/I6s
	ehvJZWh2hxPMsfD1rp+4//cJuo00GSyKnlpT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TXHQilxigcmzAuntQnDUkdDdxr9vuKIcD/qC+w/tKAc=;
	b=cg8far7LhTRwWMI86pe2XZV57Uz2S+m4aVy7+Zzd89Sehsgt7xz6A3yLKIUMrHCbTU
	Q+/EPP9ra6zckReh1324NBAeVUw62fz7ughUNp3QcS1r2nI+Vc8w7be/+St/D+Hyks3X
	KcdKg0S9x2sCQZ7gFCSjmoRzkrdj6YWDF6RBsng51+MN4Y/Z4dDPTTmMc5rfaVj4f4p1
	nRdBL63+udSqPSIKuN2L/fHCZ9Hsi+aDEeK7KSsX4eOVxgPh2Snt5o4aVWaKvrzKaAHc
	WQG2BFZEhSyOL+5aYNxviZxnSqTtOdwPPH9Y5vwBy8T5f+MVHw+s6d9gL9sm5w6s2LKs
	obPw==
X-Gm-Message-State: AMCzsaXJOOBfK6V9N2KgWkl2x/hapz08eW7ocqLEMO/1KJBDEX3QRTDj
	FY1bvr7KACpz1Wu/+ToFjDVyfdjnB9XL9aFqL3M2zQ==
X-Google-Smtp-Source: AOwi7QDUvbEQjF5M5DRsE9DoELv9LJVvSbsoyfABdPgmhSa/G9POkOMwAMf7hKqprjEGClYu7Cw9kc//RXV3hDc6K7Y=
X-Received: by 10.55.132.5 with SMTP id g5mr17093389qkd.228.1506977408557;
	Mon, 02 Oct 2017 13:50:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.104.146 with HTTP; Mon, 2 Oct 2017 13:49:48 -0700 (PDT)
In-Reply-To: <CAMKF1src=fX9LRauodhyBtWOBgpYSRYKukFN2x9t5srkPxAsrA@mail.gmail.com>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
	<CAMKF1src=fX9LRauodhyBtWOBgpYSRYKukFN2x9t5srkPxAsrA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 2 Oct 2017 13:49:48 -0700
Message-ID: <CAP71WjwMd7F1ZB+et7W_rBhh=dmk-g1OXqyEjTGF7+-py9GGYA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] gstreamer1.0: upgrade to 1.12.3
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
X-List-Received-Date: Mon, 02 Oct 2017 20:50:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 21, 2017 at 7:19 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Sep 21, 2017 at 2:21 AM, Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
>> A boring upgrade from 1.12.2 to 1.12.3. This is a bugfixes only release,
>> a couple of patches removed as they made it upstream in the mean time.
>>
>> Nicolas Dechesne (10):
>>   gstreamer1.0: upgrade to version 1.12.3
>>   gstreamer1.0-plugins-base: upgrade to version 1.12.3
>>   gstreamer1.0-plugins-good: upgrade to version 1.12.3
>>   gstreamer1.0-plugins-bad: upgrade to version 1.12.3
>>   gstreamer1.0-plugins-ugly: upgrade to version 1.12.3
>>   gstreamer1.0-rtsp-server: upgrade to version 1.12.3
>>   gstreamer1.0-omx: upgrade to version 1.12.3
>>   gstreamer1.0-libav: upgrade to version 1.12.3
>>   gstreamer1.0-vaapi: upgrade to version 1.12.3
>>   gstreamer1.0-python: upgrade to version 1.12.3
>>
>
>
> this series seems good to me,

I have seen these patches on master-next at some point, and they got
dropped. Was there any specific issue?

>
>
>>  ...ibav_1.12.2.bb => gstreamer1.0-libav_1.12.3.bb} |  4 +-
>>  ....0-omx_1.12.2.bb => gstreamer1.0-omx_1.12.3.bb} |  4 +-
>>  ....12.2.bb => gstreamer1.0-plugins-bad_1.12.3.bb} |  4 +-
>>  ...12.2.bb => gstreamer1.0-plugins-base_1.12.3.bb} |  4 +-
>>  .../0001-v4l2-Fix-4K-colorimetry.patch             | 48 ---------------
>>  ...12.2.bb => gstreamer1.0-plugins-good_1.12.3.bb} |  5 +-
>>  ...12.2.bb => gstreamer1.0-plugins-ugly_1.12.3.bb} |  4 +-
>>  .../gstreamer/gstreamer1.0-python.inc              |  2 -
>>  ...hon_1.12.2.bb => gstreamer1.0-python_1.12.3.bb} |  4 +-
>>  .../gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb   |  6 --
>>  .../gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb   |  6 ++
>>  .../gstreamer/gstreamer1.0-vaapi_1.12.2.bb         |  5 --
>>  .../gstreamer/gstreamer1.0-vaapi_1.12.3.bb         |  5 ++
>>  ...dd-switches-for-enabling-disabling-libdw-.patch | 70 ----------------------
>>  ...treamer1.0_1.12.2.bb => gstreamer1.0_1.12.3.bb} |  5 +-
>>  15 files changed, 27 insertions(+), 149 deletions(-)
>>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.12.2.bb => gstreamer1.0-libav_1.12.3.bb} (88%)
>>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.12.2.bb => gstreamer1.0-omx_1.12.3.bb} (69%)
>>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.12.2.bb => gstreamer1.0-plugins-bad_1.12.3.bb} (88%)
>>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.12.2.bb => gstreamer1.0-plugins-base_1.12.3.bb} (84%)
>>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Fix-4K-colorimetry.patch
>>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.12.2.bb => gstreamer1.0-plugins-good_1.12.3.bb} (82%)
>>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.12.2.bb => gstreamer1.0-plugins-ugly_1.12.3.bb} (76%)
>>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.12.2.bb => gstreamer1.0-python_1.12.3.bb} (57%)
>>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb
>>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb
>>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb
>>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb
>>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch
>>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.12.2.bb => gstreamer1.0_1.12.3.bb} (59%)
>>
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

