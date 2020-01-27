Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA687CE21;
	Mon, 27 Jan 2020 15:24:31 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id v25so7630241qto.7;
	Mon, 27 Jan 2020 07:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h1mouvd9/RJwWfqGWF0+j60MOS84mirMZtzSN+xpesg=;
	b=qH5NipV5H7hPVm5HGdo6HNSf+YxQO1Qo6Z9pbvvbvYrrUyijh0OMAiNx7uG/MgDo2G
	nRJJN6f8R0zdsSGvRYPYN0mZC5ma1GUIRhfvUSyIo7CBdV/4PnB5wa+z907wZ/VHA/V8
	ZEAnHLY8/vGsux6U/qULzd+QKG5ZDea6tXvUi1vTpyooi/s5lJH4HOQVYaMj9iv8xeqr
	OIeVzkAJ8UmH8EHoXXh/+YaEdN+O+fFMBcJKvvN+kyeIz4bocRFWazHHgPlH2GnFIHmO
	DTUsnFVy0KjirAOpVB/naTW5KfCoPziwY4uovua0wM0kq0fPm71zPR0SaTgbQ4mex9Tb
	XmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h1mouvd9/RJwWfqGWF0+j60MOS84mirMZtzSN+xpesg=;
	b=UmimnBdTNn2P8SlLf0Ffaw2UcaVcKIMQEBUmfmTeIFa2JPLcV/wppMEy70LSMhdj7e
	aB/AIQV5hkeuvY1zGxEELMyGT1Wp5pIT+jEU7M/0r/aooKRYshBmPTxNW52aH2mt5Fux
	zqatXmrqj5amkZP9+cHQ2SpvjYGtWfVVBxpy1RT1TI1V6VODEpTdJhS8AT2qM7S9wjlt
	QFI/SqGbCL4cibqVB2jp9cgJmox6Z6jsmGkQtECiGT/MMe0NRADCl/aOXrZMQNj5YJQ9
	dYN/aD7T+sQVXovG//csruS4G7boKKE8W6R6F9WIsE2uf7oux8WilsW6aXbHzgndmNBA
	dj2w==
X-Gm-Message-State: APjAAAWcdlrCDPtp6JtK3awPb6/Yc+4DkRucUcMVyP3NAnT83avjPFSC
	IYJRQ/1+R0m+51Wue/uJs9yxl+FQCSNvkuH4vh4=
X-Google-Smtp-Source: APXvYqzVZny+m1R27nwsfHX0GZXJYH9NIdR3rsBNxqnIZ+FKAwp51PNvHTaJTfUnJezNExNRZBNxnDyOBejf07gYW3U=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr15377661qtn.378.1580138671723;
	Mon, 27 Jan 2020 07:24:31 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
	<CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
	<24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
	<CAHtQpK4O1eDuq8EcNcFgLasY_PE-_WtzWYA6pOVE9NFQkBbTxg@mail.gmail.com>
In-Reply-To: <CAHtQpK4O1eDuq8EcNcFgLasY_PE-_WtzWYA6pOVE9NFQkBbTxg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2020 07:24:13 -0800
Message-ID: <CAMKF1sqK8kdDdJry4+fp5bJvbUwwPo0SY8VJtpiDhY3y-e7PJg@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 Jan 2020 15:24:31 -0000
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks for the help!

On Mon, Jan 27, 2020 at 2:51 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hello Raj,
>
> On Fri, Jan 24, 2020 at 8:27 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On 1/20/20 8:51 AM, Andrey Zhizhikin wrote:
> > > On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >> Hi all
> > >>
> > >> Recently py2 is removed from oe-core, So I did quick patches to get a
> > >> world build going. And
> > >> here are initial failures, please help out with recipes your can or
> > >> care for. Eventually, the remaining
> > >> ones we can blacklist for 3.1 release.
> > >>
> > >> http://errors.yoctoproject.org/Errors/Build/97185/
> > >>
> > >> I will post more arches as they become available. If you want to try
> > >> the same for machines/distros you can try yoe/mut for meta-oe
> > >
> > > I've actually asked Ross about similar failures, specifically in
> > > [meta-openembeeded/meta-python] where there is a good mix of Pytho2
> > > and Python3 still present. I've started to remove those yesterday, and
> > > would continue with that layer further.
> > >
> > >>
> > >> https://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut
> > >>
> >
> > All these changes are now in master and its again buildable, with or
> > without meta-python2, with meta-python2, its back to where it was with
> > everything  building however, without py2 layer we have some work to do
> > so if you are interested in this here [1] is initial list of failures
> > I will keep posting more as we go along.
> >
>
> Thanks a lot for the update! I've actually saw this in the master
> before this mail and went ahead with pulling the latest - my builds
> for i.MX8M series went fine.
>
> I'd also have a look at remaining things and try to fix some of those
> as I'll progress.
>
> > [1]
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/220/steps/8/logs/errors
>
> --
> Regards,
> Andrey.

