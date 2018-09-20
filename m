Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id BC82B744AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 03:54:53 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u12-v6so1259283ioc.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 20:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9he2C5v3J7ll1zD5ebj6YBjBymYh1PgMIRhUFwuocS0=;
	b=hOLjn6W4heuZd3FBSL8SfsULj9JCDgPaVVawuQbvH23NTfsOiZWBgLmD/vI7yVV94m
	x0LQF4D29NSHaFD54VzoxxATrgmj5jh7mrbrc7tq2b7zru0rXOZS8ZKPDg95CfwY6yzG
	bTFU7xS0OK39GKgu7yZKsQ1gMO98RhitpfqhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9he2C5v3J7ll1zD5ebj6YBjBymYh1PgMIRhUFwuocS0=;
	b=TtkHhx1yHSv5wtfLrJdTjQUv5y+WgyV4nK54Pf8FnxssyycMrq9SVCI0KG2KktuaeE
	NcJZ7oGdOer1grH9AncaVzLvhDHMYbJ3qkp6Gd6R5Vtq+iMDfHosvwxX5UBZtfy3RnW1
	A27nRsM2guSbmz8IqcLG0BK5p6lOobEfr3X40C7dNXKwe2pm/CY7OsX09uDPZhyYEVBO
	cWTRgIAXVFzgD/aYT9RFRKzf5uRtpOnTVQwClmpXaovPn++vHixyK6z3ivcC377H8sLQ
	ngb22yhnhYnF0lYSrUSHKxKDEwB+zAPlB2iPd84AsCWjs+ogTx7kCedxb9P3qjlrurf2
	Bf3w==
X-Gm-Message-State: APzg51DyW104/OWg5szES4Wo/J5wBemk/vKBe4B402erS+zh8wgC/r5t
	iOeAn0JGfQc4ON3/r9zYZegLUQ==
X-Google-Smtp-Source: ANB0VdYqMYu8H3uX16EkXXqVln0Jfnno2yQ0c8b2bgkIbnidSH+OGNo/RjeIcEqXrUi0Tvw4xvYSGg==
X-Received: by 2002:a6b:9444:: with SMTP id
	w65-v6mr30328682iod.275.1537415694675; 
	Wed, 19 Sep 2018 20:54:54 -0700 (PDT)
Received: from hex ([209.82.80.116])
	by smtp.gmail.com with ESMTPSA id w9-v6sm40277iog.7.2018.09.19.20.54.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Sep 2018 20:54:53 -0700 (PDT)
Message-ID: <5968e6b9dc84b230e75b70c34302f395e19c4f25.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 20:54:51 -0700
In-Reply-To: <526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
	<526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Thu, 20 Sep 2018 03:54:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-09-20 at 09:45 +0800, Hongxu Jia wrote:
> On 2018年09月20日 09:07, richard.purdie@linuxfoundation.org wrote:
> > On Wed, 2018-09-19 at 19:59 +0800, Hongxu Jia wrote:
> > Thanks for this. Unfortunately I think we still have some kind of a
> > problem on qemuarm64 since with this patch, we cannot log into
> > core-
> > image-sato-sdk over ssh. Other images like core-image-sato work but
> > they use dropbear which suggests this is an openssh or openssl
> > problem.
> 
> Hi RP,
> 
> I will fix it as my top priority today.
> 
> Reproduce steps:
> 
> - Build core-image-sato-sdk on qemuarm64
> - Run qemu
> - Log over ssh (openssh) failed

Thanks, yes, this is correct.

You can also reproduce with core-image-sato after setting:

IMAGE_FEATURES += "ssh-server-openssh"

The symptoms we're seeing is that "bitbake core-image-sato-sdk -c
testimage" fails and that seems to be because the ssh server never
starts or responds, its hard to say what is happening at this point...

Cheers,

Richard



