Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50848.1795427862716565248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 01:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JtH5HYeA;
 spf=pass (domain: mvista.com, ip: 209.85.218.54, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d28f75d62so508988566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 01:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795427861; cv=none;
        d=google.com; s=arc-20260327;
        b=VhlM1rXoFS1d/emn2SIOsMfKyzjuR3faIlR/YELrVK2qMK0hHz5j7sp/Wa1yqMzd1J
         wDAksadjZreHygXVVjbJLX5CNDwg0q+Z/c6zpjFUp8P636yScmt63EuWtMK9lmcLsKGG
         w/xj/sXp99w7n9snIUgOAmNFXrbWmH5K0Ynmer0NtO8IjJSdfI8a8kNtDevAA1Pv+vMV
         lgXuJ3j7sr9xXQzULMQDgAcm9w15ktx8rNkZzmaH3Y5KwtpCUhgr3vnar0nArRxRqbwf
         Ulkc9Tf6G0DFXefKJ/2zZUpSB5eTzQMflNfc14A8Eym3hnevzTSFGEsGC+vT4uwGTFKe
         22tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Gy+lHWNnwOSj8pYpdmZWOZDONgMIHRCISKXku9pgEqg=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=DD/VPAo5ryj147aTdUfcv7qiqaqwh9ebMBl7u8P64Ku9xGFG2UG6UJl6wPbFc6L+c9
         TadaNyRluXuK3Mogxe+hWzxFySojRzhRpmQrHWf/gbIBzwu8Ilpqt/+sRhcJWb28Giix
         nMIAbUYOBjKpZg9qbf9EzBHVeN3qpFR1SpIra8KZCgqfB5bqBOq54Bb8MkQiUIKNsyRG
         9kvZczTKY+Equ+m5Z3mOgQqMCDXVG0UKBPITJlyDU/raTUhp2iLtdDO7RUpYT5FBC+bs
         Z5JqYDIrHOdkNvr0MxGqi9v66kHKOfVBzWpEDdLrQgoe4EoRvZer2EA0aCHdW061lvzT
         dtIw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795427861; x=1796032661; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gy+lHWNnwOSj8pYpdmZWOZDONgMIHRCISKXku9pgEqg=;
        b=JtH5HYeAmHiu6Biethu6L3QzgFX4Tmp3BRWGQO0fZd3ulDTh8v0Mf4EDKTjmR7lRe1
         8uL6y+N35hk4dEMhsPhjjjMOzcU/SN8hbxAccrBTxakoJNU6UCJbLRAjfG90VVxcm+PN
         DzScXM4TVYS0lqZZMRudgublstLx/c9vdCWgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427861; x=1796032661;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gy+lHWNnwOSj8pYpdmZWOZDONgMIHRCISKXku9pgEqg=;
        b=L8RgDPv+id6LbKfHp87CUfrPQ/+2Ejo9UlAb3HYoHiByCwqADJu/oJMDeCUgJ6gham
         Qew6dfeS6afUQYTvlGoTM18tj2mDSHy22qI8TuuZdxR6RZgwGD9N9DG+sKkYft+2Hs+K
         LshvZZsyC/34R90qPdp/7u00QD39AlebUY8Gb9F6iotpYoDlgR017cuEiKdM9SpU5NaA
         +qVxUzQWuVzkk4B9+p04dLWkNMYl8a7NbXchMdSzJNBTX7j+zHjNyVDcyPzDyQqtoDL8
         8pidMqTBv86n6sWyQZBbBLTeZLnYDbuW6NoPUHbXpppuBI74LGiSzxD5x2UD8iOlnlr9
         RPxw==
X-Gm-Message-State: APuU4Z/somUIMfd28uiL++MtznZKmlYOcazOSTum0aUouS3OhiRTBcIw
	vuCPD3dyVPAnwGk1Uxqg/7XLxb50Waie7GIgu/O5XAg0Wzk5rUQ7mP9HjqSC+CXDoNm61pfSXLd
	lLS4bZoLHHZpIgvQZqWu51dCK0608ndUVqC1u1+Fqzw==
X-Gm-Gg: AZFdTZe6YrblG+nBH+0EG1O+aJcWTrzDvqawpYtCxT1LVYtU0RTiCRSKO13PhztU4Oo
	Qxsuwxbc9UQ+Qs8YXt+TyIlxxVgxMLR/ORIEYJ6GDODonNAJdOKEk9zVMtxTrO5bF8qj8xUkcum
	VFWsqFFqYtv08uoy0G2JfDnBlvwkjmMNqeAMiAJZi4Gy5FGjWGg3LZYg5fvimOcDbyt9fkFG2Yv
	Wd8LJucM1jIhPBzIo3JtaIKhcYGH6/tOZOLBYJgQUunaCsusD7P2pxG7Ml0ZSatwyBTaE5alDTD
	hVVKQX1F5t9ef4yLNYup5Yr5QuIsA0zxh+SRHbZ6R7Mx06iPF/ONdqBcE7Jq+ee1kWjx1Psjq8x
	6vdPQrvhxbN7U1/7QvLxPzIKnqdHFms++6Yvd
X-Received: by 2002:a17:907:c491:b0:c25:91bc:ff55 with SMTP id
 a640c23a62f3a-c513ab0c6b4mr834705266b.23.1795427860625; Mon, 23 Nov 2026
 01:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20261116145033.2369325-1-vanusuri@mvista.com> <DN18ROW5HVTW.25YP9YGBIMAZQ@smile.fr>
In-Reply-To: <DN18ROW5HVTW.25YP9YGBIMAZQ@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 23 Nov 2026 15:27:27 +0530
X-Gm-Features: Aa3M54rY9k1WW191aQ0gQVKUhgWcYIImZQIFH9ZUdjYiADagMlxLU7pPkL6m8WA
Message-ID: <CANQUz188XSj5Wi78APFy0H9WG+oOvbkV3anvpki+1ibgJ4vopA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch] systemd: rate-limit tail timestamp
 refresh during iteration
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000da4eec0660ee9fa6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 09:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250892

