Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.13298.1611672652606928261
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uvVlKXFA;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.52, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f52.google.com with SMTP id v15so16750663wrx.4
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VoBA7KrHc7BTKdmvEK/esQDJqmABDtHbSgDmPH2vrFg=;
        b=uvVlKXFAM0MHdx4TJJcDmRTXkhWLImNqCU6FVCCWRqUB8u4LQqeaGTcUPL9GF33tHX
         dUhmYJlj14wdlALuIjBw1NEyL/qfk+b+RhxvyvQ6nFfajNVeET3e5lp82oRVK9vjhOVr
         e+2+v/D/VUE/eu4fb4a0oVxZ2xXzviklLIW+JGtDcMBODZfMNRRQ3gtu0a4QjKgDv3XL
         RbGeZ/nZfxTBnvVdZGlq5yaV4Xg+lqGuELSUoF5QtLx2U42DosLHgoYHA/h9AhXfs9Fp
         hXPNfdtTgcXiXiySeeLT75q+9F4cR0IeFpCqOO22tuIT8vJCdZtSb9OWuAzwve9CrKmC
         L1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VoBA7KrHc7BTKdmvEK/esQDJqmABDtHbSgDmPH2vrFg=;
        b=M0eA8clc4ZrGnkDpRMp8HEezUdNslytCJ04nfwvrlUsMVazUAXCsIpz6O1xwWVJsb0
         yJbOdeFPkWKXE0Xd2EapNDDNc7cn3PCuMDydP4bbJ47637nguhi/5ubaJjxcYjR3xvx4
         wsqBc/j4Ukj3kg8JEvEn7suq9CT/cv1ufqKdNTxaRhpeqErTcSTxsi9FJokFQcN7irCk
         oLMjqJXWZ1FCBJ9if2qOJJMdmiu6e+eTxky67w868i+OtyF3lXD3Izo+OsETLMLIHncq
         RjCaYKoiULcjD3q9XNxlQBx0c+x7EwNZGruVS9uRmwhS8GH8HOapKyR7/io+WA+gMUPH
         xiZA==
X-Gm-Message-State: AOAM530CmnEwd3xaCVibeJbkTCvvIP3tD2/4go574QPGqsbl3pOQI4yu
	ldsXKQQzHM7ZXHfiQ0f2v2pzjobalk28mIro3Y02JQ==
X-Google-Smtp-Source: ABdhPJySNwZBIE918h81aQ1a9rfFR4T3pvYFqYdxx17g0OvcUNwbNUNCKz1LyQyjbMPXzzoZV1vWo6gLbQhjYeaCCj4=
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr6423835wrd.329.1611672651041;
 Tue, 26 Jan 2021 06:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20210117211445.2341303-1-robert.joslyn@redrectangle.org>
 <CAOSpxdYiKrtF0t0wMJxp0rKqGz0bNHfbQ9XayjdgTtVNhQaoGg@mail.gmail.com> <1F9D5FAF-DA64-4BB4-B7BD-804976B80613@redrectangle.org>
In-Reply-To: <1F9D5FAF-DA64-4BB4-B7BD-804976B80613@redrectangle.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 26 Jan 2021 04:50:39 -1000
Message-ID: <CAOSpxdaLJMqNyM2y1z7ER=6k7+OaVLgHaRi3GmvgKe4RnSb0Ow@mail.gmail.com>
Subject: Re: [OE-core] [master][gatesgarth][dunfell][PATCH] bluez: Whitelist CVE-2020-12351 and CVE-2020-12352
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 20, 2021 at 7:59 PM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
>
>
> > On Jan 20, 2021, at 10:18 AM, Steve Sakoman <steve@sakoman.com> wrote:
> >
> > On Sun, Jan 17, 2021 at 11:16 AM Robert Joslyn
> > <robert.joslyn@redrectangle.org> wrote:
> >>
> >> According to the Intel security advisory [1], these CVEs are mitigated by
> >> the following kernel commits:
> >>
> >> eddb7732119d53400f48a02536a84c509692faa8 Bluetooth: A2MP: Fix not initializing all members
> >> f19425641cb2572a33cb074d5e30283720bd4d22 Bluetooth: L2CAP: Fix calling sk_filter on non-socket based channel
> >> b560a208cda0297fef6ff85bbfd58a8f0a52a543 Bluetooth: MGMT: Fix not checking if BT_HS is enabled
> >> a2ec905d1e160a33b2e210e45ad30445ef26ce0e Bluetooth: fix kernel oops in store_pending_adv_report
> >>
> >> The latest of these commits were backported from 5.10 to the stable kernel
> >> tree in the 5.8.16 and 5.4.72 releases. Since the kernels provied by OE-core
> >> contain these fixes, mark them as whitelisted.
> >
> > This seems to be a good candidate for having the cpe database updated.
> > Currently it is flagging all versions of bluez and Linux.
> >
> > I sent a request to have the entry updated.  If they accept the
> > request then we won't need this patch.  If they deny it we can merge
> > the patch.
>
> Sounds good, thanks!

After a bit of back and forth the CPE entry for this issue has been
updated to reflect that it is a kernel issue and the affected kernel
versions have also been added to the entry.

So we won't need this patch.  Thanks again for doing the initial
research on this issue!

Steve

> >> [1]: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00435.html?wapkw=CVE-2020-12351
> >>
> >> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> >> ---
> >> meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 2 ++
> >> 1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
> >> index 8190924562..051fdef8ce 100644
> >> --- a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
> >> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
> >> @@ -3,6 +3,8 @@ require bluez5.inc
> >> SRC_URI[md5sum] = "94972b8bc7ade60c72b0ffa6ccff2c0a"
> >> SRC_URI[sha256sum] = "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88"
> >>
> >> +CVE_CHECK_WHITELIST += "CVE-2020-12351 CVE-2020-12352"
> >> +
> >> # noinst programs in Makefile.tools that are conditional on READLINE
> >> # support
> >> NOINST_TOOLS_READLINE ?= " \
> >> --
> >> 2.26.2
> >>
> >>
> >>
> >>
> >
> > 
>
