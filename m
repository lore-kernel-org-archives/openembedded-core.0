Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 08C77605F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:35:16 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c26so3815162eds.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=duaWlQvltG489XToX2FPui38lZRu2vmalYvJQdzAN+M=;
	b=G5jGwxLSgu3U9hp0c/A0gDYQAebjBXWuFEprxl7piNHvgdsB1wRbD1haWS5kNGXnAk
	wkIPwn7M2afu0zYKVt05j0dAibToi+Kj2m8m3VQ+Z1cS1PNXx7GIghTO/4/4lVGiEzq8
	/k/cspq9CJlwy4F2HeoXyiKUkyRMzlQE3JQxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=duaWlQvltG489XToX2FPui38lZRu2vmalYvJQdzAN+M=;
	b=UqL8iidROjsi4WLOpYoDWsECqizqkUoNUfIeg+mCcJr00vwEPl0RtT+sD4VM+H1a5U
	nxdBxhFfltNWFGcVuqZjJ8IgwJDlMgfbtr28KbaoQOIzS3CBQqFhmC2y1xlr0fhmjhTQ
	g9ICUfQdm0wj0zbw7k1INsK74/QBgnr+dqSyK61e9XAL5StFl7SPajOZntGIgTYbV1bl
	poGZUAmQdxXGXOak8GE/fWzXZgpqgBiU+yYtYaFvlcv9CGiQycZcZ6z90oeTDeINMX6W
	p4S7xhMoFO8qiGjjMJca6OeJqunMwK5svpR2Av59s5LClfHgrVR17CanXrtWFcKERz8s
	LFRw==
X-Gm-Message-State: APjAAAXsyUS/Qu7rQgScNmsdzInzdEpE91tnZ0WLuaxESuHAdaT+vMoH
	vnc920EHjfD2qQa+J6Ub2jbEwlvohOM=
X-Google-Smtp-Source: APXvYqy+fMjd0Ac5u/LLaWx6ZooFRez7eiLdnHhh88/cuLEXlIAQNMdRRJU1lmq+e5yPwARAv/Lqxw==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr34355505wrr.82.1580298932611; 
	Wed, 29 Jan 2020 03:55:32 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l15sm2530772wrv.39.2020.01.29.03.55.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 03:55:31 -0800 (PST)
Message-ID: <6b33c47868865ce3549b8698b9bed6a2d0fa06ca.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Schrempf Frieder <frieder.schrempf@kontron.de>, Tom Hochstein
	<tom.hochstein@nxp.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "anuj.mittal@intel.com" <anuj.mittal@intel.com>
Date: Wed, 29 Jan 2020 11:55:30 +0000
In-Reply-To: <da035af4-d1e8-efd9-30fc-19a4f875948b@kontron.de>
References: <20191120192419.7352-1-tom.hochstein@nxp.com>
	<d25ed9e2-6ff8-355a-1de0-8b51aef9e2c8@kontron.de>
	<VE1PR04MB6621F85F190F08F43967C895E2540@VE1PR04MB6621.eurprd04.prod.outlook.com>
	<2f61a2ea-456e-0cf0-7ddf-03a0d9adf72e@kontron.de>
	<da035af4-d1e8-efd9-30fc-19a4f875948b@kontron.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] devtool/standard.py: Allow recipe to disable menuconfig logic
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
X-List-Received-Date: Thu, 30 Jan 2020 13:35:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-29 at 08:20 +0000, Schrempf Frieder wrote:
> On 08.01.20 09:32, Schrempf Frieder wrote:
> > On 13.12.19 17:14, Tom Hochstein wrote:
> > > I made a PR as well:
> > > 
> > > https://github.com/openembedded/openembedded-core/pull/57
> > > 
> > > Tom
> > 
> > I don't think PRs are accepted for oe-core. Your patches should be
> > ok,
> > if someone reviews and applies them.
> > 
> > Dear maintainers, could you consider to review/apply this fix for
> > master/zeus? It fixes an annoying issue when working with devtool
> > and
> > u-boot.
> 
> Ping again.
> 
> Can someone please at least look at these patches or give any reason
> why no one cares about them?

Sorry, the project is struggling with failing automated tests and
struggling to find people able to review patches for some subject
areas.

I don't know devtool very well and its hard for me to say if this is a
good change or if there is some other way we should be fixing this.

Of particular concern is there is no automated testing in this area and
devtool has good tests in general.

Not good answers I know, sorry :(.

I'll add this to -next for wider testing and see if I can find someone
to review.

Cheers,

Richard



