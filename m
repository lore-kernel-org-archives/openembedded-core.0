Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 15B3879547
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 21:18:07 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id c10so1844375vsk.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 14:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e5Wmza/qSTTrdrcTBpkRR4oI8Dd0FgseZlc6OVMX30E=;
	b=MOItoCcHMlHWc79UDlQuUpAD26tF6dRWhQ0zoAq0WVpSRUILkPP4l/Pztoa69Im5mF
	39SDWAuYzb5Vnal8aGIIuR9QZJwOxukYNl6fCi+Z17QwKa5pzHLYj2mk8LHCszwwyhc0
	Iw2T4XolRC3WArjsWQHDZ9QXxys1dklVd8uX15rG6zW/1EPZAH/QU6hrU/YGSaLwV1Yh
	O8IIJI1IpQTI4LwB/EmQs3ET4qRcUYBnF1UnaG4qspDejGoECTEkXgUfvi48gg4GCo1o
	dmtufaXNZoMGgZyXTIqGloYJaIvlsFlMklomdc4S/FGhdWIljsP25bupkMoxQgePuOPS
	G7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e5Wmza/qSTTrdrcTBpkRR4oI8Dd0FgseZlc6OVMX30E=;
	b=NNG7HCOKpdnyaEh/Y9f8Gl9FGk6mRYjkatsnoZ23Cx1xGBmPLQcGU3AxmqjS5UCZ9A
	Ppf108OpSquXk5TSVOsZ15rGov7Ki7IX8uFWwd/9U8xQ6AJGm9BILeGFURUaG7y1ILcO
	n55sv0+W5MfRX81dO7BRXlMeyHcBhzWZiPWSuyRK1a//8eeOFLM3J30TjuAZW8fpYSsV
	U9Mt8jDEsS8X8tATXLSrwtHySl6sUdTzw1QOokB5jrqYrgj3r0Qrcy8KJgQ0YTUoJDTJ
	JgXDnQtDueSUg5/GOjVtHdAvVnZ2i0Xprvy0L+2XrBimSSczMAhUsrKFeY3AJvYPkq9d
	Byxg==
X-Gm-Message-State: ABuFfoinsGJX9SGKFuoMGaAmsVPe63X2G3EPFyYrIodneXAqfqYul/vW
	xXnzHvQijw9nYl50LiEAXS/lIvelGADvXotIh50=
X-Google-Smtp-Source: ACcGV62+EIXYz46Wj0E5shqONLeVeEQdZHX4D1DnqprE8oJqUrIhkiOpNN/cJgN8PjS0LgUXg9OI4yHKk43G9xvS13w=
X-Received: by 2002:a67:7344:: with SMTP id o65mr21639351vsc.223.1540329488819;
	Tue, 23 Oct 2018 14:18:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2914:0:0:0:0:0 with HTTP; Tue, 23 Oct 2018 14:18:08
	-0700 (PDT)
In-Reply-To: <CAJ86T=XB+UgGZvW71x0QHb6QzwadMejBDOLEh+q0yjwO-q3yGg@mail.gmail.com>
References: <1529088192-991-1-git-send-email-armccurdy@gmail.com>
	<9be8087a3d586dd5d372954ddae61db388e39011.camel@linuxfoundation.org>
	<CAJ86T=XB+UgGZvW71x0QHb6QzwadMejBDOLEh+q0yjwO-q3yGg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 23 Oct 2018 14:18:08 -0700
Message-ID: <CAJ86T=Ww84U3V5Oghro9Pxz93KHcsOan_wmrTEu8=O9A83esjQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: drop FETCHCMD, GITDIR, etc fetcher over-rides
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
X-List-Received-Date: Tue, 23 Oct 2018 21:18:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 3:12 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Fri, Jun 15, 2018 at 2:58 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2018-06-15 at 11:43 -0700, Andre McCurdy wrote:
>>> Following recent updates to the bitbake, the fetchers should now all
>>> contain safe and correct defaults for the subdirectory within DL_DIR
>>> to use and the base fetch command to run. It's no longer necessary
>>> for bitbake.conf to specify these values.
>>>
>>> This is cleanup which was originally proposed in 2012:
>>>
>>>   http://lists.openembedded.org/pipermail/openembedded-core/2012-July
>>> /064224.html
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta/conf/bitbake.conf | 12 ------------
>>>  1 file changed, 12 deletions(-)
>>>
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index 3b2ef9f..8588684 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -349,12 +349,6 @@ CACHE = "${TMPDIR}/cache${@['', '/' +
>>> str(d.getVar('MACHINE'))][bool(d.getVar('M
>>>  # The persistent cache should be shared by all builds
>>>  PERSISTENT_DIR = "${TOPDIR}/cache"
>>>  LOG_DIR = "${TMPDIR}/log"
>>> -CO_DIR = "${DL_DIR}"
>>> -CVSDIR = "${CO_DIR}/cvs"
>>> -SVNDIR = "${CO_DIR}/svn"
>>> -GITDIR = "${CO_DIR}/git2"
>>> -BZRDIR = "${CO_DIR}/bzr"
>>> -HGDIR = "${CO_DIR}/hg"
>>>
>>>  STAMPS_DIR ?= "${TMPDIR}/stamps"
>>>  STAMP =
>>> "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
>>> @@ -661,12 +655,6 @@ SRC_URI[vardepsexclude] += "\
>>>  #  export DEBIAN_MIRROR = "http://ftp.de.debian.org/debian/pool"
>>>  #     into your local.conf
>>>
>>> -FETCHCMD_svn = "/usr/bin/env svn --non-interactive --trust-server-
>>> cert"
>>> -FETCHCMD_cvs = "/usr/bin/env cvs"
>>> -FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 --passive-ftp --no-
>>> check-certificate"
>>> -FETCHCMD_bzr = "/usr/bin/env bzr"
>>> -FETCHCMD_hg = "/usr/bin/env hg"
>>> -
>>>  SRCDATE = "${DATE}"
>>>  SRCREV ??= "INVALID"
>>>  AUTOREV = "${@bb.fetch2.get_autorev(d)}"
>>
>> To make this work, we need to force everyone to upgrade their bitbake
>> beyond the point where these have been added to the fetcher.
>>
>> We could do that with the minimum bitbake version but I'm tempted to
>> hold this for a but until we have another more pressing reason to bump
>> the minimum bitbake version and then do this at the same time?
>
> OK. I was assuming that anyone using master oe-core would be using
> master bitbake too. Delaying the change going into oe-core is
> certainly safer though.

Would now be a good time to merge this?

