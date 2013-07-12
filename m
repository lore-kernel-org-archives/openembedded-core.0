Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8646D60289
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 12:40:04 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id db10so8021871veb.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 05:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=7K7KPMtUVVNl4wjw1YtJfuEOmkImg5aCIQS/w6fVmNo=;
	b=B0yVSoErD1qk601b5P14VQAb1CDG3Vk42vzxL9s7UUPoIKeMZJni7C5gfVaPASFb6e
	xpm3EyhvoF3y501hzcdETb4PWaPi5u9yMiLXkXCVSl6I+t7FUFAo3EHxiF4Rgk1L/bQR
	G+ACKRV5d00JySBjOmM4lYzsHoUfJkzn7c0S0oQei824kZAvAwt6QtO6tUhQBxBUonN9
	I4sdID5yUUoNHiOT5D9MkyDnyhAer1t4BVZheQfkRrOsiIDuy4alcRTMETr0ka8VN2D2
	7fP8z67EsQMI61jJkjDuqLzJWiUJtWzMTChwdqE5DY+RsQbUWziXAbLLbOBR0uMHxM4c
	GpVA==
X-Received: by 10.52.164.227 with SMTP id yt3mr20501535vdb.107.1373632804684; 
	Fri, 12 Jul 2013 05:40:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 12 Jul 2013 05:39:44 -0700 (PDT)
In-Reply-To: <fb33ec7730da4eec3aeb2a73295a851ed15af941.1373443071.git.hongxu.jia@windriver.com>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
	<fb33ec7730da4eec3aeb2a73295a851ed15af941.1373443071.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2013 13:39:44 +0100
Message-ID: <CAJTo0Lbm2aLC9fV1hwO4yQPsDpr-5GSc+-K7Y6BnHFHEX+1Z1A@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQnNVLsTuKXZbOa4cqrklWUIzfTGNJdY19slmDlR5sJO6/19kzV4O2YejrKDDxMp2QixHIY/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] nss: create checksum files for the nss libraries
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
X-List-Received-Date: Fri, 12 Jul 2013 12:40:04 -0000
Content-Type: text/plain; charset=UTF-8

On 10 July 2013 09:03, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Add checksum files required for the NSS softoken to operate in FIPS 140 mode.
> The shlibsign is invoked to sign the libraries, and it is built for the target
> architecture and doesn't support cross-compiling so far.
>
> Invoke shlibsign at target's first boot time to generate checksum files.

As NSS depends on nss-native, can't you use that?  The bug you link to
implies that's what someone else has done when building NSS for iOS.

Ross

