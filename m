Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 75720753AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 22:12:19 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id c23-v6so7359343uan.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 15:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7HQFaBIHGFZE4jSArAJSIpGJWxPYRbZPio6j/BL2XBE=;
	b=cLgluw7cd0ad4Z0hqWsH1WeNAa1pAZ9N97zOZ9ChsHilvzlO0fYjfmeC3zRYWPSkZi
	Tt68uo+aN7W63761yrCZzTSmFIlB47BRZ8VuhxkGYTMoqNJtoKjhTC3wl3UojRd36Bcz
	5f2c4iJycC4rt+k+tUQmtvIQ07uBKnCOotofLsUl7Udn6rIlOlsEySmPoQ/vSwTmByTu
	O0Op7QmAwie0GMmJlTm5b8BsALHKbS+HkxvAiHYgsmDFkutzN3BDhiDEZLlvFHKQ9A7a
	PjxmzZ01HrjDfNulBlsjyNdL417qWAp/bovyL09ZrniqESLp2jT5u55gdVkI7GhExGbP
	qM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7HQFaBIHGFZE4jSArAJSIpGJWxPYRbZPio6j/BL2XBE=;
	b=S7YTDwRJTTIC0BIhbQT5wwecN6SDetC6UqZ1ee4hbLJ7u8UDkaH0Th4/zf8ontRpxm
	yL1E25lJtLnKUk7/6/RyMP0jq3OE3l5H0K/CkkQ+IxtINWBvvQeFbbdEF8RxXRAGKnfn
	CmQwcXG8iHSfD65aHf/y48962jaMtYrMVJMt+3rqyfftsw/rh7Kvqqxv4hvMVNO07kjW
	3GRraJIWCxhvB9YwHl2xJneaMXO5eWghTUC049i9VYkCPFbGmr+CdXzGX5w6uVa7nfRr
	K2uvHJtKRAdtgn0czSnpCol0qlh33KpxFYqjKiG+8o/mTOyAlzZIaGydXoHFDlwGDZs6
	vUOQ==
X-Gm-Message-State: APt69E1eYlbsa84CsAFUOVPn9NbAJ1kQi/Ui8JhEMk9TRoPScjLxnJ2e
	nZRTydP1rvWecMXIfK0HyLQtL/YeXUCIVTSjCN8=
X-Google-Smtp-Source: ADUXVKKsAj34lggiSHFnUwiLJCdlpTdD7qCc3ssH574eMvZ61vflm7FpdiBaPtn4BwW+x/oJDBYOqehOftJpZvzVKBA=
X-Received: by 2002:a9f:3644:: with SMTP id
	s4-v6mr2363013uad.128.1529100740434; 
	Fri, 15 Jun 2018 15:12:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 15 Jun 2018 15:12:20 -0700 (PDT)
In-Reply-To: <9be8087a3d586dd5d372954ddae61db388e39011.camel@linuxfoundation.org>
References: <1529088192-991-1-git-send-email-armccurdy@gmail.com>
	<9be8087a3d586dd5d372954ddae61db388e39011.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 15 Jun 2018 15:12:20 -0700
Message-ID: <CAJ86T=XB+UgGZvW71x0QHb6QzwadMejBDOLEh+q0yjwO-q3yGg@mail.gmail.com>
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
X-List-Received-Date: Fri, 15 Jun 2018 22:12:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 2:58 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2018-06-15 at 11:43 -0700, Andre McCurdy wrote:
>> Following recent updates to the bitbake, the fetchers should now all
>> contain safe and correct defaults for the subdirectory within DL_DIR
>> to use and the base fetch command to run. It's no longer necessary
>> for bitbake.conf to specify these values.
>>
>> This is cleanup which was originally proposed in 2012:
>>
>>   http://lists.openembedded.org/pipermail/openembedded-core/2012-July
>> /064224.html
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/conf/bitbake.conf | 12 ------------
>>  1 file changed, 12 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 3b2ef9f..8588684 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -349,12 +349,6 @@ CACHE = "${TMPDIR}/cache${@['', '/' +
>> str(d.getVar('MACHINE'))][bool(d.getVar('M
>>  # The persistent cache should be shared by all builds
>>  PERSISTENT_DIR = "${TOPDIR}/cache"
>>  LOG_DIR = "${TMPDIR}/log"
>> -CO_DIR = "${DL_DIR}"
>> -CVSDIR = "${CO_DIR}/cvs"
>> -SVNDIR = "${CO_DIR}/svn"
>> -GITDIR = "${CO_DIR}/git2"
>> -BZRDIR = "${CO_DIR}/bzr"
>> -HGDIR = "${CO_DIR}/hg"
>>
>>  STAMPS_DIR ?= "${TMPDIR}/stamps"
>>  STAMP =
>> "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
>> @@ -661,12 +655,6 @@ SRC_URI[vardepsexclude] += "\
>>  #  export DEBIAN_MIRROR = "http://ftp.de.debian.org/debian/pool"
>>  #     into your local.conf
>>
>> -FETCHCMD_svn = "/usr/bin/env svn --non-interactive --trust-server-
>> cert"
>> -FETCHCMD_cvs = "/usr/bin/env cvs"
>> -FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 --passive-ftp --no-
>> check-certificate"
>> -FETCHCMD_bzr = "/usr/bin/env bzr"
>> -FETCHCMD_hg = "/usr/bin/env hg"
>> -
>>  SRCDATE = "${DATE}"
>>  SRCREV ??= "INVALID"
>>  AUTOREV = "${@bb.fetch2.get_autorev(d)}"
>
> To make this work, we need to force everyone to upgrade their bitbake
> beyond the point where these have been added to the fetcher.
>
> We could do that with the minimum bitbake version but I'm tempted to
> hold this for a but until we have another more pressing reason to bump
> the minimum bitbake version and then do this at the same time?

OK. I was assuming that anyone using master oe-core would be using
master bitbake too. Delaying the change going into oe-core is
certainly safer though.

