Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 42A0E71A9B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:07:49 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f82so106980107wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 00:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7reVuMuXog+5QdRtLiR1kxEbde5+zyS84lwjdd4r/zY=;
	b=1HRmlHePMW5fAP4s1uqH+Jkn755AqDRB/RB744OcMNOyxNCdRSCeiPFMJOqIfZlkUW
	h9Y4qmS25f40XylyYDOJtquvmh/rkImi9qqlKdknz3CSEbSpwTFrx6ZfofZvRo+l/9hq
	Pq5FljmaWtvhEEH1dhJkSpTuxtwwWsxQvsb8pGcVmo8wsZREVnZKaXM6/a3MOtcbvv1X
	LuycKKfUMU/uKErg2JsBlP/0tMMT/a/KP+JNmlYIWXZ9PdFYbfcf8Fto3TFlCO9yrjku
	eIbDrNVKCnFbI2QHwDN7n7TYvtUpTHbLzJJpgJuP59OFaPxsBpSGuUy21S3e5N3wcekV
	oxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7reVuMuXog+5QdRtLiR1kxEbde5+zyS84lwjdd4r/zY=;
	b=kmaoGWbjuFCqM1GGkMBXIvpJiKRWxTzCCTpIaOU/HRWjTottvkCuF4LHHj9RvaUtMu
	ao6Ohcq3At6G6raeb2wTj7gSZsLb9VL9krqs0IbbFx279q1vk6jWeQ3KqLOcjV/XlOrr
	GfV8zK8GkPq9dNXsvPMfHPnH1b9rVrwH3+g8ZcV/sRyS9khFyhqYbOzfRX2EEmYmu5OA
	Q5V5PZyyUdAWAbvo1zZ4asJoDde5GU7dQ+UvGm32hsySxUgzIZOIpMjsQItj9K7MGwlN
	r+3jiQrFoggotkKIq2sSKYqdUgjl5ZuoA0+U7gOU75Xg+Uoc+D/69JtzrSxdKhBTX8x6
	wmBg==
X-Gm-Message-State: AKaTC018KDRrM0jmdwHhJA5oNUSLS5DJXfu2CnZfI5dCHSyUmwz6BdGBX5XNZHYfuMazoLDfYdZWHLrpvt2H0g==
X-Received: by 10.28.88.11 with SMTP id m11mr1360204wmb.45.1481616471004; Tue,
	13 Dec 2016 00:07:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.10.69 with HTTP; Tue, 13 Dec 2016 00:07:30 -0800 (PST)
In-Reply-To: <cover.1479970230.git.maciej.borzecki@rndity.com>
References: <cover.1479970230.git.maciej.borzecki@rndity.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 13 Dec 2016 09:07:30 +0100
Message-ID: <CAD4b0_LMUu4=kTEon3nk+_8-1+nG+zQsph9yPB-SNabahhKsbQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [PATCH v5 0/6] wic: bugfixes & --fixed-size support, tests, oe-selftest: minor fixes
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
X-List-Received-Date: Tue, 13 Dec 2016 08:07:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 24, 2016 at 8:08 AM, Maciej Borzecki
<maciej.borzecki@rndity.com> wrote:
> v5 of a patch series previously posted here [1].
>
> Changes since v4:
>
> * dropped `wic: selftest: do not repeat core-image-minimal` & rebased
>   dependant patches
>
> * minor formatting fix in `wic: selftest: add tests for --fixed-size
>   partition flags`
>
> [1]. http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129103.html
>
> Maciej Borzecki (6):
>   oe-selftest: enforce en_US.UTF-8 locale
>   oeqa/utils/commands.py: allow use of binaries from native sysroot
>   wic: add --fixed-size wks option
>   wic: selftest: avoid COMPATIBLE_HOST issues
>   wic: selftest: do not assume bzImage kernel image
>   wic: selftest: add tests for --fixed-size partition flags
>
>  meta/lib/oeqa/selftest/wic.py          | 123 +++++++++++++++++++++++++++++++--
>  meta/lib/oeqa/utils/commands.py        |   9 ++-
>  scripts/lib/wic/help.py                |  14 +++-
>  scripts/lib/wic/imager/direct.py       |   2 +-
>  scripts/lib/wic/ksparser.py            |  41 +++++++++--
>  scripts/lib/wic/partition.py           |  88 ++++++++++++++---------
>  scripts/lib/wic/utils/partitionedfs.py |   2 +-
>  scripts/oe-selftest                    |   3 +
>  8 files changed, 234 insertions(+), 48 deletions(-)

Is there any additional action needed from me at this point? A rebase
or a resend perhaps?

Cheers,
-- 
Maciej Borzecki
RnDity