--000000000000da4eec0660ee9fa6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have applied Jaipaul's systemd 259.10 upgrade series on Wrynose and
completed the build and runtime testing.

https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D53480

The build completed successfully, and the OEQA runtime tests on QEMU
(qemux86-64) produced the following results:

RESULTS:
RESULTS - ping.PingTest.test_ping: PASSED (0.04s)
RESULTS - ssh.SSHTest.test_ssh: PASSED (0.78s)
RESULTS - systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.59s)
RESULTS - systemd.SystemdBasicTests.test_systemd_failed: PASSED (1.20s)
RESULTS - systemd.SystemdBasicTests.test_systemd_list: PASSED (1.10s)
RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.60s=
)
RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED (0.77s)
RESULTS - systemd.SystemdServiceTests.test_systemd_coredump_minidebuginfo:
SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable: SKIPPED
(0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable_ro:
SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_status: SKIPPED (0.00s)
RESULTS - systemd.SystemdServiceTests.test_systemd_stop_start: SKIPPED
(0.00s)
SUMMARY:
core-image-minimal () - Ran 12 tests in 5.091s
core-image-minimal - OK - All required tests passed (successes=3D7,
skipped=3D5, failures=3D0, errors=3D0)
NOTE: Tasks Summary: Attempted 1341 tasks of which 1339 didn't need to be
rerun and all succeeded.

I didn't observe any failures during the build or runtime testing. The
patch series looks ok to me.

Thanks to Jaipaul for the patch series.

Thanks & Regards,

Vijay




On Sun, Nov 22, 2026 at 3:58=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Mon Nov 16, 2026 at 3:50 PM CET, Vijay Anusuri via openembedded-core
> wrote:
> > Rate-limit journal tail timestamp refreshes during journal iteration
> > to avoid unnecessary volatile mmap reads.
> >
> > Fixes: https://github.com/systemd/systemd/issues/42521
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  ...limit-tail-timestamp-refresh-during-.patch | 95 +++++++++++++++++++
> >  meta/recipes-core/systemd/systemd_255.22.bb   |  1 +
> >  2 files changed, 96 insertions(+)
> >  create mode 100644
> meta/recipes-core/systemd/systemd/0025-sd-journal-rate-limit-tail-timesta=
mp-refresh-during-.patch
> >
> > diff --git
> a/meta/recipes-core/systemd/systemd/0025-sd-journal-rate-limit-tail-times=
tamp-refresh-during-.patch
> b/meta/recipes-core/systemd/systemd/0025-sd-journal-rate-limit-tail-times=
tamp-refresh-during-.patch
> > new file mode 100644
> > index 0000000000..0f30978bce
> > --- /dev/null
> > +++
> b/meta/recipes-core/systemd/systemd/0025-sd-journal-rate-limit-tail-times=
tamp-refresh-during-.patch
> > @@ -0,0 +1,95 @@
> > +From 46e1b78bb2724e9691e4c91b7b4b8559d218fbfc Mon Sep 17 00:00:00 2001
> > +From: dongshengyuan <545258830@qq.com>
> > +Date: Wed, 24 Jun 2026 13:01:32 +0800
> > +Subject: [PATCH] sd-journal: rate-limit tail timestamp refresh during
> > + iteration
> > +
> > +journal_file_read_tail_timestamp() is called unconditionally in
> > +next_beyond_location() for every file on every iteration step,
> > +resulting in O(N x files) volatile mmap reads. For large queries
> > +like 'journalctl -n 1000000' this makes the command unusably slow
> > +(~5 minutes on systems with many journal files).
> > +
> > +Rather than suppressing the call entirely (which would make the
> > +inotify path fully load-bearing for cross-boot ordering), rate-limit
> > +it to at most once per second per file. This reduces the overhead
> > +from O(N x files) to O(T x files) where T is the iteration time in
> > +seconds, while still providing periodic refresh as a fallback for
> > +any missed inotify events and keeping cross-boot ordering
> > +reasonably fresh.
> > +
> > +Embed a RateLimit struct in JournalFile for this purpose.
> > +
> > +Measured improvement on a real system: 5:24 -> 2:39 (-51%) for
> > +'journalctl -n 1000000'.
> > +
> > +Fixes: #42521
> > +Regression introduced in: #26355 (34af74946e)
> > +
> > +Signed-off-by: dongshengyuan <dongshengyuan@uniontech.com>
> > +(cherry picked from commit 8f8ab4bf98f930fcbbdd7efcbba8577981d31df9)
> > +(cherry picked from commit de01a0f78f833208fb9c8eca69bed6420b0e7e65)
> > +(cherry picked from commit 578dc90e6c4a87ad77927c462f5c42794c464c4d)
> > +(cherry picked from commit c066fab7052e41b2de4893488fdd39a0c3db4fef)
> > +
> > +Upstream-Status: Backport [
> https://github.com/systemd/systemd/commit/46e1b78bb2724e9691e4c91b7b4b855=
9d218fbfc
> ]
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + src/libsystemd/sd-journal/journal-file.c | 1 +
> > + src/libsystemd/sd-journal/journal-file.h | 2 ++
> > + src/libsystemd/sd-journal/sd-journal.c   | 7 ++++++-
> > + 3 files changed, 9 insertions(+), 1 deletion(-)
>
> Hello,
>
> As far as I can tell, this commit was backported by systemd upstream in
> https://github.com/systemd/systemd/commit/c066fab7052e (v259.8)
> But current wrynose systemd is 259.5.
> Jaipaul sent an upgrade:
>   [wrynose][PATCH v3 0/8] Systemd 259.10 upgrade
>
> https://lore.kernel.org/all/20261117115126.14374-1-jaipaul.cheernam@est.t=
ech/
> ... but I have yet to review it.
>
> So, this scarthgap patch is blocked until the above upgrade merges. You
> can speed up the process by helping review it :)
>
> Thanks!
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000da4eec0660ee9fa6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Yoann,<br><br><p><span>I have applied Jaipaul&#39;=
s systemd 259.10 upgrade series on Wrynose and completed the build and runt=
ime testing.<br><br></span><a href=3D"https://patchwork.yoctoproject.org/pr=
oject/oe-core/list/?series=3D53480">https://patchwork.yoctoproject.org/proj=
ect/oe-core/list/?series=3D53480</a></p><p><span>The build completed succes=
sfully, and the OEQA runtime tests on QEMU (qemux86-64) produced the follow=
ing results:<br><br></span>RESULTS:<br>RESULTS - ping.PingTest.test_ping: P=
ASSED (0.04s)<br>RESULTS - ssh.SSHTest.test_ssh: PASSED (0.78s)<br>RESULTS =
- systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.59s)<br>RESULTS -=
 systemd.SystemdBasicTests.test_systemd_failed: PASSED (1.20s)<br>RESULTS -=
 systemd.SystemdBasicTests.test_systemd_list: PASSED (1.10s)<br>RESULTS - s=
ystemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.60s)<br>RESULT=
S - systemd.SystemdJournalTests.test_systemd_journal: PASSED (0.77s)<br>RES=
ULTS - systemd.SystemdServiceTests.test_systemd_coredump_minidebuginfo: SKI=
PPED (0.00s)<br>RESULTS - systemd.SystemdServiceTests.test_systemd_disable_=
enable: SKIPPED (0.00s)<br>RESULTS - systemd.SystemdServiceTests.test_syste=
md_disable_enable_ro: SKIPPED (0.00s)<br>RESULTS - systemd.SystemdServiceTe=
sts.test_systemd_status: SKIPPED (0.00s)<br>RESULTS - systemd.SystemdServic=
eTests.test_systemd_stop_start: SKIPPED (0.00s)<br>SUMMARY:<br>core-image-m=
inimal () - Ran 12 tests in 5.091s<br>core-image-minimal - OK - All require=
d tests passed (successes=3D7, skipped=3D5, failures=3D0, errors=3D0)<br>NO=
TE: Tasks Summary: Attempted 1341 tasks of which 1339 didn&#39;t need to be=
 rerun and all succeeded.<br><br></p><p dir=3D"auto"><span>I didn&#39;t obs=
erve any failures during the build or runtime testing. The patch series loo=
ks ok to me.</span></p><p dir=3D"auto"><span>Thanks to Jaipaul for the patc=
h series.<br><br></span></p><p><span>Thanks &amp; Regards,<br></span></p><p=
><span>Vijay</span></p><p><br></p><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 22,=
 2026 at 3:58=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@sm=
