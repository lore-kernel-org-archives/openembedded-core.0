Return-Path: <net147@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id E46416F203
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 00:04:08 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so7860861qgd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 16:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=P5Gjzu08l0oPXCkF3DT911DfM0H8apbN0jD7pLaZQX8=;
	b=KrHBlS+LCbS5ZhYfuFFHU1AWoXdVserjznMmEz8Q8vL7fpG3KuU3lKTt4Ky23Woqmt
	jP0g2Vulx4xEr90t2XCf98TnVXtJaJdt345rOKZWl3pvbrj6PbusLd5q9lHqacOLQEMR
	g7G40izbNNq2zb3j07gd3+2oLmsbarBwHYHUc/01DlJ7nBMriSMtrpkDeDxQXKIlR7U9
	F8e6yXVAnfIhoErw6vBdvO9CoyngUfPc094WCHiDKged8l8USA+O6TKS9spNhX/nuFMF
	rbHn7NbsM5kC8u/AujDz+GRxt1m0Ee522LCAhke8E5UVpD36UNzG1QIDVKfR4EAt1avw
	vS8Q==
MIME-Version: 1.0
X-Received: by 10.140.49.109 with SMTP id p100mr11463295qga.52.1393545849549; 
	Thu, 27 Feb 2014 16:04:09 -0800 (PST)
Received: by 10.96.33.35 with HTTP; Thu, 27 Feb 2014 16:04:09 -0800 (PST)
In-Reply-To: <1392957737-959-1-git-send-email-net147@gmail.com>
References: <1392957737-959-1-git-send-email-net147@gmail.com>
Date: Fri, 28 Feb 2014 11:04:09 +1100
Message-ID: <CANwerB29+ZAbLsHanbh19ybYzsp=9QyDJe2zPBBOfgNEQkLbKA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix console-kit-log-system-start.service startup
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
X-List-Received-Date: Fri, 28 Feb 2014 00:04:12 -0000
Content-Type: text/plain; charset=UTF-8

On 21 February 2014 15:42, Jonathan Liu <net147@gmail.com> wrote:
> console-kit-log-system-start.service fails to to start if the
> /var/log/ConsoleKit directory does not exist. Normally it is created
> automatically but as we mount a tmpfs at /var/log, we need to add
> a tmpfiles.d entry to create it.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd/00-create-volatile.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> index 9ffa88e..dc6b462 100644
> --- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> +++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> @@ -4,4 +4,5 @@
>
>
>  d              /var/volatile/log               -       -       -       -
> +d              /var/volatile/log/ConsoleKit            -       -       -       -
>  d              /var/volatile/tmp               -       -       -       -
> --
> 1.8.5.4
>

Please disregard this patch. I will send a patch for the consolekit
recipe instead,

Regards,
Jonathan

