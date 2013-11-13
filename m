Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3C96D7D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 12:34:27 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id jy13so234525veb.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 04:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hPdo2Tfl5CbCaTq//WrBr3XdvH5zx6ThAVlH0NmJeJI=;
	b=Gj3GXxQJRwtnChrclM+ipnng4rdDHONnkszhR34LN6nULzo24otOedg+YVLKBtpHU+
	vI4B41Lrkd8nepwQk/k7mueUo9PXK8S2GmKEwkX6HgTJpOj2HppoQD7A9VU+CrOwQjwq
	tfFsyxM5v3T7rERar1RSKmaBSgmNGKD5OAzWSfIoAsHKOcYOwZfA3AlqfGxstJ/Q9bS5
	k/nU9vjR3fLzNOrvO6IThgsF6G9eCLAhMlxTqZqLxaRSnZIOdL3qLAqvYHwPfqM50+m7
	WTWmLz61euyxWTuAMM7/lQwvH6VhEPb8XQ9wIQOuAU7S9gemj0ioZV+kIH88pa/aAThb
	04VA==
X-Gm-Message-State: ALoCoQlZEQmB2dE20t0w5WLexIXoydvLh7WKkZeNrEAsoZViS8dNWtKI4wOrKXZqE9todG0dq6jU
X-Received: by 10.52.165.131 with SMTP id yy3mr12040139vdb.25.1384346068853;
	Wed, 13 Nov 2013 04:34:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 13 Nov 2013 04:34:08 -0800 (PST)
In-Reply-To: <1384342720.12863.10.camel@phil-desktop.brightsign>
References: <1384337335-32231-1-git-send-email-hongbo.zhong@windriver.com>
	<1384337335-32231-2-git-send-email-hongbo.zhong@windriver.com>
	<1384342720.12863.10.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Nov 2013 12:34:08 +0000
Message-ID: <CAJTo0LZFOyfK84xnA8HhV=UJD23hPhhX0DFJ=t_TvYkGymKZHQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bluez4: Install simple-agent utility for pairing bluetooth devices
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
X-List-Received-Date: Wed, 13 Nov 2013 12:34:28 -0000
Content-Type: text/plain; charset=UTF-8

On 13 November 2013 11:38, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2013-11-13 at 18:08 +0800, Zhong Hongbo wrote:
>> From: Zhong Hongbo <hongbo.zhong@windriver.com>
>>
>> Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> [...]
>>       install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
>> +     install -m 0755 ${S}/test/simple-agent ${D}/${bindir}/simple-agent
>
> What does simple-agent actually do?  Is it generally enough useful that
> it should be installed unconditionally?

It's a dumb agent for responding to incoming pairing requests, as it
works interactively from a terminal it's purely for testing purposes.
I'd prefer to see it (and probably more utilities) installed in
bluez4-tests as it's not generally useful.

Ross

