Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id DD3437E719
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 13:56:51 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id w25so177268ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 06:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sGWW8/oKlPbGyYQ8GFRR3IFH57heDQa80oyLm4eP6a0=;
	b=c7YfZi4y89VIZwHeRKLJV83lCUFZP1ZRDYezejBi7im9SBIbzexNPHJecMcQp5ySpm
	kuos4XMqzbflWWPOGqL6H25hSqsYqo7e23Xm/8IP7++UjzoN8/9kXxsI5nCvtEnwykZl
	AlKHjFZHAz5oeOpm+v/8KB3UlCXCGcRt2L/9O94L0QbR8epyq9ePHAFuxgukdmseC+S2
	pTCw8VQHwjCOliGksWXr5TixUewkxZTmUVQ3auU3bHA2YXyfwNZnVjTjm3NiAgdAHWba
	R6M+OtH17JrTUMXzs38iDGJjEnG1/K5b539YBkZDCMc7+3aLOw8HoVcbfXmGGEBpTJQ1
	sntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sGWW8/oKlPbGyYQ8GFRR3IFH57heDQa80oyLm4eP6a0=;
	b=UV+mmJydSivpy4upwqSP7hXDDmY8YZkMhny+DEUiuDcHSu6BiYe1R8o+zTd7mOTETd
	JZsUrMbl6g7Jorj99sq9zCX/vKW8eSsr4ON036/3LiW4AQrDOIKntXIfSkn8ObqirWh5
	au6jweczw5hIvdv9xVO+eZlTWVJJAD63LbXAZ3TBK1rEH8CSbCYebHk1GFRLohConz2C
	FbPkgV6dhwpC0XMIWwO7sNMGFolK46WWFJdqDbV9cJUj1uaAggRqw6n2lVp32TmEMoUL
	b6OanBiywNKJ5aFzqmDCFjGkpQmVe1ZWdorG8uUnkg1KPZ9Pu0Fcu7LEh0hBN9qFwcD2
	zUXQ==
X-Gm-Message-State: APjAAAU6EoayAnYjHoqGtWqfznR1N7FrPdUh2Iq1T8ZG24yE7Zx3BeZO
	Gwh4LqeCERq9MJ5N/6uKRPh06FWJbBbYAtnWYhP0SQ==
X-Google-Smtp-Source: APXvYqzj2y2tPSpihcUr/n6JHVrwHYK5LEN7Ou/B+cXmNfHi12LXWLACvOl3++6oUVOmGsB50mbY7df/Z+Ldd8xNKRc=
X-Received: by 2002:a6b:6611:: with SMTP id a17mr13121918ioc.179.1561039012929;
	Thu, 20 Jun 2019 06:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561018476.git.liezhi.yang@windriver.com>
	<b7589dd06670ead7a2ca7e8c7301b289e2543249.1561018476.git.liezhi.yang@windriver.com>
	<20190620082858.GC27107@localhost>
	<07882a06-4c45-07aa-9696-8de4f86b8c0b@windriver.com>
	<20190620091913.GD27107@localhost>
	<fd9aef39-bbbc-f6ed-e9b2-37009952e3ab@windriver.com>
	<3b30ab5eae1506d44fc9c95543d7ae833018c087.camel@linuxfoundation.org>
In-Reply-To: <3b30ab5eae1506d44fc9c95543d7ae833018c087.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jun 2019 14:56:41 +0100
Message-ID: <CAJTo0Lb3EwnoC28cesYt9BnuKucW_dCp5bangpdYscLgNOZ7_w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] gtk-icon-cache.bbclass: Depends on gtk+3
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
X-List-Received-Date: Thu, 20 Jun 2019 13:56:52 -0000
Content-Type: text/plain; charset="UTF-8"

Why DEPENDS on gtk?  The recipes will typically already do this, but
all this class needs is the rdepends.  Also, there's no explanation
for the hicolor addition.

Ross

On Thu, 20 Jun 2019 at 14:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-06-20 at 17:58 +0800, Robert Yang wrote:
> >
> > On 6/20/19 5:19 PM, Adrian Bunk wrote:
> > > On Thu, Jun 20, 2019 at 04:46:16PM +0800, Robert Yang wrote:
> > > > ...
> > > > Maybe gtk+2 is out of date? Since gtk+4 is on the way, so I think
> > > > that we
> > > > need something like virtual/gtk to fix these problems totally?
> > >
> > > GTK+2 is mostly obsolete.
> > >
> > > I just checked the GTK4 sources, and there it is renamed to
> > > gtk4-update-icon-cache. Based on that I would say that your
> > > patch is actually fine at least for now.
> >
> > Thanks, I updated the commit message in the PULL:
>
> Please resend patches rather than updating the branch as they get lost
> really easily and also don't get reviewed properly this way.
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

