Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id E77527D723
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 13:56:52 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id f4so2026635oib.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 06:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Lq525XsdrKOLe2RfgfCSBzngeIHgiripYU9MLeabpeI=;
	b=KYd+ZYWOGEms4UXCX3jMuPMIFwwoE8KP7qfe6XZBZMmJXfyJUmE31UUswchYi4w/Kc
	en/V5x4rYU5NBSwuMMm+yDgpRWEF1E+soGab8oAsvGBqDIXN8/r/jK/IAYQ1eTmWsMYY
	TaEbfJEhAnKQy5w4KWOFrq/L5MAG+Aa3xZv8G5tIoNTOGKg0FnqiqEOXGQ9u10Q3JSEa
	93tWkT6aWt4AQGvaY9lkMl9tzfLs7Aihhw8u+adhkDucgupcSA21l9OdPBo0ZWud5keW
	a7ti8TJ4B8wWiVtWDwJG+dvBdReZ2PYMt505mRTUTEKAvE4kweTUhpWZRBSAIhhn2gAo
	sgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Lq525XsdrKOLe2RfgfCSBzngeIHgiripYU9MLeabpeI=;
	b=twA35GX54SIorIU/UgpCvL1Xj/eKKACixU/7KoKbdsoQSe1h1NPw1QeFV2vq8BF44R
	5eT0zzcfkRaN5WEVUldbb+hpdsJJ5rI7O2lCAUFFF4gAP9+EgVqytE9t6dXuA3EBrr3x
	7iTQVicpm8grlxGWblHbO75dRrEciOhIj7x86FYn+qIwdQjFTW5JfKNpM//bUaZN7gKt
	idfdNewdPV2MMiPRMbIJjhRjWwUkXfp9SxD4CzNUotN/c7hKZXvAqwcq1ArZXTBA1pTP
	RLp1JYMFFIF2l47Xll6/PDVj5uTEb0zt3K8R24JLYrLDAJAikPMB3XnLQ77HDgvJfBqh
	ZcDw==
X-Gm-Message-State: APjAAAWi0feL8VO8FejKs/Ra60wCaN+Y/pCXVj3GD/BAcWuVx4Co7xf+
	sBCO9S6nbWjlmO5AQxbUv/FRZKbNBe3gcREb1F8=
X-Google-Smtp-Source: APXvYqxIf+VSEyde5qh8dfR15ny6z07qJXYBp7QDmGIV621QODOboKeKubtny9YBokDIdvpI7Yd2K4Zbdy5//a4Lwps=
X-Received: by 2002:aca:d40b:: with SMTP id l11mr14634839oig.132.1557755813979;
	Mon, 13 May 2019 06:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190508135459.84886-1-alex.kanavin@gmail.com>
	<20190508135459.84886-3-alex.kanavin@gmail.com>
	<000386a97aab0dc593e908b4d7f50f1c8a079be9.camel@linuxfoundation.org>
	<CANNYZj8WQasbaiPZnifQ474QMPyNS-YZC3fgqbK7eMZSWCenig@mail.gmail.com>
	<c1411d0a06b8e9778f581247d4fa9fb20859021c.camel@linuxfoundation.org>
In-Reply-To: <c1411d0a06b8e9778f581247d4fa9fb20859021c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 May 2019 15:56:42 +0200
Message-ID: <CANNYZj-g5RMyUwkx9SHgXmOut8VngL70tfW++x9jziYTURZcjA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] webkitgtk: update to 2.24.1
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
X-List-Received-Date: Mon, 13 May 2019 13:56:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 May 2019 at 15:46, <richard.purdie@linuxfoundation.org> wrote:
> I agree it shouldn't be in self hosted which should be more minimal. I
> think we do need a webbrowser image which we test *somewhere* and this
> ties into the discussion we had in the bug triage meeting regarding bug
> 12991.

The problem with the web browser is that webkitgtk is one of the
heaviest things in oe-core to build (in time, RAM and disk space).
Otherwise I would just stick it into core-image-sato, and write
something reasonable for testimage to try doing at runtime. Tips?

Alex

