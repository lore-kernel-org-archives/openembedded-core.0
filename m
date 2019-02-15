Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE417C71C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 10:20:00 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b3so15682840otp.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 02:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mcuC2TNubYQxKtKvxOw8IDH0cgchevoJDDuhu5XYyyQ=;
	b=Fh+JJ71IEUGAzbaHwOhF2B1tadvxsM5PtUUvVW4a9AE28i92bOlYKXU6leVl8rTLnC
	XeFI3WbSxUmoCl5rVwqnOv2emJQzwIooToqRzUSh0pFnKBEzM9/y7O5lYO0mKsQHhSyN
	JpRA39lra8EKYDRhxZGwWtZNYg2VpHHbhG9sQ8t3VFJ3S8Zp6PvZqeyS1mn2HrfUTEG0
	oSGCepvFUGaqcG4ejfEa13pU7ShVVXcJl0BTfYLGKwdlRzzUyA+ZBfXwvpoIgebBYzU0
	Re6QyNrcuKjJrGC/TEBY6we23pSMUgrMfGcjVm3WGl/u2dcEJJ97sWluBbvXDcYth/Z1
	U5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mcuC2TNubYQxKtKvxOw8IDH0cgchevoJDDuhu5XYyyQ=;
	b=KEvACYzW4hNBgSO8FA2cqpAXcOnThSLbZdgtfqa0X73nQk3P8fYoU02RR+aUKG5TSB
	7rI2OWscS9HiOudydgoD+0snkVBxY70zuxYp2MSnw8Xj4vfSqYISfgWsb2MP238hZJ84
	oA1hjysDXgWrmm7hxtv9fF0hgw0V5gL30K4dXfdJUJg3ydA2h1W04c+8rqrVgnSpnUGg
	kh2ALsMLZT7l45qNDLpLIGQBeDav3mnEw25jMIU2N04O8XiqA8exhbtd4TKI9fsv/xgc
	lL5lZ/oLns8B4Qq7aLVUQJQtQAw24Eu09cfAdrTM6CB3hZQp/Spt0wQkY5EzLvE2TQjh
	ubAg==
X-Gm-Message-State: AHQUAuZUHF2NQlrVyQ18eXHqpoOnsCtHS3BkDVmoU5S0XTq/MSQZmfPn
	GMUP8zRY13AoUubpTiXyqXgeBBcdZR6+mqDY6Pc=
X-Google-Smtp-Source: AHgI3IadAJMjIln6UF/faj+f4wvKSnjF97Rus01lvW2ZqmeVZRq4N54dakNlEh77PnvQ4noVwVfvakw2ErG0HUyQCH8=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr5235023otl.12.1550226002137; 
	Fri, 15 Feb 2019 02:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20190215073207.30036-1-anuj.mittal@intel.com>
	<20190215073207.30036-2-anuj.mittal@intel.com>
	<b4ef5c60f8cbd104d635965b7e2243734e356cc3.camel@linuxfoundation.org>
In-Reply-To: <b4ef5c60f8cbd104d635965b7e2243734e356cc3.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Feb 2019 11:19:50 +0100
Message-ID: <CANNYZj8yHH4h8Ozw4iUHncw5P5H9iMUVzFbtagG6Vfr4f53dSg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 10:20:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Feb 2019 at 10:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > * For changes, see:
> > https://www.mesa3d.org/relnotes/18.3.3.html
> >
> > * Convert from using autotools to meson and get rid of unnecessary
> > patches.
> >
> > * Include a patch to fix detection of host os combinations that we
> > build
> > for.
> >
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>
> This is good but I think you and Alex may need to work together to sort
> out mesa-native which fails after this patchset and is needed by the
> virtgl work (queued in -next).
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/221

Thanks, I'll take Anuj's patch and see what needs to be changed in it.

Alex

