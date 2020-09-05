Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.12821.1599283053405562354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2020 22:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qbg//ifj;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id 19so4909387qtp.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2020 22:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=SStGdl3HkhLajmVcxQ89FKkFa1eq4QRyE/4A35JuEZw=;
        b=Qbg//ifjrfg0Ii3trTv9HrVmHqFVlhxIleJZj5SP9BfNQtQivLy5dtD5btAbg21RoQ
         ZRnkixidAXSEJ8Npk1CDbmjftZ1kRa9o/TwJufa1E/spa2hGnQEZ1noz87C3PvqVogWX
         MdCiy4+EZFOkEs+KUPeyesYnNnExUNlvjrxK4ooursvkkzaizH4TeBLIRSXZviaRIO9K
         GUpHDfe9z81+pUMxL09UtiTuB2WA3QlpB6dgQjHgXTCxa72952pOJDVA4S8j45qAbYSe
         9CzJ3gdV+ZS0B0H9PmoCmLPTQvKE1iGzOywL4uTeKzRB3B6GqGUY06QvPMgRmZu7IquM
         tCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=SStGdl3HkhLajmVcxQ89FKkFa1eq4QRyE/4A35JuEZw=;
        b=EQ5FCiqcid6xa8dyv2EiA2LjvuRUKHsGJ9u/5fk3Mg+czMRqCbqhmCZ5wEuWENPzHn
         Vo5UDjAvOuAtIfq5ywMNIj2EdZqRij2OrfZSa/IcIHpoahdyBQYUOl2XaDoR1hntMyXY
         ZjFo+Ymtcz8nIHaCiITKHRLHQCGu8k2MVC/V/ftlw9SViLpraue3RolCqDflk7eZUrHx
         9nZB2egeZuVx8dbot8SF9GI0l5Lmwo3MwVRxDA1WvenHVMt2iohsY0zQ859DDYdHu1nT
         6tSokycwTXp2EFxfhamrq7I4rWepKO4GCwy5kWVXq/kvR/xKDCT2vsfIjR+mDa+qpwJE
         Utzg==
X-Gm-Message-State: AOAM530UKW7FZJx5G7nnalt6098ZGvMw5sAVuPyqpqsOelZac5+IEt4Q
	pf9Z8tKX4UvkcFTvVuSq0ce6yN3rTjDdRH3q3UL4OrojatsGUQ==
X-Google-Smtp-Source: ABdhPJxTQ8GKB3+/68NCH04LUHYujifM2wRJ93Vy5as7MbhQ7n2Ky+b2uNr34YSk3ofvDUf8LAgkFrk9teZduLoZneA=
X-Received: by 2002:ac8:120a:: with SMTP id x10mr3618093qti.88.1599283052197;
 Fri, 04 Sep 2020 22:17:32 -0700 (PDT)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 4 Sep 2020 22:17:06 -0700
Message-ID: <CAMKF1srFUkD9s+5628fb_xeRTy9KQEwWQT8esK5dsQOqDL1MiA@mail.gmail.com>
Subject: core-image-weston testimage fails
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Alex

I am seeing below error with core-image-weston/qemuarm64 using oe-core
master. Any ideas before I debug this?

NOTE: ======================================================================
NOTE: FAIL: test_weston_can_initialize_new_wayland_compositor
(weston.WestonTest)
NOTE: ----------------------------------------------------------------------
NOTE: Traceback (most recent call last):
  File "/mnt/b/yoe/master/sources/openembedded-core/meta/lib/oeqa/core/decorator/__init__.py",
line 36, in wrapped_f
    return func(*args, **kwargs)
  File "/mnt/b/yoe/master/sources/openembedded-core/meta/lib/oeqa/runtime/cases/weston.py",
line 69, in test_weston_can_initialize_new_wayland_compositor
    self.assertTrue(new_wl_processes, msg='Could not get new
weston-desktop-shell processes (%s, try_cnt:%s) weston log: %s' %
(new_wl_processes, try_cnt, weston_log))
AssertionError: [] is not true : Could not get new
weston-desktop-shell processes ([], try_cnt:5) weston log: Date:
2020-09-05 UTC
[05:06:35.986] weston 8.0.0
               https://wayland.freedesktop.org
               Bug reports to:
https://gitlab.freedesktop.org/wayland/weston/issues/
               Build: 8.0.0
[05:06:35.988] Command line: weston --log=/tmp/weston.log
[05:06:35.989] OS: Linux, 5.8.5-yocto-standard, #1 SMP PREEMPT Thu Sep
3 20:37:49 UTC 2020, aarch64
[05:06:35.991] Using config file '/etc/xdg/weston/weston.ini'
[05:06:35.994] Output repaint window is 7 ms maximum.
[05:06:35.997] Loading module '/usr/lib/libweston-8/fbdev-backend.so'
[05:06:36.004] initializing fbdev backend
[05:06:36.029] logind: not running in a systemd session
[05:06:36.029] logind: cannot setup systemd-logind helper (-61), using
legacy fallback
[05:06:36.029] <stdin> not a vt
[05:06:36.029] if running weston from ssh, use --tty to specify a tty
[05:06:36.030] fatal: fbdev backend should be run using weston-launch
binary, or your system should provide the logind D-Bus API.
[05:06:36.030] fatal: failed to create compositor backend
