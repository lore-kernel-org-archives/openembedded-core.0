Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8B4613C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 18:39:48 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p7so17100752qkh.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 10:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=88qxoW69Xq6247QpQ9xk3Aydaa3U5UQDjbRHCCrurXY=;
	b=LaLsHgJIr9U8D3qNDCgEVa8TWKe3xrVNG9GIlqNgGz/vIAam6UHKWd2JmVMoEmMTw2
	74v5LEvp5XHbvS8tTIf3lAmkTBvlYSohc6aiFB6D8Q/UUvz3onDLbvfWPX2TqEomVku0
	WHFPcakIF+Qo0REhPa9A4fT5SZrGMpvnPKX3e5p4fFLgTmRn8C6F+hREsX/oU7tsMK/o
	qW9VeM/OVX6h6tf3tWFmbFlQZ/ISPd12OcqpQ2yc5tZVhENnrbJHk3lhqR9cwEH8hE2d
	O07nJD2hJ8a+CCgDRlCBYgA61PBTAn0pig/186AfyhfTwjPydyklZjzCIcgQhzP16nyQ
	Fu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=88qxoW69Xq6247QpQ9xk3Aydaa3U5UQDjbRHCCrurXY=;
	b=T/QgNrRSuCVEmZ14ltNJXFjKtbPe3Q8YPojSanRnLeqqcC/wxYmN7vgwDxNfcLUXZn
	V659vXraq3mmlDJz0MoSoQmrlHjC4HX1GDUyRt56eWIuRQQFC7zzNuNn3crS3CreSp43
	gGtZ4Yr6DPe/P8uZY1mdWo3oIcLKZnLNVxb8Bzqb0WdhX5ckVfsaJGsheh/5NCXBwSsy
	Er7xtl6gD0i6M01/SObvhl/hn7x5V4vcByv+PuVEPm9oiC7yrv9GZI0wNWzup4OdQjAh
	xUJ85CoHOmLv3FNCtI6dskLmWO8drvv55h2PDXdRF0EwU25wiw7XBWaS3CNCptiwm5XT
	VnvQ==
X-Gm-Message-State: APjAAAU7KuTMxnQ9A4VF1hUJor+VR6n7rEKLpZQ9/vS/z9bBz91BjPRn
	BeimC7cesDV5c7T0zdKT/bCb008+rWvPf1eDeg8=
X-Google-Smtp-Source: APXvYqwIZaRhc6V2Di98Z4lXcCnQtQxbZxNZzPQMaNCdRkFij6zXK2r43LaRPQt/8JnOFNQEntE5Fqas1UpLIaD0omo=
X-Received: by 2002:a37:9c42:: with SMTP id f63mr16038598qke.9.1581964788951; 
	Mon, 17 Feb 2020 10:39:48 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-2-alex.kanavin@gmail.com>
	<CAMKF1spfArttzxcU2Cug0wpT5AWozci--eEw1L9MKVmM0a2GrA@mail.gmail.com>
	<CANNYZj8qJVAh9Zz_u5OT0HRCn_LD8ZG9E3-abjJLZbo7=0UzCw@mail.gmail.com>
	<CAMKF1sqrxL4H-gYab-VopR-ZUhiPqo3f3XXQhedaKrZ7eGXtZQ@mail.gmail.com>
	<CANNYZj_2H6YJ4hO69Rwqqs6NjJynX-yigJhTdhj7tTFgbBroUw@mail.gmail.com>
	<CAMKF1soQsumU153u0ZmV6AXOiT49r3smLGfjBYYbVYEQ2-N0Eg@mail.gmail.com>
	<CANNYZj_8Hr8mrV6ND+E2Si6PDmZ9e0dzryucD8zEVFYnmx7jHw@mail.gmail.com>
In-Reply-To: <CANNYZj_8Hr8mrV6ND+E2Si6PDmZ9e0dzryucD8zEVFYnmx7jHw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2020 10:39:22 -0800
Message-ID: <CAMKF1so8mMqiuMkQwxTNQ7nL+sKOcdfQDLD8ryiq+NJCJAs5WA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/10] procps: upstream has switched to gitlab
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
X-List-Received-Date: Mon, 17 Feb 2020 18:39:48 -0000
Content-Type: text/plain; charset="UTF-8"

Ok, thanks. for confirmation

On Mon, Feb 17, 2020 at 12:12 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I looked it up. Actually, potfiles.in is typically not a generated file, and should be placed under version control. The comment is valid.
>
> Alex
>
> On Mon 17. Feb 2020 at 3.36, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sun, Feb 16, 2020 at 12:45 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > On Sun, 16 Feb 2020 at 21:07, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> >>> -S = "${WORKDIR}/procps-ng-${PV}"
>> >> >>> +# Upstream has a custom autogen.sh which invokes po/update-potfiles as they
>> >> >>> +# don't ship a po/POTFILES.in (which is silly).  Without that file gettext
>> >> >>> +# doesn't believe po/ is a gettext directory and won't generate po/Makefile.
>> >> >>
>> >> >> Do we miss .in file from tarball ? Or is it missing in a git checkout
>> >> >> This is expected when building in a maintainer mode
>> >> >> Tarballs are produced by maintainers for users
>> >> >> Who wants to build from source
>> >> >
>> >> >
>> >> > The .in is available in tarballs, but not in git repo. It's generated as explained above.
>> >>
>> >> right. Then revise the comment, since its expected to be absent when
>> >> we are building from
>> >> git sources.
>> >
>> >
>> > The fix and the comment were copied wholesale and were originally written by Ross. How is POTFILES.in normally generated (i.e. without involving custom autogen.sh)?
>>
>> any .in file is usually generated by maintainer into source tarball
>> since the build is not consuming source tar anymore
>> this comment perhaps should be deleted.
>>
>> >
>> > Alex

