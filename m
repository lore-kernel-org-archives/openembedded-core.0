Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4D26D3A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 21:17:14 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id n71so12998501ota.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 13:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gCKl2V4xtKeJZGO9heQAqk9ESnvbDjhybmrNcLHSiZg=;
	b=Ti6tBt4bEouNHaeYkhulKZs4nytojfWlNOpoaB3VHk3Pul0tyCtOcJTrvcHh410qfO
	NbR/QRkKjCiQGyFC6UsLMi57KwmxDkhUuEE6xY/tDHfmTVUukCTR5zIkb+ho0LRUhkk0
	Irwnas9qw2SrW4yDEFzF3ay6Hxzpp+d8eSo3wNVPyAxqnmwKyOwHiu1z+9yochw4nPNR
	bjDIE8WWvsKbGBZxwd9HUZ4i5TN9C9wIuIEI0xDhmyJg/7MzhEkUruoSEJ9tGPrQ8F69
	ccIcjRG0+TIv09NAUcddwH0sJ/vwC8txDMbGMwP5N91v2Z+3cvmaHf4Z9RbJPrq83Oem
	hmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gCKl2V4xtKeJZGO9heQAqk9ESnvbDjhybmrNcLHSiZg=;
	b=UJ1GdEpvbUPwLx0wzf9VRum+CH7eR49YDP3RHqpwjCaOB/JD79S38YEECOgr4ZF7qS
	wNabNu/be0OSqzkC8elyRqazHpBtI1Pr8SVUEG1eHSG87gzVshQOfrMfzvqQF51hz5gN
	kMDmHbSdFu7op1bDKD7L7r0YivhbacvVlEEfGhIuMq6sCw5927HQKWBLVoDbvrm4nLG6
	cs2WHKGzXzczyS8uCE726iys8E50utBym2BpJAVT7QAgyKOgeUCRKCp53zclQVIX7HaJ
	jxhT+xbEEYKqLfQhE+z2dQ9gHnUV5O6iLE1vnBpV4b8To5O6m+UzSRw2GQf7y6jaZ1S3
	pT/Q==
X-Gm-Message-State: AHQUAuY9n2QIaOvyeyP7BXx2zNnSpZ8NtdtFp5lwTuCgAA3duGdmd4ne
	IhtFOsqTP2ek0f8RCPGeLV/5ckdzvxTiydaYcz4=
X-Google-Smtp-Source: AHgI3IZqMKL2RJdA7aVo+nESgaPQUByv3VUNFHZioIdOzRg3Io2yFNdkTGbd3GbCG5ZbGBLuobVPBa8Z9+BGJofCNxA=
X-Received: by 2002:aca:4d49:: with SMTP id a70mr3780403oib.135.1550179033818; 
	Thu, 14 Feb 2019 13:17:13 -0800 (PST)
MIME-Version: 1.0
References: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
In-Reply-To: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Feb 2019 22:17:01 +0100
Message-ID: <CANNYZj-7Qe3-NwsBZKtmP9iyqsvQm5QP6gQzf9YU_-XYYs5_yQ@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Thu, 14 Feb 2019 21:17:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Feb 2019 at 22:10, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> +PV .= "+git${SRCPV}"

This is unnecessary and adds clutter. Just the plain version number is enough.

Alex

