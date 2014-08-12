Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4772565D57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 08:48:53 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id l6so2563472qcy.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 01:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=n6cLbcrFFPLGt99MDlFJihQyl8SO9md1kPDxs9VYoEM=;
	b=IvixQN9fFOegcfBtZniJs9yNIFx5xhLWaww1/NbW0xhzcA8mc9QOSJOqtQRJ17SbVy
	hrMCK4LzDlVf1JgFl4jfJ3l9aup0yvRkU+G/ItGeVzmQMKbM90j3yHx2rrLnjgnAIlKJ
	dg+/KIdK4FX0FS+V9rBWUs9FLtKLT0pkstPfHfWInIsbwP178VdwFbGL+tJEkrxzsKbw
	9vLBq6lt0YdZkDx3+j9bHXqXW9m11cvmuhgJK6E56/MYtDoQRve2idcwHdxp0fzWzjLU
	l50WVY8ZT0WY/CqbKT5ox5qItpkJexhD0SlI+AD7lUX1N9QsZHzuv3P/9zJYmt7nBEEK
	S8vQ==
X-Gm-Message-State: ALoCoQkm1PoB9bvurT156g0BONGi1lzmVYQY2ZVR3miyAcyv5NcJwpzKTbGaLLDTfyP5anrYa5vu
X-Received: by 10.224.44.14 with SMTP id y14mr4220983qae.34.1407833335049;
	Tue, 12 Aug 2014 01:48:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.95.235 with HTTP; Tue, 12 Aug 2014 01:48:34 -0700 (PDT)
In-Reply-To: <1407828058-9939-1-git-send-email-li.wang@windriver.com>
References: <1407824758-9261-1-git-send-email-li.wang@windriver.com>
	<1407828058-9939-1-git-send-email-li.wang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Aug 2014 09:48:34 +0100
Message-ID: <CAJTo0La8yDW0iDcmWwOEhMG6AVgnRhWqL3ijkAy7ugBUpds3dA@mail.gmail.com>
To: Li Wang <li.wang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpcbind: add option to fix port number
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
X-List-Received-Date: Tue, 12 Aug 2014 08:49:01 -0000
Content-Type: text/plain; charset=UTF-8

On 12 August 2014 08:20, Li Wang <li.wang@windriver.com> wrote:
> ++      } else
> +       xprt = svc_tli_create(fd, 0, (struct t_bind *) 0, 0, 0);

*Please* don't do that, match bracket style instead.

Ross

