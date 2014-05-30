Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 20E066FD7A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 14:28:42 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id z60so5421918qgd.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 07:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=afDriqtmNVGX42yCNwQ+8x6kims7gWMjRIscFv3gWyg=;
	b=DuHJkuda3APU7jD7exOrx1U4nWfYH/NWFSzJffbPCOy6yl/IdsBDmeaIUEy2OVzyNp
	uWIUKhKKWfrffD8DCYp+QjzGWiRyZoI6E4aGyGh63K7vyhEQ7USxijJmHoCjwCE4iDdu
	2eGbf73vgvkh3jWACtNiA3E/KN3ZFjQQOHqqcij17VMbZTDWlRZnhHtYlXn2gDJKjl/D
	ljJijKU3VjE69UXbRo6NOWhpgKLG+ZeQxeQJoxJIPNzwGT79VVrYKVGvClUx0BPeCOqk
	VBRJ2zgCWBNi87n3wi6YiWvuvMnXKhjjE7LqpCBfgu5efMYGeRxE9C89f6HnKbt9qHyw
	oN8w==
X-Gm-Message-State: ALoCoQkl6fYMKaN2WwNVqdVyc4WGzrLQCfOWr6f4NmVR32fKcY9NAedpP0Ms8aaoMLAlThnuDxX0
X-Received: by 10.224.151.206 with SMTP id d14mr21264820qaw.35.1401460122907; 
	Fri, 30 May 2014 07:28:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 30 May 2014 07:28:22 -0700 (PDT)
In-Reply-To: <1401390620-21874-1-git-send-email-raj.khem@gmail.com>
References: <1401390620-21874-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 30 May 2014 15:28:22 +0100
Message-ID: <CAJTo0La5LW4EeUX9-Eaa3jGeY_-U7PsA3T6ThqTAvihks6PUmQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 212 -> 213
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
X-List-Received-Date: Fri, 30 May 2014 14:28:43 -0000
Content-Type: text/plain; charset=UTF-8

On 29 May 2014 20:10, Khem Raj <raj.khem@gmail.com> wrote:
> +       sed -i '/ln --relative --help/d' ${S}/configure.ac
>         sed -i -e 's:\$(LN_S) --relative -f:lnr:g' ${S}/Makefile.am
>         sed -i -e 's:\$(LN_S) --relative:lnr:g' ${S}/Makefile.am

Introducing lnr was my fault but this is getting a bit convoluted, can
the ln-munging be replaced with a patch so it is less magical?

Ross

