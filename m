Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SZlPK-0003MQ-Vn
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 18:05:59 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga01.intel.com with ESMTP/TLS/RC4-MD5; 30 May 2012 08:55:37 -0700
Received: by pbbro8 with SMTP id ro8so125235pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 08:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=uL2PeTmWgSe7iToCvEGna2U0YOZaR+ad0HfNPG/HXis=;
	b=AjLfZugcF6+t7zYtJ5iULOmVEk/7M3pN32swo8ULa45/WGYsJUyU0VMbJmQB88dbE9
	zMZ92LFOhLH1ODuFjxBaliiFIYR0CFkXVPCEx1P+B56AgSGVfChNpcShWT9/H3vHjkih
	atPEmM96Ht7RjJEbYLj2P3hRciNAdWaT5tqseO0NeFWv4wlh/8GcoYoS4CXqv6Idl5f2
	1fjQ1IjEjSbyvf3RZ5YB6V0L3TfKC7VGUygSSaJlBAYbx/N8jL1S+4OF2FL0dLSZZqM6
	6dFAMh8VPIhUMXG0qkAayWDJiKnXaQv+9V9D9mv1NN51eMCnAdYS9+03TsxKtxMcDaVn
	LO1w==
Received: by 10.68.240.99 with SMTP id vz3mr50678237pbc.60.1338393336507;
	Wed, 30 May 2012 08:55:36 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id h10sm862448pbh.69.2012.05.30.08.55.34
	(version=SSLv3 cipher=OTHER); Wed, 30 May 2012 08:55:35 -0700 (PDT)
Message-ID: <4FC642FB.2040305@intel.com>
Date: Wed, 30 May 2012 08:55:39 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
X-Gm-Message-State: ALoCoQnFWws5ChQppZHBtyilT0kd4xbDxJk2GmA1TZUKWlUv7xIEjdQhpb9e34QjJpHQG9J712hw
Subject: Re: [PATCH 00/32] denzil pull request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2012 16:05:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2012 02:38 PM, Scott Garman wrote:
> Hello,
>
> This is the first pull request for the oe-core denzil branch, based on
> a set of commits I've been testing from my sgarman/denzil-next branch.
>
> These commits have passed an array of build and runtime tests,
> including the following nightly build:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly/builds/462
>
> a non-gplv3 build:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/70
>
> and a tiny build:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/47
>
> Please give this pull request a few days to receive feedback and ACKs
> from the community.

So far just one Ack from Koen. In the absence of any Nacks I'll be 
asking Richard to merge this tomorrow.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


