Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id EF98C7D8EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 11:27:04 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id u64so1318315oib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 04:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mtxgWq+kN0boWIEIXodrOJsx8yOQHSo8yz4nPBPPTNc=;
	b=L37iAQUXWhDGVZUWewBbU2nRPDOJ+qKWtF219RbGZ4l2r64hhXL6y0lhnUKN0/fY0L
	sGjgA6fmWZ6WXEQbnX26+/S46gbsHT6aAk21C+jUvjZsf6lrK9cyIA9CwW1/+HouEXkD
	GsO6kJa6BQeJszXLfPonHF/0JOb6x7rYC8a7HUhl0Y/NZNaVXXYfBJVEqS5xu/TxpWjp
	kpmn/qCtMvohH9acxaHsMH2/umMuvUzogRm0LCRsa2YhadB0c4yWPAFhHEsaE2qlvIWr
	vPdY88mL33EcLRkRMKGzwJc3tBwETdn1SspL0ZvmQ+J0tuSjt+wBmrRJaxsz9pvZZgCR
	0hGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mtxgWq+kN0boWIEIXodrOJsx8yOQHSo8yz4nPBPPTNc=;
	b=BcDSiUb5jgDYld1nH8o1X23U+U/ftkO2v9+SJPkNBX56sRrwgfkAW9e1BW0TjMdQ4H
	/SYtTzKSKVVNm6G1n22S+hxwWtJlAE5kbpUhsZsxpzbOXKKjPtALFPT7wT5vfTIcFl2H
	W/0sF72dsWzkXshTA2PYqyA1le3cf+FL/7rGIBGmsFAf2+iwk3yAShD8L6zEkenUfKnf
	o6pSZQRy/NR9HAtsPKM+rDcLMZm2jsX5aIQg5e6teHZPbPZXO9lreeT8BvR98ppxaRXy
	CgW8OmrK5zyoAal04MaoKmBVPuNPSq9OmcsDkH61MFWSixvpDilFSxu1Y/KyZMYdH0j7
	zn0Q==
X-Gm-Message-State: APjAAAX/vOcajhOsq6AtB4VLZArP8T8RGjAUwbYBGURsqOw9wWKlRMON
	dqpcntvJfcMy+SXxqPakn1t47tOAjKZ7/bKhw20=
X-Google-Smtp-Source: APXvYqzSXKPEbqmgEndgoqpHtJULs1bIEQB5fVXt4WK9goS1f39Ia9qJ90GmE4ML+nT9qejyms5kl2G4tHCPpug9Pz0=
X-Received: by 2002:aca:c450:: with SMTP id u77mr6547120oif.119.1558524425162; 
	Wed, 22 May 2019 04:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190521090032.14859-1-schnitzeltony@gmail.com>
	<20190521090032.14859-2-schnitzeltony@gmail.com>
	<03af571c3019042cff91f2703b15edb139661144.camel@linuxfoundation.org>
	<CALbNGRQjahbkMzBmqFG4QQE4moF-qTFJrDDMzBVUnXBCTwGFMA@mail.gmail.com>
	<b182fad0b95201771a7c01ab2d71aaba73810399.camel@linuxfoundation.org>
	<CALbNGRRcmwVcVD3ytdb32RkmgyFTLJ3dsKiC+iLDK36s1DBwGw@mail.gmail.com>
	<1cee8ee543463712e25b4ea4450fb40242a9e84e.camel@linuxfoundation.org>
	<CAMKF1srz+_Tk5=GNWzBLpNRXoqdCYOmLyNm6XKkFJQFvGcpX=Q@mail.gmail.com>
	<f10bbaa1a0d8ef62f7b7ffd8dfae101b906fafce.camel@linuxfoundation.org>
In-Reply-To: <f10bbaa1a0d8ef62f7b7ffd8dfae101b906fafce.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 May 2019 13:26:53 +0200
Message-ID: <CANNYZj89w2eT2bN=8SmSwmAPzYADLPk=GmajvNJTif+0q3eO+g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python-six: put python2/3 variant together
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
X-List-Received-Date: Wed, 22 May 2019 11:27:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 May 2019 at 13:05, <richard.purdie@linuxfoundation.org> wrote:

> I don't think we need to switch our default, just be able to build say
> oe-core without python/python2 in HOSTTOOLS and without needing python
> 2.7 in OE-Core either.
>
> > Its good that project is taking lead here but we might leave many
> > users behind.
>
> I suspect python2 will end up in a layer of its down which I'm fine
> with, dependencies can then be clearly seen.

For what it's worth, Fedora is getting serious about Python 2 removal,
and they have a plan for it:
https://fedoraproject.org/wiki/Changes/RetirePython2

"All packages in Fedora that need Python 2 to run will be removed from
Fedora 32 regardless of their dependencies. All packages in Fedora
that need Python 2 to build will be removed from Fedora 32 regardless
of their dependencies. "

Alex

