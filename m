Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 127836C4E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 23:16:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q1so11967227wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 15:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gCESEM6T1cO8DkOzTiy9brKNp+YcKjfxOvZw2EeNuo8=;
	b=A5DAO8Jjv2TqNju2tbFuk39aY/gt5E+QMeV+96ze+MPefnlt9p08snq5zhJ2HTRTTt
	q8lzGbono1msu+LxJYc/VfHiFrr3QrK/HTyn/yWzAhMxD17nOB+XQ2ALRp8LZmp+0S86
	B36T+R9oIP65SKeUN1xicadYEMTXgHWjJT1UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gCESEM6T1cO8DkOzTiy9brKNp+YcKjfxOvZw2EeNuo8=;
	b=CCsbpwpA57S0KC47sQv71m8L4/PAIDK+IXdoBkIyik6TXEukOQ95g/4InmHBlxcIG8
	S+bCOAzMpmlx3FR2sKhYS5DdcMRg7OZLdml5sl0MllFHIea+SJCJhtGtZpzpGj7Y5krL
	gyixgdaEXxHyiphjqXcdhbzm/P7HJ2oBxT2INRkWT5EseIBqcvkrJQ6QXv8UCQgsiL4r
	SJ2WWiE73J0ny9o6TCT9NefbYYOi7ZN9RFBe5V/iNHWe+xR+fS1KSF+0L4OVjJ1ZmiCh
	rlx1Es2joo3VhNcYDAxLXjeUEgKOExaiZINIgkT/VVhC3J0VgqtIt5oqOrS4VIWYqlno
	FtMg==
X-Gm-Message-State: AHQUAuaAFN3ST2dy0zmf8TVJWSwUSHRO3hra2mG3nDLTmA/Ip+VDXZeR
	Jyq1+LQ4ntO7LGgUTgKpZAIitg==
X-Google-Smtp-Source: AHgI3IZdZzoRXX3yCzlO5fNKk/GP1Bs4oS1+w7laFBZQ0oPlJbySwiTSYP7MktTl2RWLW96RmoDRYg==
X-Received: by 2002:a5d:4a89:: with SMTP id o9mr8206683wrq.323.1550272611692; 
	Fri, 15 Feb 2019 15:16:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id d2sm4867678wrs.97.2019.02.15.15.16.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 15 Feb 2019 15:16:50 -0800 (PST)
Message-ID: <76d71f8af98a4ebe6154ff5b7ebb59ccf989408b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 23:16:49 +0000
In-Reply-To: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
References: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Fri, 15 Feb 2019 23:16:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-14 at 21:09 +0000, Alex Kiernan wrote:
> bmap-tools 3.5 was released August 2018 but has no release tarball,
> so
> switch to using the git fetcher. Also pull in the fix for
> StopIteration
> being transformed into RuntimeError for Python 3.7.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

Unfortunately this triggers a selftest failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/236

(ignore the virtgl piece, that is something else)

oe-selftest -r wic.Wic2.test_bmap_short
and
oe-selftest -r wic.Wic2.test_bmap_long 

should reproduce. Might be as simple as a missing RDEPENDS.

Cheers,

Richard

> 
>  .../bmap-tools/{bmap-tools_3.4.bb => bmap-tools_3.5.bb}          | 9
> +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>  rename meta/recipes-support/bmap-tools/{bmap-tools_3.4.bb => bmap-
> tools_3.5.bb} (74%)
> 
> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
> b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> similarity index 74%
> rename from meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
> rename to meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> index 2aae9a3fe0d8..25d66df623a0 100644
> --- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
> +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
> @@ -9,12 +9,13 @@ SECTION = "console/utils"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -SRC_URI = "
> https://github.com/intel/${BPN}/releases/download/v${PV}/${BP}.tgz"
> +SRC_URI = "git://github.com/intel/${BPN}"
>  
> -SRC_URI[md5sum] = "883420183611aa137cbaf68a91ef0d7e"
> -SRC_URI[sha256sum] =
> "0064891270c180c190f41925b0f6fb9cecac3056f1168d2592dbe90e5f226c0a"
> +SRCREV = "db7087b883bf52cbff063ad17a41cc1cbb85104d"
> +S = "${WORKDIR}/git"
> +PV .= "+git${SRCPV}"
>  
> -UPSTREAM_CHECK_URI = "https://github.com/intel/${BPN}/releases"
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>  
>  RDEPENDS_${PN} = "python3-core python3-compression python3-mmap
> python3-setuptools python3-fcntl"
>  
> -- 
> 2.7.4
> 


