Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1436461223
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 08:57:31 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id b10so2774902vea.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2013 01:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=kXuhk+/0RjndZWLokFBBmTdXvMLV7n7M9HIC6FiWR7M=;
	b=V2jHtFcCSCUNJfcgoCBn018LmPdUsPZJwZnFsFZ4gFzD0Uf0RzePqfvO8D0wmeZ+LZ
	0+Ixq0xF2lfYgYyeu/KH4lvMQKn9XFp0uLWkaJ/zG9D3MN/3htCU5M6b1ImMzT7rJ+8W
	P/et1Rnh/1nA4jq33ZDZHAR+Z2bl5OTT8yic3rziqUxn0NycoE8CRUUIaIoFjAtD+2ut
	ZiyvawKNCRK4k60hsZGgUb8Umi0hQtXu1iG3mk5HZsm+3kx85j5zrbUwy8McpMm3AWW6
	SlSFyK9grb3+Lc/4KsL7oEm830LkkJUpKU49EbrNMZG5EkcpM1dlWgC91ItpXgk9uSIy
	8/mA==
X-Received: by 10.58.219.232 with SMTP id pr8mr5468077vec.80.1375693052401;
	Mon, 05 Aug 2013 01:57:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 5 Aug 2013 01:57:12 -0700 (PDT)
In-Reply-To: <1375679521-16328-1-git-send-email-sgw@linux.intel.com>
References: <1375679521-16328-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Aug 2013 09:57:12 +0100
Message-ID: <CAJTo0LaW4bR325d=PGiWz9OfkS-xugbp4E0dQRm0nXCZ3j9Evg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkr+loombRYzDw+tXDSWJMDizKyYpwTKLZjorB/yM1jPEjZc6docAmAg/iKmoLk1rQ09RoD
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] libpng: remove two un-necessary binaries
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
X-List-Received-Date: Mon, 05 Aug 2013 08:57:32 -0000
Content-Type: text/plain; charset=UTF-8

On 5 August 2013 06:12, Saul Wold <sgw@linux.intel.com> wrote:
> +       rm ${D}${bindir}/png-fix-itxt ${D}${bindir}/pngfix

These tools could be useful, can we make a libpng-tools package or
something similar for the contents of $bindir?

Ross

