Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id B99ED77B50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 07:08:41 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id 99so25461696lfu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7DczEXxMOF8ebSl/gnWS7HXqdxA+/6MSycb+VHPTA68=;
	b=hYi54tJHFKhUHo87pPORYvKzo9ovvFjMAC54EvHxG3twJXF4uB3skwgwwAJEWpBZwj
	nwHOLOka0QKh87yWxcOd6aQNU+Z5ZZ8spwEFndm8WzxyqZ/un0OqYKdi/SR6GBaFDc0A
	RxlhK/c5ad8rpuQCTshdnPfIi6YYIG9i7/DnlQLLDHvgANct1cSTSY69RGqDR+i2hoZU
	S9SS4KJkRy2iyMKvPJTpKKAvGC+3hJ7iHQFPlqURpI7M83VOsPiaBSxhcClZGjvk32bo
	KqW5rgE7djOKHf0W0VoVM7bHeObzhoSHjnRds5Qa29eGxuyDECLS310Mk4bVEOzoTS5I
	FXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7DczEXxMOF8ebSl/gnWS7HXqdxA+/6MSycb+VHPTA68=;
	b=QfqgqPPx6J1l8z6pdzeZrQ310NcTiEbfcLqPqFI3IUY3ifwbHr/7m7nxK2XOZDzVjH
	VZ0Q6sx5cywLfl5ihurJVGSB/AleQuLHxHvl9NWbNx1l3Qmw1lgLPz3KIlxWO2LgR3iy
	8cq4CHgYCOQScduMouuB5hKr/CTLI9i30WJIfUUyi8N+tb31pLQSd9wZsmwYQ23gFXK3
	SXJe8eFdMKSwc7OAGzpcygfh5Q5AKjQYpKcTMaSs4FSTU7RndHMKfbl/SH83MnhmKM2f
	6RTRehWC8wHpFvlB4fPjpP/otKV9YBTW1IdWeDYiLSOn7qJ9DPnGJBLnwpinQvy/IdM1
	oAzg==
X-Gm-Message-State: AODbwcCrwmry26O1pgSHAM08UPYpnQ5GV6x6PH52H1saSaB2PBqOuzJJ
	1zMih5AoDZQpfoi2
X-Received: by 10.25.16.232 with SMTP id 101mr5310917lfq.54.1495436922805;
	Mon, 22 May 2017 00:08:42 -0700 (PDT)
Received: from [10.20.33.141] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	b62sm2443096lfe.39.2017.05.22.00.08.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 May 2017 00:08:41 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1493219031-12843-1-git-send-email-kristian.amlie@mender.io>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <534a1d7c-b787-5e3c-e9fe-829c6585124d@mender.io>
Date: Mon, 22 May 2017 09:08:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1493219031-12843-1-git-send-email-kristian.amlie@mender.io>
Subject: Re: do_image: Adding support for IMAGE_ROOTFS_EXCLUDE_PATH.
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
X-List-Received-Date: Mon, 22 May 2017 07:08:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping. Would be great to get some feedback so I can continue working on this.

--
Kristian

On 26/04/17 17:03, Kristian Amlie wrote:
> This is a direct followup from the earlier f6a064d969f414 commit in wic. It
> works more or less the same way: The variable specifies a list of directories
> relative to the root of the rootfs, and these directories will be excluded from
> the resulting rootfs image. If an entry ends with a slash, only the contents are
> omitted, not the directory itself.
> 
> This is early feedback call, and several things are missing here (see
> below). However, I would like to know if at least the basic approach is
> acceptable. Reviewers pressed on time really only need to look at the topmost
> hunk as well as the last couple of lines of the two functions. Those show what
> the basic idea is.
> 
> What's missing:
> 
> * Documentation
> 
> * Test coverage
> 
> * Respecting IMAGE_ROOTFS_EXCLUDE_PATH is a behavior change, and isn't
>   appropriate for all image creators. In fact, for the the main use case [1] to
>   work it must not always be respected.
> 
> My idea for the last point is that the variable will not be respected by
> default, and each of the pure filesystem image creators (btrfs, ext2/3/4, etc)
> will set a flag that mark their image creator as a "pure filesystem", which
> would respect this variable. Image creators that make partitions, however,
> should not respect it, because they will use wic for that purpose instead, and
> then they need to have access to the entire rootfs. Hence they should not set
> the flag.
> 
> I'm imagining something like this:
> 
>   d.setVarFlag('do_image_%s' % t, 'respect_exclude_path', '1')
> 
> although I'm not sure if that's the best approach (tips are welcome).
> 
> [1] The use case for this feature is the following: We are creating two types of
> images in Mender: One complete partitioned image, and one image containing only
> the rootfs. In order to be able to populate non-rootfs partitions, we want to
> use the regular bitbake recipes for building these components, but then exclude
> certain directories from the rootfs image. Using wic, we are adding those
> directories back into the partitioned image, but under different
> partitions. Unlike the rootfs image, the other partitions are not expected to be
> rebuilt after the first rollout.
> 


