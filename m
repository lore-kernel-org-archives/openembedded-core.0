Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D8A66608DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 19:38:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t3so25403824wru.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 11:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PzMiZ29ae+KFl53fMHnDwpT88iI0Vhj2w58XMZC2Otc=;
	b=A7qNBq2bH5LjGowu5lyzj8iqSDVBAEFX+5+Y6/9LAs2Se0EMjf2WOMUHGDYWDaseGl
	cahsW9ZSD9hhCM+8S7qz/Y68k6W65DE3BYNt2V/o6h5SJMsWk8vWvqb1f/Bvmoqng1Oa
	5pRIrPsOxelaQQTpkbTB4vdvU/jbavdZ7e/bTIUuhJKqppGCQrmkTsn+cTS/doFQ6eUs
	/tZn965EhQ84No5pFrizLVObDisymbULna6aXnW0kCt0ElKiODrArZIic41nwqGBRrpa
	rkXtpj7NrvI9+kRgo4BZBdeejtE7J1RmGliIZwlzIehojtt6GaYr0KCsoER2ORQLPA/9
	PFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PzMiZ29ae+KFl53fMHnDwpT88iI0Vhj2w58XMZC2Otc=;
	b=l4X37lPWJPLeZPVieD81KOdepG2Le37twRV5LXHmf9/PfQEX872tlO9zqNVS9hIDK5
	F+1oni+2hm+7W4wMPtc93o0C6VIV1Ol1+tWDPZMvEHDrfIyEPPciW8CspkNnLXriXVoX
	T+PFTAxITPF/2LmSK+0xx4kpe9s8ctOMBl/QCXCZc4+oyYmOq7Re2qq5UON2R+dSy4dI
	CBGM4NWzNofS2Rfq1e5EIoa0ES5A4xIEYhcYG7++09iZpfT3AmDe7Fjg9nzeuggdWQzj
	Qujqec1knMjAEzPclilZpErcwTJeyKHdvKtVp6XIpGQ8PzkopOQyekyIO7TOXqCxj7ok
	UkGw==
X-Gm-Message-State: APjAAAWsFEcyIxyZ3eFMLau89156fwMTFoWx7uqci4ALeSrRnwOLhIdt
	JCP1atqmKNHATghoVEF6QIbycRu3ky2bEgZ61s1m2g==
X-Google-Smtp-Source: APXvYqw/dR2WezcoohU9TvihMn6NWTtjUdWlupIPkYbj1Ua7meaqnBvCkTMb8J4SeBMr9/GB2RsQZQKSFAuebe4eFMs=
X-Received: by 2002:a5d:614a:: with SMTP id y10mr32102830wrt.73.1582054738333; 
	Tue, 18 Feb 2020 11:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20200206075334.835418-1-anuj.mittal@intel.com>
	<b7ce05ce-aaf7-068c-ab42-235f8844350c@mailbox.org>
	<265ac69eb8eb8d129d9f66f6d037d44242c42e57.camel@intel.com>
In-Reply-To: <265ac69eb8eb8d129d9f66f6d037d44242c42e57.camel@intel.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Tue, 18 Feb 2020 20:38:47 +0100
Message-ID: <CAHtQpK4+EFeB7aY8T5TJAM_esBV3C+rL1Ai+Un_mGTBXWAhi4A@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-good: change EXTRA_OECONF -> EXTRA_OEMESON
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
X-List-Received-Date: Tue, 18 Feb 2020 19:38:58 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Anuj,

On Fri, Feb 7, 2020 at 5:15 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Thu, 2020-02-06 at 12:41 +0100, Carlos Rafael Giani wrote:
> > Shouldn't this be split into two commits, one that fixes
> > EXTRA_OECONF,
> > and one that fixes the qt5 support?
> >
> > Also, are we sure that meson's qt5 moc/rcc/uic autodetection won't
> > cause
> > any problems in OE?
> > Typically, we disable such "automagical" detections to ensure
> > deterministic builds.
>
> Right. I will send v2 and keep it disabled explicitly.

Just a gentle ping: Is there any follow-up on this patch(es)?

>
> Thanks,
>
> Anuj
>
> >
> > On 06.02.20 08:53, Anuj Mittal wrote:
> > > Use the correct variable so options actually get used.
> > >
> > > qt5 support is currently automagically detected with meson and
> > > having an
> > > explicit disabled doesn't do anything. Remove it so it can be
> > > handled
> > > in qt layer with appropriate DEPENDS added.
> > >
> > > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > > ---
> > >   .../gstreamer/gstreamer1.0-plugins-good_1.16.1.bb          | 7
> > > +++----
> > >   1 file changed, 3 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> > > plugins-good_1.16.1.bb b/meta/recipes-
> > > multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
> > > index a6eb9986dd..e78162172a 100644
> > > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > > good_1.16.1.bb
> > > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > > good_1.16.1.bb
> > > @@ -50,12 +50,12 @@ PACKAGECONFIG[vpx]        = "-Dvpx=enabled,-
> > > Dvpx=disabled,libvpx"
> > >   PACKAGECONFIG[wavpack]    = "-Dwavpack=enabled,-
> > > Dwavpack=disabled,wavpack"
> > >   PACKAGECONFIG[x11]        =
> > > "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
> > >
> > > -# qt5 support is disabled, because it is not present in OE core,
> > > and requires more work than
> > > -# just adding a packageconfig (it requires access to moc, uic,
> > > rcc, and qmake paths).
> > > +# qt5 support is disabled by default unless dependencies are
> > > present. Enabling it requires
> > > +# more work than just adding a packageconfig (it requires access
> > > to moc, uic, rcc, and qmake paths).
> > >   # This is better done in a separate qt5 layer (which then should
> > > add a "qt5" packageconfig
> > >   # in a gstreamer1.0-plugins-good bbappend).
> > >
> > > -EXTRA_OECONF += " \
> > > +EXTRA_OEMESON += " \
> > >       -Daalib=disabled \
> > >       -Ddirectsound=disabled \
> > >       -Ddv=disabled \
> > > @@ -64,7 +64,6 @@ EXTRA_OECONF += " \
> > >       -Doss4=disabled \
> > >       -Dosxaudio=disabled \
> > >       -Dosxvideo=disabled \
> > > -    -Dqt=disabled \
> > >       -Dshout2=disabled \
> > >       -Dtwolame=disabled \
> > >       -Dwaveform=disabled \
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
Regards,
Andrey.

