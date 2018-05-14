Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 70D9A75114
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 22:09:25 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id t27-v6so12155680oij.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 15:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=chlzg8MsH1gom8rEvYyReJxDKTDMMRYmWqnm3NxRsTs=;
	b=qnWez8Q8QRF+h4UXfD8xF/5536DnkPW9r2tXqn0+6y3XcrSjGPDrIGKxEHIlGqOS0b
	oWAmIzDDGOWmg0hzMcB4QfaKNPp0GsLdHQGcLBbpkoS5VHvkoDXUiRD06S3/NuncWjIu
	WV6VEa0twZ1SmYqU3tGqgLF9n50Pi3H/o0A0sip1W6KrqfJ1sk2MNYNV2GZbIiE1nBmI
	Ds/xhRIwBnPFsfP6h5dudJz11rNPRfno+tJ8WUBzhzu/Arvg8FCxjQygPkIpT29PVzRn
	E4l/gWR3cyQ9DaIyLgWBr/1GokdzETkxcEE1eBB+ot59b5mQHnefdnIGltkuOIGFF6xQ
	t7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=chlzg8MsH1gom8rEvYyReJxDKTDMMRYmWqnm3NxRsTs=;
	b=ZnOKVxJK+IqFgUyPcHp5vGuph9f6mFvdEf9JJW8ea0tppOpIO8aKxFf4LSWEfFM9/E
	5GgSNgrOpGLs+BPxntQaaJzQrU8vnLcnvygEGhe84S5YuvpAwTMp5/6dLcMoIKaHY5rE
	LW2B8yY/LDV+rnSRguxWS9AQYGvVqd/AwN/fsnczC3leJVJFzy2UqX9VJ3AvdymzllCr
	O8aAgb7Ob9KHD+tc0vnKjh86/ob+WcH7xXMy5Dv9zoNx6vOWx7mGMwXJMhkKPvlAw+4X
	IMB210GWdo1x6Eau0XZD0tSLiv92QOkJSEoiXZXj5FHLEKrx2VoHQk0tmYxJrJdT8bK4
	JMdg==
X-Gm-Message-State: ALKqPwcg04rC7tJiTDzr/yX7M+n7fd2IUdODqYnci3yiMtNI8LbwqRgA
	kLjnLE9S7Q/SY+Xsi+7dwdFaeBQ7
X-Google-Smtp-Source: AB8JxZoXAof8WbX36p9rGHppl0sxhqDs2CkHB811yz2FjbxkQt7vkf8we+JZ9drnGx0bm1voZL5SuQ==
X-Received: by 2002:aca:35c2:: with SMTP id
	c185-v6mr7547028oia.326.1526335765764; 
	Mon, 14 May 2018 15:09:25 -0700 (PDT)
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com.
	[74.125.82.182]) by smtp.gmail.com with ESMTPSA id
	t27-v6sm6252885oij.14.2018.05.14.15.09.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 May 2018 15:09:24 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f182.google.com with SMTP id n1-v6so16128119otf.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 15:09:24 -0700 (PDT)
X-Received: by 2002:a9d:118f:: with SMTP id
	v15-v6mr8872148otf.125.1526335763670; 
	Mon, 14 May 2018 15:09:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3da5:0:0:0:0:0 with HTTP; Mon, 14 May 2018 15:09:21
	-0700 (PDT)
In-Reply-To: <CAJTo0LYcAyon8a2+UmYaZYvtETjrs1_PuCRNj6s7_E=Z=9kXkQ@mail.gmail.com>
References: <20180504174346.1149-1-otavio@ossystems.com.br>
	<20180504174346.1149-2-otavio@ossystems.com.br>
	<CAJTo0LZRrvYgu9Pthi+ZzsxQX76qW2j7VzXvxfjMuOFNr5JJiQ@mail.gmail.com>
	<CAP9ODKpkqeqn=DpBGsAHMdHP94f=92P1tQL1VKTu+uk88UyhXw@mail.gmail.com>
	<CAJTo0LYcAyon8a2+UmYaZYvtETjrs1_PuCRNj6s7_E=Z=9kXkQ@mail.gmail.com>
Date: Mon, 14 May 2018 19:09:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoEQWuZLmc399h8feEtxfYo-9sk6S8yBxmg2k7LQOa8_w@mail.gmail.com>
Message-ID: <CAP9ODKoEQWuZLmc399h8feEtxfYo-9sk6S8yBxmg2k7LQOa8_w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] wic: add ontrack DM6 aux3 support
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
X-List-Received-Date: Mon, 14 May 2018 22:09:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 11, 2018 at 7:07 PM, Burton, Ross <ross.burton@intel.com> wrote:
> This one?  http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=2e9012e6b44b83b3952598b08cd9d5dadd633b69

Yes, this one ...

I reproduced the error here and will look at fixing it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

