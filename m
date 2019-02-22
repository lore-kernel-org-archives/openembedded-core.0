Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9227CBED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 15:01:35 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d2so2737079qti.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 07:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YYbTNhgdDjeQzRD52KPlR/9JpyPWvQYd8Qpmhfr+1sU=;
	b=f33R+HWGieqn/sftY0OOGRFk9QMEjV5cRXMRPCtT0wpJ+g9VERXxpeJd+dUfBMGE//
	AXKl/JxEuFrWnIsiY7UTFPwzuQCIn5pdJMo3KiDg3taCtWt0wa2e/SFs83rQN81mhtiy
	m9Dkk9REVkFbNvDnooTuZYpjyzyn0CotCiTPj274luXFaxPJVZIt3cxR4uLfIikX4k55
	QVTQyjlEZy3WpumGGTSYtID91WzURDfMKAhjh93l0mEhsLPDX7AfQhqcLTgwSyMHXUN7
	otM58ECGf/10sc6UVwb/w5++1kqtnbaSRpDpfi75wHqa/9eaIX2ITHcPX/flOJ26z1mH
	drFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YYbTNhgdDjeQzRD52KPlR/9JpyPWvQYd8Qpmhfr+1sU=;
	b=TxNUUVyFiGDkaCNOs9BpFxsLKNWmbzU0gZUCWAQg4QF+py21VXdI4+vvqQZLFN2WoX
	S7ejh87sv6WeZdb/VQnBzKzxyBHQWORkbOhjIcVbJODwZ8PyrMZHlLqI62MljZtp2Yfo
	vVsrKp0sZ11cOMQvAHmiMoBsPqbhA1DMAIwrBgCONNWwzMVixOWOmM+6WAoUb/Ei3Rdx
	T9j9cFzNXgbkwpC/i49Ps6MEJ4Qu4POeYoRWr55Ecjfbu4iig4wclSbmrCMTSv4mghQw
	EiHI2KzU5EfloujfFlMbdCWxn9Uw4Jwe2CWiD8AaspF983t5yBGHZ+B3OjV90CAdEl1S
	uIoA==
X-Gm-Message-State: AHQUAuZFYMBNpHy8mU/MYfPpAB/SrZ0SU5nJ6VcURVQKNXzyT+ukH45Q
	sEWSue8tVCte58aXM6+Bg7Jyq2pmQI+jqWjc0NfT5/hr
X-Google-Smtp-Source: AHgI3IYBhLtDhewnEg8AAlCflQblbDISAMDmDAmrRx2Tw84XZFMiFkR9TCcu9h16Rc1v4ZGQ7NETLefp2zKlyULNDmk=
X-Received: by 2002:aed:2268:: with SMTP id o37mr3445173qtc.29.1550847696042; 
	Fri, 22 Feb 2019 07:01:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550755109.git.tanuk@iki.fi>
	<CANNYZj8f0SMDZd3wryCZ0A2=RjLfOAR6q5=bLsV+QgWDakJ_7g@mail.gmail.com>
	<CANNYZj-8euMhvqpAwHoZfofAm=FdCtJSb9i7QOMiTGMhv=322w@mail.gmail.com>
	<236c2e06d12bde612ffa2399cedb9bbfce7dd5dc.camel@iki.fi>
	<CANNYZj-PdeoHukCN7_i8RgZDYRCS3dc3xWDhKXvuienyNzUFVA@mail.gmail.com>
	<CANNYZj85xGjdwMLRc3EzWzyZh6xBc+-GKhM5hwyxf3uXjS5epw@mail.gmail.com>
