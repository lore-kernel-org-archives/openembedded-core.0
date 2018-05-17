Return-Path: <marek.vasut@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 07D5160685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 09:40:16 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n10-v6so7772542wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 02:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=K5CdDLXU2KqRXa6iD56n8+fkzRkM0DlTMylTXKCPfLY=;
	b=ivA20Kl3A9ET1+Nxr0vQUPvyL5dIW+O9xE5PdBmrgNSDvRqxST8J6QWVpOUJ0glyNF
	hHTzDpqzlXcmoX3lqCaoQljPylXJpkRJYej+1jQcii42qVhWwvnLwwfj9vPs/fMVZBEq
	6v+t9HFx72eeKv6ZATtZYlTyzAnS+oBNn9xnzKyUsOW/43Metj6kNzPuU4AhpJh2wXLF
	wvnSE8aDnQUEq6Ui7qZJOm6+XSaSSSEzogTFWPmh/HfvA9NBDJALCi4K+7rGBqRnNgaU
	eLlgtZRek/23KZ+lVr+1tg5i4wnw3RDk5VrsDbsTlQCDMvYovgMMy0xF5g1uAlOgAzdU
	t/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=K5CdDLXU2KqRXa6iD56n8+fkzRkM0DlTMylTXKCPfLY=;
	b=XSxmaRT+xvUQIWdZkNanoI6XoltxmT5iiGFsuLxLuFwTw5BPDA1OtyNsZ/efjNd/Bi
	x+KqC3VuM5Jp3VakGzNS8vzbht31itY40CYqRmuCuCo6jM9DxK7292kiM7ev7o09vvs9
	B8WwEC7t3uIb5ESiuYAxQamASGbuHwx4AaPjob/HIfM+o0alYEvPKSDofU/M1L4/5Gd/
	cYe/gnifWmk/opBgICK8lheL7LW/cY4KHTQEl3qwtVRgwF+R0C/8rxsiOPF7ErfmDt1u
	uVOsIgpsk1BQhYQCE42Oqfj5Hlx6o6dWF21jmsNr7qbnFvJ1usXCakswkuBl7oDg+gaw
	lIuA==
X-Gm-Message-State: ALKqPwdI78eWwCRWfxkNGZ2BF1ZAoOZEULJvdHNgX7JpHWY2+b2aMGGz
	WnZ79EbLJ0STqRu2OVR095c=
X-Google-Smtp-Source: AB8JxZpTMKZls3W1mytD/3mZZ6Sz6DqPMUgJiQXBVhsuvQfgGIRArwQb6EfTT1bYXSNsj6GaIEGcqw==
X-Received: by 2002:a1c:e006:: with SMTP id x6-v6mr1157403wmg.80.1526550017115;
	Thu, 17 May 2018 02:40:17 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
	[86.49.107.50]) by smtp.gmail.com with ESMTPSA id
	131-v6sm7941630wms.34.2018.05.17.02.40.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 02:40:16 -0700 (PDT)
To: auh@auh.yoctoproject.org
References: <20180517021314.0C556440002@auh.yoctoproject.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b3a862cb-5561-22a8-f620-3796469559e3@gmail.com>
Date: Thu, 17 May 2018 11:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180517021314.0C556440002@auh.yoctoproject.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] u-boot-mkimage: upgrading to 2018.05 FAILED
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
X-List-Received-Date: Thu, 17 May 2018 09:40:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/17/2018 04:13 AM, auh@auh.yoctoproject.org wrote:
> Hello,
> 
> You are receiving this email because you are the maintainer
> of *u-boot-mkimage* recipe and this is to let you know that the automatic attempt
> to upgrade the recipe to *2018.05* has Failed(do_compile).
> 
> Detailed error information:
> 
> do_compile failed

Well yeah, if you dont upgrade all the recipes, it'll fail ...

-- 
Best regards,
Marek Vasut

