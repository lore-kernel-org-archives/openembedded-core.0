Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.723.1624386902054314384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 11:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=1K9LPBl7;
 spf=pass (domain: burtonini.com, ip: 209.85.221.50, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f50.google.com with SMTP id i94so24778111wri.4
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 11:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HnLvm9vhJSXt+CRzElFmEWcF+iiQ8bgJe0AicmTmIyM=;
        b=1K9LPBl7/mCFfqz6R3bOaV6yAlYJk7NloWT/n7bzsUS3CBE9FM4Q7alKPDD8YaELZ7
         G/3r/ixxFZJbDvQMqCmhc9przE1EU2Oz2vQDXTDDNdRy2Wve/VZzja/qgY797Z7NrlSA
         Xc5XxqsS+QOQ6EDjFNQo8s+n6GmOUqokvdfjacTM+P0iaZWbcoZHSjLTmdS4nbIFhLQt
         6xJGUXd89jkamWJH3o/VhNHsrM0JAedTPDsptovQ6lU/b80933kYL1EPsWLQfoLiRgec
         H18TDEVOZHfcNPq0+66NLmYJ11+HN5+zvR8EPUmsSRf6YQVIyr/BojIQE7b2WhRAlNml
         LS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HnLvm9vhJSXt+CRzElFmEWcF+iiQ8bgJe0AicmTmIyM=;
        b=lfjMBE7aYsRE6hj+wYr8nSyNjHx2eHHrQlzgrB9ktDmiUBtrbwqoQtK+BAswA62hzB
         5HtbdHYh+C8WP9u5+jTfwv1cBGaUplB2NB3ejdspeaaiQeDXmTUncHD4hvQWVMNeyIUM
         AqGIezbRcJ90pRCE86Me71t+nYxY9wDy6vDXv3NVrQuQSvfRFjtK4fpn6UURvttHRzaw
         wpt5DN9nEVtAuvJhtR00QtdrkSGvBOl5b+EnO5I/SyspFJ56F8yvfOXXze/MciWvAnm+
         AijAaCAegcwz6O+K5kgLTAGF2gSMDcY1z+UQ8tjFomIUyaB+xsqp2wZ1+SvhK2m0lHir
         YZzw==
X-Gm-Message-State: AOAM533H0YP48vENf0MceS3h3hPNozK80b3q3r6weSYsX3NF4AREP9rT
	Q6DB5pc95gK+qK6zqkDvzIPX7Q6u94nKFqow5sfj/g==
X-Google-Smtp-Source: ABdhPJyweeGBnCXGpV/x6DZEcf+KnQcID61mDxKw9YHEtD/c/465MKano6aVntLW+VKd0X4JRNATdm2YGmitI0l/jWg=
X-Received: by 2002:a5d:6985:: with SMTP id g5mr6769966wru.396.1624386900511;
 Tue, 22 Jun 2021 11:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210622162459.1449458-1-ross.burton@arm.com> <244e236f-09a5-2afa-eeff-d7191304ed19@gmail.com>
In-Reply-To: <244e236f-09a5-2afa-eeff-d7191304ed19@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 22 Jun 2021 19:34:49 +0100
Message-ID: <CAAnfSTvu__YAQ3PJCf1BVW8KeNd107XOk7bMkP7nw13xcL0zxA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/2] glibc: backport MTE improvements from master
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Jun 2021 at 17:53, Khem Raj <raj.khem@gmail.com> wrote:
> This looks fine, I have been using master/2.34 so did not see this
> issue, at this time I do have 2.34 ready for testing here [1]

Yes, I can verify that your staging branch with 2.34 is also good.

Ross
