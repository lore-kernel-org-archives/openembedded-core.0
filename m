Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 650E26B03A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 16:01:22 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id jz10so8456110veb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Q0Nbxz5FgU8QcqmpbapoOoVWEjjVEWsBbLuUzo2/P5M=;
	b=BjjW3OLOHaHi5OrrdTgq6AXpHTGig4HaAhTkIxoqBQrTYrZXxXSw38HeVnDmQoW1mA
	RMPvGrrM6tipzWcpi1/n6x5DDmFTUGjXrNJczt5KHWB6MAuG76FcfeSM4S5lv/ADa2jU
	hooIOrjTSRoCvWszOagoOKE8tlRaBaSUWRGJ9bwSD4/Pg4kDJkVMQUMbvaCJupY3aFhU
	Jlkbxbvbr4hLbXrYLM5szJwhObH+4SKGJTMlYN/i8ak0xLygwZLrifo5w1iUecISs1Cw
	BO9mBSgMKB3HNI5sfjIpK0oT/y8w9bpHlDcUvOEy1ruQMWh7/jRRr5myRP39vUXL7r78
	BRDw==
X-Received: by 10.220.42.147 with SMTP id s19mr24776836vce.46.1373644882766;
	Fri, 12 Jul 2013 09:01:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 12 Jul 2013 09:01:02 -0700 (PDT)
In-Reply-To: <a05bb98e398d4a5f8bc4fa9940759007cc4f305d.1373640113.git.cristian.iorga@intel.com>
References: <cover.1373640113.git.cristian.iorga@intel.com>
	<a05bb98e398d4a5f8bc4fa9940759007cc4f305d.1373640113.git.cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2013 17:01:02 +0100
Message-ID: <CAJTo0LbQZv6JxUi9x+O=AxCUeSUe2ubdhGDy98c1JWMwwb_e5g@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQmyHL1sCxd6Vgve1teMNrTElpMwxqgqFMfYXZiHLpGdc4sFeHKfTkWnUDM6QeQIZ2Kj/2m5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] bluez4: conflicts with/replaces bluez5
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
X-List-Received-Date: Fri, 12 Jul 2013 16:01:22 -0000
Content-Type: text/plain; charset=UTF-8

On 12 July 2013 15:44, Cristian Iorga <cristian.iorga@intel.com> wrote:
> -PR = "r5"
> +PR = "r6"

No need for PR bump.

Ross

