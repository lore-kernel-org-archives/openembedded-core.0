Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.10930.1593785199156117222
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tfOWBDeT;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id q74so8994971iod.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 07:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BG2fk2AzEeCjhfy56ffdjNJ6H3kCGyCGwRfW32B5dbw=;
        b=tfOWBDeTrtediCRp07VB+CEC/ReRyP1YPK32TCn3xwEUGzh7hWOH/tVKF5ANyt06pQ
         PpJVYXWz7xSyqc8OYM3NEG38Ror/NI54sdNei0rLAyDiRsYZUYg/TCPDe3TGpmey/EXG
         sNov6+OUOrgYN3bNYvVoGzwM3kP7gJ+rbXYniB50JpSfBGLckvsmDcJPRJ+nfR1KDepp
         DQV1YRA+mbIfR4yPwhunc8AKNzpX64H1b3S5XvLNs7ZC5LNqV8RkwHqjGvMPaX8qqORi
         kc/ISQ1Atl1rnvmTkIzuRoTYGBlVEjzZyzJilRxzWCAa7KPWMt0sVW9KefjrFsUu82e/
         4PAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BG2fk2AzEeCjhfy56ffdjNJ6H3kCGyCGwRfW32B5dbw=;
        b=KnInEf3Z+dAo+6GNF9bapg7I3d3zFz4ALJXL7M5QyA80awo67D63s9NBEhORETLysx
         UhdncOhpYom0MxLsgWEPd/7UCxH1juCQsvZkf2Fg7/CWpGnrgzhWvJvW+aWK/PaupXuR
         TNdT1s+1isnIr10DWa/ny+7/zxNVpJ88r3bqKN93r4oW2vPvdbbWyME5j74EdBNX+ddI
         c/zEq1bzLqb0suA2bbJrvdbFAveAa8qSd17QS/+0P5q+5WUdLAwbw1edCTRu3+s9XulA
         nt/ywDsFBhjj03lmFXOqIlZHDGUzWTwcjqNDn8UzjXhnNB69dv2jZKNmW65mpZ9TjkaU
         4CIA==
X-Gm-Message-State: AOAM531ubBsQGgh30MHVhT4W2fZHHAWQZjifJFXTrEnvu3VzEpMtAkBo
	+MsQh/l/N4ZhviyiNQ+6oDAXT19oWWRl1hyBan4=
X-Google-Smtp-Source: ABdhPJzP1aZaWAEM19TtrO2b6vjAnkQe3Jv4lIKZinApqvI5lu1hLB+jQhcc3aV90qFvPCD1uOqsQTeyPDNPVH3nlVY=
X-Received: by 2002:a6b:197:: with SMTP id 145mr12446741iob.77.1593785198470;
 Fri, 03 Jul 2020 07:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200622105717.108062-1-alex.kiernan@gmail.com>
 <2fd43b04ea22019411e3e01669e879a838781e8f.camel@linuxfoundation.org>
 <CAO5Uq5R-oXNuqoVPpoC288smwDH459tjik6aB=B1+aOsT+dayA@mail.gmail.com>
 <161AF559DCEBF3F0.4124@lists.openembedded.org> <68c8ab0777b1b8e43d4d9cd7a0032a84efd39ea8.camel@linuxfoundation.org>
 <CAO5Uq5ShcQMYSYT5YFOa7i3sbAGP_dVWKrcPTiK3zPKFZZfvGw@mail.gmail.com>
 <c8d6a6fa55052aecc157642169039f4c7cdccef1.camel@linuxfoundation.org> <807b2c9d9bff71490e99029793e754e0e1e38ba3.camel@linuxfoundation.org>
In-Reply-To: <807b2c9d9bff71490e99029793e754e0e1e38ba3.camel@linuxfoundation.org>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Fri, 3 Jul 2020 15:06:27 +0100
Message-ID: <CAO5Uq5Sskpnv3UXYRSDg-WUrUG2Z1EvyT==FFW3HitGjoX3rAg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2020 at 2:14 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-06-23 at 11:01 +0100, Richard Purdie wrote:
> > Looking at the pattern, I did have a thought which I've not
> > researched
> > yet.
> >
> > Is it possible these are dynamically generated group/users in the
> > rootfs which happen to collide with the host user/group?
> >
> > You'd think the adduser/addgroup calls would happen in a
> > deterministic
> > order as the rootfs is build but perhaps it doesn't work out like
> > that.
> >
> > Are each of the above groups of files, specifically created users at
> > rootfs time?
>
> At this point this patchset is driving me a bit crazy. I've had it in
> master-next, we keep seeing warnings and its hard to know whether the
> warnings are real ones or ones from this patch.
>
> I'm worried that things are not deterministic and this meant I really
> needed to investigate.
>
> I added some fixes and more debug to the patch,

