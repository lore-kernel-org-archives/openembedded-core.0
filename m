Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 37EB67597C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:42:42 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so5486441pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=JSqr80zwigj1U0Jh9BoDm93YU8We7uZDdLdfGJxGpvk=;
	b=hU0H2Yoe77PREyFqb6v2/TO7J05vkl//mty7kqk68+rA5/8bjxU3Hg16Ym3MFKs5yY
	uz1LzwP9pVbUvyaPE4wJGUdQjU+s43uPxzM12r1g8lNNsyeHgOAH7CisJaK6Xjpui7sV
	FwlH1nvQ6EsVCjdrfa4RA6cUFhdaBovfr2vGvI+2iizW9Q9X4hLenquxQE/53ejnL8sW
	uGdzjDcV5QJMgnKC7uOukfWjAj9omiW71MsQ+0AxGOzVRKDI1BlaQ907vwWTeIML8e5k
	RUaQ6GCqjcy0rWs+k8qNSjYJOG23kuUYIleO0hv6KFk8CYVSVaJ4aLmG/V8Aqg3CnMq9
	TERA==
X-Gm-Message-State: ALoCoQnzgMITChcqWRODQ7TNBkKE3b3oVXocBb7VP6GwKpxsGtAHlpcom+2k+EmgXUqIbWAdd1yh
X-Received: by 10.70.118.5 with SMTP id ki5mr94367901pdb.6.1438173763223;
	Wed, 29 Jul 2015 05:42:43 -0700 (PDT)
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com.
	[209.85.192.177]) by smtp.gmail.com with ESMTPSA id
	pc9sm40711190pdb.6.2015.07.29.05.42.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 05:42:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdbnt7 with SMTP id nt7so5545427pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:42:40 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.135.104 with SMTP id pr8mr92391094pdb.129.1438173760872; 
	Wed, 29 Jul 2015 05:42:40 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 05:42:40 -0700 (PDT)
In-Reply-To: <1438194339-13618-6-git-send-email-b54851@freescale.com>
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
	<1438194339-13618-6-git-send-email-b54851@freescale.com>
Date: Wed, 29 Jul 2015 09:42:40 -0300
Message-ID: <CAP9ODKqd+wKwmMLjddLd+4SEEqbLm+iXYvuSNh9iJ93obxtsZg@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v4 5/5] gstreamer1.0-plugins-base: Add videoencoder related patch
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
X-List-Received-Date: Wed, 29 Jul 2015 12:42:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 3:25 PM, Yuqing Zhu <b54851@freescale.com> wrote:
> Keep sticky events around when doing a soft reset.
> The current code will first discard all frames, and then tries to copy
> all sticky events from the (now discarded) frames. So change the order.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

