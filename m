Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id AFD8E78380
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 13:29:07 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id t124so5565818oih.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=DxUp2gvdfWKcxVLtf5vJPOWUKXrC6xhP/QnPXI3c3hE=;
	b=zdLLIqt5D+/R8/17Lx3VnWWm2synooC/1vBBzVmVT8WxD4JhKGgIEZrB+Eq+nLXr1O
	8Jvg/nbVmrUmDVU6x/2torrMEHHwL/DQY/bY6Riddgg4pqAGKX7B7n33qEwXxDwqonsz
	gZnTdMJEvLhkyU8INi2GYvszGONRiZf0bq2O6xAcJHxK7h/HnFjPw3NEBqHD05K7EoBW
	oKfeZfm2ReVcT2Tyuauaen/2FvRLqa+Qn9QGLlgqIyi6POJaR8S+NP7y8eqMbDwTct2y
	75tG3Iqsj3LF6feZq7WCTLza39cUAJN3oT73vMtBEjy4+jF998YeZ8nxVIELV40lE+QR
	6leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=DxUp2gvdfWKcxVLtf5vJPOWUKXrC6xhP/QnPXI3c3hE=;
	b=L9VTKJqyqr8OZM/f9hg4hNc6LvwbYGWSS2fGLREHBEdZSzQKQ673AWUDtmXq86v6gM
	cd0pmSTNY0uC82PKONpJEUosGLMqqQWtHr1ykMfjUrWe/V6azG53UrsFIPHzxrsx3X8I
	4h6YQKXvy7DdNlfZDEntHlU5l4MolzWyFQGVLDtnDd9hcW8EndYw2Ke7U6dxs7afPu9p
	nAHO7GPxA7l10NawTwFmaV3zboi+4Emp8+5cWmRW5yFQXP7Mdbq/UcVmcho78Z07AXRP
	g8gOKf6E3VMWhJfJLqt6cQpd2ZzKo1ovHu2n0byPXvzyQfhDOM1o+nIZ/irafBcTdBvk
	IPyg==
X-Gm-Message-State: AHYfb5icdPhKmQ2HlGrEuFwiBJxK9RR9/zJqx4iiuAyXNS/LEikCBaA9
	cVPOgUC621b3ie0VQHE=
X-Google-Smtp-Source: ADKCNb6AkXgMWVOu9qg6mc1yGZJo+dVUnY1GK2bE0I8eAt9o6T4qOlN0YfxX1OXLd8TeZrJgDi6VDA==
X-Received: by 10.202.214.143 with SMTP id n137mr1657101oig.208.1504099746814; 
	Wed, 30 Aug 2017 06:29:06 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	d95sm5706507oic.49.2017.08.30.06.29.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 06:29:05 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id r203so51023584oih.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 06:29:05 -0700 (PDT)
X-Received: by 10.202.186.10 with SMTP id k10mr1450880oif.100.1504099745070;
	Wed, 30 Aug 2017 06:29:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.37 with HTTP; Wed, 30 Aug 2017 06:29:03 -0700 (PDT)
In-Reply-To: <1504099498.12799.41.camel@intel.com>
References: <20170829204309.16139-1-otavio@ossystems.com.br>
	<1504085996.12799.39.camel@intel.com>
	<CAP9ODKqSH7PNk1fATkb6CGiwkKAnkuR5d2esZtVbzp77b2n3Mg@mail.gmail.com>
	<1504099498.12799.41.camel@intel.com>
Date: Wed, 30 Aug 2017 10:29:03 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpybDPamPKJJ0zo4FyrDg4d3LQguVSO97biw5+7AXD48g@mail.gmail.com>
Message-ID: <CAP9ODKpybDPamPKJJ0zo4FyrDg4d3LQguVSO97biw5+7AXD48g@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>, 
	California Sullivan <california.l.sullivan@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Wed, 30 Aug 2017 13:29:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 30, 2017 at 10:24 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Wed, 2017-08-30 at 09:46 -0300, Otavio Salvador wrote:
>> On Wed, Aug 30, 2017 at 6:39 AM, Patrick Ohly <patrick.ohly@intel.co
>> wrote:
>> > Let's not dig us deeper into this hole and instead split out the
>> > live
>> > boot module into its own, arch-specific recipe.
>> >
>> > Then initramfs-framework can become allarch without having to make
>> > layer.conf more complicated.
>>
>> I think this can be in two steps. Splitting it out makes sense as it
>> avoids the build of useless packages if someone is not using the live
>> modules but it can be another patch.
>
> I'm not sure in which order you want to get it done: first split out,
> then update (i.e. remove the layer.conf change) your patch and merge
> that, or apply the v4 revision of your patch and later clean up
> (including removal of the layer.conf change)?
>
> Personally I'm in favor of first splitting out the modules.

I am not in the mood of splitting it now; I prefer California (who
send the additions) does that.

In any case this patch avoids a sstate change for no reason.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

