Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id EA71362134
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 02:39:54 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id u10so3116780lfm.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 19:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=14xKL99OIKuybXx2RAEMfmGaWoHCyHyjJSvUPpQErxc=;
	b=Vo5vZesLN4qQnjU7sAohCtpDLnKzjtYNGEwzWg5ItpWUN0R697jqFc8esTFbrOPo9f
	w8WCV4cLK7H9A1d2qof6cAAbU8dolN5zkwz+n25z2pZJG2mhrJHWYH9e9QFmQ7rGPPSf
	WL3l2mAJshCsMFeK5fdwOH8OiWEbfyfrII6LFz0JxnTRiJS4X6SfPkF4AkGjYM2UpqPG
	q7g2OHhEafjfIUPVV3YP8yXEmEix8l0Gp6QnYYNVvi7Sf5aaUOCk+V56JlET7+xmgt/F
	vEK07QUQzFweaxwcI5H4pLYikW/TuEJsvzszCjP2mVgeRK4cQYdG67X2XTwFXi4s4NWx
	0i4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=14xKL99OIKuybXx2RAEMfmGaWoHCyHyjJSvUPpQErxc=;
	b=h26nPPnyI1GRhJ1ulv60AfPY75kXZFCzbRAvw0lf4WsQI9wcLeD7qyRYuGzL0k62ly
	UPYhWHJzw+/0nBolRYM9SnobPgqOhbfNEsTzDfVXgT1NleRvR18QCWokwgFL5wmtVbsA
	8HxTGsGGXDZPHHrrpom68wI3QkMuCq1EWmzBlIiovozidR7JeT+arASaLHAaTy4zHHKs
	sXktxyLddX05w614pzYgOQ+u2Ikp+8ecBPp20pMyA/n6MnfkZq0mi477ewGYrfGmvd9R
	/OAuP6AmQwVQkH031maNF2kk3KQB/ayfRC55fnagggjiP4SjmqobDEOARlXy7qVG3jNk
	mjEg==
X-Gm-Message-State: APjAAAX490dbd8MDtAAzVY4Oyrpp3lBiAIj3d1eak2NIA3vNS/1UfM8R
	VYKt39PwITbj3eshSv0zKkbCRpsrPHyXlPBzPzw=
X-Google-Smtp-Source: APXvYqyHLTacuYrlHw/Qi1zYQwz0JXhKzs9sxulogotFXsnLuFRGr/OZIKJt/XXMnRY1AJcpG4R3rSr/akQsRs8V/oU=
X-Received: by 2002:a05:6512:15a:: with SMTP id
	m26mr19158919lfo.71.1562207995324; 
	Wed, 03 Jul 2019 19:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0HgOebmE=uUJ718CBhsXv3bW7WoeXa4dp06LL=vcLd_qg@mail.gmail.com>
	<CAJTo0Lbm1DVcwKFjYBaXWsgzTGLbRRH2aFEzgTi0MAGQXQ4T_w@mail.gmail.com>
In-Reply-To: <CAJTo0Lbm1DVcwKFjYBaXWsgzTGLbRRH2aFEzgTi0MAGQXQ4T_w@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 4 Jul 2019 14:40:03 +1200
Message-ID: <CADySD0E7mwou1DeeTWfjdXh3QjqM9oMDvLsVbkXMrFZCfcgdug@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Problems with sstate-cache in Artifactory
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
X-List-Received-Date: Thu, 04 Jul 2019 02:39:55 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

I can't see any "log.do_setscene" inside the tmp directory.
When I start an image build, it does say executing setscene task but
then no setscene task log for any recipe

Initialising tasks: 100%
|############################################################################################################################################|
Time: 0:00:01
Checking sstate mirror object availability: 100%
|####################################################################################################################|
Time: 0:00:02
Sstate summary: Wanted 484 Found 0 Missed 968 Current 0 (0% match, 0% complete)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks

Regards
Ankur



On Thu, Jul 4, 2019 at 12:04 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Check the log for the a particular setscene task and it will show what
> requests it made, and if they failed.
>
> Ross
>
> On Wed, 3 Jul 2019 at 11:09, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> >
> > Hi,
> >
> > I am trying to setup sstate-cache in Artifactory so that multiple
> > Linux host systems can share it.
> >
> > Once build finished in one Linux machine, I uploaded all of
> > sstate-cache directory to Artifactory
> >
> > Then I configured sstate mirrors in local.conf
> > SSTATE_MIRRORS ?= "\
> > file://.* https://artifactory.com/yocto/sstate-cache/PATH;downloadfilename=PATH
> > \
> > "
> > But when the build started, it didn't used anything from the sstate
> > mirror and ended up building everything
> >
> > Am I missing something?
> >
> > Thanks
> > Ankur
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

