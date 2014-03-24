Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 96C5D6E9D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 08:09:58 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id j15so5015943qaq.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 01:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=83oMzYAPc/7IgpzBHtvnwfZWL6J28wxskN37jQHraKQ=;
	b=Rb36U8VTQLj1QAUiZP9ZBuhtZIxSpBkZziqPBTW/t6/94SboYXW4kHw9TgLFgtwvU3
	I1YKQYejqZ5pdFbM6vM403iT1OZekRamU50TDE+FHEkinwXNPnrqwjBENmXFjGSCJ/Y5
	zjDRT3zX7ch+9Hpfi8ljEMKEtq/grZoRcey9NAhFvyNSozK2wMJZcY0JHghKH5qexfD0
	gA7N+HD/gG1MSKuwPF9O7F+GNfM+mtOAufKWQnFNsyyPJjNJapuKZen9m4509Fe1zO1c
	FJrJl5fhUQZc7vx9LZb+gCgbjkDOJTOCNT8leRt1AImt5yRng0a+9UCVp2LonqLknU7L
	Z8sA==
X-Gm-Message-State: ALoCoQlv1ZpRChmuItvL0cx6FQoKEPyaCGCtLwgizeZrpLO64L6CDSsQm7BrFc8qA8BqPrVTQTkX
X-Received: by 10.229.12.197 with SMTP id y5mr397700qcy.22.1395648599337; Mon,
	24 Mar 2014 01:09:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Mon, 24 Mar 2014 01:09:39 -0700 (PDT)
In-Reply-To: <9c06686dc4ccc2576bd8a171ed685ab00eecf84c.1395646642.git.hongxu.jia@windriver.com>
References: <cover.1395646642.git.hongxu.jia@windriver.com>
	<9c06686dc4ccc2576bd8a171ed685ab00eecf84c.1395646642.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Mar 2014 08:09:39 +0000
Message-ID: <CAJTo0LZEQzZYt+G=3OyzKLdceXeKZ2dHD2gDOVEJBD+yhiAc6g@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libsoup-2.4: upgrade to 2.45.92
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
X-List-Received-Date: Mon, 24 Mar 2014 08:10:01 -0000
Content-Type: text/plain; charset=UTF-8

On 24 March 2014 07:40, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> There was a error about mips-gcc optimization while building
> libsoup-2.4 2.45.3 with DEBUG_OPTIMIZATION enabled, the 2.45.92
> have fixed this issue.

.92 means "beta release" in GNOME versioning, so not only is this a
new upstream release (when we've frozen) but it's also not a stable
release.  Please backport the patch instead of upgrading.

Ross

