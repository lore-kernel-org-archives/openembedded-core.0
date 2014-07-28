Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6619870732
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 14:24:16 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id a108so8285299qge.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 07:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LSBaJrgry+WUZEDfOLa/FebNMJ9hX5WZdt7P9L7ZpGg=;
	b=ApKIpXQQOz4NBY4KhBILNkSlIYo6fHbZmvwyljMXL2QCyf9CX2Vy/jmG+MGDA03kEk
	4t7tg0ecGUip/e6Q9Axtn3dYjaE72zRfm6ILgyVxnbU2qEnOnQZB60p/xFjDOJhmm9WE
	Rw90RPb6w8s7Eh0Hi9JvUAbAf3f98gtarOYW/qD9HtQqWfcKzXBn94O7HiXenmYzZTAm
	MYmLdmyo2uQKZRx0/lIGD/yx2ChpdftWDISb7hQK/3lbI7Ej3tPoQslzZhVJkJLmqtak
	TKKSsU+cpsaWI1O4N3dy/VmBFep7ZyFrbEviCbVtoZb1EstziwJ6StljmqmYOimWO/6M
	5zOQ==
X-Gm-Message-State: ALoCoQmmCw2uYul0BGcI9nN4rC66vBLCXJuKbHjqfQX0YJbguOPedaIMAeIzPahjXvib8enWw7dB
X-Received: by 10.140.109.136 with SMTP id l8mr270971qgf.72.1406557457242;
	Mon, 28 Jul 2014 07:24:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 28 Jul 2014 07:23:56 -0700 (PDT)
In-Reply-To: <1406557176-29200-1-git-send-email-jackie.huang@windriver.com>
References: <1406557176-29200-1-git-send-email-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Jul 2014 15:23:56 +0100
Message-ID: <CAJTo0Lbn+=irRyET=k0XHF4=BAbrQCin4=Uqrg9TKk78ezLdBw@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: Add RPROVIDES for alsa-dev
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
X-List-Received-Date: Mon, 28 Jul 2014 14:24:18 -0000
Content-Type: text/plain; charset=UTF-8

On 28 July 2014 15:19,  <jackie.huang@windriver.com> wrote:
> +RPROVIDES_${PN}-dev = "alsa-dev"

I believe you'll want replaces and conflicts too, so that alsa-dev gets removed.

Ross

