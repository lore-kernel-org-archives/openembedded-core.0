Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id E2F9F7E6BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 00:13:36 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id x187so5729271ybc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 17:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PCL4O370u7acAHpoliPN4Z6bylJ6kN8hVxP9Innk2H8=;
	b=S1WPu1hupFv4pG3HAjPbcSTKA9jmdr5krhmM+ifWvbBERUWTy81w/akOhEJk38R8Se
	gohtWsmM+aLvO0WJ5f36UdMQR+B4Ry9rZG3lktNF3HPqpNqB7k8+YaU7TBg0NktWF9tK
	A47H152gmb8JU0q/EbBghrILF/qlNicAT4aEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PCL4O370u7acAHpoliPN4Z6bylJ6kN8hVxP9Innk2H8=;
	b=knF8gE6yy8IldLF8rzGj0boilaYManp6onHWC5eufUwcZQOtfdopTa0x0VIX0K343c
	99jcONBrdTEqKP7F4YzlZv+VFhVmEZGhWsjxGbdsEp6ZopKo++poI1efvEdfGzqLBBVk
	QyITsTLB5yXZj3b9Lbg/cofFLi6mX4Ym/L/RgwWpoVZsJoOoSqGNWdhpCFC3JmKpq5zR
	C8DRXN5FOXf7SwwhpHg5YAESFUG+AvzI8AGKAvw9o/prMB7VVy9p66g+2UnGJ4P/ZG4K
	OWWOJiVNBqMAxpVtEpRMZxQk7LztZPhYv7br3OwRZUFiC+q87XtHLg5mwj8EvYtXfqkx
	0DGg==
X-Gm-Message-State: APjAAAV4XzsiLEo8RQlvgd/0WeFP4xEfb9LaC4Aa0UpUwEFiSSh18wT1
	HPKPnPigbOEZ8FdQ5W8G6ij35L9e3gYCWg==
X-Google-Smtp-Source: APXvYqxE2ulBX2IKatx+QgPWz0X12QrZ4DXuMNrDA7clrjRb47RN7KYlEUHlO8tWc223HG3IgkRScQ==
X-Received: by 2002:a25:8e05:: with SMTP id p5mr24900908ybl.96.1560298417359; 
	Tue, 11 Jun 2019 17:13:37 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82DE-1DD5-268A-2EEA-9945.dyn6.twc.com.
	[2606:a000:1401:82de:1dd5:268a:2eea:9945])
	by smtp.gmail.com with ESMTPSA id f9sm2540007ywb.36.2019.06.11.17.13.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jun 2019 17:13:36 -0700 (PDT)
Date: Tue, 11 Jun 2019 20:13:34 -0400
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190612001334.GM7115@bill-the-cat>
References: <1560298258-21454-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1560298258-21454-1-git-send-email-trini@konsulko.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] vim: Update to 8.1.1518 to fix CVE-2019-12735
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
X-List-Received-Date: Wed, 12 Jun 2019 00:13:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2019 at 08:10:58PM -0400, Tom Rini wrote:

> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  meta/recipes-support/vim/vim-tiny_8.1.1240.bb | 12 ------------
>  meta/recipes-support/vim/vim-tiny_8.1.1518.bb | 12 ++++++++++++
>  meta/recipes-support/vim/vim.inc              |  2 +-
>  meta/recipes-support/vim/vim_8.1.1240.bb      | 10 ----------
>  meta/recipes-support/vim/vim_8.1.1518.bb      | 10 ++++++++++
>  5 files changed, 23 insertions(+), 23 deletions(-)
>  delete mode 100644 meta/recipes-support/vim/vim-tiny_8.1.1240.bb
>  create mode 100644 meta/recipes-support/vim/vim-tiny_8.1.1518.bb
>  delete mode 100644 meta/recipes-support/vim/vim_8.1.1240.bb
>  create mode 100644 meta/recipes-support/vim/vim_8.1.1518.bb

Note that for warrior, if desired we can simply cherry-pick
https://github.com/vim/vim/commit/53575521406739cf20bbe4e384d88e7dca11f040
to resolve the CVE in question.

-- 
Tom

