Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 133A261B8D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 18:19:47 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c145so3017862qke.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=uQ8W2H00VQ/mQKeYm0qlmbInc8N83K/jGnhElL7a3GQ=;
	b=uNix68oIh7XHMIOJaMwXu19gLrZKOTX2zixSjL2yzlO25b6MAANnckF54R9lpXbpCf
	CETuacCv7JkrMOSk64cNAaMIORy7pJJanyw8QTrXGath4w8mA3P3aQYKFTbif0B5BtWs
	N0wHtR8OtRllrKmaiDwfdS5itHNS+3vTd5qWoPfmj24iHWHNvcBtKqEaWmLsLMnsWRCn
	xU8IcKPja4Sh+HY054kv/evRTu+4r9qdiLZZ4iG60+ePxQjkHGcA4WZhIclcn44rGYAI
	wguPFH67ObdBdrAYQf5hRANIRc1Ilxu6JcDa9+qZn2wsm7wZNX3be7lO5rJN037/RIF5
	3Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=uQ8W2H00VQ/mQKeYm0qlmbInc8N83K/jGnhElL7a3GQ=;
	b=d28jhKB9T7XA52gm+vKeUT3MyUe75jg0pw7u+gd+DPjOcD3PnKd47gKR00gCO4ja7K
	kujQaLEvtNfTUg9EDVdfZbb062p/CREt2WKU4wwqJH5P45rYTjwXCfLQ8c8yyzh5w/mB
	lIbGNddqh2M94P5tMatqqGXNqj/FlQKpFjYNAnzu6kUD7HbVPdK3LyqpFab4tEu/DAq3
	RClemDT2NXLi0+HlcLRlZ9LfC0PJrpM+kGMX8Z81KsgEOYxea+EsQp9pd6I4q/Ho40ED
	d6vA0eY7pIfIehs4H6aBYZWf/QcGM/N/sIASk6c9sGQg9t/eiOck6xLEKvIXbTNutU99
	yfUA==
X-Gm-Message-State: ANhLgQ0KH+2E2ObBBDY3tcnnZfx2eIWwWqEP/VQu6FLvvDFOrYcGwRaE
	0HdEZyaroIMOabXJt/FGsnUWmi6q3aAppg==
X-Google-Smtp-Source: ADFU+vtRoWkMOshwkP1Ma6DNpWgg3+bmx1szSlMVYGx46Vz7CmMXXpkFoihDwjTqfPEfAGdzYYq3Cw==
X-Received: by 2002:a05:620a:141a:: with SMTP id
	d26mr4041535qkj.312.1583950787958; 
	Wed, 11 Mar 2020 11:19:47 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
	[209.85.160.179]) by smtp.gmail.com with ESMTPSA id
	p126sm26108238qkd.108.2020.03.11.11.19.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 11 Mar 2020 11:19:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f179.google.com with SMTP id f17so1017484qtq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:19:46 -0700 (PDT)
X-Received: by 2002:ac8:7c95:: with SMTP id y21mr3904862qtv.387.1583950786378; 
	Wed, 11 Mar 2020 11:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200311165221.23475-1-domarys.correa@ossystems.com.br>
	<CANNYZj_wh5Xxx38jyzDc6SaFWV9KfVsh=G-k8ceYim=NTi1iVw@mail.gmail.com>
In-Reply-To: <CANNYZj_wh5Xxx38jyzDc6SaFWV9KfVsh=G-k8ceYim=NTi1iVw@mail.gmail.com>
Date: Wed, 11 Mar 2020 15:19:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqbUzA1+FKH=nS6oKdg8bj-rzDAzv7nhi6C05Ywu+hQMg@mail.gmail.com>
Message-ID: <CAP9ODKqbUzA1+FKH=nS6oKdg8bj-rzDAzv7nhi6C05Ywu+hQMg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston-init: Allow use of weston without input devices
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
X-List-Received-Date: Wed, 11 Mar 2020 18:19:48 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Alex,

On Wed, Mar 11, 2020 at 2:22 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> I do not think we should be overriding upstream defaults like this. If your use case is different, you can always provide a custom weston.ini through a bbappend.

I'd like to argue why, in this case, it makes sense.

The weston is getting more and more adoption and often we use it on
devices that do not have keyboard and mouse connected. The default
configuration file, on OE-Core, should be adequate for common use
cases as we see on embedded devices and failing to start just because
we lack input devices is far from user-friendly.

We do have a bbappend our multiple customer layers and as it has
become common we'd like to upstream it as we used quite some time to
understand why it was failing when we first faced it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

