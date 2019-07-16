Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5B87ECBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 13:15:40 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id l2so18670655wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ENjtoipc/ulWFVmxe083OJ7G2lfS3FPQuiwjzOVD8P8=;
	b=FE/LsiRoI2An+5fvS4Q9hZoNKahhhYDrWF85G7Oh+4G3ikiA5PVRcc2LYDJ3kZ+soS
	7tt9U00cd0nDTq9C7jf2zh4eqURY5lcTRfnuLdmvCyb2pG8WGKpTc21rugi6IT+w4XQB
	vIxsWEKhGiXyIk9YshgRdWQYqPzjeruh18LKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ENjtoipc/ulWFVmxe083OJ7G2lfS3FPQuiwjzOVD8P8=;
	b=X/d8t99bAhaRPULzdw9xTH6kZ8UUCmK6KffhWOtm+RVaHpbw++dymvnd9PpCoQFvPF
	cR2F+HAnQf9H10hvG/hNa1X4B5oFiGxs45hjmFAhRcxdh6BZUOw8zcZzzKPq5RKnIwgS
	URulcZkk/5VJd7tu0A79G84eaS8COvDJYBZgLZYrCEgF8zxzLaOd2rxBBKp84JwtN27M
	SfYYkrUo7nt9GZbDQmoq7zBi2kdkUadSKuE4ju8F5+cp6iynmVD0/P7UKF3Ef6BI1cgK
	yg/UhsiStWM/oN26sFHGUWj8P+RuvMkSB71FUgQyFL1v3AvxCbolka1p+9MTLxfABrE6
	Omvg==
X-Gm-Message-State: APjAAAVXlLZvsvLw9KbnESy3Af62RvrePTEZKibDfujfzJianIBNj/xo
	EB1hVCJOLJDADecBZmUPbAlSTQ==
X-Google-Smtp-Source: APXvYqyD+m4UT/Xo8CxQnFaoV3oJgjiJJUMi/6rOeHZla8ztboTtk+BpmBZrW+M23ufqrAHl8T+y6Q==
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr28861182wma.37.1563282941024; 
	Tue, 16 Jul 2019 06:15:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b203sm22928058wmd.41.2019.07.16.06.15.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 06:15:39 -0700 (PDT)
Message-ID: <c107fcbe444523a800e3c995c114beb7fa24a18d.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Joseph Reynolds <jrey@linux.ibm.com>, Adrian Bunk <bunk@stusta.de>
Date: Tue, 16 Jul 2019 14:15:38 +0100
In-Reply-To: <f6e26cd5-887e-4c1f-18c5-3c257a888932@linux.ibm.com>
References: <20190715203857.65119-1-jrey@linux.ibm.com>
	<20190715205842.GA14808@localhost>
	<f6e26cd5-887e-4c1f-18c5-3c257a888932@linux.ibm.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Joseph Reynolds <joseph.reynolds1@ibm.com>, yocto-security@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [warrior][PATCH] dropbear: new feature: disable-weak-ciphers
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
X-List-Received-Date: Tue, 16 Jul 2019 13:15:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-07-15 at 16:08 -0500, Joseph Reynolds wrote:
> On 7/15/19 3:58 PM, Adrian Bunk wrote:
> > On Mon, Jul 15, 2019 at 03:38:57PM -0500, Joseph Reynolds wrote:
> > > Enhances dropbear with a new feature "disable-weak-ciphers", on
> > > by default.
> > > This feature disables all CBC, SHA1, and diffie-hellman group1
> > > ciphers in
> > > the dropbear ssh server and client.
> > > 
> > > Disable this feature if you need to connect to the ssh server
> > > from older
> > > clients.  Additional customization can be done with
> > > local_options.h as usual.
> > > ...
> > Changing the default behaviour in a stable series does not sound
> > appropriate to me.
> 
> Although this patch is for security, it is a config change and not a 
> fix.  I understand if you don't want to add it to a release branch,
> and I am am okay with that.  I just want to know one way or the
> other. 
> If this is the answer, we'll put the patch into our downstream
> project (github.com/openbmc/openbmc branch=warrior) ... waiting for
> more opinions ....

Whilst I understand the rationale behind this, our policy for stable
branches is clear, we shouldn't change behaviour there unless its for a
significant security issue. This is more prevention rather than a known
large issue.

So unless I hear strong support for adding it, I think we probably just
move forward with it in master.

The patch is here if anyone does want it.

(Armin as the stable branch maintainer does also have a say in this,
I'm not sure what his opinion is).

Cheers,

Richard




