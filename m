Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web08.10038.1628431457539620614
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Aug 2021 07:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jlf/iMwm;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id u10so19795190oiw.4
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Aug 2021 07:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=EsnemcvSErrPOdlRitcx53iPi2svCZxSnmm2X2NbqMI=;
        b=jlf/iMwmslgB3rcRR1tOhNQFFd8qipr65mZKfeWhdWl/UGVqyG1IdFmq7I6l4We0Sf
         PiEE0zDoKyfiZ0nsq3wbS7eSwIvADElCdsPhy+DIOtrC1tQ62xLY7L0rKXfT9/yfenCI
         s3v6uwL9+N+sU1e8qkbnIMh2N8gHHl6GqEALNfSwn3rPxvgcBSyHXw8JLNibwndp8RV3
         ZEd/rU6HDdg/5j+8edd9cqQJIOdevAm9YZ8MEJH84S5OrIHRmBc+SFtm/rTgBHs1X+GQ
         FDRAmY2pfRkW0dip7QDdEcT/EUxZFTwGlEPBcr/DdFJuKk9/0bOzpZu6sVUCWxN6H88E
         LCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=EsnemcvSErrPOdlRitcx53iPi2svCZxSnmm2X2NbqMI=;
        b=lIa7BQJD0UhO5qYMHGYEZzW8CKyTvaE+iixWowJVznKwu3NNrQYmE6yN1/smOxpYyL
         DrguDuFEqGW8AiZV9cFFdPzH+nXZfyJseK0FvkIXin3JQl6v/AVLYfie7fMntMppkRdi
         j2MgyGV7pl4D9EMGKYUjLAdSqfJyzOlbKqKgYiLRORCmpX92xVh3C6oXpGCSClUZtwqK
         o5Q+PxS1dRRanv7hQNop3DRgPX5nDn11YaqW8r1SpcRdr431rGo2pL2dX13JpCFGzSVS
         ws41jVNKVgyA07CEJxR477TUqTdenW6Az9+i6wKARY/cO/zUKUFkDdFphA60w9IfjFS9
         rfqg==
X-Gm-Message-State: AOAM533//Nf3LL/XgZMnT9lkKY0eWJ5SWwTCvs+/mDi28og0Wyk7Ke41
	mKtVPl3E8fXKrRLeWihU3nY55+9T9BvtvJ9T
X-Google-Smtp-Source: ABdhPJyqUxnwok5aJ3N5Z0B2UMMtCjY0D+1RZtnxyR4bkoUThOx5ovk5R4OhoM9/ds2aAiyXvquRew==
X-Received: by 2002:a54:4d90:: with SMTP id y16mr18604015oix.76.1628431456297;
        Sun, 08 Aug 2021 07:04:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id a8sm2604177oiw.52.2021.08.08.07.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 07:04:15 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 2C0CF9602DA; Sun,  8 Aug 2021 04:04:06 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 08 Aug 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210808140406.2C0CF9602DA@nuc.router0800d9.com>
Date: Sun,  8 Aug 2021 04:04:06 -1000 (HST)

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 11 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-35942: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35942 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
