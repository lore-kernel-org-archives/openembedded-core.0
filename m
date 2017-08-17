Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id B7E78719E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 15:09:41 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id y129so44800231pgy.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 08:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=Tglyb7omxyPVyMMzPH952qc3XzHJT4Vn/+PyTvU+7RU=;
	b=tItqAXuN2yxQY5nNpxp4fXl4wYfDE8B8NBQ2qSIOsfDfJzQumP4nXSpWQKVaJCj3jO
	TM5fBUEU/zaz0+jfy8C5OSwSEzU4g477dPLVqid664mp26WYGJ7rMRALhiRVFU+LdEbI
	7GlpAu6d4URrC+13mHcVwu6Za5+ppV+eM3fKNGsatE+vxoYOh4r5E0C83n1dtMOrkP1G
	Vx7tyhMQ+vZEQVTsafg+FbweWB8ddBKbRSJRPRxSvtjzmgQB+mvv8JRaKMF2U2xpVgVC
	HiFDHMyW7ppbVSshT+5rNo3v0u7iIa4APK71mr6aSTEjNdtSJjcit3x6r6UgV2JPFZiv
	lgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Tglyb7omxyPVyMMzPH952qc3XzHJT4Vn/+PyTvU+7RU=;
	b=DpSL5W6ehOu3nclDr4pr4Sy2/gmNFmVi7w1ojdSjaAtTSkP3ksgDicBeEdt85zqVD8
	OlaGYxq8LFZq2jDKG/wwCDAFwiJydHrfloaQUAepIs52G+C2vh4JWJ8I7EiaE6lHbOn1
	I8T+YXFUocs8N6r6otVhYAz/8VjfPgcIG3Ss5hZhvxJkAS+IzB6xAHPafVooMJ9kJPsu
	/k7lwurIoPnE2GKphv1pRF78bFRPX95G29CDhijrwLnFlSLX4+LC3aHjdg+DIkz+1PX+
	pVapH3ZRhVFp1zj2QIay/hnnflptUdoAMpIyCyRkf7pXXVJRcEqaXr4jo7uVPctuIGTn
	zWVw==
X-Gm-Message-State: AHYfb5iovXzaNYHXvEalya2vfiq2kKuLOgg/H/N9fj4eDoShBlT5ycKY
	XHGsyxG+3c+nioQp
X-Received: by 10.98.14.195 with SMTP id 64mr5734472pfo.10.1502982582703;
	Thu, 17 Aug 2017 08:09:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:d0e0:b257:e49e:7633?
	([2601:202:4001:9ea0:d0e0:b257:e49e:7633])
	by smtp.gmail.com with ESMTPSA id b1sm5088699pgn.1.2017.08.17.08.09.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Aug 2017 08:09:40 -0700 (PDT)
To: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
References: <20170731135904.GL16135@bill-the-cat>
From: akuster808 <akuster808@gmail.com>
Message-ID: <8732aa9a-f239-e910-f5e7-b45cbf07c676@gmail.com>
Date: Thu, 17 Aug 2017 08:09:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170731135904.GL16135@bill-the-cat>
Subject: Re: Chaining compression support fixes for morty / pyro
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
X-List-Received-Date: Thu, 17 Aug 2017 15:09:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/31/2017 06:59 AM, Tom Rini wrote:
> Hi Armin,
>
> The following changes in master are relevant to both morty and pyro:

In stagging for morty. will do pyro shortly.
>
> commit 0a7ce0b971a208956cb895ba5a869ec8c5d94703
> Author: Tom Rini <trini@konsulko.com>
> Date:   Fri Jul 21 18:06:33 2017 -0400
>
>      image.bbclass: Correct chaining compression support

Needed a little fixup

thanks,
Armin
>
> commit 98a2afeb3a53bec7a72a4a9846e1dba636cc6f3d
> Author: Tom Rini <trini@konsulko.com>
> Date:   Tue Jul 25 15:58:09 2017 -0400
>
>      image: Fix "metadata is not deterministic" when chaining 2+ CONVERSION_CMDs
>
> And fix the problem where you cannot make arbitrary combinations of say
> "ext4", "u-boot" and "xz" images.  In the interest of full disclosure,
> it is entirely possible that there are image types introduces in other
> layers that have the same problem that the "u-boot" type had which lead
> to 46bc438374de being done in the first place, which is to say a new
> IMAGE_CMD that also cleaned up the intermediate files on its own.  This
> may make this too risky to pull into stable branches and that's fine.
> Thanks for your consideration!
>


