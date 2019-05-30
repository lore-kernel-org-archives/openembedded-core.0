Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5F07E3FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 11:46:08 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g135so580187wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 04:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=pUd1GR4/PNDciRTV8MDL5GUcg6HiaZRRF+4JZevwy2c=;
	b=D/XPLKselwk9Xe3ySaQL0IUcHHMT2hH6H8OyKs9AKuLy073LeL+KmpmBJnm9mhpMXQ
	lfZT5mKQkC4JFVPI/z+Oq6jQNBMYL8n837Guow55q8r8gy6n/vMwlE5lWIeCYnFLSgqN
	zV0TbyrtjkCDPS5rLJ5Rtwb6SlvbU9DwDkGzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pUd1GR4/PNDciRTV8MDL5GUcg6HiaZRRF+4JZevwy2c=;
	b=Yu+I625oKWLYybf0ich9tBy9iEuGDcf+vrfWZE7d3oH/bAEhWXAyO4JRVD8K9rKb2Y
	GtR/B/PuQ4WH4YaWTcYZz7Wr+2tM245SKB2Mp9SGNB5xV8MAWhSTSakASou9yiBo0syE
	AQllytZA2lq8EashXXRbePG2nPK2F3KbdBE8ac2YAslcxbJQY/a1tfu+aj/OcDm7Efcu
	9rdS+IjfBdHKlep/gA/eigBpyaklSIN6aDPYAZFzPTW27o/m3okWSuGnzwNJLyyns6+W
	ZQir4H30YL7JJcgxaaoFMlm4QcXgsdhcsulCrC6Fa9oCPn0VESIspYvS1WmqUL9mCaxO
	JeyQ==
X-Gm-Message-State: APjAAAXUltZsXrWMqw0NQR5Z9GRMRq9Dkf8fY6FKD86jeVBSMXJXqTKy
	1i/L6/C8yWEApE7X/tx3uuhRNw7VGZA=
X-Google-Smtp-Source: APXvYqwCirSjvZhI6o1Dz/h2nUrvlD963B7928C4WKYtp/4gIKo6ifyoKbvKdANGDs9gIikEscTN4w==
X-Received: by 2002:a7b:c057:: with SMTP id u23mr2063965wmc.29.1559216769437; 
	Thu, 30 May 2019 04:46:09 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f65sm2901411wmg.45.2019.05.30.04.46.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 04:46:09 -0700 (PDT)
Message-ID: <8137b5badadbc46db18fc7b4bafd0734f90586ee.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Philippe Normand <philn@igalia.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 12:46:07 +0100
In-Reply-To: <7383a1c593e41083fa4123cd1341b1505373806c.camel@igalia.com>
References: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
	<9891ffe8291ac7ac5d5e5be5289436b7290160c4.camel@linuxfoundation.org>
	<7383a1c593e41083fa4123cd1341b1505373806c.camel@igalia.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] gnutls: Add a config option to enable the pkcs11 trust store
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
X-List-Received-Date: Thu, 30 May 2019 11:46:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 12:43 +0100, Philippe Normand wrote:
> On Thu, 2019-05-30 at 12:38 +0100, Richard Purdie wrote:
> > On Thu, 2019-05-30 at 11:12 +0100, Philippe Normand wrote:
> > > Since version 2.60 the glib-networking TLS database relies on
> > > GnuTLS's system
> > > trust store, so not enabling it leads to TLS errors in
> > > applications
> > > depending on
> > > glib-networking. The raised runtime warning is:
> > > 
> > > process:500): GLib-Net-WARNING **: 09:14:09.321: Failed to load
> > > TLS
> > > database: Failed to load system trust store: GnuTLS was not
> > > configured with a system trust
> > > (app:490): ... TLS Error: TLS certificate  has unknown CA.
> > 
> > Doesn't this mean we should enable it by default as well?
> > 
> 
> Yes, I would likely support this decision. :)
> 
> I didn't do it in the patch because I don't know all the consequences
> of enabling this by default. I would rather defer the decision to the
> recipe maintainer.

Given we're seeing issues without it enabled, can you send a v2 with it
being enabled by default please? 

We try not to do that where it adds dependencies we don't need but it
seems to make sense here to me (I can take repsonsibilty for asking for
it!).

Cheers,

Richard




