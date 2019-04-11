Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 35C077D781
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 20:17:11 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k11so9011867wro.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 13:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=C/TD4fWCtZZJY2uv5Zkm62s5Hbt69wMKY+zFPfsv5fU=;
	b=F9o9tXie/1onun107UsQzJh3B4ORkmNGIyakO7C/Apw+gGWY1eVyF+mWIKfObOrGhG
	aMwGaVXLnx+GjhWVeGQ4gO8XARhtV2yJkRCG4v/HieBPojMThzgCGwmGueY0RkSse1CE
	4Yx8oQhosvgHOUOUcByM0PU/rXZN9v0g4kv9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=C/TD4fWCtZZJY2uv5Zkm62s5Hbt69wMKY+zFPfsv5fU=;
	b=LzOWqUO+jHm5mGLXbV1T/A9eBju0uzHyzXWh2rovCRpV+KS/71iWSuhVo3Z8zukWHG
	Mh7PjylcvkxioqQKIPu0G6OJq4aSpaL7GmaSdMhklHXHuIscfjgUX7RT6u2mPOvEqV4A
	nZE0VH2HhPtuDb8HqtUe7nF6/L9V8HiQIPlP8NNWor500VuILT8kAiTHFRhDY6hqMvoY
	7BIo9dwa1ObK3lkzA0+WjyTAGItk3htnl4k+iKA1Yjj5tIMCVoILf0n+gS9X98ConvqK
	Tri3UzJbZrm3wrjhaQ4qVPIjhZtCV+X8Q+Q4T8u2Ab1ZolsCVRoUk1nyuxMliH1TEX3K
	j6bw==
X-Gm-Message-State: APjAAAVdKHbRqXg6SECzjno+JsPyxDXNnusG11YiXfIfKs4fUvweqluV
	dODqrdpVkSFnlqZaJ04rUhf9Kg==
X-Google-Smtp-Source: APXvYqxoS88wJ0cnaCbWbbp4u+9znmF2dZwBjbAxBX8Oof8drHSQCudXa6qip6IUFBajT+6YUSWCHg==
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr32463350wrn.193.1555013832754;
	Thu, 11 Apr 2019 13:17:12 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o15sm35662858wrj.59.2019.04.11.13.17.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Apr 2019 13:17:11 -0700 (PDT)
Message-ID: <4d6910fce53474b2dae495913ec671a6c79db60f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jason Wessel <jason.wessel@windriver.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Thu, 11 Apr 2019 21:17:10 +0100
In-Reply-To: <ed1491f9-dc70-2380-f938-4b8104c86596@windriver.com>
References: <20190410215402.20055-1-jason.wessel@windriver.com>
	<CANNYZj8K=irJAXpTtFtaNiQ2V+dFpSPT-ikfTgK5e0TECCv_fQ@mail.gmail.com>
	<3e65af20-d2ad-603a-d121-a5982c0ae69e@windriver.com>
	<CANNYZj94F69Ske57dARqP__Yk5iiutjaqxcens6tR84sfVMF+w@mail.gmail.com>
	<847b6274-fa84-c76b-ee52-b4f884d63c0a@windriver.com>
	<CANNYZj9k0qM+O9+mVmHf1JM6MR3Cd5xbuhfZFWTqXcW+DnXb2w@mail.gmail.com>
	<6cb9ab41-778b-5e87-dfd2-88d38fec279a@windriver.com>
	<89f9a01cf5b0e87afe338360dda5057f34a60747.camel@linuxfoundation.org>
	<2E6EA27D-9294-4354-819B-5CD771285CBC@gmail.com>
	<ed1491f9-dc70-2380-f938-4b8104c86596@windriver.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection.bbclass: Disable writing to $HOME/.cache/g-ir-scanner
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
X-List-Received-Date: Thu, 11 Apr 2019 20:17:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-11 at 15:11 -0500, Jason Wessel wrote:
> On 4/11/19 3:01 PM, Alexander Kanavin wrote:
> > Yes, I agree.
> > 
> > Alex
> > 
> > > On 11 Apr 2019, at 21.59, Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > > On Thu, 2019-04-11 at 11:36 -0500, Jason Wessel wrote:
> > > > 
> > > > It all appears to work fine without the need to patch anything
> > > > in
> > > > master-next.  
> > > > 
> > > > Thank you for the explanation.
> > > 
> > > This is starting to look like something we probably want to pull
> > > into
> > > the warrior release given the problems with meson converted
> > > recipes
> > > otherwise?
> > > 
> 
> I concur, with Alex.  I talked to Mark Hatle about this earlier
> today.  If it is not fixed prior to the release of the warrior branch
> we were going to submit it as a back port, due to the fact this
> causes build stability problems. 

Agreed. Good news is it was already tested on master-next and its had
time for review so I just merged it.

Cheers,

Richard


