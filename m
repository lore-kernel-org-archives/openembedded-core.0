Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3plp-0008Dm-JF
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 16:21:57 +0100
Received: by mail-vc0-f182.google.com with SMTP id fl17so2409989vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 07:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=tMQnGZzxdR+3WYnQXJtLegV1Srf9QtG7ydtmJoBIPnY=;
	b=mmoY67A1iaO0zAU2H1NMNhJ/qHd/axlnMLA7eHblLOLuu710y0Oz/1RJrz0XpowUSO
	X4MX2lzVx7TJjpqM0nZcZh1SXLu6mpb7w63fCQXkk9oIGUHLBKBdnxYZ2alyrKszZ893
	Nl+dO7LBt/Qpe+JKOz9PFU1BhrYFIGb6It74iuV4Wn9INmBe7Zle4kGZC50uvUs56Gc4
	PZDyF4oZiuFth9jGd/liYNqrW/NHTIkdKsDLALM0priZWtUzyv3FGu8ysWa4ONyp38QC
	0eKWxaJz23vU45bIuDdO7+hZJAE0rGDHOXs0YFF0X4E1wE/POdy3Srqs3xNqwuziKbd0
	Ki4g==
X-Received: by 10.52.23.18 with SMTP id i18mr6139545vdf.46.1360335951270; Fri,
	08 Feb 2013 07:05:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 8 Feb 2013 07:05:31 -0800 (PST)
In-Reply-To: <1360335313-22408-1-git-send-email-ml@communistcode.co.uk>
References: <51150D5D.2030403@communistcode.co.uk>
	<1360335313-22408-1-git-send-email-ml@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 15:05:31 +0000
Message-ID: <CAJTo0Lbf+qsJd2R_39bN2GDHZNbncKPZFa1VUQiHn7USVZy_iA@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQn/GJSfOBbc37KrMKbTCoS/kcwfVnQ9FTxRfvQVMIlDMmXpklDTZAKQQbvWkBMC76nwyB4a
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-core-boot: add VIRTUAL-RUNTIME_network_manager
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 15:21:58 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2013 14:55,  <ml@communistcode.co.uk> wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> Now netbase has been split into netbase and init-ifupdown, the user should
> be able to make a choice on which network manager to install, and not be
> forced to install init-ifupdown alongside if they wish to use a vanilla copy
> of packagegroup-core-boot

Seems like a reasonable solution to me.

At the moment the sato packagegroup pulls in connman indirectly via
connman-gnome, it might be reasonable to set
VIRTUAL_RUNTIME_network_manager there too.

Ross


