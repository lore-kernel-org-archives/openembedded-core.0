Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A4B897C346
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:02:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so1965273wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=lfxrP4e54/Brs5Gg0f3704vnMJpSaam4kFws4w56iOQ=;
	b=RtuAOxH1fjqIvEjYiA4w5dmMo8YPuTtbMlbQ7pXppZXutx/gW4bs6FOcNbWSp9U6fb
	UeBmo6hLmMDOlY6OXRkmgget0wC3chnfPWriwIDQqXORx7YK2O/GjHaDU/B2dtpXrvir
	h9Gg0pEpi6/yIXy4n607VkiEaqi+iTnWbnxAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lfxrP4e54/Brs5Gg0f3704vnMJpSaam4kFws4w56iOQ=;
	b=qRfjnJtbBFEInfRXc1IWfXhI9EcNeQIpxIikK4IUt74LRVpkFE4OhdoYSLQZa1KyaQ
	cMcrJGCM8KpTbpflICtogTsirGK53zFs81fuF+nEGM4kuCmX9rojB0PgDsUN8MDqEZE8
	NK2h29bERkTP6bt89qx0pPB7SpjxsHBno9iAqgF7EHmRuQ1YJFzYzQUjiNaV3J6pk2hN
	kiU99gnCxwuwp4ZVMksSi417C/wbM0U4DPqT3vKbP2g+6ZpwXX3tm3jm65gisvZDRx5Z
	+IlfJb7kyONvNkv9NqBIsicJ6unjdfuuBhEAVj9s3b1SGBj9/SOOnaMcnknKwQ5Agoiw
	z/yw==
X-Gm-Message-State: APjAAAW9YrjCXzUy1iDBkp8lWc9/sAqmxBTIXD5n9gLMbun8GHDZ4YO/
	Uz4LmuaNUcbMBEtM8Oq/ItN2RA==
X-Google-Smtp-Source: APXvYqwSTRlD4F7I2hGqT1Z4a7Mn3Fu3n7IsT0eWCONKIOs1eVlK9gw4w3o6oc7z/i4Rq090SAOOCw==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr16016831wmk.99.1560243724940; 
	Tue, 11 Jun 2019 02:02:04 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a125sm2139768wmf.42.2019.06.11.02.02.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 11 Jun 2019 02:02:04 -0700 (PDT)
Message-ID: <72dbb4c10b7e7d4eedbcc8a60a93e80b168dbafd.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>, 
	Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 10:02:02 +0100
In-Reply-To: <b950d0d5-6ef3-37fc-29de-15bd0fed7c7a@xilinx.com>
References: <20190607154805.15741-1-richard.purdie@linuxfoundation.org>
	<ff680a45-8b31-6167-d5b5-e1a242fc006d@gmail.com>
	<c0cb96272d5dd5dddfe61dfbee2f428156b124d9.camel@linuxfoundation.org>
	<8c1918e6-9b46-393a-5a11-a4ee64290091@gmail.com>
	<b950d0d5-6ef3-37fc-29de-15bd0fed7c7a@xilinx.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] multiconfig: Adapt to bitbake switch 'multiconfig' -> 'mc'
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
X-List-Received-Date: Tue, 11 Jun 2019 09:02:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-10 at 10:53 -0700, Alejandro Hernandez wrote:
> On 6/7/2019 9:30 AM, Joshua Watt wrote:
> > On 6/7/19 11:23 AM, richard.purdie@linuxfoundation.org wrote:
> > > On Fri, 2019-06-07 at 10:51 -0500, Joshua Watt wrote:
> > > > Is there a reason for this change other than aesthetics?
> > > I have had a lot of complaints and in real world use I can
> > > understand
> > > why...
> > > 
> > > > FWIW, we maintain some recipes across several versions of poky,
> > > > so
> > > > this rename is going to cause me some headaches
> > > The mcdepends code is tollerant of either naming. We could teach
> > > cooker
> > > to translate any commandline references so both worked there.
> > > Would
> > > that be good enough to work for you?
> > 
> > Ya, that would be sufficient. I'll work up a patch for that.
> 
> I believe that I originally named it 'multiconfig' to try to make it 
> more explicit for users,

I remember the discussions and I was fairly strongly in favour of
"multiconfig" as well...

> but if people think its more intuitive to use 'mc' I'm not against
> it, using either also works for me.

On balance its proving annoying to people and the feedback I'm getting
is people strongly prefer "mc:", even if it makes me think midnight
commander! :)

Cheers,

Richard


