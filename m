Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 313F27DE42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 22:08:58 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b18so406482wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 15:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=pxUkZ+qIqfifR/t0Yqc8pb3BujRx4ZzLbN+si8xs7DE=;
	b=Yd5xhbMCvk2OpP+nu9fpxEG8v2k1WXPtLoFXilW911uqvO0yk618cSw+GBCaqgqbR0
	7o3MfxkP2x58MeI9N1lY0OBBPWJF5/7aGifuKZXVZoucSt16Htc9MxyDhbgiVFYAw6xh
	x+8fFRsFQx1MO1/Nizyq4rQU12LDrDEG09z82KAfTeUKAPieVgojB6hhXcC2bLxYNhUA
	Cq31pkxncm8n/GdMTImBwAz+ihJHJaxIIhdjuXLV+nMNJaevhwl939S1wFvylI+oxxFZ
	u5YOXr6W/qWn0GMtmC2On1g9lqckW79FoHW1Exx3rtWrNxTJuY3rt8fat+awTkb/lez0
	x+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pxUkZ+qIqfifR/t0Yqc8pb3BujRx4ZzLbN+si8xs7DE=;
	b=ZW461e9eRRZKsmJvZW516T3y7k6CI6a7pKr1AINuBtZIuLuT07UN9dp0//0Ay4Qyzb
	ITmfunKgsOuZFSj9m2+DaPChhlrInnk2Iyxg4h3U3GNCFxhGswt5zOKwxBmoyh326Jur
	HMgbZ0I3k8/I628S+8iGlO8Sft+pe/SK0D655tr/kIpAlg8WlsoOTkNJ+/zG0NPKLeQz
	hfLvYRDiXwDQDa8mIjnf1q+Tar03nkzqRSnKjRZOfyFjHg6KGjR+u7cxhr5XG9Ax0PPf
	a6gm2eJQ0jCTygxcxk5j6LEGQ0GwEPVTmRXa0GQoD8IGvPMU0mYVH9ohoVzd5Ph7X4uq
	Agqg==
X-Gm-Message-State: APjAAAXvo8lwdjQcriy/ZIm9wFjqPPSQRYYB6sPVMwpHHc3RPSJScj/5
	Sb236AM9qrUSHw2E4/bZOfA=
X-Google-Smtp-Source: APXvYqyYmVvXt2DuCo+yBgmw3LkhGRpLCzXwmc/2VHYprdiQ9qvV5mDdzpfCnWglwSpWdiHAGghn0g==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr24269899wrq.10.1557871738730; 
	Tue, 14 May 2019 15:08:58 -0700 (PDT)
Received: from bluca-lenovo ([88.98.246.218])
	by smtp.gmail.com with ESMTPSA id r2sm154798wrr.65.2019.05.14.15.08.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 14 May 2019 15:08:57 -0700 (PDT)
Message-ID: <ea4d1117ec424ad77c0ee5c88bcdb31115cb8d68.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 May 2019 23:08:56 +0100
In-Reply-To: <CAMKF1so-_bkEVm7cze8tdy9xhY6PE0H3uWRjEaB1+j02T4eg8g@mail.gmail.com>
References: <20190509214007.13927-1-luca.boccassi@gmail.com>
	<20190510120932.29765-1-luca.boccassi@gmail.com>
	<CAMKF1spVZzywgp8PE3OuZ+x60tkyXgHCD3QpDfMfkVFefEMZrw@mail.gmail.com>
	<41ac4abea0dd66e99d21bdda69acd08ef81807e7.camel@gmail.com>
	<CAMKF1so-_bkEVm7cze8tdy9xhY6PE0H3uWRjEaB1+j02T4eg8g@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: enable portabled by default
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
X-List-Received-Date: Tue, 14 May 2019 22:08:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-13 at 08:24 -0700, Khem Raj wrote:
> 
> 
> On Mon, May 13, 2019 at 3:10 AM Luca Boccassi <
> luca.boccassi@gmail.com> wrote:
> > On Fri, 2019-05-10 at 09:45 -0700, Khem Raj wrote:
> > > On Fri, May 10, 2019 at 5:10 AM <
> > > luca.boccassi@gmail.com
> > > > wrote:
> > > > From: Luca Boccassi <
> > > > luca.boccassi@microsoft.com
> > > > >
> > > > 
> > > > portable services have been declared production ready with
> > v241, so
> > > > enable
> > > > by default and install the files in the main package.
> > > > 
> > > 
> > > what is the rationale to enable it by default ?
> > 
> > Hi,
> > 
> > commit ada8a5d9175b disabled it by default because it was
> > experimental:
> > "Add a new PACKAGECONFIG item 'portabled'. Default to disable it
> > because it's still experimental, according to the announcement
> > letter."
> > 
> > Now it's been declared as stable by upstream, and also given
> > machined
> > and nspawn are enabled by default I don't see a reason why this
> > shouldn't be as well, as they all provide the same "kind" of
> > feature/functionality, albeit on a different level.
> > 
> 
> Ok being stable is a good thing I agree but I still fail to
> understand why make it default I am for disabling nspawn and machined
> as well

Simply that as long as nspawn and machined are enabled by default,
there's no reason to do something different for portable services, in
my opinion. At the moment they are enabled, hence this patch.

> > > > Signed-off-by: Luca Boccassi <
> > > > luca.boccassi@microsoft.com
> > > > >
> > > > ---
> > > > v2: Just enable by default, and let the files be installed in
> > the
> > > > main package
> > > >     as requested by reviewers.
> > > > 
> > > >  meta/recipes-core/systemd/systemd_242.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/meta/recipes-core/systemd/systemd_242.bb
> > > > b/meta/recipes-core/systemd/systemd_242.bb
> > > > index 73e03c7a77..f15d125bf8 100644
> > > > --- a/meta/recipes-core/systemd/systemd_242.bb
> > > > +++ b/meta/recipes-core/systemd/systemd_242.bb
> > > > @@ -81,6 +81,7 @@ PACKAGECONFIG ??= " \
> > > >      nss \
> > > >      nss-mymachines \
> > > >      nss-resolve \
> > > > +    portabled \
> > > >      quotacheck \
> > > >      randomseed \
> > > >      resolved \
> > > > --
> > > > 2.20.1
> > > > 
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > 
> > > > 
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > > 
> 
> 
-- 
Kind regards,
Luca Boccassi