Oh, that's the /home stuff... I looked at that, thought it looked
wrong and totally forgot to go back to it :|

> then ran it on the
> autobuilder again. An example failure is:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/2113
>
> WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owne=
d by the same user or group as the user running bitbake: /var/spool/cron to=
tal 8 drwxrwx--- 2 0 995 4096 Oct 31 2019 . drwxr-xr-x 4 0 0 4096 Jul 3 12:=
27 ..
> WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owne=
d by the same user or group as the user running bitbake: /usr/bin/crontab -=
rwxr-sr-x 1 0 995 51544 Oct 31 2019 /home/pokybuild/yocto-worker/musl-qemux=
86-64/build/build/tmp/work/qemux86_64-poky-linux-musl/core-image-sato-sdk/1=
.0-r0/rootfs//usr/bin/crontab
> WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: /etc/passwd: root:x:0:0:ro=
ot:/home/root:/bin/sh daemon:x:1:1:daemon:/usr/sbin:/bin/sh bin:x:2:2:bin:/=
bin:/bin/sh sys:x:3:3:sys:/dev:/bin/sh sync:x:4:65534:sync:/bin:/bin/sync g=
ames:x:5:60:games:/usr/games:/bin/sh man:x:6:12:man:/var/cache/man:/bin/sh =
lp:x:7:7:lp:/var/spool/lpd:/bin/sh mail:x:8:8:mail:/var/mail:/bin/sh news:x=
:9:9:news:/var/spool/news:/bin/sh uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh=
 proxy:x:13:13:proxy:/bin:/bin/sh www-data:x:33:33:www-data:/var/www:/bin/s=
h backup:x:34:34:backup:/var/backups:/bin/sh list:x:38:38:Mailing List Mana=
ger:/var/list:/bin/sh irc:x:39:39:ircd:/var/run/ircd:/bin/sh gnats:x:41:41:=
Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh nobody:x:65534:65=
534:nobody:/nonexistent:/bin/sh messagebus:x:999:999::/var/lib/dbus:/bin/fa=
lse rpc:x:998:998::/:/bin/false rpcuser:x:997:997::/var/lib/nfs:/bin/false =
avahi:x:996:996::/run/avahi-daemon:/bin/false sshd:x:995:994::/var/run/sshd=
:/bin/false pulse:x:994:993::/var/run/pulse:/bin/false
> WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: /etc/group: root:x:0: daem=
on:x:1: bin:x:2: sys:x:3: adm:x:4: tty:x:5: disk:x:6: lp:x:7: mail:x:8: new=
s:x:9: uucp:x:10: man:x:12: proxy:x:13: kmem:x:15: input:x:19: dialout:x:20=
: fax:x:21: voice:x:22: cdrom:x:24: floppy:x:25: tape:x:26: sudo:x:27: audi=
o:x:29:pulse dip:x:30: www-data:x:33: backup:x:34: operator:x:37: list:x:38=
: irc:x:39: src:x:40: gnats:x:41: shadow:x:42: utmp:x:43: video:x:44: sasl:=
x:45: plugdev:x:46: kvm:x:47: staff:x:50: games:x:60: shutdown:x:70: users:=
x:100: nogroup:x:65534: messagebus:x:999: rpc:x:998: rpcuser:x:997: avahi:x=
:996: crontab:x:995: tracing:x:1000: sshd:x:994: pulse:x:993:pulse
>
> On that centos7 worker, the build UID is 6000, the GID is 995.
>
> As we can see from the dump of /etc/group, crontab is GID 995 and
> crontab files owned by that group are fine. So the warning is a false
> one and my theory about the cause is confirmed.
>
> We'd only see the issue where the dynamicly assigned UIDs/GIDs conflict
> with the host running the build which explains the intermittent nature.
>
> I don't know how to fix this.

No, I can't think of anything off the top of my head either. I keep
coming back to AB configuration, which you can't rely on outside of
that environment.

> I'm going to batch together the fixes we
> have and send those, then drop this patch from master-next until we can
> figure out something better to use in testing.
>

I'll keep thinking about it...

--=20
Alex Kiernan
