Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9150472F45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 09:08:09 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id j90so60851425lfk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=Vbo0PQxyQfuDnRGhkB3SbA56BRiLppl/n7WPyDdHA40=;
	b=k1lQcdiARJR+maNojCxNMkVCGGFbK6XgTSKxXDHZja5FHY37nQNdKJKa8I13O95kKr
	zUMTcj5DZ2jpdgul7oIilJ5WbQ2E/0gwP8Gw62vZ6xUrrJlJsQDqghH8gno4v1/2SPHY
	aCygrUeaJpHsXXE4YfJ3aq9q8i+p0u32zGcAUc8Du+0NsAx+1NcKJ6l7ElOqh6XGvRKD
	ghERSktgcNmetWODQqKCzBpwpPgMnbbt+uZmX0/EZEZg0Fc10prZycat1jpmt9ar8B4i
	oRfjU09BvWuVNnOK9oWWysklCW5YYQjz7Gx3F8qY4OcDkjtk60eZSXqNMtHo5zD1hunK
	2x/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=Vbo0PQxyQfuDnRGhkB3SbA56BRiLppl/n7WPyDdHA40=;
	b=DTMIyZdRBi0oLvP+uFkpTbsqh5HGlTxQc4c59H+2PlY5u8eGqBkw9/HsCY6aezMnal
	ehKxMs6u3hXME6OfH823/a9MjYmTOCB7EIs1Qo3RRqQcZRY7+hzeLmlUZjcbQ8EXcsQx
	PdWMb2vxvD9EDb6mihtcav71YWD9gRB2wT2O33xHROK8w2XUKi0r03gWEJwLafDgw1jd
	Nn3r6nfllwe9/Fa9ry+w7QKro6alGDtAnLKjO2uOBTQMmgPyKTrqTypJSXPjdXp4xkBA
	67fCe2wfrOa3aJKGINCp/FoBsumATxQ3N3u/aT2W9z5lfqLz4DX70KrQrbsmHL/FEP8X
	5rnw==
X-Gm-Message-State: AMke39lFK/fLk6E/UcUKkxFiKr/WnVau70iWRoXX0cZOgBo+ZHfAAToFXKGmJOOrjEGaXw==
X-Received: by 10.46.87.67 with SMTP id r3mr9680250ljd.73.1489396089746;
	Mon, 13 Mar 2017 02:08:09 -0700 (PDT)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	s70sm3529008lfe.32.2017.03.13.02.08.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Mar 2017 02:08:08 -0700 (PDT)
Date: Mon, 13 Mar 2017 10:08:06 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170313090806.dvoav52finvx5bgi@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1489391139.git.liezhi.yang@windriver.com>
	<16e826372adf1760d2f8b884e913451a7ab23b33.1489391139.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <16e826372adf1760d2f8b884e913451a7ab23b33.1489391139.git.liezhi.yang@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [PATCH 1/2] terminal.bbclass: add tools for terminal
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
X-List-Received-Date: Mon, 13 Mar 2017 09:08:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Robert Yang <liezhi.yang@windriver.com> [170313 08:47]:


> +# Tools needed by terminal
> +HOSTTOOLS_NONFATAL += "tmux tmux xfce4-terminal konsole gnome-terminal \
> +    terminology mate-terminal rxvt xterm tmux screen \
> +"

Why are you adding tmxu 3 times?

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

