Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A60657BF09
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 10:44:49 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r4so11337544wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 03:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=YLUMM+frJcIFH3pl/ZSwygW4iXCwXZdjQrKRxkqJecE=;
	b=SoYV7Sxva7+tKZ53gKLIrrmQqctHlt0Ai0L9Wb1DhTTh2sgAohcHuHRC2jY6E3TC2h
	MJ0FHXfpEaCv1ZyJCmzzYE8xNQLIH9iYaqRLSiooAUXr2fB6NLl5QenoSzsy/UeKXLN2
	KtBjC1QlmDraqrzCn7LX/r1LQ/ZnAdE8IFbDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=YLUMM+frJcIFH3pl/ZSwygW4iXCwXZdjQrKRxkqJecE=;
	b=W6IwVRqQLiah/OB7ufTPdRyzTCZYZo8iIaX/nItstXRyNf9wWg80E/hhK/BYjJ8gdz
	2wwNVttlg0iQdG3v+Ojbq9NimPGHK+xNlyWoDcPtaQZrx0V0MASU+g6sg05YbXbFuoMD
	T/I7WaB2kYvojYMREjHt9d1hMDwqkk+d7CGwu5pGjmFzt8DRFy40eJSll3zyPzN4zvBm
	r4rbLzyZ0BMMDSkskkWbakc7dN8RPQjJNiqzo0CVPJL8lIiZBp/3f7cK/H9MEdrulfnT
	5xOBOmMuPnRn2pfYvkoV47YxlxHxfCF1zCEYm6vuoALSIKffVm3BUBzieaUOs+PT3aD+
	oDxA==
X-Gm-Message-State: APjAAAVvV7U1ckzeRp2bhF8nDV5mZPPGBvrJ7X7/NjjRaebVNhQv7bnz
	L2Up6LN40/aeHELCEONZArRxAw==
X-Google-Smtp-Source: APXvYqxx/lvCCHJ5P4K86hshLzpVH/kZX8YiU01FKlhaU2NI4QLcAxyOS7lzf8VSOSh5RXPDYFWNSA==
X-Received: by 2002:adf:fa86:: with SMTP id h6mr33242489wrr.67.1554115490340; 
	Mon, 01 Apr 2019 03:44:50 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o130sm15219470wmo.43.2019.04.01.03.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 03:44:49 -0700 (PDT)
Message-ID: <b8022f1a28c2bf5c32ddcbb498bf9a3ede0dc181.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 01 Apr 2019 11:44:48 +0100
In-Reply-To: <20190329142905.20123-3-ross.burton@intel.com>
References: <20190329142905.20123-1-ross.burton@intel.com>
	<20190329142905.20123-3-ross.burton@intel.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] gtk-icon-cache: clean up DEPENDS
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
X-List-Received-Date: Mon, 01 Apr 2019 10:44:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-03-29 at 14:29 +0000, Ross Burton wrote:
> Instead of using DEPENDS += use _append to ensure that these additions can't get
> overwritten.
> 
> Also use gtk+3-native instead gtk-icon-utils-native as that recipe no longer
> exists and is provided by gtk+3-native for compatibility.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/gtk-icon-cache.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
> index d87167aec09..3572f62ebb6 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -1,8 +1,8 @@
>  FILES_${PN} += "${datadir}/icons/hicolor"
>  
> -DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk-icon-utils-native"
> +DEPENDS_append = " ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk+3-native"

I don't mind the changes themselves but I do have a bit of an issue
with changing to use DEPENDS_append.

In general recipes should be doing DEPENDS += "xxx", unless its at the
start of the recipe before any inherits (and even then += is fine).

_append is much harder to override and whilst it can be needed (e.g.
the hoops base.bbclass has to jump through), I'd much prefer to
encourage people to use +=.

I appreciate its a style thing and there is no "right" answer but its
one do have a fairly strong preference over, mainly for the
overridability. Our _append/_remove/_prepend operators are operators of
last resort to me.

Cheers,

Richard




