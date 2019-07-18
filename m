Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9807ED61
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 12:28:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f9so28452168wre.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 05:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Ibzi5AXui8XOymW+uB6jIfWZAExNtIEok9dQeGmaVtQ=;
	b=b3hLDjMsGokqbUByOPZKjbCur7Ux7qR2Z8jPzayEDVBx9NdmTLehF7vVeDu9esy0SG
	4qlAQQFx28y98UbeYrxPm7paT9QNgxgyiDTpVBAWdoIRZsOa3xii288qC3rDY1y9neXg
	QxeHV44yTehCuxG8v8bh3ji6L1mdrbAgYmoic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Ibzi5AXui8XOymW+uB6jIfWZAExNtIEok9dQeGmaVtQ=;
	b=qGO6S9crzK9ZqpabYmXrslLY0yAGAT+5RwYkY6M5dPYpR4Eorpmnzvua/PvGIdWVID
	YZFSDmz/E0kyZkjebiIIbco2WM8gsNXYFOAXlSrOkIEkrQU6hxmE7KKFZyVCBJawZB7V
	RqSaEVQWXfZVIUTYNGNyxw/0eVT7EQFcqitrvXteGGevKW0NFL6SJj+698RJD3JqTBHu
	hcOw5Mgy2tO1DYrsyKGh5Xhbt8/34l0sSEfKehc/cavGiC0quRkH29SD4Qy/M55/adUx
	7vXs6kD6uB8pbhyq/Z2ZwZbgsXsTzsPl0X4rWwDWSkiuZCMyaH5U4KMab7z5Oa9m8Oao
	hP8w==
X-Gm-Message-State: APjAAAV1aF2fjPox3IPsoGrRYEP0ASyi71sWbKneEx2/TYAFBksD+D8F
	aP/P/MCZZS39qc4q4otwZC+Vzg==
X-Google-Smtp-Source: APXvYqxFhLZ9uI0xS4rkWbD34SIV9zeA1KIGJjea30yaNSlJaQ7/B/oqkW8hknxlc14GQk3yW9jRHQ==
X-Received: by 2002:adf:f646:: with SMTP id x6mr52815056wrp.18.1563452907130; 
	Thu, 18 Jul 2019 05:28:27 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a81sm26347718wmh.3.2019.07.18.05.28.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 05:28:26 -0700 (PDT)
Message-ID: <0582005b00d2a7789ed794501c57064f265a0205.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 13:28:17 +0100
In-Reply-To: <CAPVBjxFRyEvgBoNN818RD0Lg9D1GjdBidxrit-PQ4cqVwxJswQ@mail.gmail.com>
References: <20190628101353.11933-1-jean-tiare.le-bigot@easymile.com>
	<CAPVBjxFRyEvgBoNN818RD0Lg9D1GjdBidxrit-PQ4cqVwxJswQ@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: =?ISO-8859-1?Q?Jo=EBl?= Esponde <joel.esponde@easymile.com>
Subject: Re: [PATCH] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Thu, 18 Jul 2019 12:28:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-18 at 13:57 +0200, Jean-Tiare Le Bigot wrote:
> Do you have any feedback on this patch ?
> 
> Thanks!

It merged a while ago:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=0df6cef5258ccd6bd137279aa610b6b1bce43640

Cheers,

Richard


