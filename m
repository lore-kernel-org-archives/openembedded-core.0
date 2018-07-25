Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 664AF60801
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 20:08:50 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id k12-v6so16129854oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WX3sQnOI4cFrQmTqG438FG3ed4gSSa3Cm69iphoYEPY=;
	b=Hifgrg89YtNdZ+BXzw9UxcAxbQ7tZHq1DH9bLdRzWd9gu/CBjtfYlToHchI9eaLKsp
	KMW13YqgwstAHwHGIl+04sn4IBPYOICop4R+tasc/MhBQdr1U8vhzgnGqNIZH7OXxwqi
	kaCjaL0EtWuUw+eMPBuCqzGK6J8VIWdC4zvKtHBNtvvdx/xG34/lyhDaDqFcvoOfHo4e
	NDbaLshAwhgoQp6xYu2J4r09vMgB5uNSx/BOWaic1cqHvE5igyPEk9gkx5ZrdMT7kjHl
	UQgWokhroH2ykjKbIg1DkjMvjrt41vbaB3N21LhnOafFUfVAG0dE6xj+WswL/o/twVMF
	96XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WX3sQnOI4cFrQmTqG438FG3ed4gSSa3Cm69iphoYEPY=;
	b=VFrXDLFj6Doxpuk21tD+CdWMThp85j/dHipsUrr54Q6uCLL1Uk0frDK+A2UDLb/2ub
	aplI5p9qcP0XyjYIDMXzU4KgfxoXcn6rBeGUBKyP1XXbRzN42wLDrQ+7Y6oRI8tj42Hr
	VCkXk5j+S2mj/2jLyOnKnAdnnBJhCpoawtuugvKH5qMuoTMevGsDMrM7J2XyU2+FlYGK
	QKdycTBnxy/iivcSm3WSjBwuZeineazaptntbf7yD83hPypmT1erqstvCHMVagbZrU55
	bfSNXzLNZEce40FIsnutSKrZ1bN31IS3n0fm1JGTAI9vBbVwScMh2uOlK65vvl9kw8pQ
	r6BA==
X-Gm-Message-State: AOUpUlGx0rM2B87LkXOJn9OEEcOzAPtxBkIoakn5FxCEBLw4sySqUjEm
	Ebg/lk+eVHFXeB8TR8NnT2FoNOC31TWyR/3zqsf/MZ1u
X-Google-Smtp-Source: AAOMgpeoT/gvi1uZ/fIEzmEEl0mQL17PhRNlMl9CSuBZUNU0ryPSkXUCFGU1xNt5bd2CZ5htGwBrKO0/78hPAwridEY=
X-Received: by 2002:aca:e185:: with SMTP id
	y127-v6mr4973724oig.245.1532549331438; 
	Wed, 25 Jul 2018 13:08:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 13:08:30
	-0700 (PDT)
In-Reply-To: <20180721162715.12611-3-raj.khem@gmail.com>
References: <20180721162715.12611-1-raj.khem@gmail.com>
	<20180721162715.12611-3-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2018 21:08:30 +0100
Message-ID: <CAJTo0LbU0UhP6OzHJwJQBcFXw+y3+9f+1BxFiQX3FCbotxOtFQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] libsdl2: Find wayland-protocol files in proper location during cross compile
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
X-List-Received-Date: Wed, 25 Jul 2018 20:08:50 -0000
Content-Type: text/plain; charset="UTF-8"

On 21 July 2018 at 17:27, Khem Raj <raj.khem@gmail.com> wrote:
> +pkgconfig would return an absolute path in /usr/share/wayland-protocols
> +for the pkgdatadir value, which is not suitable for cross-compiling.

For reference this is due to pkgconf (not pkgconfig) having different
behaviour compared to pkgconfig, which is breaking recipes.
Personally I consider this a bug in pkgconf and there are bugs
upstream (and new releases) which may solve it directly instead of
having to fix every user of Weston (which isn't the only user of this
pattern).

Ross