In-Reply-To: <CANNYZj85xGjdwMLRc3EzWzyZh6xBc+-GKhM5hwyxf3uXjS5epw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Feb 2019 07:01:09 -0800
Message-ID: <CAMKF1soTbbU-ht1A7Pm6NRh8i4r7Lf4UtkVQzBsy7GfUHWd=uw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Tanu Kaskinen <tanuk@iki.fi>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] alsa recipe updates
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
X-List-Received-Date: Fri, 22 Feb 2019 15:01:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 21, 2019 at 10:33 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> ftp://ftp.alsa.org seems inaccessible or unstable:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/70/builds/317/steps/7/logs/step1b
> (also can't open it on my local machine)
> and generally we prefer http:// sources over ftp, if available.
>
> Alsa does have one: https://www.alsa-project.org/files/
>
> so can you please resend with SRC_URIs changed to use it? (also for
> alsa-tools and everywhere where the ftp is currently used)
>
> Alex

seeing this fetch issue building alsa-utils-scripts

ERROR: Fetcher failure for URL:
'https://www.alsa-project.org/files/pub/utils/alsa-utils-scripts-1.1.8.tar.bz2'.
Unable to fetch URL from any source.


>
> On Thu, 21 Feb 2019 at 19:09, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > Bah, and I often point out to people that they should read *my* cover letters :)
> > Thanks!
> >
> > Alex
> >
> > On Thu, 21 Feb 2019 at 17:41, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > >
> > > Richard already sent the update for sbc, so I left it out. As for alsa-
> > > tools, if you read the cover letter in more detail, you'll find the
> > > answer there :) (Spoiler: I'll send it, but it's not ready yet.)
> > >
> > > -- Tanu
> > >
> > > On Thu, 2019-02-21 at 15:57 +0100, Alexander Kanavin wrote:
> > > > (Also sbc needs an update, I think)
> > > >
> > > > Alex
> > > >
> > > >
> > > > On Thu, 21 Feb 2019 at 15:56, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > > > Thanks! Will you be also sending an update to alsa-tools?
> > > > >
> > > > > Alex
> > > > >
> > > > > On Thu, 21 Feb 2019 at 14:34, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > > > The following changes since commit f15ceac287c094abdeda64b03628455d92e0ce74:
> > > > > >
> > > > > >   libdrm: Upgrade 2.4.96 -> 2.4.97 (2019-02-20 21:22:28 +0000)
> > > > > >
> > > > > > are available in the Git repository at:
> > > > > >
> > > > > >   git://git.openembedded.org/openembedded-core-contrib tanuk/updates
> > > > > >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=tanuk/updates
> > > > > >
> > > > > >
> > > > > > The alsa-tools update is missing, because the recipe upgrade deadline is
> > > > > > near and the changes in alsa-tools look like a potential rabbit hole.
> > > > > > I'll send the alsa-tools update separately when it's ready. The main
> > > > > > change in alsa-tools is that the hwmixvolume program got ported from
> > > > > > PyGTK to gobject-introspection, and from GTK2 to GTK3. I doubt anyone
> > > > > > actually is using that program, it's not even built by default.
> > > > > >
> > > > > >
> > > > > > Tanu Kaskinen (3):
> > > > > >   alsa-lib: 1.1.6 -> 1.1.8
> > > > > >   alsa-plugins: 1.1.6 -> 1.1.8
> > > > > >   alsa-utils: 1.1.6 -> 1.1.8
> > > > > >
> > > > > >  .../{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}  |  4 +-
> > > > > >  ...plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} | 84 +++++++++++++++++--
> > > > > >  ...s_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
> > > > > >  ...lsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} | 10 +--
> > > > > >  .../recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb |  2 +-
> > > > > >  5 files changed, 85 insertions(+), 15 deletions(-)
> > > > > >  rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb} (88%)
> > > > > >  rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} (51%)
> > > > > >  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} (100%)
> > > > > >  rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} (92%)
> > > > > >
> > > > > > --
> > > > > > 2.20.1
> > > > > >
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-core mailing list
> > > > > > Openembedded-core@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > --
> > > Tanu
> > >
> > > https://www.patreon.com/tanuk
> > > https://liberapay.com/tanuk
> > >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

