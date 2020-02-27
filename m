Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3F823618A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:48:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v2so887935wrp.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 15:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=akK60vtepcynygrrIrwBJhUEPT88MzuMELpJMl+awhw=;
	b=ExzTjnfYdT5pD5SewIV0AVxc7jWoQG48jBdTbs8jGssYJzDDDnwI56ximNT1nyuGWH
	zZTHtweenZEm7dxZbcAjQFsTlE6vj6MTzeLEZCngeMRvtfY9tc5dDh9cszNEr4sjQAwt
	LdY5ojqegd3337TG1KLXnumrDN16jrT+ngNpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=akK60vtepcynygrrIrwBJhUEPT88MzuMELpJMl+awhw=;
	b=I2/+JRFl+YRaJf+L5aPWvs3Kj9i+/VIM81Hrc5e8xU4/Fcbnl1D8VsoBegxK77dAog
	CGTu1m4BCWDcpdWP5RkPz5YnvfMk1mIS1/+huLv+qJeSaJHCb1/pvmedscjcb1pu/dph
	nvBCXbIxKpYZKCgQT2TRtAIJA9SEDtyoaIbTxHgxqrDzpPlfZctWwa8HOe8Xs9xwoM3g
	o26zo/XZqhkqptIuGqWbuVK6/zY9k30zqoSG3q9bQ4DMWT4oNCZ2bwRQcJCDenu4/+Nz
	LIVn8/TIUW/jFQ3HnIHAXJJDF7AaG3+DFpXSyt5XnsNaF7sVKXEj9hJnWehOA2+lRlvX
	e6OQ==
X-Gm-Message-State: APjAAAU7L18SezyOXRVFjTc5SaXfhEzMLM6edW3PmuHpG4LzC8ciTQzw
	+OpU8wOTDc5Wooi1Iaxcau3IXQ==
X-Google-Smtp-Source: APXvYqz++rskEr/cmi5wc16bEk7pwozGGH5kDDw0vvn07jqqzZJfpsvIGoWy6QeXDUAbe6TA9gXf2A==
X-Received: by 2002:a05:6000:106:: with SMTP id
	o6mr1317282wrx.120.1582847304899; 
	Thu, 27 Feb 2020 15:48:24 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m19sm9706488wmc.34.2020.02.27.15.48.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 15:48:24 -0800 (PST)
Message-ID: <c429bfa7ba5f3dc570c725c24efbc58352c41ccc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, bruce.ashfield@gmail.com
Date: Thu, 27 Feb 2020 23:48:23 +0000
In-Reply-To: <1a0c08fc-2643-2d32-86f2-77ed17ea05e9@intel.com>
References: <20200224200202.61426-1-bruce.ashfield@gmail.com>
	<beec08fcb1f0b492dced91217f2fdd598228f87a.camel@linuxfoundation.org>
	<1a0c08fc-2643-2d32-86f2-77ed17ea05e9@intel.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto/5.2: update to v5.2.32
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
X-List-Received-Date: Thu, 27 Feb 2020 23:48:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-28 at 07:42 +0800, Anuj Mittal wrote:
> 
> On 26-Feb-20 12:47 PM, Richard Purdie wrote:
> > On Mon, 2020-02-24 at 15:02 -0500, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > 
> > > Updating linux-yocto/5.2 to the latest korg -stable release that
> > > comprises
> > > the following commits:
> > 
> > This was included in testing on the autobuilder and we saw:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1612
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/315
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1616
> > 
> > and I'm not sure if they're from this?
> > 
> 
> I had picked this for zeus as well and didn't get this error on 
> autobuilder. The builds failing above are building v5.4 by default.
> So 
> it doesn't look like it's related.
> 
> I am not sure what could be causing this problem though ...


I've come to the same conclusion having run builds without this patch,
its something else in -next, maybe the make patch. Trying with the
reverted, failing that we'll have to bisect next :/.

Cheers,

Richard


