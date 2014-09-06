Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9712E7139A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Sep 2014 07:23:51 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id j107so247906qga.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Sep 2014 00:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=o1LCZeRzGShTs3S9imygtTj9H8u3u61jxMNFzj+ldIY=;
	b=BH8taw2jlbdvxqSQZBdOOdO1byVRK3GiBZ8I8z3Uu+V0JQ9lgBY6k4JRSLW5MCla1S
	Pnn/WRMFlFPDLWOeTaE4l67EiXyz8kJLQQbYMcfvuC9fZLx0u7j/g7vqmHQvDED7OIaQ
	jsF0kUsuWlkk50ey6yt/WRbuuTGQwbXEhwERXkPN9p9skBs3IOSjkk0ACbO8pSpYsApu
	rWYYG/V13CkWo1noub0DUmB8fKtaUJgwjXHuxhaALEtgjBfG2RxMR6x6CHNMcNS48eXR
	01ChDhyGpfxu+AmQmmAs6XVtCHroHzZqSUcLB0AFxJ0V/AVM4IrxzFHxcrBdWLizOZOU
	RIDg==
X-Gm-Message-State: ALoCoQlGXx0CJPvT3Ndo1RjLOimaCCrW45QNmTYdHfNzsPVyY2+pI01d+NU3UD8CHvKgNHPBWuuy
X-Received: by 10.224.64.201 with SMTP id f9mr26170000qai.64.1409988232670;
	Sat, 06 Sep 2014 00:23:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Sat, 6 Sep 2014 00:23:32 -0700 (PDT)
In-Reply-To: <CACS+7ZRU6R--qxKFxWmCKGQaHgyDMfd=cUrnLnjZVfsktmhxAQ@mail.gmail.com>
References: <CACS+7ZRU6R--qxKFxWmCKGQaHgyDMfd=cUrnLnjZVfsktmhxAQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 6 Sep 2014 08:23:32 +0100
Message-ID: <CAJTo0LZDeTCp7E3ZMX6To6Ox-bOLS625d_T2QBjjuQ+RZ7==dw@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: Use ${ROOT_HOME} instead of /root
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
X-List-Received-Date: Sat, 06 Sep 2014 07:23:53 -0000
Content-Type: text/plain; charset=UTF-8

On 6 September 2014 04:26, Dan McGregor <danismostlikely@gmail.com> wrote:
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-Make-root-s-home-directory-configurable.patch
> @@ -0,0 +1,176 @@
> +From 00138d820fc0dfce6e5fee03d1edda66db34aa80 Mon Sep 17 00:00:00 2001
> +From: Dan McGregor <dan.mcgregor@usask.ca>
> +Date: Fri, 5 Sep 2014 06:28:58 -0600
> +Subject: [PATCH] Make root's home directory configurable.
> +
> +OpenEmbedded has a configurable home directory for root. Allow
> +systemd to be built using its idea of what root's home directory
> +should be.

Patch looks great, but please add signed-off-by/upstream-status tags.

Ross

