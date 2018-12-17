Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2427D7BE6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 13:46:48 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l9so12292865wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 05:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=um9zgZKbwJrb0sF3515TlcDlNROv0t/lLlVqTM0jcsM=;
	b=A/t+hG77mplezDexLdFwRVquwMnauqbjVjr83pgjggc7NiWOGy5vNObo8OTe7mft2r
	AgSwK6vkYHFnDkf0WEtr7TMA7wO322xz3wb49Df0KqT48eE5ljVxQYNXX6Fi5uyASkIB
	IEqMJN1ZthaJms1w3elMK+eQGZws6tryu05Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=um9zgZKbwJrb0sF3515TlcDlNROv0t/lLlVqTM0jcsM=;
	b=ZLYH7TEwrfbQ8YpgT/jmv8z+sfX+ZJ39EJv9DDXkg7qFCeA5NYSeNhcptIOEvNPj2N
	HCi4fJFn/wYf0ixnbLHl3zQeBAPJmgl5/8DjEmkI5PCAVcfEzi8F1c7Bl+81x3J8dG+D
	cYRUdmkpjle/R1JjAEa1BoJfKx3rzYQfVU8QiXnB95ySyliY/pLlCCmC9tKxk8Vd583V
	1neC3QDKHWR/RX5izOcy6kFuux9TFwac4MP0IfaRbcrkiqXeh3m1DvrVMNGVgCLmHuuB
	w77vhp2hmJil85H77MjNQX9CI1/2YoW0no31u9yGgIaObtZcASLmqW36zhAjjBOlPD4L
	0USA==
X-Gm-Message-State: AA+aEWbggXVkTYRxunk5x+A+dRM/Rl2HxbaA3sHHBC6KcqJppTMZgpjr
	Fd2ZJgbWpM3hZTW1QUymVA1VBw==
X-Google-Smtp-Source: AFSGD/WV8VIFwjdYxbg++imeK5RPb0E9aFEC7yQb61imj0ijTX3gmNI+Mr2XwLnoFFIcKWCOubCONQ==
X-Received: by 2002:adf:f211:: with SMTP id p17mr10545608wro.293.1545054408793;
	Mon, 17 Dec 2018 05:46:48 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k7sm180813wrl.51.2018.12.17.05.46.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Dec 2018 05:46:48 -0800 (PST)
Message-ID: <e0db46c5e24ebf77fc634c515ac3e2025e11fd55.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Dec 2018 13:46:47 +0000
In-Reply-To: <CADkTA4P5h=ErgMF4W-oHcdgQ8BYQNK6SgdHgC5wdmY3p=4Zysw@mail.gmail.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
	<7fc18a5b076eaf0c9e089ece60ed6845f2d36fbc.camel@linuxfoundation.org>
	<CADkTA4P5h=ErgMF4W-oHcdgQ8BYQNK6SgdHgC5wdmY3p=4Zysw@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/17] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 17 Dec 2018 13:46:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-12-17 at 08:37 -0500, Bruce Ashfield wrote:
> On Mon, Dec 17, 2018 at 7:26 AM <richard.purdie@linuxfoundation.org>
> wrote:
> > Hi Bruce,
> > 
> > On Sun, 2018-12-16 at 22:38 -0500, Bruce Ashfield wrote:
> > > Here is the latest linux-yocto consolidated pull request. Some of
> > > these commits are re-sends of changes that didn't make the
> > > release,
> > > and others are new.
> > > 
> > > Most are routine -stable bumps, configuration cleanups, etc, and
> > > shouldn't cause any issues.
> > > 
> > > The more interesting part of this queue is the introduction of
> > > 4.19
> > > reference kernels to replace 4.14 as the LTS version in master.
> > > I've
> > > built and booted it on qemu*, so it is sane from that point of
> > > view.
> > > 
> > > I'm trying to separate out the kernel bumps into distict pull
> > > requests so I can deal with one set of issues at a time:
> > > 
> > >  - I'm not removing 4.18 yet, since it will be replaced by 4.20+
> > > as
> > > the "latest" kernel in the next release. Plus our h/w reference
> > > BSPs
> > > need to be updated before I can drop it.
> > > 
> > >  - I'm not bumping libc-headers in this pull, I'll do that in my
> > > next
> > > queue, and we'll jump to 4.20 for the libc-headers at that time.
> > > There will be one more bump to match the 'latest' reference
> > > kernel
> > > for the release.
> > > 
> > > I will also follow up to the appropriate list with a bump to the
> > > poky-lsb distro
> > > builds that are using 4.14 as their default kernel version.
> > > 
> > > I'm not convinced this is issue free (i.e. did I miss some
> > > reference
> > > to a 4.14 kernel ??),
> > 
> > The bbappend in meta-yocto-bsp? ;-)
> > 
> > (I deleted it)
> 
> ahaha. Did you want me to add that to my queue (a delete of it),
> since I'll have
> a look at the 4.18 version bump and see what happened to qemumips64.
> 
> Or I can send an incremental 4.18 patch (since I see there's another
> version
> bump for it available now), and take care of that issue without
> resending the
> queue. Whatever is easiest for you.

At this point an incremental patch is probably easiest since I have the
other patches in -next, thanks!

Cheers,

Richard




