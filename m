Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id 274727CF8E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 15:03:20 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id d12so4313114edp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VB72/PxIpePB+BbplClzHEglxq7W0XBSWZIBL3k7k0E=;
	b=dZ7YV1TbwH3qz5LVnaA/md0zZut2Ug/JqHc59cmDM34xEYGf46s+o19rdfbFoUHIjE
	/0ZE8UW2mL5w5j5kVgr0GsPrHMK3Rhy2AmgGRjhh7A7gqQn/vpEyatrVKQV57kW0jDFf
	E/peT7XRGu3INtK36DyVZlf84RQUImipLYBsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VB72/PxIpePB+BbplClzHEglxq7W0XBSWZIBL3k7k0E=;
	b=eZAgwd6OiAJYy0AFaGl4Hdf43rJvlXUeT5ocWysIvvt+BqbBWf38+fPuRdlwhETFA3
	QhZj0SSfpbpGmAfDSJJobiFvc9veoKuvh/y2onCttLygQlggInQRrXWnKgqQhbfEvbTp
	k2rFei5OT2xMxU3jSUYms3Fp4eJ8A5FoWdSxOYUFUzso052oOK9WppsVT4r0ffwmc8lS
	ZYMwYhk+c4P2fqNxVKIod9mNoB7Ok7ChA6KwCumRoCU4QOaDZKANrH9k8NZfCM4LSBT4
	NEpMBQYm7TiXGujStBDG7UdCfyv8tGZH00FgejdHNJYW4BDHmM6TtCn7UOH9Dv1aFjQB
	/yiA==
X-Gm-Message-State: APjAAAVdUqzevYTVnO0UJxVPiUbsT3tQMmKFciPBKcU/1Zb6VAuZ2eUT
	f1F+jixck6BkyMT+Fuc0ZzKCpw==
X-Google-Smtp-Source: APXvYqxFjXInmxkSTUf5D+izbXog501iywmJY7P8aubUs2e+THKY1/n+gA9xV2I6U5E+BW2bk+edbg==
X-Received: by 2002:a17:906:4688:: with SMTP id
	a8mr9775565ejr.246.1552316601705; 
	Mon, 11 Mar 2019 08:03:21 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-8115-A47B-CFB7-48B5-2047.dyn6.twc.com.
	[2606:a000:1401:8115:a47b:cfb7:48b5:2047])
	by smtp.gmail.com with ESMTPSA id
	e11sm3116206eja.54.2019.03.11.08.03.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Mar 2019 08:03:20 -0700 (PDT)
Date: Mon, 11 Mar 2019 11:03:17 -0400
From: Tom Rini <trini@konsulko.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190311150317.GX5026@bill-the-cat>
References: <20190310201201.3345-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190310201201.3345-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [sumo][PATCH] busybox: backport fix for issues introduced by CVE-2011-5325.patch
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
X-List-Received-Date: Mon, 11 Mar 2019 15:03:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 10, 2019 at 08:12:01PM +0000, Martin Jansa wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

This also reverts some really odd functionality that can cause projects
to break (I hit this myself and intended to find time to do a
move-busybox-forward patch to sumo) so yes, please!

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