ile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Mon Nov 16, 2026 at 3:50 PM CET, Vijay Anus=
uri via openembedded-core wrote:<br>
&gt; Rate-limit journal tail timestamp refreshes during journal iteration<b=
r>
&gt; to avoid unnecessary volatile mmap reads.<br>
&gt;<br>
&gt; Fixes: <a href=3D"https://github.com/systemd/systemd/issues/42521" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/systemd/systemd/issues=
/42521</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...limit-tail-timestamp-refresh-during-.patch | 95 +++++++++++++=
++++++<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_255.22.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd_255.22.bb</a>=C2=A0 =C2=A0|=C2=
=A0 1 +<br>
&gt;=C2=A0 2 files changed, 96 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/systemd/systemd/0025-sd-jou=
rnal-rate-limit-tail-timestamp-refresh-during-.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/systemd/0025-sd-journal-rate-li=
mit-tail-timestamp-refresh-during-.patch b/meta/recipes-core/systemd/system=
d/0025-sd-journal-rate-limit-tail-timestamp-refresh-during-.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0f30978bce<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/systemd/systemd/0025-sd-journal-rate-limit-tai=
l-timestamp-refresh-during-.patch<br>
&gt; @@ -0,0 +1,95 @@<br>
&gt; +From 46e1b78bb2724e9691e4c91b7b4b8559d218fbfc Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: dongshengyuan &lt;<a href=3D"mailto:545258830@qq.com" target=3D=
"_blank">545258830@qq.com</a>&gt;<br>
&gt; +Date: Wed, 24 Jun 2026 13:01:32 +0800<br>
&gt; +Subject: [PATCH] sd-journal: rate-limit tail timestamp refresh during=
<br>
&gt; + iteration<br>
&gt; +<br>
&gt; +journal_file_read_tail_timestamp() is called unconditionally in<br>
&gt; +next_beyond_location() for every file on every iteration step,<br>
&gt; +resulting in O(N x files) volatile mmap reads. For large queries<br>
&gt; +like &#39;journalctl -n 1000000&#39; this makes the command unusably =
slow<br>
&gt; +(~5 minutes on systems with many journal files).<br>
&gt; +<br>
&gt; +Rather than suppressing the call entirely (which would make the<br>
&gt; +inotify path fully load-bearing for cross-boot ordering), rate-limit<=
br>
&gt; +it to at most once per second per file. This reduces the overhead<br>
&gt; +from O(N x files) to O(T x files) where T is the iteration time in<br=
>
&gt; +seconds, while still providing periodic refresh as a fallback for<br>
&gt; +any missed inotify events and keeping cross-boot ordering<br>
&gt; +reasonably fresh.<br>
&gt; +<br>
&gt; +Embed a RateLimit struct in JournalFile for this purpose.<br>
&gt; +<br>
&gt; +Measured improvement on a real system: 5:24 -&gt; 2:39 (-51%) for<br>
&gt; +&#39;journalctl -n 1000000&#39;.<br>
&gt; +<br>
&gt; +Fixes: #42521<br>
&gt; +Regression introduced in: #26355 (34af74946e)<br>
&gt; +<br>
&gt; +Signed-off-by: dongshengyuan &lt;<a href=3D"mailto:dongshengyuan@unio=
ntech.com" target=3D"_blank">dongshengyuan@uniontech.com</a>&gt;<br>
&gt; +(cherry picked from commit 8f8ab4bf98f930fcbbdd7efcbba8577981d31df9)<=
br>
&gt; +(cherry picked from commit de01a0f78f833208fb9c8eca69bed6420b0e7e65)<=
br>
&gt; +(cherry picked from commit 578dc90e6c4a87ad77927c462f5c42794c464c4d)<=
br>
&gt; +(cherry picked from commit c066fab7052e41b2de4893488fdd39a0c3db4fef)<=
br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/systemd/syst=
emd/commit/46e1b78bb2724e9691e4c91b7b4b8559d218fbfc" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/systemd/systemd/commit/46e1b78bb2724e9691=
e4c91b7b4b8559d218fbfc</a>]<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/libsystemd/sd-journal/journal-file.c | 1 +<br>
&gt; + src/libsystemd/sd-journal/journal-file.h | 2 ++<br>
&gt; + src/libsystemd/sd-journal/sd-journal.c=C2=A0 =C2=A0| 7 ++++++-<br>
&gt; + 3 files changed, 9 insertions(+), 1 deletion(-)<br>
<br>
Hello,<br>
<br>
As far as I can tell, this commit was backported by systemd upstream in <br=
>
<a href=3D"https://github.com/systemd/systemd/commit/c066fab7052e" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/systemd/systemd/commit/c066=
fab7052e</a> (v259.8)<br>
But current wrynose systemd is 259.5.<br>
Jaipaul sent an upgrade:<br>
=C2=A0 [wrynose][PATCH v3 0/8] Systemd 259.10 upgrade<br>
=C2=A0 <a href=3D"https://lore.kernel.org/all/20261117115126.14374-1-jaipau=
l.cheernam@est.tech/" rel=3D"noreferrer" target=3D"_blank">https://lore.ker=
nel.org/all/20261117115126.14374-1-jaipaul.cheernam@est.tech/</a><br>
... but I have yet to review it.<br>
<br>
So, this scarthgap patch is blocked until the above upgrade merges. You<br>
can speed up the process by helping review it :)<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000da4eec0660ee9fa6--
