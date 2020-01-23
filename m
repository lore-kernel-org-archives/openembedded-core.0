Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id A22197FD47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 15:23:50 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id y11so3515577wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 07:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=IPPG2T1dkFQvUepF1hAEp7eqLN6B4xoxQhoSNO9RrLk=;
	b=O+fKNlDR3rUo3hdH68FEAhWIN+gh1Rb1OZRcKQ6O6fBksNKtvEoKhL16p9rBpQYTk7
	aRkmz7Zomp5nkftbgq4Nb6t5kmA7LSdk5pNkcDYW4qVL4GdM3/fVZrFzFitrMCIA04fj
	3E1Is2CZ4Xal/PJuse0/PzM8BRQgt1VoEXqIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IPPG2T1dkFQvUepF1hAEp7eqLN6B4xoxQhoSNO9RrLk=;
	b=GYtvCVy0QskE4meZQSlSZ7gKoyhzCilfTb3xOLOwjjfpLR7sj9RNScZ3EzDLEW1Sqh
	lkth5PO6y7a3KT41KYsoePVAUAyn91PdbWmrT5PUYK5JvDDMIJyH4HhXzGrFCSeoSgr9
	07sDRzk3kETKuwU6v5W/+IiGmJsWDMoLxaK1xWBlAhXFT8Rt3/EteJBaBCo0IL4Oe1U2
	rb3XPFgbZmMIFML0UGEd3snvJC3EGFfEDxDqbnuEPeXLuDm7Xpid+D22wDXTigA8ba+7
	dPa9bW5mPH4CKCTMVg55ozSR0ZbaZ3PUwN7WQpwsheAVqfEqezQpjGXyVt+gw/0P3jut
	D5RQ==
X-Gm-Message-State: APjAAAUu6xbHmZJg+Gb3EzQaAAs8Li4EZ4o2hmymrmXjqXl6s/xp/Dv4
	ddN5N6pyatlRAdjY0sx7woc3jTl9l+o=
X-Google-Smtp-Source: APXvYqwCGOdnoy7EvSBfmQNJNUuYN6ncS0JBjRw7jWiG8+kkGNUxjiHltz8JCttmNyO2+4LAR3Hw+Q==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr18614209wrn.280.1579793031224; 
	Thu, 23 Jan 2020 07:23:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n14sm2986857wmi.26.2020.01.23.07.23.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 07:23:50 -0800 (PST)
Message-ID: <91c23ebb8817e8cc5e0c1644529f6d3034749e53.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Date: Thu, 23 Jan 2020 15:23:49 +0000
In-Reply-To: <1908740460.2169186.1579791546237.JavaMail.zimbra@savoirfairelinux.com>
References: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
	<fc798fd12d4a06537fd235b6247a0193d1df3022.camel@linuxfoundation.org>
	<555772143.2167690.1579789341772.JavaMail.zimbra@savoirfairelinux.com>
	<b1cbeea067af1e54e596425c87b55b36062bb49f.camel@linuxfoundation.org>
	<1908740460.2169186.1579791546237.JavaMail.zimbra@savoirfairelinux.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Connectivity check uris
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
X-List-Received-Date: Thu, 23 Jan 2020 15:23:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-23 at 09:59 -0500, Jean-Marie LEMETAYER wrote:
> On Jan 23, 2020, at 3:37 PM, Richard Purdie 
> richard.purdie@linuxfoundation.org wrote:
> > On Thu, 2020-01-23 at 09:22 -0500, Jean-Marie LEMETAYER wrote:
> > > I understand the issue with blocked domains this is why I suggest
> > > the
> > > custom domain "connectivitycheck.openembedded.org".
> > > 
> > > But I dont know if it could be an option. Can OE have a sub-
> > > domain
> > > like that? maybe using some cdn to handle the load?
> > 
> > We can certainly setup domains but we can't easily get a cdn. I'd
> > be
> > worried about OE's response time too.
> > 
> > > Another option will be to provide multiple URIs:
> > >     CONNECTIVITY_CHECK_URIS ?= " \
> > >         https://google.com \
> > >         https://www.bing.com \
> > >         https://www.baidu.com \
> > >     "
> > 
> > Looking at the code, I wonder if a CONNECTIVITY_CHECK_MIRRORS,
> > injected
> > into MIRRORS internally with google as the default and baidu as the
> > mirror would work?
> 
> It should work but it will not be efficient as the tries are serially
> executed. So someone in China should have to wait that the former
> domains failed to be able to start the build.

I'm guessing those wouldn't resolve so it should be pretty fast? 

Maybe we make the configuration more obvious in local.conf?

> I am still thinking that the OE subdomain with CDN could be the best
> option.

Sure, but who is going to pay for and maintain a CDN setup?

Cheers,

Richard


