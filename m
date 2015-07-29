Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8804B75A60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 16:33:33 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so8566092pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=Xyd3wuL0RVskYkWYPbqnpERNkUgfatXvZXsqpJmKFaU=;
	b=U2Fhcp3AYMWGfWygitUr6ncLLGnp2tYe66NroM0IzPdUiLQymC7gYf2SbFdfBZd8oB
	Ne/rz+LAxfekZmu8sjrPdUL39M8+qONNtLgBiQqHshgwekZ6Ykm/aqmYUSZBXIhx+9Cb
	X0V2cfchRi36XpEhsx6Fa8kR5RYLCrFQ14tAlfJR5ltAYcuoz2va+lCA24283rwxZT5f
	EOCtBjxCPRLOX2x0IZwTXPcMsEBEfJs3zod+OuqBbkpICY9adZ1Fc3SVddozFB8UzRiy
	QgBkJ8IpfX1f5OPuXUZZ0gZFb2jR60OST46Y/05YGkWz8ca4JsrG33/E+oGQoY2smEAv
	/Nkw==
X-Gm-Message-State: ALoCoQlVBjyY6Z2Fiq7EEsjD4xfSxxpG4RiMMu74Lt3w3kgBQUbRRHxLiFuQ1lqrtR0W1uAaNPKo
X-Received: by 10.70.42.105 with SMTP id n9mr96486505pdl.78.1438187614252;
	Wed, 29 Jul 2015 09:33:34 -0700 (PDT)
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com.
	[209.85.220.52]) by smtp.gmail.com with ESMTPSA id
	i5sm41922947pat.42.2015.07.29.09.33.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 09:33:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pachj5 with SMTP id hj5so8147356pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:33:30 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.251.135 with SMTP id zk7mr94842765pac.80.1438187610726;
	Wed, 29 Jul 2015 09:33:30 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 09:33:30 -0700 (PDT)
In-Reply-To: <1438125665-14966-9-git-send-email-armccurdy@gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
	<1438125665-14966-9-git-send-email-armccurdy@gmail.com>
Date: Wed, 29 Jul 2015 13:33:30 -0300
Message-ID: <CAP9ODKqSeym02zoqOn5Mim3mXq1RWzpzMkq9Oqr_e525cyxTiA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] busybox: disable volumeid support for exFAT, F2FS and NILFS
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
X-List-Received-Date: Wed, 29 Jul 2015 16:33:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 28, 2015 at 8:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> These are less common filesystem formats, so disable volumeid support
> for them by default.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>

F2FS could be of use. It is being more adopted now that Android is
starting to be deployed to some devices with it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

