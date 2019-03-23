Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 817DB6BCA9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 10:25:14 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id t124so4360897wma.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 03:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=p83lCzFhw53OvdrvyOuYR/biwjOtNRkvmfWSae0A5gE=;
	b=dglN+urqmyIHR6VuKuYxxod4DA5Gnm8U4SHhUn6dVRJ6owTg7dZhAE31Zs+M80mNcD
	nCDdcArEQwFQb3TTAqx5EdSFIIs+I5Ev8bF+o1mETqdjZYb36JTPQCw0z03wHg7TPxH4
	GexYtCXtSqtRaMv082lWak5pj6NKEdZi6Dbik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=p83lCzFhw53OvdrvyOuYR/biwjOtNRkvmfWSae0A5gE=;
	b=emGVFMzBfDlOJGA0YDydusEcvEUxzNV85ne+rOl+Ax+93Tz7/f0Hjc6egKWMcFl00/
	5k/AaGkcQ0745LtvLbN71jPwgf8YZ5afZEwIqeRVOXKhHnHyZ/N4rQJwqztteYLrD0xB
	T67cwWEPc+XafN6QoC9hgV75yTaDPUvqC4vgg8YkQCaiLEso37t5on4RGrXIQTyJ8Tbm
	zd7kfS+CwaDRwoYL9C9xpdyG7Qqi0vsnfgJs5YlH/ZEL6KfcrhDLIn+HL8iRMd9iO/m7
	IlpZFvlhixDXaUcN7rwRhO/fcmVxe2eXAF5rnP/Ri7ZI+ovBTKqUf4DbwA+tKdY6R5Gl
	s6gg==
X-Gm-Message-State: APjAAAVSdJIekWcq6IyimJfymXl+nLRM4DlTCmOKUSACLsZTtEkXEGPN
	F8og7f++zL8RA3l/b+zvpE2TZQ==
X-Google-Smtp-Source: APXvYqwTbyzjdjDESBEjnl/j+NTKpo0Skw83X+csj4biftKX00B2H1ACf2BUTei6aiuowoi+bRdbcQ==
X-Received: by 2002:a1c:f011:: with SMTP id a17mr265252wmb.89.1553336715258;
	Sat, 23 Mar 2019 03:25:15 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d6sm10870113wrx.62.2019.03.23.03.25.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 23 Mar 2019 03:25:14 -0700 (PDT)
Message-ID: <8db32a05a6f93737792b95ce73b70b335ab06e8e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Taras Kondratiuk <takondra@cisco.com>, "Burton, Ross"
	<ross.burton@intel.com>, rbilovol@cisco.com
Date: Sat, 23 Mar 2019 10:25:12 +0000
In-Reply-To: <155329719078.6500.854973581146180677@takondra-t460s>
References: <27c741f4-1ac3-c837-df65-60a46712888a@cisco.com>
	<CAJTo0LYQCmNA9PppMauoPzn5HBVgzLfHAxfPyVZOTcTtdzgMRw@mail.gmail.com>
	<f347f66c-0a6d-9f49-98f2-a66f735a653e@cisco.com>
	<CAJTo0Lb=O0kLdbv9qYZLVXnfNd5Np=4HY8d7ASXSM5TiE33Ayg@mail.gmail.com>
	<155329719078.6500.854973581146180677@takondra-t460s>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why openembedded-core mailing list is now author of some patches?
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
X-List-Received-Date: Sat, 23 Mar 2019 10:25:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-03-22 at 16:26 -0700, Taras Kondratiuk wrote:
> Quoting Burton, Ross (2018-10-12 07:04:38)
> > On Fri, 12 Oct 2018 at 15:03, Ruslan Bilovol <rbilovol@cisco.com>
> > wrote:
> > > > This is basically due to SPF, and people sending email from
> > > > non-authoritive hosts.  Concrete example: Richard Purdie's mail
> > > > comes
> > > > from a machine which the linuxfoundation.org SPF records
> > > > doesn't
> > > > recognise as an authorised sender.
> > > 
> > > Hmm.. I've just sent an email from rbilovol@cisco.com to another
> > > Gmail
> > > address, and Gmail says SPF checks passed:
> > >   SPF:  PASS with IP 173.38.203.51
> > >   DKIM: 'PASS' with domain cisco.com
> > >   DMARC:        'PASS'
> > > 
> > > Does it mean oe-core mailing list's software is incorrectly
> > > configured,
> > > or there is something else missing on @cisco.com side?
> > 
> > CCing yet more people, specifically Michael Halstead who admins the
> > machines and actually knows what he is talking about (unlike me).
> 
> The issue seems to be still there. It doesn't seem to be cisco.com
> specific. I see actia.fr and globallogic.com too:
> https://patchwork.openembedded.org/patch/159446/
> https://patchwork.openembedded.org/patch/157540/

The cause is the same though, the senders are sending from addresses
which the SPF records at those domains say shouldn't be sending emails.

I'm trying to catch these and fix them up in before committing them. I
thought I had local hooks which would not allow them, clearly the hooks
need more work as things are getting through those filters.

We are looking at a different email list hosting solution which may
help. Adding "From:" lines directly in the patches where the domains
are problematic would also help. We could also in theory teach mailman
how to do that for patches but its a question of people/time/resources.

Cheers,

Richard


