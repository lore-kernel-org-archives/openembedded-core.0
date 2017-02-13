Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id A59E760291
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 18:17:14 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id t8so65907688vke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eUXS+TFh+zpz7TtA6pCcOUm8bR43vF0zn1apwsRbnNQ=;
	b=DBJqTD9n2Kv4bdak3X7MWwlnCnYeu5h/RJTqKWmj1FmMPaSKRSg+pc1oFlO5FSf6F1
	rusizxoiSFb82tlWtp0ouMQnCENjZlegys/PSepHnKwzpyUF9zCrtTj0qwdh7MAlptak
	k1gRn5gP9WVSoAtHJonONqgxMl5+K0gpQ5/OPQt295WsYHWUvA2zeJiWk+CQm4Y1G/4G
	WJWKAsSmdjpWSOeGWC7jB06ADH4tgWtaz/ymOywiVmewXaJyseHOnGSWTLS2LNwhXYfY
	lsmz++TrCtzw65GbuuLi7W8kQEtI9DF9ZupZ/ijUTmgTpGiZ3qKx82gd2qhjnT/T1Ohq
	9vbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eUXS+TFh+zpz7TtA6pCcOUm8bR43vF0zn1apwsRbnNQ=;
	b=rTWy3eUPzQVeq2Dklkku59sVqdEmnjDGV7haGKaj3YwyED6D2l2dWXr0UtfBaut1yM
	XsWyMtUnN5OvWFqPgG/Skd0G7o4RHIy4u+9WynAZth+Cw4EpWY7hknhwWzJtuoLh3Jgk
	xqPjsjnxZ9PIyLwICrOR+xS4bi0v1VNmhwRZJTXKraGtgr9hPrnm0J9RXepAPQ5C5p02
	kxe9uaKH4RZBDQx1/DNljG01bm3yD53JBlfv3+E4eVxifCarpvrqW8KOJ1RUpJIyZ6vy
	LLCU6Mdkrdej/Zmw2h89y4eO5bps01iky0dcPVVSrtTY1NuIbh4cxNkQon8dBj65SIOM
	zr8Q==
X-Gm-Message-State: AMke39lftDzzLRhy4qCqFKxA3TJnssHP7rKLYLjnTLl3KESS4/M1KzqAFTAml8Gs4UHgjfEceGmJpCYWwKSPVw==
X-Received: by 10.31.8.147 with SMTP id 141mr12097822vki.111.1487009834542;
	Mon, 13 Feb 2017 10:17:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Mon, 13 Feb 2017 10:17:14 -0800 (PST)
In-Reply-To: <1487009117.27753.14.camel@linuxfoundation.org>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
	<1486999455.13854.241.camel@intel.com>
	<CALbNGRQns-G9XOtS8wGetnAAYVv7Z+F+2h3rLQ2XxgSiSBwHWQ@mail.gmail.com>
	<1487009117.27753.14.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 13 Feb 2017 19:17:14 +0100
Message-ID: <CALbNGRSg9p-MPjjmR4g5VDgfRTWONyuF5_s+t2G=o2wLxsVgXQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 18:17:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 13, 2017 at 7:05 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> To be clear, you can't depend on the build dependencies of some other
> recipe to be available to your recipe just because you DEPEND on it.
>
Yes I expected that my fault. Together with my hack on sysroot
alignments I think this is the end of kf5-kde in meta-qt5-extra.

Andreas

