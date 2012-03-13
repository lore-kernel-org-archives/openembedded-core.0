Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7KRh-0001zC-Fv
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 06:38:53 +0100
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 12 Mar 2012 22:30:07 -0700
Received: by yenl4 with SMTP id l4so168128yen.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 22:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=l+dThm3oK/t2/f1xYdhm5w8U7NuhGFPIABT+ELr9z9U=;
	b=OW6BPV9Tn6vQg53neUMlp9yAt5C5vzYoO1OzjffR855KZe/EZsxzNNGRKFdsVMwlmh
	Uy9vTnFq5tuDFuJAr3BPPgX3XhH/4nBu6YDdkX1L72QuceBhSNheuJnFOxSBt0Ist/rs
	9Paa6eGcCxfDrolTXH08D7CvVDpAmY96ZRv4oehWwQx+YsF5P+PtmDM2NgkCALhc1Egj
	XGi7aOwNsUzeLgoQ9dwnx7IUPhwRa1rmLwUdaN2+P8pv9wYj3cCajB6Kkjp1trkbMbaU
	xSWAv5FAWXp0nsETUrp65TOF3Akpqx/qBUv0hbjNLyrspeSJdM6tgWMf+HXsTF+ZPekY
	4l5Q==
Received: by 10.182.1.2 with SMTP id 2mr3609999obi.58.1331616606044;
	Mon, 12 Mar 2012 22:30:06 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id a18sm24430038obu.15.2012.03.12.22.30.04
	(version=SSLv3 cipher=OTHER); Mon, 12 Mar 2012 22:30:05 -0700 (PDT)
Message-ID: <4F5EDB63.9060403@intel.com>
Date: Mon, 12 Mar 2012 22:30:11 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331604310.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331604310.git.scott.a.garman@intel.com>
X-Gm-Message-State: ALoCoQkDo+B2BZVsYR21QMV+BPxEdMrBt+SgVwAXVMvNmOjVdn+6nN/NMruXJ7OhsN5osxaV2vUn
Subject: Re: [PATCH 0/3] ncurses library location fix
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
X-List-Received-Date: Tue, 13 Mar 2012 05:38:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2012 07:08 PM, Scott Garman wrote:
> Hello,
>
> This pull request improves the way ncurses libraries are installed,
> moving only libncurses, libncursesw, and libtinfo soname libs into
> base_libdir, and leaving everything else in libdir. This is how
> ncurses is packaged on my Ubuntu host, and doing things this way
> fixes bug #2070 so ncurses will work within python again. It is
> also a partial bugfix for bug #1937.

I'll add that I've build-tested this on all five of our qemu 
architectures, and runtime tested the python curses fix on qemux86-64.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


