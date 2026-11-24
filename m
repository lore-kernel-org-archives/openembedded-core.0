Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15137.1795517192395794940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GJIxaHFp;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9211bbce3abso35971166d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 02:46:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795517191; cv=none;
        d=google.com; s=arc-20260327;
        b=eVUDhvW7ynkDf/5oca3cfhusmLibzPpVIEii4eQm/7ketJgRFD4iH75xpQ3QlfMcSr
         5KD56FIrbGECzRipt4VcqpFhjjMUeppRXHf3eNNqgTND1ge7ubV+KLV5+5NrzSs2Mazu
         yxCcemvG3aU1yuevHKhKaoeIHriPrWdIQyhMMVULXurLkbNhNQeWszLLRlu+65Wfu1zw
         vzelQa+CY/yaGeN50ja5SSCT4S8tnrXZN15++avIylBcc9Dja3CfjmzciaYIMZ/FTOlD
         7buQ+n1jZU9pbg1hzz0cR/lsP6was0vgdC5ivnIwUJMpW4Gwm1xA7MpbtcCmmEwTTmKk
         RMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5SkEP5G8pFGS/jAT5tEq28WFlOMTWg56rOXhXcZ4yLE=;
        fh=t7chGXBqmskmzQUmoob6Y92laTW5wYR0hjIqvaBb0Zs=;
        b=FIgJc2zmpPUrqfM3rvL38fxkQ95Taz2tkP3ENimzFVMCzn57caFW9QrzHedQrkM8l3
         ouzxxq6po7RjWiLLl3Yg1LmHfN8QExqs23kCDa4FurYVTJA1UQFPgBIkakCSpPpCofzI
         0c5Zymd7EoRPZt69BL3UdDn7MUbElOMbb7Qc7d55x85rbGqmJ6jhHAWaFWTGS9qdIVi+
         wBRArfItf68AlIAJGHs9RUs3U9TD8XmQ6XHCmKvPFYwSk6y4Au/qlcuVxfYJJQB3KlCq
         Z7JIWmnXTClRRw9leDwO3JIN88Y3e5VnxLJySGCzF+umN8Mtou/1XKSBuL3zzvdgI/WV
         B28g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795517191; x=1796121991; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SkEP5G8pFGS/jAT5tEq28WFlOMTWg56rOXhXcZ4yLE=;
        b=GJIxaHFp7YU9l5pUDN5RmEhSBiyh48NVTBqMviAgSEjBzayGhJblRZIz4ZIHBzMFRK
         MX6SE/t0DikKghovyz7G6qBspKBNazv16A4aU5uy9qO6DEKyk/UZL9JDHzX7ylbelHZB
         dEJyYJ89/qLR/KfBE6PmoKWiatUFvqgsR9Cgjd3zj87vdxAL5A/O6BSYIKydczDRtmLt
         RUIrsQR9qP77flrDLg9VDdogJRkCKc00I7i8PObYuZ3h6K0jkrbNHnqH0dfbVklreCYx
         ld3DdPh7NPi94v1Kx+Tap9duPc75hM4ZHNdVT1r6RBRfecwTjOtoYjvvpG6sj7fr+4/4
         0MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517191; x=1796121991;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5SkEP5G8pFGS/jAT5tEq28WFlOMTWg56rOXhXcZ4yLE=;
        b=xg/HtvyarrIWCyNondFXSUbRQEg79za50p96XbRJLLjAKPqgW6goH3Ys5hYEWPYjUd
         4wJyS7yh6crM7pPVO0uLuhjxiu+/lpfaY4S2ESwjzyzlaxhZC0iSe31JvBY4gy11v6LG
         LOG8iNwu5UWARYfjnPtY3eitKwGRVNatUb+khQ8bbkUVhCnbax4SJs+3qG6tL1oYTAdM
         4/46XuSHKV6KAKLuzi3nHt9ylBZIIug5i/fnANguVLbC2f2P4jjfJOMaD+y4MTmWLqWX
         tdAkVJmV1y1sbzd92MFOIFH4vs4V1+RFIFMSBVqD1BNrMnmZy3vAz4XlDDSsqWokWAfb
         Xytg==
X-Gm-Message-State: APuU4Z9Hbf4U03L0VczXGOrjv/OXlQJx7Ioed209yfpe9CVoYb7zuwna
	DP/9kQR0GkcAMR0AEWjwATDsgTQIy7lgC0R8t6N2J8+HXg6m/vNB57IoIKPprXtAGJmEfmOuN6L
	onjEsG8fWIVckDucRYBQkoTAnB9GLeNo=
X-Gm-Gg: AZFdTZcBmzb9hDCXVzVxDrRM1qHEGyvZdstAy7f8J9Vjl25PZ8jQHeGm4TdCAWr1R9G
	ZXs51o2CD/fyOgLkzfVf/sju84lR+Wro0S+AvtJ7Q8uSZ4h2nNzh9uGn7ta3lhg0koX6iOszF+v
	psmSpidPpfmqzFNMwy8XQFJqKbvEZ3REleAm/XpWeDkjA2YLXLpuJrtYCyc/UADF/kNsYHs3KAf
	5b2yOrgNrBt9NZGvNqEj8fiJUi79jdmQgKH2xMmpR2c61AZgwy3zDsSeteEWqKx8ahn47KAfdF0
	AbHqmcW1T/wVYj2jak/C38XzToXtBh8BPieeRAKfR45FVvvNAvcqdx4PyROT3H5ONBwzFwzTGH7
	nukT4Vjv9FsTF0NZqb3DRwSbSB8fOWAGTh5FG47xbVDorgSglNwOu86NEXInpwIqyJy3Z7TM=
X-Received: by 2002:a05:6214:5294:b0:921:3766:8307 with SMTP id
 6a1803df08f44-92137668410mr233808326d6.10.1795517191213; Tue, 24 Nov 2026
 02:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20261124054841.2576858-1-hthakar@cisco.com>
In-Reply-To: <20261124054841.2576858-1-hthakar@cisco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Nov 2026 11:46:19 +0100
X-Gm-Features: Aa3M54qsZNdJ6AdEP-PpIuGcBeGSYA3axldvl8Bm09d3baZawv5OS9AHy6gLtqw
Message-ID: <CANNYZj8G8WR+EkPx6+PD4cS3DwFv5G=YjARDGmqNuJgT8D+ceg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] attr: fix recursive getfattr failures with low
 descriptor limits
To: hthakar@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005edac90661036caa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251005

--0000000000005edac90661036caa
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 06:48, Hetvi Thakar -X (hthakar - E INFOCHIPS
PRIVATE LIMITED at Cisco) via openembedded-core <hthakar=
cisco.com@lists.openembedded.org> wrote:

> +Subject: [PATCH] walk_tree: resume traversal through anchored directory
> + handles
> +Upstream-Status: Pending


Please submit this upstream first, and do not claim 'pending' without a
clear reason for it.

Alex

--0000000000005edac90661036caa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 24 Nov 2026 at 06:48, Hetvi Thaka=
r -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core=
 &lt;hthakar=3D<a href=3D"mailto:cisco.com@lists.openembedded.org">cisco.co=
m@lists.openembedded.org</a>&gt; wrote:</div><div class=3D"gmail_quote gmai=
l_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+Subje=
ct: [PATCH] walk_tree: resume traversal through anchored directory<br>
+ handles<br>+Upstream-Status: Pending</blockquote><div><br></div><div>Plea=
se submit this upstream first, and do not claim &#39;pending&#39; without a=
 clear reason for it.</div><div><br></div><div>Alex=C2=A0</div></div></div>

--0000000000005edac90661036caa--
