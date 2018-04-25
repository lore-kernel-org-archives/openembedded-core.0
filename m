Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B350606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 13:05:33 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id m134-v6so19858078itb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 06:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=X760Edm1nCpsqtEuRxVte+hthYSLArXg/PhBLMmvx38=;
	b=YNgCjBBlVgBEXM5nxEphjqvNsN5yfL0Sit4nTkR4x8enK2fHii+TFlL2VbYEu5GKBu
	zbzymRsCYMVNAibsDzT6vLYyZBy7k4ZIMumHZG8kcE4/T9nTE58el7ONB4FCfeJcqQ2d
	Pj/Lq8gUi1rg6OfADg/1DEKpKCDQ64uE+W1jZLoGigZX5at3wLiomGgpF26qnuusQspv
	2qLKrAt6H2xQAwm9kEMukGTHwdpt8WYm0RD0HQDHGBq/NTqSYFDp74Z4t86cNxWM3syz
	/SflbzCVD9RrXt8qIXT0dB1faDStPb7m/dYzlQgnqFjxqseWicfiwGujzYpKpCw5a1CC
	Q4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=X760Edm1nCpsqtEuRxVte+hthYSLArXg/PhBLMmvx38=;
	b=CUQKbphq2tiX/YoQGiFwlwEaOAjP6ek/Nfdecmfd3zIrNmi27wEjL4kXV7aNovkw3p
	4N7b+bwUZnbIL138ABWgp4j/jVXyb8eT7sLPjIDevY8+Sx9i4v0xClraDOV/5Xi9hdgv
	kd/U/MVqstTb7YnPEVZE7s/5jV8Mvy2lWbBaeIBB5LcwbzJJ1A/x30PCyx3UOdFUWnCh
	6eVjEYWOb8ZoeQ3MEr93FlmjdqVJtlvlEZhXRYjwCkviB60hgSdRbDR3uAXsRaTiNqhx
	E8bP+KaX9octzA3wAZ8YOzC1VMbhErQDpPBzwuAQ6FSmwymQYSAgPnKGLlgKX2CVzX1z
	O8aQ==
X-Gm-Message-State: ALQs6tADvG2wmDwwP7syHm8k5m47hobcQxHBf7GjZhN1v2P9XrcMKJL4
	LKj87fUJL/hzsIWA343Q2iI=
X-Google-Smtp-Source: AIpwx4+f+7GCCMqyz3heQUg+w10J+btdRwlPMhdWmf8xeX4Y8ke76FF/8jTXbfzNIjkgmKuNoFdhfg==
X-Received: by 2002:a24:d011:: with SMTP id
	m17-v6mr22613277itg.147.1524661534709; 
	Wed, 25 Apr 2018 06:05:34 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	f124-v6sm7938450ioa.8.2018.04.25.06.05.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 06:05:34 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1524661533.31562.2.camel@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>, Yocto-mailing-list
	<yocto@yoctoproject.org>
Date: Wed, 25 Apr 2018 08:05:33 -0500
In-Reply-To: <CAJTo0LbOsiLq=0Zz=4fPE-A7Q7Ez_XVgqm8CBkSeAu6Bz=myLg@mail.gmail.com>
References: <CAJTo0LbOsiLq=0Zz=4fPE-A7Q7Ez_XVgqm8CBkSeAu6Bz=myLg@mail.gmail.com>
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Subject: Re: GCC 8 hosts
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
X-List-Received-Date: Wed, 25 Apr 2018 13:05:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-04-25 at 13:11 +0100, Burton, Ross wrote:
> Hi,
> 
> Just thought I'd say that GCC 8 is going to start appearing in the
> wild, I believe the first distro to ship with it will be Fedora 28.
> As usual there are changes in behaviour so there are several
> problems.
> So far I've identified the following issues:
> 
> * Python 2 crashes on startup
> * Kernel tools fail to build
> * grub fails to build
> * ovmf fails to build
> 
> I've patches locally for all but the ovmf failure (which is a pain
> because the source uses CRLF) so if anyone switches to a GCC 8 host
> before they're merged and wants to help, you know where to find me.

Do you have a branch with the patches somewhere so we can try them out?

> 
> Ross

