Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 74F117E9AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:51:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id c6so2179196wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=27yOfCNAVM0xiT+tDb33nAbLlZogiE7E7jiRA+pbimA=;
	b=atSt8FQDDJhK+AhlRBYZHvVEX1fL4Mf5TDaW2vwlu4DQ9k74ofUFk+hJ9Dix9z8yRz
	opSC/h+3AZTwnQoeRh0kDCvQ+DGb3zVqXgMlGbzLPJ7Of9CXBtQY27tlNTsngfGU5LaR
	Gks/3RP9gZcEncDtZ9xMKdvHlspwWYA//TdCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=27yOfCNAVM0xiT+tDb33nAbLlZogiE7E7jiRA+pbimA=;
	b=keXF6kuENtToNKhRMTcPOb4WDefT3AkfBzxZ7RWMPhMjtagB+9jK/dWZtJq5q2964b
	7fuFFMEx/YX4gL6nRpw5KfADarsUT5CfkMsM1WVXi+HIuDNCvwsbgttrph9aWoJfxl7S
	Ke9BVU5m1s4MdVtsio6H3T5qvT5KP5noZ2zX30HX87Ga75yNgyK6ptoHjhsnnmVYjQP6
	VBuxkQ7NvGt1GMC+cuTpRK3SlRlv9pXERI2dEbk0msA+Whkf6ZrrhPTRB9buIT2oeqay
	oVxGNR5shPvRN37Xcha0i2vdOVOhQoHoAKCAM/z0aa5BtsmkA6Tkiaol9x3mBxQRJpXp
	UW2w==
X-Gm-Message-State: APjAAAU9h/Wk70h4Dww0RuQmARqVPpYXlKa84W9EnrYxti+wgCkgkhAm
	ROZOkrMfH4kAwJE+z4idPujY/Q==
X-Google-Smtp-Source: APXvYqxMlGbBMBcGLVVe6CvU15CHcvCSC6PF3Sx4Mbi0XWxLLb9VS6u0JoFVwbDiam6VGCuzwSNN1Q==
X-Received: by 2002:a7b:c748:: with SMTP id w8mr8325637wmk.36.1560955884255;
	Wed, 19 Jun 2019 07:51:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r3sm21449970wrr.61.2019.06.19.07.51.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 07:51:23 -0700 (PDT)
Message-ID: <18e05da8a22ebe92979079187d1782413195cef4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Luca Boccassi <luca.boccassi@gmail.com>, Alex Kiernan
	<alex.kiernan@gmail.com>
Date: Wed, 19 Jun 2019 15:51:22 +0100
In-Reply-To: <2964bfd2c8101f0497faf7c4de54b78172b5631d.camel@gmail.com>
References: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
	<f1aeb71da144e3cf77b9f1c1e402bb0f5f71e847.camel@gmail.com>
	<CAMKF1spZojFkRCEqOE-RLkYpeTuub9O3i9OWg9sQpV19zjv+Xw@mail.gmail.com>
	<615d805a254f145c076ef586e4aaead67f689e97.camel@linuxfoundation.org>
	<2cd9ca60d5b70de9ed931d57cffca652d16bc984.camel@gmail.com>
	<CAO5Uq5QK8+bF812AF4o-AG+sOMb4E51Wj88CoLWL4jSccLdy6A@mail.gmail.com>
	<2964bfd2c8101f0497faf7c4de54b78172b5631d.camel@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Ayoub Zaki <ayoub.zaki@embexus.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe,v2] kernel-fitimage: introduce FIT_HASH_ALG
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
X-List-Received-Date: Wed, 19 Jun 2019 14:51:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-19 at 10:14 +0100, Luca Boccassi wrote:
> On Wed, 2019-06-19 at 10:06 +0100, Alex Kiernan wrote:
> > On Wed, Jun 19, 2019 at 9:48 AM Luca Boccassi <
> > luca.boccassi@gmail.com
> > > 
> > > Thanks Richard - in case it helps, we've been using this patch
> > > for a few months at $work (on top of sumo) and it seems to work
> > > fine.
> > > 
> > 
> > I expect that's true for everyone touching stuff in this class - it
> > works fine for them... the problem is everyone else, since it's
> > terribly fragile and has no tests.
> > 
> > I'd not be at all surprised if changing the default from sha1 to
> > sha256 doesn't break someone.
> 
> Keeping the default to sha1 would be fine by me, it's the ability to
> configure it that is useful.

Its merged and it probably makes sense to change the default, I just
continue to worry about how we can test this class and make sure the
commonly used workflows continue to work...

Cheers,

Richard


