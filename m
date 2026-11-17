Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13978.1794907728749433869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 01:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20260707.gappssmtp.com header.s=20260707 header.b=Kjs4ASGZ;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.128.172, mailfrom: jester@theyoctojester.info)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b4cd576f2aso18373737b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 01:28:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794907727; cv=none;
        d=google.com; s=arc-20260327;
        b=fGu/kSflvwffzAx3Eu9LSzOfGa5/AYQ1sdnvZwKPanooSggrhkTpRpWtH5EFBOlEzo
         KB1hihEeJBUtr3g8QcGKKVapQau1P7qZXkN+ueXRxqAP+tzJeOxil3QGjGqoAljPsy+y
         LvzIVdPmje7Ww6e3Y9hIG8iC8vVLMahMdxHCJiGGPFxZzUgtX1oK9vA4yoKy00jNjpyP
         aem4Fretc4d5WYsHmRuGMuXWRfJbSchmOykuqVJ22VyQ4iznim63fJvIQEC/s7/BK2Iq
         x+qn2zxiuyGSXY/na+eFxzVk0RarC3I9ogiRse6EiQrN5Wfs1qtEHMuwcnLaj0V6xcXx
         rAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7zGHJge/+/jVxb6TNIn8p4XO+EYoA7MCp//QCyrMLbw=;
        fh=eNgii/rhf8FxiHk6a0xWpYThESCFwUfKDUqgZ5C37kQ=;
        b=CUAaJKcEmfVY3vpDd0Sj6zHfowWovg75AUPz9CsCzMn59EznciCsdJgTfgF2U8KBSn
         L/zv/lBT7qiOas6hfL/dxdn/+ZO9RA1ATSNv76zLIGzg9T3Y/9tsXzxldVX9Gt9HZZzx
         +0GCu6dcEe2tsIiBXHpBiAHTP+5jL/9MJqnlH8McAUpZaax0FHU/BMehhKMUOQesO+oz
         tme7TuvdcM7c8C0FfuQVX04piyHu2Z2vpTNmjqkSMQM29tS3AWZHvoTCi4z6JLfZvEyf
         910jfZ65BXk8va0flBBsBQKgrIpgjcP9VfrAX/FFB3vDstWrXgUruGsBBYdOSRYNea10
         H04Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20260707.gappssmtp.com; s=20260707; t=1794907727; x=1795512527; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7zGHJge/+/jVxb6TNIn8p4XO+EYoA7MCp//QCyrMLbw=;
        b=Kjs4ASGZSyBGD71+otkCX9UUMUaeVjN/iD29PdM+gsyp/YIrpddtlstWcCZwmd/l1/
         pXayUvd+Ds+TTMLdXZAphDznQw0gWidN/PgRcvjTp55FTzRmHlOPc95hKnDXIOBydvlb
         lb/k2M4vy6SbHQHZcXpZ0zaToK3CG5MqGgkxaWs8MROec84dt8iFJdJQJX1ez8N37GfB
         I8qWRhvyrNhwz1qFRRDpFay8dGgOtsTQIbYwsUFct4V4LVbbW7M1NYdFOZfUfGTrntlb
         7kPTLaRoqRxM/gxuPIuQjwQh1uiGFW/iHZSvHFE6FttoU5VG/mPV6eSSPh+8CEk1odtF
         HPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907727; x=1795512527;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zGHJge/+/jVxb6TNIn8p4XO+EYoA7MCp//QCyrMLbw=;
        b=MFBmjlgV0LdhWctlndoCym/3kvsqCMHVgrKxLk1bixVE2SDAlpIvjKn4Dek9VMzbEL
         5cYkpZrOkEq34pAstb95O8X4ZCJYpC6OXRZ+BSvqcEQqghGTZeDYje/jC+rcbBXId2d9
         PvkcAOHMJSISZj3QLtxrUIRWoUQ35e/k6mKoJPtyVPBb2+WjKoxrQSiRNoKtWpWGHUg1
         UE4mrgS7kLIBBSJHwD9B4U6Cw5H46kurh4mxy+KXzAvvsC91QICblW7PfPCBn/6fcsEB
         Uq/o8KuSty0CMYpWKdoQQf7mfKLIDBxKfbJ1ju4BYRbq4vN+wbH9ItCgJGAX/RI4xj2I
         yPNg==
X-Forwarded-Encrypted: i=1; AL+hErGBkK1NZWdz0Hmo8jd1NntkZAAmHBgPgDlPKDmVX9ViI8tLdZkX1HkaeDvZ9ySRpp1DEtIjtiIxl8cJyV2jgE71mA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z95H8IEsLv8btWNprnEJZg5N39z6XdnvFSTC/VSpRT4FDGTDyoD
	QbKueuZvXdtltyKRaJZkZxf9Isb/rz/LwlD0//Kb0YVz0pnXkKRXsrxTGJBRq4eBa1rP+Egb2wY
	+E0zxzRuxcaepelVtjDpDTtZHVO+mh668BOFfPQcYKg==
X-Gm-Gg: AZFdTZdQC+zm7F2VeDq+XgA81oAPj1TLlmDVchyQ769EKrpj6gm1cWcdzxsbqOK5PLM
	zLnp0pkqsO0XmT99nCFHGrzUsymDzJWCM8YwcbWkYfIkKRDOxX8iRaAURa9Wbrjh8AHG6EBbsjt
	llOrGWt5VZLU5JHZtb17YtZMPznTU3FGNFA0d2r7VZYhcMk9oxk7bMDZ/wRMfpr0JmnC8JIM2Ts
	+FIu9Wm2KlWuembjJIy/6esX63cE9EcsMEv5vz9X/7XYBrE0eqwrnMG/654EQXcnEpUuWIkbvvn
	jJKzMWPcOP1VYlp6dKi3OsOcVlB7SWtSV8dxbvEwv+9zgxgO+y09n8K6wk/EFiT8tBtxXUsPJ7M
	XEVkaBe38BEgq5cIrROYJIaNn8VT4uMuPoQDmJr/zQmB08pRQ14Ov+0WNclBD5HvDHR79SfUPeL
	xVqG+1m7iRdHx9BQTJE7yAOjfbfAnqghurAS4Ukuz3vQ==
X-Received: by 2002:a05:690c:f03:b0:8b0:bc6c:9229 with SMTP id
 00721157ae682-8b4aa2e33c0mr84636287b3.27.1794907727496; Tue, 17 Nov 2026
 01:28:47 -0800 (PST)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Tue, 17 Nov 2026 10:28:21 +0100
X-Gm-Features: AclHuK_RWciqAMZ5aWmBm-5DFBFJHFzzw7jqQk-UCGMm5KHZEAGdLt5dnKHPr6c
Message-ID: <CAEt6NwrXK7Zcz=Ljc7VS4U0Qu+yfTb33SDpjUn-GA62CDgP0pA@mail.gmail.com>
Subject: YPS 2026.12 - schedule and registration
To: Josef Holzmayr <jester@theyoctojester.info>
Content-Type: text/plain; charset="UTF-8"
Bcc: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 09:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250415

Hear me, hear me!

The schedule for YPS 2026.12 is almost finished, and we've got the
good, the bad, the ugly... I mean, the good, the better and the best
things lined up for you. Check it out at
https://pretalx.com/yocto-project-summit-2026-12/schedule/

And then, hurry up, head over to
https://register.linuxfoundation.org/yocto-project-virtual-summit-2026-12
to grab your seat! No change since years, still only 40$ for a
whopping 3-day program.

See you there!
Josef
