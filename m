Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9409D7E397
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 09:24:47 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w9so3839858oic.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kzZ8nmqOwDTFIfXjC6hmOQNWMPb4+3wE2GE5TFrw3Dw=;
	b=A9xXEDDnrLVP94d9mljiQalIjUGrpAjzigHJx6AhMStG3jQ1fnzNspqdRZ3OVvVQ4B
	qq+B5waCF4IRnt+OXAx3SLwIrwZGX1e/slSIGwkllmLZmkAtXRn5C8fqVuC2qNDMAuWw
	oRJzQwE59LLhJJtFvZ9QMjtAiziqpZmuOWpTVW4qyoypsVY/Hx7Jc4hNVTLH/3UcQUdW
	VWXHjya+E2WDtMo0RFdo06jmPjYebo7mf3r/jvA+X3HenpL8KM9W3DC8GjN4Uv+fQ3fb
	pLzXjqGHDiBzdSNNEihRL9TQa3BKleSKOdPKqjJrgXEnjKQFXDoX1Bzf8se70zk+1LB4
	bJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kzZ8nmqOwDTFIfXjC6hmOQNWMPb4+3wE2GE5TFrw3Dw=;
	b=KQeU6Oq2mekvieEVvbFszHesdziHa8vXvB8dRM8LishyQD+kUZ8mS4B6gg3J1SL3Ll
	yjuojrNr9G8duAoy3bTfOhUIVRSYBQuiiapovf1G/gg2Y38AiusC9HZFgO94qr6jXnEG
	TBAsBywK/IvcFyG622e2TBfzSledoyvhgZblMSILI4OO2qrrMyoj9Vd/AShyH0zHralj
	yX7GKkuc5RtMFqQ/dGlRq5PeIP+CJpWC1TGDaSketps8CqxMw5JZt7nSO51jCnTqxQlq
	kQt2wBIhet/nPJGV6Vvs+JTIHPCtSFjuzeZd09bagQ93RbGA8FQ7RVL4FCAvHwfowQME
	3Phg==
X-Gm-Message-State: APjAAAUPuWQWorbXB72wJACiItmDTgrmRr5qNo0P/XwDPylgD5fk01um
	aU49fLtno/fJ9qj7JMjVN34rNNuFAmge8KqZGcY=
X-Google-Smtp-Source: APXvYqxpL1e3PpBIkNeZh+p0AqU6sGv8jlvByZiCZkhXhoWGhYRY8YpBsitMbPW9e76mrPbvtwm5u47vDc5h9FCm4nc=
X-Received: by 2002:aca:c450:: with SMTP id u77mr2057274oif.119.1558603488570; 
	Thu, 23 May 2019 02:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190517233743.9646-1-ross.burton@intel.com>
	<CA+chaQdQSk_WCyJC+beE7i+Y8fuqSZxA_-tR4yGXYfDVsRKQaA@mail.gmail.com>
	<e24b3dc06a6e7545cab9a5be19f2803df3f6f10b.camel@linuxfoundation.org>
In-Reply-To: <e24b3dc06a6e7545cab9a5be19f2803df3f6f10b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 May 2019 11:24:37 +0200
Message-ID: <CANNYZj8BZn3h4kGytqqK7HDDT7=-u4_zkmjBfQAvUxbw+5sRaA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] insane: add sanity checks to SRC_URI
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
X-List-Received-Date: Thu, 23 May 2019 09:24:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 May 2019 at 00:24, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Ultimately I'd say that all these checks should work with INSANE_SKIP.
> I was just wondering about this issue myself for the chkconfig
> autobuilder warnings...

chkconfig can be easily addressed by switching to git:// I think. Patch coming.

Alex

