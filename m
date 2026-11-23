Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51251.1795428166491164978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 02:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=gUOEWuEn;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so23218735e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 02:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795428165; x=1796032965; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zTDp1org7WtPh67fy1SVCbORSGJjFlfsLUPae+bztfs=;
        b=gUOEWuEnR7+AMKtH2D/qg+N2v8SbtbyfTx3pxHgMyAGRK5qDGS+y39heoK0rWf1bVo
         aqjcWlRnkjTrlcZDEmuwyTnq2DjVVfRsdFiRmdcHm/thgRzH/pqgzqOFg/GVyf+69OzM
         tjln+antnVWRXZozJtqbkqykJi+MJqD6/0mGpVC7jG0Y1vgRXu6cCv4qfhsojMAei1+M
         PL84F6vGiDGbgDUN4tVSmKnsv1hDXMqHusjnOI2iXYjPL196qpj6KEBUAfL3Q1A/iKJi
         1WRAv46GBSjj+N0cs/suhdC0CMTUbkf6K7nODXVG19BJ79umHO/yGpgWN0kbY/xEnsaP
         YkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428165; x=1796032965;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTDp1org7WtPh67fy1SVCbORSGJjFlfsLUPae+bztfs=;
        b=gze22R84aPT8cKoGPRyg7O3HOH29SKzJ8T+UtHvd4M7z8oDADtGse2Vu3tbv91tAQs
         o3b0bzsqX1mzYwSlp4o9NsYMoFzx7iu69PuSY7pz3aEkTkt4V8LxCCxIv+axPzE3U8oD
         xElI2aHFqQdtYZtz175RUbHjolmVYCVAshWvPgm5dQX4ZRhNLFTlZoegPHmFH6bswXYS
         EiXh3GQ8lPaGd9sT4vXR6L/3IHpFXQyX4dfhKji4E0CkSgzdwWPKaA88HkW56B+butVl
         JMeSFq8cli9lO+PjhDMozfFzdxyocd5y+zVDzJ3Zj3ugKvJECSZk9NdzEzPjrO0OV1yr
         7MjA==
X-Gm-Message-State: APuU4Z+C1x7z+VhdIoQfQ63izMIF6nPHZQbgaEUIk/DLKUqg0RX9Z/1c
	Xo4AGNYsxW3hWVCJCvpf1UgyZJSfS+IZiG57rZEQmc2Am40NpY/U1mQ4PHVoLcN841M=
X-Gm-Gg: AZFdTZfHktC0MoYojttBqyfngX/wKQ7DMdn/y2l//DbUElUt27LyXSnjkVLkIrZrKb6
	wf248m9qcAdSMnTir8cBI2Ihlev2SNEL0VcUPSue0PPfPLQucBKq1JNzp5L2QLhM5aWcahV8Far
	vh6r5Om5EVyBSUF+HfjB6NQMDAxw+CArvQjezVyAzCDXpFZAfOPqQ0D4Z9QZhwiMTJMosL7iBvt
	IHTxShnTn/yvZaC3kCAbNGRCWRps/vNTWJYQ6flBjfzykp/70QKYNlPVx5ytNfYWx7JkHTEi3Lc
	4uZ7KiT9xZsIHE86kz/hM4LBvlS9tX1GuB+elv4lZAGxfzeX46cbMncyxjvg86675iwqC67NfD7
	Jcz3NpEum2wG5wT82DhSPCCbFktgRAXw4Af05s+Y0wh80zpPOo1nWI00iw7WERjekUAhkmcjUFv
	3IVKoXiI03zNXhFY8m+vzUlMPnQd15/1sLd42EdyT9DjH3mb/p1REcRRVkEDfJZVb5E9xy1xfEG
	ZdTJLIVh4R6ywLdhR5LDYcpb510jtvhm2AZ/MVyDMN1oYGdB23um9ugHF0C8t9ipjIbAO4EKfW8
	/8vjaCQS89V56cF9c9t0QAxai6uNxQkTQcslC2FCiWWf2YosP5VZ5n/kvQ4weyzLT+UhqhEEl3u
	9Xdo0SPlqWPG6KA==
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr227014965e9.19.1795428164649;
        Mon, 23 Nov 2026 02:02:44 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm345706045e9.15.2026.11.23.02.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:02:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 11:02:44 +0100
Message-Id: <DN2I5ZXYZ4IH.1I13EZR3SLYI7@smile.fr>
Subject: Re: [OE-core][scarthgap][patch] systemd: rate-limit tail timestamp
 refresh during iteration
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Vijay Anusuri" <vanusuri@mvista.com>
X-Mailer: aerc 0.20.0
References: <20261116145033.2369325-1-vanusuri@mvista.com>
 <DN18ROW5HVTW.25YP9YGBIMAZQ@smile.fr>
 <CANQUz188XSj5Wi78APFy0H9WG+oOvbkV3anvpki+1ibgJ4vopA@mail.gmail.com>
In-Reply-To: <CANQUz188XSj5Wi78APFy0H9WG+oOvbkV3anvpki+1ibgJ4vopA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 10:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250893

On Mon Nov 23, 2026 at 10:57 AM CET, Vijay Anusuri wrote:
> Hi Yoann,
>
> I have applied Jaipaul's systemd 259.10 upgrade series on Wrynose and
> completed the build and runtime testing.
>
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D53480
>
> The build completed successfully, and the OEQA runtime tests on QEMU
> (qemux86-64) produced the following results:
>
> RESULTS:
> RESULTS - ping.PingTest.test_ping: PASSED (0.04s)
> RESULTS - ssh.SSHTest.test_ssh: PASSED (0.78s)
> RESULTS - systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.59s)
> RESULTS - systemd.SystemdBasicTests.test_systemd_failed: PASSED (1.20s)
> RESULTS - systemd.SystemdBasicTests.test_systemd_list: PASSED (1.10s)
> RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.6=
0s)
> RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED (0.77s=
)
> RESULTS - systemd.SystemdServiceTests.test_systemd_coredump_minidebuginfo=
:
> SKIPPED (0.00s)
> RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable: SKIPPE=
D
> (0.00s)
> RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable_ro:
> SKIPPED (0.00s)
> RESULTS - systemd.SystemdServiceTests.test_systemd_status: SKIPPED (0.00s=
)
> RESULTS - systemd.SystemdServiceTests.test_systemd_stop_start: SKIPPED
> (0.00s)
> SUMMARY:
> core-image-minimal () - Ran 12 tests in 5.091s
> core-image-minimal - OK - All required tests passed (successes=3D7,
> skipped=3D5, failures=3D0, errors=3D0)
> NOTE: Tasks Summary: Attempted 1341 tasks of which 1339 didn't need to be
> rerun and all succeeded.
>
> I didn't observe any failures during the build or runtime testing. The
> patch series looks ok to me.
>
> Thanks to Jaipaul for the patch series.
>
> Thanks & Regards,
>
> Vijay

Please answer that to Jaipaul's thread with your "Reviewed-by:" or
"Tested-by:" (whichever applies): That will be easier for me to track.

FYI, I'm working on the scarthgap release now, I don't think I'll
include these systemd change in it. They will be considered for the next
cycles though.

Thanks!
--=20
Yoann Congal
Smile ECS

