Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A944B6C132
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 10:22:43 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k11so13303766wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=+Ja4Xwl3h1B/ZvPOr+Hs/+U6MfAKJXVyM81TkAsFINk=;
	b=KEQHq/llyAvxRLsyHG6XhHEXP5KWhRrcxWz3rG0qWu+BZa1smO4TRPiyzRMEL2lyGX
	Ri5wNUk8cVW7MUr7+lVMYVkaGys2YI8WtmL1de2dyumibL2ChvqknLWv/i0fWicZ6ri8
	kbHnRZk0z9azn9UQ7vt+HGHTanJsHnq+16VwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+Ja4Xwl3h1B/ZvPOr+Hs/+U6MfAKJXVyM81TkAsFINk=;
	b=rpp7Nzaq2GS8AbGZ0fpb+RTcxIGyQGIE6e3g/RtI60RZqLSFNfmL/mUSLu3/osq+JH
	C+hOoF56YpWIZgIeNmZ1P82A4mfo3kasm5DhwTRxXPQ+CSanRTXVJYLkBHKdy2gnDCSk
	8Mz0CO0qhjapjbWkydZaz2fj26ZgH8AGJxaAZOLybHffxOAnXer9HZwDnUnzD/47fc+f
	kfHyQ2UcjxqHYeGgfGkSOwtwFHeBam6qLr1lVHea5Ao3NyrnmZagtlS7LgA8KQKQN7mT
	k71/GTOVxWan86C6U7/4UnzuFvcgXsejkS2H1jdeJTzuzYC62fbEnTNZ4SrBeYEo8R48
	cPBQ==
X-Gm-Message-State: APjAAAXxpd1bEm5/XCKzFHU2I27qzEH5kl7FglD65jpg6x0eV4kqSRKx
	rF/afA7jz2Fdsq/WvigVRuttmA==
X-Google-Smtp-Source: APXvYqyrQ4OG/y4gucQ/17Ae7EYoxkFlvmS10Y1SXJCiEss2YqjQ5qffa0ws1yU0NqidX+Z6dNCPag==
X-Received: by 2002:adf:ce88:: with SMTP id r8mr34115929wrn.42.1561371764220; 
	Mon, 24 Jun 2019 03:22:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s8sm12991575wra.55.2019.06.24.03.22.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 24 Jun 2019 03:22:43 -0700 (PDT)
Message-ID: <cdffa8e2d2d7ed81450272040d6e18eceb447f08.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Armin Kuster <akuster808@gmail.com>
Date: Mon, 24 Jun 2019 11:22:42 +0100
In-Reply-To: <20190624073802.GA11015@localhost>
References: <cover.1561348290.git.akuster808@gmail.com>
	<b8d16e9d74688e91d6dee5e643b42fd5c4f887b4.1561348290.git.akuster808@gmail.com>
	<20190624073802.GA11015@localhost>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Warrior][ 15/19] texinfo-dummy-native: A little clean up of template.py
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
X-List-Received-Date: Mon, 24 Jun 2019 10:22:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-24 at 10:38 +0300, Adrian Bunk wrote:
> On Sun, Jun 23, 2019 at 08:54:14PM -0700, Armin Kuster wrote:
> > From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > 
> > This is mainly whitespace clean up, plus using the with statement
> > when
> > writing files.
> > ...
> 
> This patch and the next two look more like cleanup patches to me,
> not changes that should go into a stable series.

FWIW the package.bbclass change is being requested to allow people to
stop patching the class...

Cheers,

Richard


