Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id EA2327C6FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 11:27:41 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id d15so9595091wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Ykpmt4kn4LYCCuMT6DQY6ns3+qijwtvFCoDuWt/600Q=;
	b=K4r5HsJNcn2XBYkCpHc5mEPfVHkbllQ+20JBPaLMSqDQGyHFN5HqitADBO6fsSo4+U
	q8jWhgkh1/lrVYw2peqnDTQtxet49hFP+vsXHID1BF5w4LHWMPbWGUP38EwiKq4qCgrn
	dNoXVAHKn1aKEYqUhU6B7M48ds92lkRjRAdDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Ykpmt4kn4LYCCuMT6DQY6ns3+qijwtvFCoDuWt/600Q=;
	b=K1VSmG6bJp0heMFZPwSsJRPOxpMzqkvsubV2rW36V6tjpb8kIMmzgG1234SV4DcEdm
	uedptYO591ZdPRw6DzAr8UHrD4POfxO+x1c8UtMAz1UMaFGoDvJKlburLAKMlsDbsedJ
	SSIm9dWI2l667ZBBmyvSSpTPLh8bzUO/Zfj148p0ihyX8cKYR5DMp9GeircPdba60hOr
	gfFEwQ991YwNRjZz8n9IlgdhTu8GoXcTs4z6oKxTfzzL+wYo0SryWXqxjrfsUIYMggFT
	SgHIZppq+jPvIkE903Hx2069VPilyuqneVKB1VBUDw0U7Rp/YtLNdelKBLj4x+VWpL9U
	l8eQ==
X-Gm-Message-State: AHQUAuaktrD/QlyECrQ8oajUvPwrVcIo0hm7kE+vg5S+HidktxqlWOyb
	QXWMRfwQdDH7DDexCCN1FPOx0A==
X-Google-Smtp-Source: AHgI3IajBqI1319aUNb0IA8UNrskS6QMEDePk7K/PFNKQoCKDO5Fg37c5qnbS6TbYdfoBFzIvH+gRg==
X-Received: by 2002:a1c:ab87:: with SMTP id u129mr6229488wme.104.1550230062587;
	Fri, 15 Feb 2019 03:27:42 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y13sm512887wrw.31.2019.02.15.03.27.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 15 Feb 2019 03:27:41 -0800 (PST)
Message-ID: <1581437706268e9141366523e891a9625a3a453c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Alex Kiernan
	<alex.kiernan@gmail.com>
Date: Fri, 15 Feb 2019 11:27:35 +0000
In-Reply-To: <CANNYZj-7Qe3-NwsBZKtmP9iyqsvQm5QP6gQzf9YU_-XYYs5_yQ@mail.gmail.com>
References: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
	<CANNYZj-7Qe3-NwsBZKtmP9iyqsvQm5QP6gQzf9YU_-XYYs5_yQ@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 15 Feb 2019 11:27:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-14 at 22:17 +0100, Alexander Kanavin wrote:
> On Thu, 14 Feb 2019 at 22:10, Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> 
> > +PV .= "+git${SRCPV}"
> 
> This is unnecessary and adds clutter. Just the plain version number
> is enough.

If I read the original commit message correctly, it is necessary as the
version is 3.5 plus a bugfix?

Cheers,

Richard


