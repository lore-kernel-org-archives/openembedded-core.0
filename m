Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7E54174831
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 22:49:29 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id j186-v6so6271869ita.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 15:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0LlXicsVSfWjHHTGt2oZakjBwsncZSv/0FlSl9luDuY=;
	b=0gRDHZ7Ok30oHSEZ3elcW0YhOG/fEhyNhTiQTitwZxWlC9xSuU4jYEwgEZXgYX0EiO
	8xp9nwYMlSNOIIlLrCS2xC8Zbfc3bUWjvmetSDbm+hpJi6mV34Hm8KF8MjXO9zF/M5J3
	gPt2wTCYrWDTKx6xuo3OUZd39MR1l9/aEASgu3iz0uLDxmqLe9rW1iG/IBWeHxpKpP7h
	TJ+ypCXz+wptaum1GHK5m66V/+po+YzD7OGMvKXzyOCf+FYUxw+lDMnHRJWAMUEL6RJq
	4Fj4VVoN0cQlfh6Lxez8EhXX2PPlP/xmUirj4Ze0rzMY1kXlfj5ry2PcdXGwS5sxvley
	bvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0LlXicsVSfWjHHTGt2oZakjBwsncZSv/0FlSl9luDuY=;
	b=bcbpeB5E0J+Xb+25BM9uDIfEjKifQVdRRvPVPHKqel38HPLi488hBnTrLu8bNxWkdZ
	Iq8TXTyMNpPQtAOAo9vrkovhEpisWuZESz+0he134zB0QPvqbE4q0w16x5V3aR7M1bSY
	mnGGseKdqBfDDIRrAdP1FgqJewsesNZLK6i/RyE++A0n8AH0UIXKtiqyIi4XQSpWtiWQ
	+v0/zFWjlEvhSQTzTdSB2CEvWKaWd/gpakvH5FCbKeyyfPf9yZ4XKEzLeePVN3qoqUNT
	0nTsCY3XrtR9ixuO6unIsWsAMrLXdf7gA/MTABvWcrKlpUpTrI/9h5WqaAscwOZSKOUy
	po4g==
X-Gm-Message-State: ALKqPwcuYHfPmzPnTHn7CAwRRj8+Pu6WTlMcjUIS3Ry8JwWhq/zBJId8
	GqZq+3GhxS4+lHi8aKlX2GAP//NAgQ3BpMXdo5zhiA==
X-Google-Smtp-Source: AB8JxZo5WCgbh09pUk+5Rb3ZeZzLvDPP6yLcs/47CUBVrCzV6f3ISoPafRPBLHpDlBdV0VTP1G7eKtgOzoaO/gPEExg=
X-Received: by 2002:a24:3a0a:: with SMTP id m10-v6mr296133itm.45.1526510970222;
	Wed, 16 May 2018 15:49:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Wed, 16 May 2018 15:49:09 -0700 (PDT)
In-Reply-To: <d2492e4a-0dab-21fc-8502-6bc1e19a34f3@denx.de>
References: <20180516201415.8002-1-marex@denx.de>
	<CAP9ODKrXkwobok9O9RsebrZ7eOQze_t_fL5KqXCcDvkk9B3DRQ@mail.gmail.com>
	<d2492e4a-0dab-21fc-8502-6bc1e19a34f3@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 May 2018 23:49:09 +0100
Message-ID: <CAJTo0LZqvWUgL1vj0dn7Ez0YUoS6iwG-bPEp5+gkopnDtitcKA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.05 release
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
X-List-Received-Date: Wed, 16 May 2018 22:49:29 -0000
Content-Type: text/plain; charset="UTF-8"

I was informed yesterday that AUH had just started, so you should be
getting an email shortly...

On 16 May 2018 at 23:37, Marek Vasut <marex@denx.de> wrote:
> On 05/17/2018 12:00 AM, Otavio Salvador wrote:
>> On Wed, May 16, 2018 at 5:14 PM, Marek Vasut <marex@denx.de> wrote:
>>> This upgrades the U-Boot from 2018.03 to 2018.05 release.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> Cc: Ross Burton <ross.burton@intel.com>
>>
>> Nice work :-)
>
> Except this kind of patch could (read should) be generated automatically
> by the OE recipe auto-upgrade drone.
>
> --
> Best regards,
> Marek Vasut
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

