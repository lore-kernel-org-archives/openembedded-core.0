Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 20E356E934
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 00:51:40 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id k19so3203769igc.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2014 16:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=B4U7FzzyXgQm1Ivxr/Y1Sfuomh4gwXBNI60+mM3P01w=;
	b=B14iQQ9wYrT7+/J4L6Xk2OeNHy4SEMjccoi7JbPuQfGbUlOs1z0pbBaQ5ZgQRj7bTk
	fGwxfsx0KP8izOWDmbRgWfMzGBSlcve8UYIcXI2Ux9B/09w2sMn3HEErgcjUio504ubt
	eTdrv7AHdT0wHmx9GzK9ScuPAFNi2obNiIAO8SWyh1FKkQXd4Et7AownAaVu6TeUDy8I
	aY3kzPekfABvmsx+siZZgazRtdhuS0fZrjO4MS5BqmSpUSddkuki4n4T/d+eS2cWdoLh
	eY/TwB3tgmr0+D5+puIOgdKaKySlrLKxfUvkxQgMtPEsdsJ0Dg3lALj2oSWNMmtxc8lY
	RGUg==
X-Gm-Message-State: ALoCoQloGLYU6JXR1eFHJGkOW/2CGuJCGHkibQNRhJb+ZFU4qHrG8hmH0NV49d2WZy7J7rrYNnfJ
X-Received: by 10.50.18.41 with SMTP id t9mr9554512igd.26.1391388700323;
	Sun, 02 Feb 2014 16:51:40 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id fk5sm24836896igb.9.2014.02.02.16.51.39
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 16:51:39 -0800 (PST)
Message-ID: <52EEE81A.9080906@linaro.org>
Date: Sun, 02 Feb 2014 19:51:38 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1391208456-23049-1-git-send-email-trevor.woerner@linaro.org>	<1391208456-23049-2-git-send-email-trevor.woerner@linaro.org>
	<CAP9ODKrULmq0BdYtPYqug34dReOfqtntFky_W2m4EKjLvVgb4g@mail.gmail.com>
In-Reply-To: <CAP9ODKrULmq0BdYtPYqug34dReOfqtntFky_W2m4EKjLvVgb4g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] scripts: add get_maintainer script
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
X-List-Received-Date: Mon, 03 Feb 2014 00:51:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Otavio,

Thanks for taking a look at my patch.

On 02/02/14 19:23, Otavio Salvador wrote:
> I like to idea and I second this pull request, the only thing I would
> like to see added is the possibility of grabing the maintainers for
> boards from the machine .conf file. This is the way we're using at
> meta-fsl-arm and meta-fsl-arm-extra. What do you think? 

To be honest I don't have much experience with perl, this script is in
perl simply because that's the way it comes to us from the Linux kernel
(although I was able to understand enough of it to be able to make the
changes required so it would fit into this project). I'm quite sure,
with StackOverflow by my side, I'd be more than able to make these
changes :-)

However... the MAINTAINERS syntax[1] does allow for "F", "N", "X", and
"K" clauses, to wit:

	F: Files and directories with wildcard patterns.
	   A trailing slash includes all files and subdirectory files.
	   F:	drivers/net/	all files in and below drivers/net
	   F:	drivers/net/*	all files in drivers/net, but not below
	   F:	*/net/*		all files in "any top level directory"/net
	   One pattern per line.  Multiple F: lines acceptable.
	N: Files and directories with regex patterns.
	   N:	[^a-z]tegra	all files whose path contains the word tegra
	   One pattern per line.  Multiple N: lines acceptable.
	   scripts/get_maintainer.pl has different behavior for files that
	   match F: pattern and matches of N: patterns.  By default,
	   get_maintainer will not look at git log history when an F: pattern
	   match occurs.  When an N: match occurs, git log history is used
	   to also notify the people that have git commit signatures.
	X: Files and directories that are NOT maintained, same rules as F:
	   Files exclusions are tested before file matches.
	   Can be useful for excluding a specific subdirectory, for instance:
	   F:	net/
	   X:	net/ipv6/
	   matches all files in and below net excluding net/ipv6/
	K: Keyword perl extended regex pattern to match content in a
	   patch or file.  For instance:
	   K: of_get_profile
	      matches patches or files that contain "of_get_profile"
	   K: \b(printk|pr_(info|err))\b
	      matches patches or files that contain one or more of the words
	      printk, pr_info or pr_err
	   One regex pattern per line.  Multiple K: lines acceptable.


As you can see, use of these clauses would cover your use case.

What I was hoping for is that this script would be added to the project,
then I could go about creating MAINTAINERS files for the various layers
which would incorporate the information to which you referred above in a
more standard, cross-project way. If you feel strongly about keeping the
maintainers information in these files and this is the only thing
holding up the script's inclusion I'd be happy to make the necessary
modifications. But personally I'd prefer to use the existing MAINTAINERS
syntax instead.

Would moving that information into a standard top-level MAINTAINERS file
suffice? Is there a reason it needs to be in those files (perhaps some
other tool is processing them that couldn't be switched to process a
MAINTAINERS file instead)?

Best regards,
    Trevor


[1] https://www.kernel.org/doc/linux/MAINTAINERS

