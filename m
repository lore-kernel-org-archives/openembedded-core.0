Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 65C7F7F61C;
	Mon, 27 Jan 2020 18:06:09 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d5so8115343qto.0;
	Mon, 27 Jan 2020 10:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O+7H3LVmMZMkISpEnfGQRVH7m4+6JHwVAv83qTxYujU=;
	b=XQZkFm2JVWCVE/SyUXndce1tRfpww9Q3wB8F05EgfVCm6lh45ZJFsJgf8P2e89RriF
	+qFfFQsjaBa+4RwCHiR+QQfMSrDFcoZdqTbmEvuYqXIb0h3S57wA68Yt66eBhaxZM48C
	kKdri2v6eRDpIiwzILFtZxmul/6GJZRreVODERxsxuIvzW1V65r+2ELBy2GuzBpTRqIh
	pwSlMqBrLhGLVzvc55Lp/Raqkn7A5X6unRfYx5K1+Qksn/kflty/C/PLvw77E+Kimxtz
	AGQ+AbxJwJr94jZL24X1pdL5i/VqC8fbkklX2GWhpk+iO9ja9/0zQEkzH4zAMkiBMhmY
	sunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O+7H3LVmMZMkISpEnfGQRVH7m4+6JHwVAv83qTxYujU=;
	b=su0gHZZI1XiWyVkQcsNOryJe4H/kCQK/klRC1/lC6H9ykgDMGVfYwsSwwaZ0SHeqHr
	rfrYHq4+ATSSpiOCkmyoPa87U7Panheysw65xPVsIiWaGYZICEZbidjOUg1ci9Z7R3gV
	yhcjxNjsMn6EX2ss1ULS6xbwoK+EDBY4cJ04a/C1V33BNVKRvcmB/zRjriCnM+jTVLtj
	W6EJC8benZYfrTxL7TvSNOMHN4/m1335IxmGbr4gp/A9kCTgBaO7r4DtI7fbDT5FjGDA
	9ken/qfe+H9m39B04QnFyX2EJ74d8xIpX4+ve0Pl5k8kuy9f7nm35dr9gcYBVnqnzVaf
	9tkQ==
X-Gm-Message-State: APjAAAWaj2z4+sYxbhIe3WaTRuPV2ZCivnTk+m49+66HMN0UfcO3rg8V
	gXBH8zDrz14AL3y2AhTSaIkMPFeVph9it2iL3prl9KHv
X-Google-Smtp-Source: APXvYqzQzwcUImCfTdaeO1M08389Nw03XF519l8Mx5x8Mf587KbiGZ5xz99SMVAMNzCx03wVgO0Znc9omN5mD/0XD1k=
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr16499085qtj.80.1580148369836; 
	Mon, 27 Jan 2020 10:06:09 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
	<CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
	<24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
	<CAHtQpK4O1eDuq8EcNcFgLasY_PE-_WtzWYA6pOVE9NFQkBbTxg@mail.gmail.com>
	<CAMKF1sqK8kdDdJry4+fp5bJvbUwwPo0SY8VJtpiDhY3y-e7PJg@mail.gmail.com>
	<CAHtQpK4P3nxZPhWC0T84016toXJ5SoEnH1xuyw94jQCjXWV7Bg@mail.gmail.com>
In-Reply-To: <CAHtQpK4P3nxZPhWC0T84016toXJ5SoEnH1xuyw94jQCjXWV7Bg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2020 10:05:43 -0800
Message-ID: <CAMKF1spddmi=Sk55Dyb_eS6m6cwa1M_bBfzyqcyn6y_RG7r6wA@mail.gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: python2-less meta-openembedded build results
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
X-List-Received-Date: Mon, 27 Jan 2020 18:06:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 8:54 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> On Mon, Jan 27, 2020 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Awesome, thanks for the help!
>
> No probs!
>
> I've actually looked into the list and would have couple of
> components, which are sort-of "python2-only":
> - dnssec-conf: did not receive any update since 9(!) years, written
> totally in python2. Should this be bumped up of bumped out of
> [oe-core]?

yes meta-python2 is a good place for them if they are primarily
written in python, otherwise retire or blacklist them

> - mozjs: this one pulls the most of dependencies and produces the most
> of errors. It's version is also quite old (60.9.0esr), and there is a
> lot of python2-only code inside. Should this one be bumped out? Latest
> ESR version available upstream is
> 68.4.2esr [1], dated 01/20/2020
>

Andreas is working on it IIRC, we have updated to latest 60.x ESR
but perhaps 68.x might be a path if it addresses py3 migration.

> For some other recipes I would send out the patch series later today.
>

thanks

> [1]: https://archive.mozilla.org/pub/firefox/releases/68.4.2esr/source/
>
> >
> > On Mon, Jan 27, 2020 at 2:51 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > >
> > > Hello Raj,
> > >
> > > On Fri, Jan 24, 2020 at 8:27 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On 1/20/20 8:51 AM, Andrey Zhizhikin wrote:
> > > > > On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > >>
> > > > >> Hi all
> > > > >>
> > > > >> Recently py2 is removed from oe-core, So I did quick patches to get a
> > > > >> world build going. And
> > > > >> here are initial failures, please help out with recipes your can or
> > > > >> care for. Eventually, the remaining
> > > > >> ones we can blacklist for 3.1 release.
> > > > >>
> > > > >> http://errors.yoctoproject.org/Errors/Build/97185/
> > > > >>
> > > > >> I will post more arches as they become available. If you want to try
> > > > >> the same for machines/distros you can try yoe/mut for meta-oe
> > > > >
> > > > > I've actually asked Ross about similar failures, specifically in
> > > > > [meta-openembeeded/meta-python] where there is a good mix of Pytho2
> > > > > and Python3 still present. I've started to remove those yesterday, and
> > > > > would continue with that layer further.
> > > > >
> > > > >>
> > > > >> https://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut
> > > > >>
> > > >
> > > > All these changes are now in master and its again buildable, with or
> > > > without meta-python2, with meta-python2, its back to where it was with
> > > > everything  building however, without py2 layer we have some work to do
> > > > so if you are interested in this here [1] is initial list of failures
> > > > I will keep posting more as we go along.
> > > >
> > >
> > > Thanks a lot for the update! I've actually saw this in the master
> > > before this mail and went ahead with pulling the latest - my builds
> > > for i.MX8M series went fine.
> > >
> > > I'd also have a look at remaining things and try to fix some of those
> > > as I'll progress.
> > >
> > > > [1]
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/220/steps/8/logs/errors
> > >
> > > --
> > > Regards,
> > > Andrey.
>
>
>
> --
> Regards,
> Andrey.

