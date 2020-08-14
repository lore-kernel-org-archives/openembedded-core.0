Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.348.1597443750227462247
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 15:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=MPcxafVJ;
 spf=softfail (domain: sidebranch.com, ip: 209.85.219.67, mailfrom: leon@sidebranch.com)
Received: by mail-qv1-f67.google.com with SMTP id l13so5011981qvt.10
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 15:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MtEFX0jD2SRbKo0rqu6kS4Vpb+DMEbYPisTGvaZjwms=;
        b=MPcxafVJ3G9WR7Sh/gZDHD8sgZ03hrLJGVJeU0rxklxn35Il5xAAdz/rC7hPRt310j
         3ixrEGJms68JPq6K4DyeTIxyye7GTLXUFtF5CxQXTTDjqR7fDBz3j8CXM3j3kt5/avke
         tp2vnxox2E3oFIaRLDU5iWerFgI1xZ4RkrqQbsaUZVOI7f6qcwEnUc0Mr1z2EmoB92dI
         slt/7SsOZ0cqQpHq+0B8mwQx4wx/MbnXMWdbG9pMhbXRiR5YZ2mbe0EMKFrvtMJLuJ0W
         XvPCmwLY5dVjKK4y1c6o3wz5iWqUyleDCZ3HEr1bNmL1xLQT0dO4ekxSeGULM+Z9u0Na
         na8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MtEFX0jD2SRbKo0rqu6kS4Vpb+DMEbYPisTGvaZjwms=;
        b=h6eCv9P07K1+i1N4Aiwk9MPXuP4rXl7vUuhONoMKSWF+fPjjf+7feLBW+9VpwKdnfh
         pJucN5ZHcCWokBbCNj4TxW7PgFEimZtTxxvhzzfBgEKPod6EgEIAjDR7NKbVYgHx7A62
         2OhLsx/coEq+TRYMqtxv+QEHVMBWKUTMxK9sjvnvx54JcRwcXpYK7Oe5j37YEnXHUMrS
         OGBRP+Im846WU+vbFr84XK/jA3jduZm+Mx+J+s2TMsPEvbefu9iOz7OcQ4srBU0VliF/
         uJ34m2sWk/bNdDXo+t30BVrgBir9BkQQY+1PPDCsRFCpeZ5ejIXIfy1Es4eK6ASzNIRb
         d6Eg==
X-Gm-Message-State: AOAM530GQHBjbTO8TVTWIxAWCUEL4rGhNzEoo1ayEBs5wv7zejpl2+eI
	0w8dxS1pRzihikj9SLpKEaRaSJTh1g44NEDSIla1Wg==
X-Google-Smtp-Source: ABdhPJx+5Du9xe8N5D7fcRhJFR+lNXtqyzjl58MKwSvCIqXZMHg/ixDYzLRxPPk7IieSl7bSMNO5v3OC0gonR+uHunk=
X-Received: by 2002:a0c:f702:: with SMTP id w2mr1106358qvn.152.1597443749318;
 Fri, 14 Aug 2020 15:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <1597438000-20251-1-git-send-email-leon@sidebranch.com> <CANNYZj9i+s2ORHFtJDZDHJUQ2pfFHAbJdK+vp3cFSp5ZHNuitg@mail.gmail.com>
In-Reply-To: <CANNYZj9i+s2ORHFtJDZDHJUQ2pfFHAbJdK+vp3cFSp5ZHNuitg@mail.gmail.com>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Sat, 15 Aug 2020 00:22:20 +0200
Message-ID: <CAMjhiJgYOE4t7p80bmvG2pZFDOz8kiWpF_7GSRaLMJ2aVYsfJQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell] [PATCH] cmake-native: Use cmake-provided zstd library; supported host distro zstd may be too old.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Alexander,

On Fri, Aug 14, 2020 at 11:44 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This needs to go to master first probably?
> Alex
>
> On Fri, 14 Aug 2020 at 22:46, Leon Woestenberg <leon@sidebranch.com> wrote:
>>
>> cmake-native uses the system provided libraries due to:
>> <...>
>> This fix is to not depend on the system library and use the zstd library provided with cmake.
>>

Yes most probably, but master did not build for me so was untestable
for me within reasonable time span I had for this issue.

Regards,

Leon.
