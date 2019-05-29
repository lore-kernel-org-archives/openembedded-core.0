Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E2EB36093F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 12:02:58 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id e19so4168763wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 05:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=WJ9+ZC7GiDvgQWDcc2vOaMUXjS/th9+/IaTiYlVvOgc=;
	b=JdbcwMkShco7NNsAQ3n5CQVrfFTbgAPCUEFZUdFhZz2t7r8PrYLvd8aDbPi7jqrqWd
	qXyWkgCvHbALvPFlXln66dcPztsyioiKtQfa4SfQDS9YG3h0epE1wQ5pLe2RvY0jAC8v
	kdChlXRXHHmLDXuAeCSWPanE2S/319m0G0Yig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WJ9+ZC7GiDvgQWDcc2vOaMUXjS/th9+/IaTiYlVvOgc=;
	b=EKfQgT8rmeqe8VnpE6qpw2rVJT45cptZT2PVEwjFEAE8S4rg4m9SmhZpxwY8NYwSUa
	yyubwuuORCPOZxUZK5ZsmCPm40k01t5PuvhjorSo5T8dRVwdrdjdS/q70Rk7OKHw5Lz8
	c7Ou+UDcDFJE+lW9/3CUIFT19Z07bN5fFoBwPkHiJyi58A2zdLzZ69aNAXbRX2W6VLiU
	ubL0544Ope/KLzOE8rv91gHnNunEE71GhBAQIMQcErwQz+7rwp5nMZ0dITjzzGz/dY1X
	oZuxxcV+cqP7KCjcYjQ/44n34fBI+4noSdB8pWS8XFFLK2ZSh6WfuuO6IEXSaQScpncW
	ogqA==
X-Gm-Message-State: APjAAAUjKjPFzMO6B9tE32/m3FFSZe3I3tSrgi7AqoxF5UtBNYccWyXc
	RXw+6Nr8rzdgRhDiGnHN18D6fA==
X-Google-Smtp-Source: APXvYqxvk+Dotu58e7G/Gnp2B7Wg0x7PdomalP8Y5mTutf6PdkHscS0Z84xfu7aeGtpkPPNkfcnp+Q==
X-Received: by 2002:a7b:cc0d:: with SMTP id f13mr7152686wmh.1.1559131374096;
	Wed, 29 May 2019 05:02:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j123sm9260247wmb.32.2019.05.29.05.02.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 29 May 2019 05:02:53 -0700 (PDT)
Message-ID: <4cfe4f8b320613893837b923d1a9df64f2eaf1c0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 13:02:51 +0100
In-Reply-To: <b824eb18-6876-06ed-5246-65d9e671dd9e@windriver.com>
References: <1559016116-139663-1-git-send-email-changqing.li@windriver.com>
	<1559016116-139663-4-git-send-email-changqing.li@windriver.com>
	<df74915db04e0cdf9648a95e23435db3c8aa4684.camel@linuxfoundation.org>
	<b824eb18-6876-06ed-5246-65d9e671dd9e@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] bootchart2: add initscripts-functions as rconflict
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
X-List-Received-Date: Wed, 29 May 2019 12:02:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-29 at 10:45 +0800, Changqing Li wrote:
> On 5/29/19 7:13 AM, Richard Purdie wrote:
> > On Tue, 2019-05-28 at 12:01 +0800, changqing.li@windriver.com
> > wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > > 
> > > bootchart2 rdepend on lsb, lsb rdepend on lsbinitscripts,
> > > lsbinitscripts rconflict with initscripts-functions. so also add
> > > rconflict for this one.
> > > 
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > >   meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta/recipes-
> > > devtools/bootchart2/bootchart2_0.14.8.bb
> > > b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
> > > index 396d0ec..36092e6 100644
> > > --- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
> > > +++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
> > > @@ -143,6 +143,7 @@ RDEPENDS_pybootchartgui = "python3-pycairo
> > > python3-compression python3-image pyt
> > >   RDEPENDS_${PN}_class-target += "${@bb.utils.contains('DISTRO_FE
> > > ATURE
> > > S', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
> > >   RDEPENDS_${PN}_class-target += "lsb"
> > >   DEPENDS_append_class-native = " python3-pycairo-native"
> > > +RCONFLICTS_${PN}_class-target = "initscripts-functions"
> > If lsb and initscripts-functions have the conflict, why do we need
> > this in bootchart2 as well?
> 
> Yes,  this is wrong for indirect rconflict,  especially that, this
> maybe 
> break someday when lsb changed.  Same as lsb/lsbtest in patch  4/5
> and 5/5.
> 
> 
> For patch 1/5, 2/5,  it is direct rconflict.  It will also report 
> rconflict during do_rootfs when both are  installed  if only one
> package 
> set rconflict.
> 
> but I think it is better to set rconflict for both packages, in this 
> way,  when user parse the recipe to get the recipe info, it can get  
> this rconflict info.

We only want to list direct conflicts, not indirect ones. If we tried
to map all indirect conflicts we'd have something totally
unmaintainable, it wouldn't scale.

Cheers,

Richard




