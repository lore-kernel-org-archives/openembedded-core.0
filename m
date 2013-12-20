Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC8160C24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 11:50:56 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id m20so2090517qcx.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 03:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=y09j1mZRECNqgUMaAEQZaMSEVzw0lO5VQhRrajakjd4=;
	b=BfxhnIuC76tmEZ/ILLssZ+HWmFEHV1x+ZBYwC7XTIpWBSPOHmgLrGlfl/0tlPgjwQd
	WFLLhh7+kvhb81mGCjy9t9IPMiUbkNnhSNZWEKeTNmOh34qG5RbeAuffEI9cvo8OxG+l
	0M7LB5+NG9POGPAm+OUEN3bkVpl0Frm0YQGBr+J8eIwm/fmo8GDHyI0Iqxbj34kpxnE/
	Qtws1hldl6t2jsIXH9qXnhdFt1AK3VfIlX9MZFXHgUxLf837X3HnWZ/zEtJUGquxxfEC
	t4buzOzIGwsoJIWQRzBmxS2sJUxwhKXVmqYQKCy1bCz2udDgDqVlDNFQHwnyRGCFCWxv
	9BCQ==
X-Gm-Message-State: ALoCoQk7kcX9mZqo3JrxrDPWsYtcf5MEK/sEV63yd9g82nntInwTSD2c4Jw9h8k0TOkLF5RYTiyg
X-Received: by 10.224.16.204 with SMTP id p12mr13107097qaa.26.1387540257195;
	Fri, 20 Dec 2013 03:50:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Fri, 20 Dec 2013 03:50:37 -0800 (PST)
In-Reply-To: <52B41B29.7080805@intel.com>
References: <1387462812-23194-1-git-send-email-valentin.popa@intel.com>
	<52B39115.2080008@linux.intel.com> <52B41B29.7080805@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Dec 2013 11:50:37 +0000
Message-ID: <CAJTo0LbJ+YVWOD3dDAe1otr8bBq9+DFnya1Zb83Vz6WhgzF58A@mail.gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: for fbdev enabled distro feature, change WESTON_NATIVE_BACKEND
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
X-List-Received-Date: Fri, 20 Dec 2013 11:50:58 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2013 10:25, Valentin Popa <valentin.popa@intel.com> wrote:
> I've tried to build with both kms and fbdev and failed at compile time (bug
> or feature).

I'd expect bug as you can build with x11 and drm backends enabled.
Please file a bug for this (and CC me using ross@burtonini.com).

Ross

