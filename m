Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id D3F096017E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 15:37:15 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id n8so10448708qaq.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 08:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0Jh38BxuC7334hTTwybmOlsbEzPdS9aC68Zs0Uv7cpY=;
	b=Ti9FHN+trj9wNCQ2ciz8q5oF+PSiwWjUA7Am+Js/zAuFYU0MXg80u7cXws0e8kROIx
	FpXKiY08l3+4iXrZ4WkGZ/wAZeB4gioHvUlguo/83hYje6siy5PpeXA0GAwvW/cj3huV
	61qAaqF3dFhptpT7nodKD1QD5zSdObIFrtC+pJZftvykhPm5jym7Vg8bA4wJR1aAis29
	E/TjfszIPwoqKOjc75dhu2uyR70amUiDKCsxbSB6GRZav2flJxRtumXV1VnBxu6SZLTa
	NUnuPK632Ti7NB/ixfVW1a3GmC50oTSwE1ikZ7vhbjEnttNdwbEB6MdGj6W6QreYxKtA
	YyPw==
X-Gm-Message-State: ALoCoQnMlI57XFNCQfcL9Ib/jcyiR9TFgQ3mnUWlhrFkiKTzQv5edKitGLRycYU5zw3wZyZjQ5L0
X-Received: by 10.229.236.8 with SMTP id ki8mr60729523qcb.12.1412091430724;
	Tue, 30 Sep 2014 08:37:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 30 Sep 2014 08:36:36 -0700 (PDT)
In-Reply-To: <1412086856-1516-1-git-send-email-noor_ahsan@mentor.com>
References: <1412086856-1516-1-git-send-email-noor_ahsan@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Sep 2014 16:36:36 +0100
Message-ID: <CAJTo0LYNbLXgGbqnakm7=NiFxP-cdU4av+a1HfemWriEq+DZYA@mail.gmail.com>
To: "Noor, Ahsan" <noor_ahsan@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] latencytop: Creats x11 PACKAGECONFIG.
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
X-List-Received-Date: Tue, 30 Sep 2014 15:37:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Typo in the short log, "Creats".

On 30 September 2014 15:20, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> +PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"

Use ??= when assigning to PACKAGECONFIG.

Ross

