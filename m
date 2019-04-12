Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 787FC7D915
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 13:34:16 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id z6so488153wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=xtrZKJ7ksWaYaUqqsD5ZyeRwHWnedpQy8k04f5X9P94=;
	b=aWgQuk7zIhRY8W3Thdg0oOvGxDAPQp3nV/h533VpcDVSmEuegme+YovKflz3vUAnEz
	AX2yhYmU9EsVRm/3LCepGzpA6dLAEqYdqb1GIkTLLx8OSYkYtW0+S0mdLaFi5PJPVGyv
	9vL0iy4uQ0pBbf+id7DQC+j4prUdhUGr9nK/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xtrZKJ7ksWaYaUqqsD5ZyeRwHWnedpQy8k04f5X9P94=;
	b=F/v3uCl9GDxDsJAl3F9z0w/yTDgeW38GC1yiIgQ1jt6oRN3rkIiWjoO2tXD4eSE2C7
	KQBDyY9dF3wUB6WCsSbhzv1K7gJxCY+2Q3k7DPaTbYtl4SrHVL+Y3BpMlg5zjeI7EbqD
	wJFWxG4KHm7hNGaHKzQRUZ0RRwWzH7GBv+WL3/pUTcAxVAZLowkuNnG3Aq/qG1JzteNg
	Orm8I8NvunT9cFpG9vuJoUVvQ3+/gp6nk+isTa+aIiwNI3vux6Et0Q9n/Y0dCB0rWj6T
	Urn15k1LnDpeJJQDqL25B9IzTQf750hoYGqKyXaBOe65Jc9FVFBGZzkX2iKhZX5blqTx
	sFiA==
X-Gm-Message-State: APjAAAVcORIbiAO/bIdpNnk/2c8aU45SA4ps/cI9ifpMYePGJ04aHdaf
	fZkS+Bq1G6UUr2fJZOzm2Xxu4A==
X-Google-Smtp-Source: APXvYqybaaYRfzk3ssn5APH+UdGNcx3TzgGduwOdOQanEBtyO+pGCwXeVLQnKDynNxoCNaEiESkA9Q==
X-Received: by 2002:a1c:9d46:: with SMTP id g67mr10458969wme.99.1555076057169; 
	Fri, 12 Apr 2019 06:34:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 4sm6439330wmg.12.2019.04.12.06.34.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Apr 2019 06:34:16 -0700 (PDT)
Message-ID: <f704cab815c2157a4a26537f0a72c5bef3d59fa0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Fri, 12 Apr 2019 14:34:14 +0100
In-Reply-To: <20190412131616.2mwd5qefxrvlxaw3@holly.lan>
References: <20190412123046.17510-1-daniel.thompson@linaro.org>
	<5b21542499899b2465a2b1f581faba726351e58d.camel@linuxfoundation.org>
	<20190412131616.2mwd5qefxrvlxaw3@holly.lan>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] go: Allow bootstrapping using host go compiler
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
X-List-Received-Date: Fri, 12 Apr 2019 13:34:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-04-12 at 14:16 +0100, Daniel Thompson wrote:
> On Fri, Apr 12, 2019 at 01:39:52PM +0100, Richard Purdie wrote:
> > On Fri, 2019-04-12 at 13:30 +0100, Daniel Thompson wrote:
> > Whilst this is quite a creative approach it isn't deterministic and
> > I can see this introducing bugs which are hard to track down :(
> 
> I guess I can't disagree too strongly... the version check and
> bbplain message about the go toolchain we adopted were intended to
> mitigate this by at least making the selected go toolchain
> conspicious (and thus a git blame would probably draw flames towards
> me).

Once something makes it into sstate, the message is lost and you don't
know how it was created. The problems invariably end up on the mailing
lists/bugzilla with others being on the "front line" for this. Rightly
or wrongly its just the way it works out.

> We could make things fully deterministic by downloading go compiler
> binaries (rather than source) if the host architecture is not
> supported by go-1.4. Is this feasible or should I continue trying to
> adopt the host go compiler for these architectures?

Is the go compiler a standalone binary that can cope with this? I think
I prefer that to requiring people install host dependencies.


> > I think we need to make this a specific configuration option.
> 
> I guess we could wrap this up in a config option although I hope
> it is ok to have per-architecture defaults so the config option is
> always sane out-of-the-box.

Yes, per-arch is fine and we definitely like "out the box"! Not sure
any of us are classed as sane anymore but I digress! :)

Cheers,

Richard




