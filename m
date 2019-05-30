Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 142EB6C42C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 15:50:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d18so4543885wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ZGK/cd5AJRV9OmUcsEU1jvgm/AjugFVM/T8TdYH9TRE=;
	b=AxAIo9bB5GsHKGafUj9kRKKfaXOyqRxG0vv49VL3CFFFJ0/k3poNVvPoUwwmDd1n4p
	EhKGaNbG8NDafKY+jwyiajcMXU5fgDbUl/bEwFNxrSpJnQGOlipveCLMslsq/VWIapfK
	2EUsMA9Ondm2YT9EBg6wKy4N+aQR4LdSnMtpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZGK/cd5AJRV9OmUcsEU1jvgm/AjugFVM/T8TdYH9TRE=;
	b=VtDLNlkQqbDAnvHfvO6d5sm/8QIM1WjK4IZ65AELUDPqorSYD+/mnpqkAF3RTLO6TC
	RmBEJIGhZJcKWOdAv9k8dqi5fG9lWbuXBa4sf0otQ+GX6kiLTl1kNeC3TotFlu1nt4ur
	LVmFOfH2lgiXFSbCOLdKc2dh/JP3EgjWsuJPGyftrrvyFSaZ3H1LVwA7DzQ0/QK5Z6g8
	8klnQLfI2AXUuQj+i+cgg6Y+5OaZv12//7NOEhnlyHG4Ozcmvxsvdg5Oo8oOYp0o0QHh
	pBPWJhu7qpMEK1bDchsOu4fuxJDaQnoVxwesCtKSj1IvDwIHMhNiAW5M+GK93vjSea3H
	O0Lw==
X-Gm-Message-State: APjAAAWg55nXruMulNFZVi/9mZn/4XdnPnYaPCUjoqz/waoE379+Obz+
	xNq2YAc3a4nB+GSARjnxdEeodz+QsAQ=
X-Google-Smtp-Source: APXvYqxvk4R1F/QL8gDwKkZ5NYG5sCxHHHmd6WpUzk05ELkAZfJXsyIQhzVh0eZgVVvO9CF0aFGlAw==
X-Received: by 2002:adf:efc3:: with SMTP id i3mr3150513wrp.45.1559231418801;
	Thu, 30 May 2019 08:50:18 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id b2sm4158159wrt.20.2019.05.30.08.50.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 08:50:18 -0700 (PDT)
Message-ID: <ced415509fb3ccbf8c7c3190209243aa8870e413.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philippe Normand <philn@igalia.com>, Adrian Bunk <bunk@stusta.de>
Date: Thu, 30 May 2019 16:50:17 +0100
In-Reply-To: <7a13472cb0f7ecfc7553e9369f66a0f7f4226984.camel@igalia.com>
References: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
	<20190530121718.GD20599@localhost>
	<4f49826346960c908c5d0dca1812bb9d9d860074.camel@igalia.com>
	<20190530140633.GB318@localhost>
	<7a13472cb0f7ecfc7553e9369f66a0f7f4226984.camel@igalia.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 30 May 2019 15:50:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 15:47 +0100, Philippe Normand wrote:
> On Thu, 2019-05-30 at 17:06 +0300, Adrian Bunk wrote:
> > On Thu, May 30, 2019 at 02:30:14PM +0100, Philippe Normand wrote:
> > > Hi Adrian,
> > 
> > Hi Philippe,
> > 
> > > On Thu, 2019-05-30 at 15:17 +0300, Adrian Bunk wrote:
> > > ...
> > > > 2. Wouldn't the more common case be to use the ca-certificates
> > > > package instead of PKCS #11?
> > > 
> > > I don't know why glib-networking needs to go through gnutls which
> > > then 
> > > needs to query p11-kit. I suppose p11-kit could directly be used,
> > > but 
> > > this is not my call to make.
> > > ...
> > 
> > I think your "which then needs to query p11-kit" is not correct.
> > 
> > My reading of configure.ac is that ca-certificates could be used
> > instead, and this also makes a lot more sense in the default case.
> > 
> 
> I've asked Michael Catanzaro about this, he's not subscribed to this
> list so he can't reply to the thread. Here's his reply:
> 
> The GnuTLS default trust store can be a certificate file bundle or a
> certificate directory (provided by ca-certificates), or a PKCS#11
> URI,
> but PKCS#11 is a better default. If you do not use PKCS#11, then
> expected functionality like trusting and distrusting certificates
> using
> the 'trust' command or applications like seahorse will not work. Most
> modern Linux distributions are now using PKCS#11 URIs; the only major
> holdouts are Debian and Ubuntu. So I would definitely recommend the
> PKCS#11 URI. Of course, basic functionality will work whichever way
> you
> choose; glib-networking only requires that GnuTLS has a default trust
> store, one way or the other, so using a bundle would be OK if you
> want to avoid the dependency on p11-kit.

I think most of our system is already using ca-certificates at this
point so consistency here might make sense.

If you use a PKCS#11 URI does that mean the systems would need network
access to obtain the trust store?

Ultimately we may want this to be a global config selection but using
ca-certs and then having a wider discussion about a global option might
make most sense.

Cheers,

Richard









