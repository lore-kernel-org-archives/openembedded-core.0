Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53396C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 13:17:12 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.77761.1752499027336014177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 06:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dlW9YTQp;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso36004006d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752499026; x=1753103826; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Mzcdv492Vh3QCqpTEyqoW/Lplju+m1EUHN7HB0OSAA=;
        b=dlW9YTQpcC5XJJwpvP4eaR+23OegVEGJTZ7odP8yofZvwGlPqpZopOfiBQstKPjhBX
         n7pTkuI5z0J9D13tTX27PDvwCxErw0sccqpC982qtJLYw5PeNZv8sG3/K4gLZCBxO1A5
         WUAWpz0vExkjMucXVr9bLetsobwHkYMuD69RJK7VcXqFBuHhGz3FNQEfllPRCTJDEnDg
         RG/Bz4zVtkVK7gaRt39IgGzdcxoF5HpgEjsEHwT5hg31nNejqdqSQXMkwvaGFCUkhmim
         dBa8oHxjZUWpXOAEDP+ca9EXlcsAueDI4038C1UW0Q27cUPeP3Oyo7FrqjTYhb3AiGyI
         l/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499026; x=1753103826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Mzcdv492Vh3QCqpTEyqoW/Lplju+m1EUHN7HB0OSAA=;
        b=W6ADlkPutVeZZonMAWXoE0mrzYIjks8yxuS+odTbDQHiXfpDRWd62WDAcgIYOiVGSO
         ot7sk6TN9vKio56pKZl+b9UFWQ83vQRCo6Q8iewSRXCfLPNsdHwaTyvkTeGa0TbNGWNM
         fgIAP1w6mMTIk2kzgWitgRAsCFWhiB+6CkNFjuVx5AZtCSgZ1joUDjfbcgGgEVAVr35y
         2ScoLLQ3264hj2FwVKybfhX19m7lvwpRZD1DRamGSUScP0abZ1TLMXCfAf8bZ0Kv/nTb
         hFfkocp1bxfWDsOa6pkuduzjN8SWGIqmqd8LY0AA18FgH4M39qlzws4VdeHCAhy8vDuH
         0dRQ==
X-Gm-Message-State: AOJu0YwBRL7zOIMZD39J4gIcJgB7SxDv3rkitq9/z5wYobne5rHVVfUJ
	HYN3C3knI+EJ6aU2YqtdkdyDP5bwLkcR36bVccCu6/diqfbsM13RX0vHj/NNiua5n0jflvv2STu
	X05myq3wce4HxOBW+frwYbwL4JvBXLZg=
X-Gm-Gg: ASbGncvThvq5FrNcY2MC8ALRHDWm3y1gcjY81i8UKOGTHDRO7Y0HPMySKeCUoL452pK
	0XMBx2jIP6o2L6vq7aM/xMtfkRYDSBAbvdr7W4Z8mAPy/0QfI/Wo4b7QoW2FnpISkX4Tm/K20T7
	OSD7XPbITopZqXdwkXJCm5RoUSs1c5xboSgqPh4WiqlJANpk4CAVgAyAoDfz8mfXL0XSkcJHi/W
	ni74/aeZch95bPP49vnb+1EVgsjwmW9GGA3KinQPx+JJSf3J14=
X-Google-Smtp-Source: AGHT+IF43Vuqq4OF4PugbSU6eLGYn2imokqMvQAnx4NGlj85MEJJiuttia9Shlq+HWr+8VVI7U0WtEZIyJHxl4lw0/E=
X-Received: by 2002:ad4:5aeb:0:b0:704:9245:283 with SMTP id
 6a1803df08f44-704a40eac3amr209385786d6.15.1752499026119; Mon, 14 Jul 2025
 06:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250712125103.3404739-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250712125103.3404739-1-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Jul 2025 15:16:54 +0200
X-Gm-Features: Ac12FXz1cxYMXk5AsAVIjugN8Suh04RFXjpE0gEWbZdpi55wQcVKQ-lqSQHvfyI
Message-ID: <CANNYZj_+LPx9-HD=G__VtatjFMcG01YntH59Pjg2X5EJa5ggjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/2] oe-selftest: devtool: split tap
 detection into function
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 13:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220231

On Sat, 12 Jul 2025 at 14:51, Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=siemens.com@lists.openembedded.org> wrote:
> - Dropped the part which removed the test for the /etc/runqemu-nosudo
>   file. This was discussed controversially in the patch review meeting.
>   The file is kind of an API and is used in multiple scripts, not only
>   by oe-selftest.

I'd like to see that argument. runqemu-nosudo is not used in 'multiple
scripts', it's used in one other places (runqemu) to determine whether
runqemu should attempt creating the devices.

Please bring it back, this check does get in the way, and isn't used
anywhere else.

Alex

