Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7387578228
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 14:49:15 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id a1so6432246pfj.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 07:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=eJVdekWjvP/81UPyqH01uHWgHse/KAd9czXK711eMVg=;
	b=X5+BqIn9gCbVE1jqdiukPm5JzlYA44tIrMTLBp/p1nWCXdOXE8zZgVeiEYULPQAL9D
	dbNN8GlNRMhXzOIbX+yQAxE3EfmBTDMWl6sy9cCf95/8CIgRmmsmmWSsDwapmk5PzaFl
	dVnyNsdI22RaFxnvSDkBR3Ple/IgmkLN231Xc/faqrx+O4AvqlFTt/qrrFJNOnY/49vc
	7StQEKAPjt5TzsAgbw41p3u8VeswOU+smrKwkDSagEaW2gGvQH7Q18aRvZdYz4Wugn2k
	zkZ9ka31ou64qBowpRd8JTfD5uPdXsgAq/Jca7Sj99wqloUugdIigs5ZjqVUJAIX+bcD
	6GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=eJVdekWjvP/81UPyqH01uHWgHse/KAd9czXK711eMVg=;
	b=LXf/f5CYJsNIQxAy5Z6Sj+1EFAOOio+UpNSwP4tOwAwYMeIoiFo8OURfs+FAmwNLSH
	Xpdb1RXXnoeMxks46DjjPXDuoF6vd7voUdqF2radPkChR/AXsviD7qQzpVRphXPFVvD5
	Lxl1Outr0xRQYwk21Ze7XuQDXUw+SxV5sKlECg/9mAIp1rdZkCKR3FAii+rRsDezEa4X
	KxuO23vokGGT3/oBW7QBnXcFehnay4jxIEYY1rg7ip94PqFme9kDODnAp/7OZtjzM4FE
	XDha/PO/eO0lVgKKJBtdCgBZvWhFJkCaTeyiMsxaIh0+ExCGzesEUU2KjhpxT2bkif35
	/GMQ==
X-Gm-Message-State: AMCzsaUn4ekpc8m4BKzwL0LENzhME/ODSM4nInAZ7qy3EqHYE+uS8EJs
	B7yHa4tbgJtg6Tm+Y+n6jR3v7Q==
X-Google-Smtp-Source: AOwi7QAEUEQP290O3VRijS5vWOCzX35dm6hwrOUKCwEZovaFi1AmkTqdRojUyS9wrda7lTG2OCd/BQ==
X-Received: by 10.98.84.66 with SMTP id i63mr2443365pfb.97.1507301357331;
	Fri, 06 Oct 2017 07:49:17 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:2592:db33:fab5:1bd8?
	([2601:202:4001:9ea0:2592:db33:fab5:1bd8])
	by smtp.gmail.com with ESMTPSA id b9sm3735875pff.63.2017.10.06.07.49.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 07:49:16 -0700 (PDT)
To: Javier Viguera <javier.viguera@digi.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170914122753.12713-1-ross.burton@intel.com>
	<c93c3583-f1aa-bf91-c86e-bde0f6229592@gmail.com>
	<6ba17c2a-78cd-2705-0ce4-1fffeb4c007e@digi.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <3ec3a685-211e-6feb-3391-c29bded5ccac@gmail.com>
Date: Fri, 6 Oct 2017 07:49:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <6ba17c2a-78cd-2705-0ce4-1fffeb4c007e@digi.com>
Subject: Re: [PATCH][morty] bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
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
X-List-Received-Date: Fri, 06 Oct 2017 14:49:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


Javier,

On 10/06/2017 03:31 AM, Javier Viguera wrote:
> On 20/09/17 21:30, akuster808 wrote:
>>
>> merged to stagging.
>> thanks
>> - armin
>
> Hi Armin,
>
> Do you plan to merge this into 'morty' soonish?

I hope to send a merge request shortly. We have been having build issues
with the series I put together that included this fix causing some concer=
n.
build looks good now.

apologies for the delay.

regards,
Armin

>
> Some users of our BSP layer are asking about this vulnerability.
>
> Thanks.
>



