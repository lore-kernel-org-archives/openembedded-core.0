Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 05A146C190
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 11:17:02 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id u19so8554103ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 03:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tiVQb3RbAoD3OHSVKLua28A+kIs2VaKg26pW1Qtnmo0=;
	b=heBRytOOLMXUJ4EI3O3g+SwVkP2I6vzNiCruLI4eU65Iv2yrfVHlFsh9TuWS+lfwCQ
	ZHqsGE14bsWsXNHxv4MmjAy34DJZqZidKn4RRyv6sLajJ6IYfkq3kXJZg6gU6OFkbKmG
	23AgYP3xKWBGyv1kEov/f5km3G4v3SesxIDQpK2QoL10pxzSyAbvp5+H8hFlWP18DFEH
	aKjoNkbk5FHbEnawB86/MTsRC1e1rDSUzlqTNoSeTpP1dwbfwwxuxJKBdJ4gCsFriIKJ
	WBcEg9ZdtEZdrIra1yyr8OGc+hP+6UmPo98DYCMJVKxocAcZcXW3TYBr3oDaY+UuPBot
	m3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tiVQb3RbAoD3OHSVKLua28A+kIs2VaKg26pW1Qtnmo0=;
	b=JkKK2s8vnATffEmIkMDgJX6iuoyrhKt9aZOlgF4xCez/BtndQE/J5rlxfuw1YcUwYR
	7Wmo+GPcCd8sH3gg/usOLqrUlox70WP2VRHpu5IIC9Ta5EzUUp30cCThhx5TPsugEfdO
	QT2vAai7LfpQcgBmA+1Ls+OjY2n67cQH6bR7/OKT5oxCGDiP+IZcN4brF3pVgf/L3tAU
	JviA/wk5SdHiROA+h0+hMbH5n9OSR9XuhXcp89yrV/XwVUB5+o0C3PMWfLUi+hd5Dhm3
	XM8kwL0AFTV2D45yKykAaN0mGwYAnPu9ketP+Cq544NxTET3XYEYyz8xdDuOX4AlyLKk
	EHXw==
X-Gm-Message-State: AA+aEWZom3FRZNMSvOkaD9IHi9ivISbqeKHfCG+aA22pxZB3Zfy8PRcm
	QcvVXasFMaI2dUHwC8Xx09Z258Hxa8DxkyWvFOPS7w==
X-Google-Smtp-Source: AFSGD/VBFeHJALF5jPHLzYIQnhhz1tHxJ8sqAVhXaMDVoWzS9166VEnlqgNQcIeNJhvhGt67RowNodRS6wSybcsglX4=
X-Received: by 2002:a6b:fb19:: with SMTP id
	h25-v6mr9949075iog.270.1542971824028; 
	Fri, 23 Nov 2018 03:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20181122014831.46298-1-changhyeok.bae@gmail.com>
	<20181122014831.46298-3-changhyeok.bae@gmail.com>
In-Reply-To: <20181122014831.46298-3-changhyeok.bae@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Nov 2018 11:16:53 +0000
Message-ID: <CAJTo0Lai5VN4XA=__YvN44bMap7ZZdfZNYdRPovonW8rYVCqvw@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] iptables: 1.6.2 -> 1.8.2
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
X-List-Received-Date: Fri, 23 Nov 2018 11:17:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Nov 2018 at 01:49, Changhyeok Bae <changhyeok.bae@gmail.com> wrote:
>  .../iptables/{iptables_1.6.2.bb => iptables_1.8.2.bb}         | 4 ++--

Fails with security flags enabled:

| ../../iptables-1.8.2/extensions/libipt_icmp.c: In function 'type_xlate_print':
| ../../iptables-1.8.2/extensions/libipt_icmp.c:239:5: error: format
not a string literal and no format arguments [-Werror=format-security]
|      xt_xlate_add(xl, icmp_codes[i].name);
|      ^~~~~~~~~~~~

Ross

