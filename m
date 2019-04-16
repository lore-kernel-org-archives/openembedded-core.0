Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 745FA7D723
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 10:22:41 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id h18so24612902wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 03:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=jbx3QIubDDYiMLM6hGI/8oqZtYt9Yo9avaXvAD36JV4=;
	b=XS86v2tdBGLVT5+zsBRRJfbb0kaJbXfb8xx+XbZsQx8t0KfuNP7nG7zm/xxM6efg65
	Tw4TTpxHFnCpWaDfefHcg3PhL3/O+08J1qlk0h/sN1brB+vdH1LgilXEXJR9VZ8HBSj3
	Vx9OA9XdQTq2VRWIKDh3k0bx1BaEeLMxGvG9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jbx3QIubDDYiMLM6hGI/8oqZtYt9Yo9avaXvAD36JV4=;
	b=rJcCeloMTD+Bau6bTz7CKWIeF/S+WIxbk88ywctnGcV4V7JPe8OOseK99IaFaMIlEb
	YRQrTjftNoT/l6HHv6TxBuJY334UV8zoBcgVU7jtho533KqZlVjL/ZqpkO5feucOzFfH
	0d9vNJsLPHL0ZaWVURVhVDM8wf1P5AgaxN7Vm6uaXvH7Y07JtYCna9sMfcR2tNZrmtSC
	SgKH+FgUlM9BwwRlrBahDKEMIpzb60YuDZoomKhadu6t0mljjj4FKrat/i9+6IWM/8vy
	/gPbzO1jaNQcUbREcMWF4PGZjft4u8dG0+E7hHyuo9oUwsqts22yEBoXf7RsnkAidhke
	wnIw==
X-Gm-Message-State: APjAAAVEyhCIcHYtxhNydjzAFtv+BSln+4wEuy+K+T+6yjeracBws0Ok
	lbBnDHC5qTPjWJsMC/HW8Q5lSIQttqA=
X-Google-Smtp-Source: APXvYqyyK+lY3NuMjPIjNOrRXlMeIWZDt4ZbFfFi73JkTwoouDY5O4fXCrNhN48Vnz3vDPBYb/yQ/Q==
X-Received: by 2002:a1c:9c14:: with SMTP id f20mr25753977wme.16.1555410162164; 
	Tue, 16 Apr 2019 03:22:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t81sm41529762wmb.5.2019.04.16.03.22.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Apr 2019 03:22:41 -0700 (PDT)
Message-ID: <6ca03a74bb0c22fb2f483afac0d9e8ec13d6e29d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2019 11:22:39 +0100
In-Reply-To: <1555408184-375724-1-git-send-email-changqing.li@windriver.com>
References: <1555408184-375724-1-git-send-email-changqing.li@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] systemd: change default locale from C.UTF-8 to C
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
X-List-Received-Date: Tue, 16 Apr 2019 10:22:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-16 at 17:49 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> current default locale is set to C.UTF-8, but glibc not support
> locale C.UTF-8. so set to the default locale C.
> 
> [snip]
>         if not meson.is_cross_build()
>                 choose_default_locale_sh =
> find_program('tools/choose-default-locale.sh')
>                 default_locale =
> run_command(choose_default_locale_sh).stdout().strip()
>         else
>                 default_locale = 'C.UTF-8'
>         endif
> 
> if default locale set to C.UTF-8, it will cause libpcre ptest fail:
> 
>   re> //8+L
> ** Failed to set locale ""

Doesn't your second patch mean we don't need this one?

Cheers,

Richard


