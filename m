Return-Path: <trevor.woerner@linaro.org>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7F060048
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 03:23:39 +0000 (UTC)
Received: by mail-yk0-f182.google.com with SMTP id 9so825342ykp.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 20:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=auVxtgDYo7S5V4dPWnkS9dB3u784MLK0IZnKRP3gGl4=;
	b=IByz+V6t8hXU/9kF0gp6tu4VqlyziRqsntdBiUmFiIJU1WWZOEAXdt/0v1MiUb5r8k
	L1pwfjLJJELMcZYIB27OWYvc4UqT1S1K2zBqj/69fH3Is/H493SKfTbWoSvfd3/Lt0id
	JLIYZ5eVxjZNTE6sdDTe+aNHS9bokbA1kSHYhdd2ZmFaXY47c4f9jBAai8BDbQsP9fnW
	botuzgT377/h81YHTWPT656mwM8X1CEqrDTuCKIC8tg/HHEcptc1myl3IR30I+8SrhDq
	p6/ENoUGv0tklNgU3SfXAwPL3Hry3Q6p6q4ENQhB5Gf5ddbYhxc23rwSoFgIbhmC8vl5
	X1WQ==
X-Gm-Message-State: ALoCoQnr9F+VCcF2CeoHrokAx1w0ImRogU5dIb79kRMvUZ1Y/bWn0MxpEWcFUYFlvGtq3sRzoSRb
MIME-Version: 1.0
X-Received: by 10.236.74.229 with SMTP id x65mr28776030yhd.131.1399087420274; 
	Fri, 02 May 2014 20:23:40 -0700 (PDT)
Received: by 10.170.156.8 with HTTP; Fri, 2 May 2014 20:23:40 -0700 (PDT)
In-Reply-To: <CANyK_8c_-UdtF6ZqHLvQcs_JJ9PGjP+wP0dJGH_3imkn4n4h4w@mail.gmail.com>
References: <535F3FFD.1080403@hostmobility.com>
	<535F4513.20407@hostmobility.com> <1398873268.16672.529.camel@ted>
	<CANyK_8c_-UdtF6ZqHLvQcs_JJ9PGjP+wP0dJGH_3imkn4n4h4w@mail.gmail.com>
Date: Fri, 2 May 2014 23:23:40 -0400
Message-ID: <CALmOhgm4=Gw=yE2SRc7YS5ZvH+oyrP=g3fSiDPyT50X5CZQxLQ@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: quilt-native fails on tar version 1.27.1
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
X-List-Received-Date: Sat, 03 May 2014 03:23:44 -0000
Content-Type: text/plain; charset=UTF-8

On 30 April 2014 13:57, Paul Barker <paul@paulbarker.me.uk> wrote:
> If you can't find
> a good guide online on how to set this up, let me know and I'll write
> up a blog post of how I did it.

I'd be interested in reading this, if you wrote it up. Which container
technology did you use?

