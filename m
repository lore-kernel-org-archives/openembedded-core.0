Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C7018600BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 12:45:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r10so7227921wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 04:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fES6LgiFJUkU3cjmaystukXcjQ6OkoiY6ZyFkwNssD8=;
	b=VJIova/LrZiM1GAcAN7XB68va0PQDGF9laCBojY5wd6dt+hpLularPRRudOoj+AL2B
	jNySJW4rAZUqrdzunHyENUNBIKwjBF5iWwYmpeBANJwVOLUHgZZsxSvYcJWjiiMb7y75
	CghoHsdxI1NaAUrmGM3VzcCC8MkbKunqQMhOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fES6LgiFJUkU3cjmaystukXcjQ6OkoiY6ZyFkwNssD8=;
	b=dV4wkaXNsgPnI5YxueDLBhgMB7dhs3qC88SknfZTQgQgTndh0SNeuIJIZKJ3oqbUDj
	fFAUDDMNevI/9BxoULsGV0eKu+aWNNAz9kUoHaMQKQypeULqvKmfLuWn90HsCwEX0p9j
	8hcER3iY3jMyEqBH3P/O6D+sFGTpNmHjJJ/O0OhC++zSuY1GK4GuS2MCDGavi6eZ0CjU
	oEYTbbjSSmSei2I9oYbpqfCngY5YG1nwLnTcPRjI7F3AyXy0V+GFzOkiIQ/JcVrt1714
	0bVMw+VHykQiDDX+YV9qSgM0DlLqHINA7X10zexl+qfPFel6qrFkodGdQuovmR8I6BbU
	C4wA==
X-Gm-Message-State: AA+aEWYhkI67ZW2zojdSxJO+ksV2LBS9ZS3PzkVlvHsOzpFNE30aPvEg
	kcIQkPBEYhAuZGwDvX/cBYPpzA==
X-Google-Smtp-Source: AFSGD/VYDFQvPMwyYqU/aLLeH3/oGqppSfg/5ivfoLUP5A3fqwS3+0/OQXrQ1CLN0VBl2AYdIDRgfQ==
X-Received: by 2002:a5d:49cd:: with SMTP id t13mr2513517wrs.144.1542372359153; 
	Fri, 16 Nov 2018 04:45:59 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t69-v6sm25249730wmt.5.2018.11.16.04.45.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Nov 2018 04:45:58 -0800 (PST)
Message-ID: <79fd2ed2fc241bf2770b4e471d94cb024c313140.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Lukasz Majewski <lukma@denx.de>
Date: Fri, 16 Nov 2018 12:45:56 +0000
In-Reply-To: <20181116133124.14279e76@jawa>
References: <1542339582-13778-1-git-send-email-chunrong.guo@nxp.com>
	<6338fea41b758f901b90c9d378c50e824fb01593.camel@linuxfoundation.org>
	<20181116133124.14279e76@jawa>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Wolfgang Denk <wd@denx.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] ppce500v2: remove spe *The PowerPC SPE support is split off to a separate powerpcspe port
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
X-List-Received-Date: Fri, 16 Nov 2018 12:45:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-11-16 at 13:31 +0100, Lukasz Majewski wrote:
> Hi Richard,
> 
> > What does "The PowerPC SPE support is split off to a separate
> > powerpcspe port" mean? 
> > 
> > That gcc support is being dropped and its going somewhere
> > separate? 
> > 
> > That we're dropping spe support from OE?
> 
> I do hope NOT.
> 
> There are still some users of those SPE SoCs. Please do not remove it
> from OE.

I would highlight that Yocto Project and OE get very little support for
anything PowerPC related and that upstream gcc have already removed
parts of the SPE support. We will likely end up having to follow what
gcc does, we have a hack in place now but it won't last another gcc
major version upgrade.

So if you or your customers care about SPE or PowerPC in general, we
really need to see more support at the Yocto Project advisory board to
continue to keep it as a first class citizen.

Cheers,

Richard



