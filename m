Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id BA10F77DCD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 13:26:34 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id u138so22501632wmu.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8WQwZo7s/AyeHmh/fhPLvoxz15LsPkNeZ7YLPGrhTzg=;
	b=Y8zkZoHCv+y33QcOX6LaifX5A6yFaDzJbj8nJiik8yCRy0L8ZHxfpGuOKZmzanC4Vk
	UukQz/eD3rMuo598SegSKnEJ3rWNXDlMXNyhyOLuQvkibqYHNrRcc9wgYym28M6OxcXT
	o5O5aq4+8i5a+MQ6LZSAMDoEHBc8MqdTHjtZp86e740GwqaG2LxEM+C7Qadv0eAIAiUL
	w4T/BWobyvUAnwuTm+uo/PC99HuXuw7mMqOeS4HAJRPYxVns6HZXP4SuIolI6VmySiER
	MIk965uzMnzMyjL9OUw+nUixmr3cfKd7jebYlrBVH9Me7gkQa+dZhT2uyOLlbkmvqtsb
	PTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8WQwZo7s/AyeHmh/fhPLvoxz15LsPkNeZ7YLPGrhTzg=;
	b=T1A/OhPTqY8pAog0MmNLtCtdhEkoSMnbjbbPwte+38pPMjHvtrgqw2KIObQF4/Y7YU
	LoQgdioSNLEwYtLg069fyzx8RzFSejuqOj7rW7tPOEyfgQ9UHn05/GKz/aN7xedw3vlT
	Iju302upGme0UzK5Jmo1ALbbomWk+XXI4N4L6YGIanjMJ4pTH66jMAktSm85V1QX7s1l
	O1fJ3euZ4wniPAZU0vEYTKWL4sj8jRAK43dNbIOOxX+8tpeMZaynqiggMo03Z3e1M0a5
	8nPifB2CxN5o4rEZx0MRpHaRmiqe08CtXD9ljXhtHaCyziP0CHrUtJ+KfDjvPkf+1Wyw
	6JvA==
X-Gm-Message-State: AMCzsaVqFFi2GQRq5CdtbAZagR9ODsn5bMtNZyTYS+LWJCvk+UsNBFqS
	y9EycN8z+cS79YKKUGV+2RqXoIJfQlSotD5nH6Q6yg==
X-Google-Smtp-Source: AOwi7QAzuh2b708bPkD85VCR6glz+Tln9acBbjkXOJAwbMv24CvY/0PiEpvCHUFu6TxVYIvlEO34/ShVURpK6LjxGFk=
X-Received: by 10.28.29.215 with SMTP id d206mr8120410wmd.130.1507555595650;
	Mon, 09 Oct 2017 06:26:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.173.139 with HTTP; Mon, 9 Oct 2017 06:26:35 -0700 (PDT)
In-Reply-To: <CAJTo0La9PqqgOfRZB-cXo89e4x8HAHcfyUVCKcwuCUJ+jRhESg@mail.gmail.com>
References: <1507551680-26238-1-git-send-email-pbarker@toganlabs.com>
	<CAJTo0LZ8OkfLxgCLZi9-d2vpXUtWFo6jROedC01zid7fx=FX3A@mail.gmail.com>
	<CAPyrkgzum8JGfqsP2tu+7bjG8-J-UNBMgJPhLK08o7i0YXWHqw@mail.gmail.com>
	<CAJTo0La9PqqgOfRZB-cXo89e4x8HAHcfyUVCKcwuCUJ+jRhESg@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Mon, 9 Oct 2017 14:26:35 +0100
Message-ID: <CAPyrkgxSdzv2smpXDvd62w-9TMuXRY+b7T=GSGc0E4zX7vtJWg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Fix building on armv6
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
X-List-Received-Date: Mon, 09 Oct 2017 13:26:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 2:15 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Thanks, queued for rocko.  We've just fired RC2 so this is unlikely to ma=
ke
> it into 2.4.0 but it can be in the queue for 2.4.1 if it doesn't.
>
> Ross
>

Ok. I assume the same will apply for the go qemux86 illegal
instruction fix once I've got it sorted. As long as it hits the rocko
branch within a week or two of release it won't impact me. If not I'll
carry this in our distro layer.

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

