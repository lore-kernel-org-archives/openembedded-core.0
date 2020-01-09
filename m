Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B80217FEFD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 22:15:26 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id w5so3019874wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 14:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=y7LwTqKjRm35EYc2ZQqa3d07kR7vMcTfzsw8DVXPBYA=;
	b=UQnCTNFNv7AHwMZ/zXMW8LklNIDueSaVkaamAC8VO5CXNFdozcmmR5LpGA+OT7z2es
	9NPVyGToW42K9F2yoKEbxGvdWOBJko8hHlu/QtxytCjzkZv3TguKGQeadEu0k/DItGT/
	SsJgFWSvMz31gYexA9Typi4mQ9T+wOyBtz0SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=y7LwTqKjRm35EYc2ZQqa3d07kR7vMcTfzsw8DVXPBYA=;
	b=FvdGTeaOXQUjAZMf/tvc8woLwseJLyP0SmAQRwFa1vsP2NChuKfRDf3ImAuFoOHtbg
	UMFDYZoEBrslDIy1OzAcCFuKHJYzSLhFKop/10vJLaUVtrIVMylQJshoWRNpjf1yLeJ6
	xYizUe/JPI91UHbhDs+YRiHNLBooNrBW97Yo3D3h+lk8CnXot1Vxtsn66ZLu3HV6HfMv
	Hvv8Plmf0SKa5ayWfAOl1Y3gSRotP0dh5LHLWD8gMvWTFvnyQaiZpKUFzhuaQgHYfnYX
	z2/EKlmmDyx4LCS2lySqRtit0QbD76JEHIKweaDuFQMX8g5PzGgQVeY+DrIjlY5cQXQk
	q0pQ==
X-Gm-Message-State: APjAAAWeDkXmsbSI//dDF5f+KxK682LOCzdCspy2HvE717tUgdtW22VL
	5S3IC+fU3aoKTdtpWWjnaE6qjg==
X-Google-Smtp-Source: APXvYqwOOWCKUao5Ladm97PBtSaIKbojnTlqsByRJdpCXymqigIB0+H92bHxbNJw7HaZHyY69YBTWQ==
X-Received: by 2002:a1c:2187:: with SMTP id h129mr177233wmh.44.1578608127444; 
	Thu, 09 Jan 2020 14:15:27 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r15sm4208539wmh.21.2020.01.09.14.15.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 14:15:26 -0800 (PST)
Message-ID: <083170de5cdb826ab20f4384270b1f9553692e62.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Jan 2020 22:15:25 +0000
In-Reply-To: <20200109202623.28936-5-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
	<20200109202623.28936-5-schnitzeltony@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 04/11] bitbake.conf: add variables 'mimedir' and 'desktopdir'
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
X-List-Received-Date: Thu, 09 Jan 2020 22:15:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-01-09 at 21:26 +0100, Andreas Müller wrote:
> mimedir:
>    This is the path all mime information is stored at and
>    update-mime-database works with
> desktopdir:
>    All application .desktop files are stored here
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  meta/conf/bitbake.conf | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 263d8aea4f..6fb4072f1b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -34,6 +34,8 @@ export datadir = "${prefix}/share"
>  export infodir = "${datadir}/info"
>  export mandir = "${datadir}/man"
>  export docdir = "${datadir}/doc"
> +export mimedir = "${datadir}/mime"
> +export desktopdir = "${datadir}/applications"

Do these really need to be exported to the environment for everything?

Cheers,

Richard


