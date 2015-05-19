Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD9460168
	for <openembedded-core@openembedded.org>;
	Tue, 19 May 2015 15:35:01 +0000 (UTC)
Received: by oica37 with SMTP id a37so13934298oic.0
	for <openembedded-core@openembedded.org>;
	Tue, 19 May 2015 08:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xyrt+rD4XHG0EnoZ4+k5F942/2AqZ5EaG7LfxkdF4AY=;
	b=f4acSHM4YRXiLpsysCmxDCKa0L3C+j0VcIrS/9JHStPq2/zCpcxg8/NJkvrJuhD2zL
	9h5PC90AnbDfq4dmkSeYutoWZcMVcnN5+OTC8KEH8peFN361i2MwjjzQwwVyRALg+zNi
	6F5fh47STPC8NXN+DAPI6/6H2DOuXtaCzh5dkSzf2jcDsm1Q56rKe1YxZ/miuFKQyFH6
	z3t0TVOdgNq3OwOatSB9wdxs7txyqgAY8CSoIPQOLebRmKNyymHuiES+Jj2NCyHsKBKn
	i0nazxk4pMwnzhOGmJ6MAUkaSQBbdQTSDj2BLmv3bCZwKFBcvFPgVhL3/PjcHEOyBCU2
	7o/g==
X-Gm-Message-State: ALoCoQkVr9fQ1QTmXPUTtdbunTfC74NHYCn+Gfn0Qtg1w1XvwY2ggrr2CRvCkLrBu5kl2sRQsNzM
X-Received: by 10.60.40.163 with SMTP id y3mr24585328oek.34.1432049703076;
	Tue, 19 May 2015 08:35:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.37.200 with HTTP; Tue, 19 May 2015 08:34:42 -0700 (PDT)
In-Reply-To: <555B53AB.2010804@mlbassoc.com>
References: <555B53AB.2010804@mlbassoc.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 19 May 2015 17:34:42 +0200
Message-ID: <CAP71WjyCqH34ULgHUmGx4S6bx0fm4gu2dNnOiLmZUZ0mQ4oM8A@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Re: media player (gtk-play)
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
X-List-Received-Date: Tue, 19 May 2015 15:35:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 19, 2015 at 5:15 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> Do you know if there is a way to tell gtk-play what gstreamer
> back-end(s) to use?  In particular, for my i.MX6 board, it is
> not choosing the video plugin I think it should and it would be
> nice to test if it does the right thing if the correct plugin
> is used.

by video plugin, you mean the decoder or the video sink?

if it's the sink:

gst-play --videosink <foo> --audiosink <bar>

if it's the decoder, you can't choose on the command line, the
application will just rely on playbin, so you need to configure your
plugins (and their priorities) so that playbin would pick the most
appropriate plugin.

cheers.

