Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 916F877ACB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 16:40:32 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id u134so3912480ywu.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 09:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=A+WXkOH0+Bj/f7GBfJsCwkjU1lWC3YgZwOB0lrMd+tU=;
	b=SXgz8AB4176yMW9BWwXzVxzw+zPBY1ZCaCoGhaCrU43S+CC9TZUifxyRAJYH5nSmGS
	61Qwh4y299L4BhcavbzH40xEH2Bj5BeqejF1c2dh6UhFheU7WBCn73m06aJREMkHRtgE
	3UgguIg1gfBiUCUZJe1OFx7ILXXKO5eDkgzDGDRw/SGGqMX1V1ZM5S1Qm+TkqJHEJzsB
	w52KQbDQsLEIp/iBvp8HrnK+ERmtN80CT2Yy/HprEY3dCTbMjGwtf8Vl44YRqJz9fl2X
	5wnYEmce4f5SxDnOYYx1A3TT75iT1Wce72i6IOp+lhtxMlOpfEMr980YRIAlq+9F+qvT
	HEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=A+WXkOH0+Bj/f7GBfJsCwkjU1lWC3YgZwOB0lrMd+tU=;
	b=itusRGCbJH/Fohh/NUPaOvFaqYPqZT1ndSKHuyFSs0H4py/jAazKaMTPJw8VAKzjuD
	DoFb1m+H08AR9T/HxHl2Croz1AHFNpMmxlTdtrGZDcLqlICvhhJU+QBC+ssvpSD6+0mK
	gOTSk5Xl4wlVBvwM7d6up1060onu8fApWaTBMvNP6ARQ5LI23Qfx/1w7RmxAeawVP8LT
	bAyZh56N6dmuCVHQCk7KaFhd9tKKiLn+8kA3fKd2tdOkntyGiJQk5hb1jCkVKD2P9lue
	Rmg/kiUgZ/4+JdBpmNUQW0Ks08Q+L+KJEE9BdMNP2ip51Jsx/tZcyuqJlT/bY4Cp+gfG
	fPrA==
X-Gm-Message-State: AMCzsaUaOefZQU2ZuiocuFadMqlKJ3UxnAHBI3snpdTUkAAvtXQaiNUk
	jc2s9gOet4QovMEVxlPTPWSax/bV
X-Received: by 10.13.235.214 with SMTP id u205mr1971396ywe.349.1506962434001; 
	Mon, 02 Oct 2017 09:40:34 -0700 (PDT)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53]) by smtp.gmail.com with ESMTPSA id
	t66sm4524103ywe.79.2017.10.02.09.40.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 09:40:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id n82so9957439oib.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 09:40:32 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDERoyHBLQZAKO4ZBmluMODcu1UujWRd3VWacV/g+rwVUO5wX6bgmKjWq1Rs1zldg1dx3o3fLtibE0bAH6Myj4=
X-Received: by 10.202.223.8 with SMTP id w8mr6811485oig.17.1506962432194; Mon,
	02 Oct 2017 09:40:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 2 Oct 2017 09:40:31 -0700 (PDT)
In-Reply-To: <13841d53-4135-0f9d-0cc8-e98a45b11120@linux.intel.com>
References: <20171002145234.6306-1-otavio@ossystems.com.br>
	<e28ad2ad-f30c-bffe-808d-4f6d782f172d@linux.intel.com>
	<CAP9ODKoYZsqkWzsmuwsVKZ43cOOQTRF=hWKWJttruE7iS3fUJA@mail.gmail.com>
	<13841d53-4135-0f9d-0cc8-e98a45b11120@linux.intel.com>
Date: Mon, 2 Oct 2017 13:40:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoufiCZeZe5uC46CeNh-yGOsSaWsZqtGudptYyJa_oBRQ@mail.gmail.com>
Message-ID: <CAP9ODKoufiCZeZe5uC46CeNh-yGOsSaWsZqtGudptYyJa_oBRQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"Burton, Ross" <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH v3] lib/oe/package_manager.py (rpm): Allow use of non-signed packages
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
X-List-Received-Date: Mon, 02 Oct 2017 16:40:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 2, 2017 at 12:06 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 10/02/2017 06:02 PM, Otavio Salvador wrote:
>> Em 2 de out de 2017 11:57 AM, "Alexander Kanavin"
>> <alexander.kanavin@linux.intel.com
>> <mailto:alexander.kanavin@linux.intel.com>> escreveu:
>>
>>     On 10/02/2017 05:52 PM, Otavio Salvador wrote:
>>
>>         @@ -551,6 +551,8 @@ class RpmPM(PackageManager):
>>                    if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
>>                        gpg_opts = 'repo_gpgcheck=1\n'
>>                        gpg_opts +=
>>         'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n'
>>         % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'),
>>         self.d.getVar('DISTRO_CODENAME'))
>>         +        elif: self.d.getVar('RPM_SIGN_PACKAGES') == '0':
>>         +            gpg_opts = 'gpgcheck=0\n'
>>                    else:
>>                        gpg_opts = ''
>>
>>
>>     Still wrong! I'm kind of getting tired though. Can you figure it out
>>     for yourself, this time?
>>
>>
>> Even better, I'll leave it broken.
>>
>> I use I'll myself so good luck with rpm.
>
> FWIW, the wrong part in this patch is that when PACKAGE_FEED_SIGN is set to
> 1, but RPM_SIGN_PACKAGES is set to 0, you will not get gpgsign=0 added to
> configuration.

Good that you know how to fix it. I gave up as you said, I got tired.
Being not an active RPM user I took the time to check and test it and
got a non-helpful attitude from one of its maintainers so please go
ahead and fix it if you care. I got tired too.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

