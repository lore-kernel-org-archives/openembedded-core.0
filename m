Return-Path: <tom.rini@gmail.com>
Received: from mail-qe0-f45.google.com (mail-qe0-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6A36AA20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 11:27:29 +0000 (UTC)
Received: by mail-qe0-f45.google.com with SMTP id 8so1632805qea.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=bMScR1tosG1XXRoQQSN0jtZ7jiHXXAx1LdB0BPiApwU=;
	b=WDJzay1tAl+nykJ/Lo49XbjNSabgSVlCr6T0Pg/trK2Teao0hcKtmHVb4sQoCKct15
	YJC+0bPLgfDjL3ssSQhv+qfBXkdm76B89v9yDcRr3Wk6I9IVCgnpV/AluNrz9oPxckzM
	7sfsOUdgFelZXQjFslXmkarSpCWTK6y4e9yjzFqC9uooeyJKjAavzlE0Bj5QF2bDBveL
	/vINuhlfe1Yd0bRBUij2UuBOk69PuyPKFMvh6dSYSG/SbppywlX/MxdQyFMua2FOMXui
	0Kg7dkyvW9gNUKwv7mzQRWAa37JAd0xCYHfXJPBHYlXPI6k5/vON09fkN5EOWLGuMuEo
	yAZQ==
X-Received: by 10.49.50.232 with SMTP id f8mr3146220qeo.63.1383218851649;
	Thu, 31 Oct 2013 04:27:31 -0700 (PDT)
Received: from bill-the-cat (cpe-174-106-216-211.ec.res.rr.com.
	[174.106.216.211])
	by mx.google.com with ESMTPSA id e7sm8135758qag.7.2013.10.31.04.27.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 31 Oct 2013 04:27:30 -0700 (PDT)
Date: Thu, 31 Oct 2013 07:27:30 -0400
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20131031112730.GU19303@bill-the-cat>
References: <1382459830-15683-1-git-send-email-trini@ti.com>
MIME-Version: 1.0
In-Reply-To: <1382459830-15683-1-git-send-email-trini@ti.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] udev: Update touchscreen rule for ID_INPUT_TOUCHSCREEN
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
X-List-Received-Date: Thu, 31 Oct 2013 11:27:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 22, 2013 at 12:37:10PM -0400, Tom Rini wrote:

> Since udev 174 udev has been running input_id as a built-in command and
> setting this value in the environment for touchscreens.  Use this logic
> to detect when to make a touchscreen0 symlink.
> 
> Signed-off-by: Tom Rini <trini@ti.com>
> ---
>  meta/recipes-core/udev/udev/local.rules |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/udev/udev/local.rules
> index 72d92ef..d0b0216 100644
> --- a/meta/recipes-core/udev/udev/local.rules
> +++ b/meta/recipes-core/udev/udev/local.rules
> @@ -17,5 +17,5 @@
>  ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
>  
>  # Create a symlink to any touchscreen input device
> -SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
> +SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"

Ping

-- 
Tom

