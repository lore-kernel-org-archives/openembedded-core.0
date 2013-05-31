Return-Path: <ross.burton@intel.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id A784E6A44D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 09:28:25 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id x10so1894369pdj.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ol/qImMnSujrDhWJUHvp8P5vpZcE4VSOXAXMCkk8CB8=;
	b=ZgQVkmfUcZsEOvz6oPVMUZQksBDMuJBVfceZasApRRe1ZbNQntJWQQ63Z1uJy4LGI7
	GG4s627b6lOqfxVCEBpOCvc1qwKWpo3+x18MA9hYthLRUSKcaGduH/PC5lx4pdlK/YV+
	r7oTzp+IOc+6N+BCs/OB+yeRUVc45SOB1Qspj7P4zHqaI+0CZu/vUZQwQSs2yr+6WALQ
	2Qt2B4M6p1m/s9YPYa2h3fOKdWDOFslji8HxhzjexfS8aovU+Y4XS71c56ordu/N6ybm
	2zUW82Zvxi7TSNmuHoEQ+6rU4hXSKwIAlhPfiOjxQooMo0JL/FfNNellanfQuXv+jyX6
	0Blg==
X-Received: by 10.66.13.169 with SMTP id i9mr12400537pac.212.1369992507053;
	Fri, 31 May 2013 02:28:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Fri, 31 May 2013 02:28:06 -0700 (PDT)
In-Reply-To: <1369978815-15261-1-git-send-email-net147@gmail.com>
References: <1369978815-15261-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 May 2013 10:28:06 +0100
Message-ID: <CAJTo0LbQKdr3CaHrd4G-T5KRxgZRZ4ddakK5i3GWkJxijtmQLA@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQkwdbUjPIXa6e5UkZDzHUzsCMmrWg39kW90E/HOl/K2LW0wKXkk5SAPOCGICQVS32OujAYb
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xf86-video-modesetting: update to git revision cba29fd8c2
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
X-List-Received-Date: Fri, 31 May 2013 09:28:25 -0000
Content-Type: text/plain; charset=UTF-8

On 31 May 2013 06:40, Jonathan Liu <net147@gmail.com> wrote:
> This adds support for 32 bpp pixmaps when 24 bpp framebuffer is used
> which fixes graphics corruption in some cases.

Instead of grabbing a random git revision, can the patch be backported?

Ross

