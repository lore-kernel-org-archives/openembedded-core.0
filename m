Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1A9606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:27:46 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id y201so31631124qka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ozroe5yjbSfg+5wYBjfSBOz2l/MMsXA6D+3AdYoy0Os=;
	b=IqaMoo5U6ilNnO/l0wxB+R4gGy5QCuTeZnJdGSwXkobvOys7zFvW67YAxFSXALLTT3
	PFkpC2SK/7mn1h5u22pqKjNLBrl0tAdjtolj7F9GXTAHhfYS3mPYXW4RUW8j5G2LRKUj
	Gn7X4BPxG9Z3zgwyz222TI/B9w0VxbFK4VO3fwOz/5BkqFd+LvSNNuDJ/Ly2XFMVaPde
	tfPwya7OXKhqkoxdPRkJoNGlDpHvls3yAfTngTpbwFIpfat6cGSGzyjw6xaf/ePcyam4
	asQv3VaQ9oNkdI3Pr4p91QyY4DqX/1wUHWm6Qsygsq9WacjkSQwyMU2zqFP8DgsW+nEy
	TL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ozroe5yjbSfg+5wYBjfSBOz2l/MMsXA6D+3AdYoy0Os=;
	b=P3p0CFktjH6nShH92B59iHDlP7lKTBCWpTrxD2VIOe5PaBSbHAQZmsR170PecHLMds
	EQNeGtiT6rjvgJAJOyz6Ezr2ds46dN7Y8DU/HKcjysscOpuPuImiw2ps5aQu7ejWba8q
	4RtdwsTnqcCV/h3nJaPOxDItLyLe9Fmg/n1IRrzUBhGJD6ba7FMXoX7HXsHiPANPrS7d
	axhVEhCsSycH6Q39v2Ri/wHL/g7yvUc/I/Gugp4isbVdOD6iJOSLVS00fD1jvnzW7Vkt
	0LFWO8W3bVKvQzE3SstlS2tDDo9F28usw00RoCy9UQf/3jIi+JrSMLPwXfPLE6GumypE
	fNlg==
X-Gm-Message-State: AODbwcCupnu4miDHXQpQ5LLHDUTY4Mve8m+pwt55ajKIfVyjc2lYKovk
	46aSLPv1zJrFtpDw9YVrzvtNTzO6Y7vM
X-Received: by 10.55.86.66 with SMTP id k63mr494906qkb.46.1496309267849; Thu,
	01 Jun 2017 02:27:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 1 Jun 2017 02:27:27 -0700 (PDT)
In-Reply-To: <1495791114-1419-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1495791114-1419-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Jun 2017 10:27:27 +0100
Message-ID: <CAJTo0LZVhAr0JROGrE6HMG=bOrWFZNhvm5872sn80zPb617aRw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses: 6.0+20161126 -> 6.0+20170408
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
X-List-Received-Date: Thu, 01 Jun 2017 09:27:47 -0000
Content-Type: multipart/alternative; boundary="001a114e72386278b90550e2a68f"

--001a114e72386278b90550e2a68f
Content-Type: text/plain; charset="UTF-8"

On 26 May 2017 at 10:31, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> 1) Upgrade ncurses from 6.0+20161126 to 6.0+20170408.
> 2) Delete patch "fix-cflags-mangle.patch",since it is integrated upstream.
>

As usual, the ncurses upgrade has broke mc:

http://errors.yoctoproject.org/Errors/Details/143477/

I haven't investigate what recipe is to blame, but obviously we can't merge
ncurses unless mc builds.

Ross

--001a114e72386278b90550e2a68f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 May 2017 at 10:31, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-lef=
t-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:273" class=3D"=
gmail-a3s gmail-aXjCH gmail-m15c441ad9a6227fe">1) Upgrade <span class=3D"gm=
ail-il">ncurses</span> from 6.0+20161126 to 6.0+20170408.<br>
2) Delete patch &quot;fix-cflags-mangle.patch&quot;,<wbr>since it is integr=
ated upstream.<br></div></blockquote></div><br>As usual, the ncurses upgrad=
e has broke mc:</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra"><a href=3D"http://errors.yoctoproject.org/Errors/Details/143477/"=
>http://errors.yoctoproject.org/Errors/Details/143477/</a><br></div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I haven&#39;t inve=
stigate what recipe is to blame, but obviously we can&#39;t merge ncurses u=
nless mc builds.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a114e72386278b90550e2a68f--
