Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 724446FEE6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 15:14:39 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id w7so8042684qcr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 08:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=e3RNxwpDoyx5bbkDT95Dk+V5mP/Qv1P9gq1NESO+S0s=;
	b=Op+VLN+2K58nbO2LjPzmjoFRzwlYzPf7rnDReDUWCwH/XrQXEhUP6njWlz9LD0+4Iz
	Ui1mQPboOXoXWhv9e3GFaTYpdV/7f52k6UO5nkbrxzjvIVh4y67tLtTWZPdW0fBlJcUV
	XxfuXSIWkEeNv93uOE8+PBi3fXUgK2Eg1cznqzdFOmYBbPnGSPDRMILeD8WEc3nKpLQ8
	4z/uzFzbcTACOepr3KUkTEimCXqAsz/GyLF53B4MgImhiprgkLc1BzYpQyHwPoV4A4/W
	NWA7rmK2/d4W0SvF3/06e3ZTUVGniIAHDYVnZ1nwvY2mjHKlkkIFvmD6xjA4ztTxqvg2
	hEkA==
X-Gm-Message-State: ALoCoQkHRgBqBDmYUwlbsGSAWlKbK3CB9L5JSpyWl/DJYc5ddA04aR8wKGJLiF+d6EgKjYVHFbTD
X-Received: by 10.224.151.206 with SMTP id d14mr26929698qaw.35.1402931680752; 
	Mon, 16 Jun 2014 08:14:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Mon, 16 Jun 2014 08:14:20 -0700 (PDT)
In-Reply-To: <e79079ad10954af18bad63ad1ab8939ceda7fbac.1402926503.git.liezhi.yang@windriver.com>
References: <cover.1402926503.git.liezhi.yang@windriver.com>
	<e79079ad10954af18bad63ad1ab8939ceda7fbac.1402926503.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jun 2014 16:14:20 +0100
Message-ID: <CAJTo0LbMvPG1N1_vY5eb6MN+AYbgKbJdxbeDqQChbGZ460+jQQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] guile: depends on texinfo-native
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
X-List-Received-Date: Mon, 16 Jun 2014 15:14:42 -0000
Content-Type: text/plain; charset=UTF-8

On 16 June 2014 14:49, Robert Yang <liezhi.yang@windriver.com> wrote:
> +DEPENDS = "libunistring bdwgc gmp libtool libffi texinfo-native"

There's a texinfo class you can inherit, instead of adding the
dependency directly.

Ross

