Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.11444.1602766855162921023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 06:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ne7RzDH7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id p15so3077704wmi.4
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 06:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ncwWJl4Hvph7OngZecZcEegd0bTjztOQK7bWa1pblLM=;
        b=Ne7RzDH7nTJY1EmMUA80SGx6B/OX4S9pjOpaFpaPUW7t2rhOvqO3hkXadcGyerYZ55
         mqnCeaGTjRWLKdTcpXJo7q37ii63JM0OBeOqPmSlcaYwXAS8PXKoVBsWFJeuLCPTmc8Z
         SFPHOz3gc9+hHok5fLaleUwhat6TnJyaI1OH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ncwWJl4Hvph7OngZecZcEegd0bTjztOQK7bWa1pblLM=;
        b=CMEqCo0AG2cuzk0rtNO/xv8X9HLrX4yimczFd4v6ls5SoUbRkjGMHCJjEZ/C3j0sZv
         ANUEoZjtcsPU7hcabhCtnd6DvEMSfIGf2iikKrbHn+HfzEgPLv5p8QkJAsvxxdvoPDz9
         kw+WQny6EPgY2FGRRQ4v47X874Mq9d41r3aAQ6v9ENlzyybwFz7bL48y9jTPBNKsgUIE
         8/vEa/s7H/CsgjTqurvG2YGHXYw+xsepxJCIZgCK6YQxdXpSZQulnJ0AQdH/ZDOaniG5
         EXJtpi9c0emSEriz5brbN0jqo3dGp/6R8c6BGrSSgvrXH+wG3W8Us0UebJ0k56QyxAWB
         ADjg==
X-Gm-Message-State: AOAM532V7TwafqiGOazDCtkT4LPeShTuRaYBBcOs2BudttFbNsveTmkm
	w4lx8tNKjBstcumM2KvnkWP/dA==
X-Google-Smtp-Source: ABdhPJwHx75fcLftfjpvtFJIEh8X8wPWts9mGZywpLfZ8fKRbRYJhrtV8NaJE1iKo5t+ODXQwUd7lw==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr4188380wmb.129.1602766853428;
        Thu, 15 Oct 2020 06:00:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id u15sm4491162wrm.77.2020.10.15.06.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 06:00:52 -0700 (PDT)
Message-ID: <29366a5ec6ff7d531505fc2d96c8099b3c784b70.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][PATCH v4] Update license file to match current SPDX names and license contents
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 15 Oct 2020 14:00:50 +0100
In-Reply-To: <20201013094630.28512-1-idadelm@gmail.com>
References: <20201013094630.28512-1-idadelm@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-13 at 10:46 +0100, Meh Mbeh Ida Delphine wrote:
> Updated mappings of license fields of meta/conf/licenses.conf to
> match latest SPDX naming.
> Added missing mappings.
> Adde new license files.
> 
> Fixes: [YOCTO #13320]
> 
> Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
> ---
> 
> Changes in V4:
>  * Added license files for AGPL-3.0-or-later, etc
>  * Added new mappings
>  * Updated license content.
> 
> Changes in V3:
>  * Added missing mappings to meta/conf/licenses.conf
> 
> Changes in V2:
>  * Corrected the email subject line.
> 
>  meta/conf/licenses.conf                       |  62 +-
>  meta/files/common-licenses/AGPL-3.0           | 661 ----------------
> --
>  meta/files/common-licenses/AGPL-3.0-only      | 613 ++++++++++++++++
>  meta/files/common-licenses/AGPL-3.0-or-later  | 613 ++++++++++++++++
>  meta/files/common-licenses/GPL-1.0            | 252 -------
>  meta/files/common-licenses/GPL-1.0-only       | 251 +++++++
>  meta/files/common-licenses/GPL-1.0-or-later   | 232 ++++++
>  meta/files/common-licenses/GPL-2.0            | 132 ----
>  meta/files/common-licenses/GPL-2.0-only       | 319 +++++++++
>  meta/files/common-licenses/GPL-2.0-or-later   | 319 +++++++++

Can you describe how you found these files and what you did?

I was expecting a 

"git mv GPL-2.0 GPL-2.0-only"

but the size is different. The size of GPL-2.0-only and GPL-2.0-or-
later is the same which also worries me as those are two different
license wordings.

This patch should only rename the license files that are changed in the
mappings changes. Only related changes should be together in one patch.

A followup patch could add the "or-later" versions and a separate patch
again could also update existing license files to match the upstream
SPDX text (assuming that is what the other change here is).

We need to be careful with changes to the license file contents as some
recipes reference these license files and may need checksum updates. If
the changes are separated out, I have the option of merging the good
patches whilst the others are tweaked but where something is all
together like this, I have no option but to ask for a resend.

>  meta/files/common-licenses/GPL-3.0            | 225 ------
>  meta/files/common-licenses/GPL-3.0-only       | 625
> +++++++++++++++++
>  meta/files/common-licenses/GPL-3.0-or-later   | 625
> +++++++++++++++++
>  meta/files/common-licenses/LGPL-2.0           | 342 ---------
>  meta/files/common-licenses/LGPL-2.0-only      | 446 ++++++++++++
>  meta/files/common-licenses/LGPL-2.0-or-later  | 446 ++++++++++++
>  meta/files/common-licenses/LGPL-2.1           | 176 -----
>  meta/files/common-licenses/LGPL-2.1-only      | 467 +++++++++++++
>  meta/files/common-licenses/LGPL-2.1-or-later  | 468 +++++++++++++
>  meta/files/common-licenses/LGPL-3.0           |  65 --
>  meta/files/common-licenses/LGPL-3.0-only      | 163 +++++
>  meta/files/common-licenses/LGPL-3.0-or-later  | 163 +++++
>  vscode-bitbake-build/bitbake-cookerdaemon.log | 489 +++++++++++++
>  vscode-bitbake-build/bitbake.lock             |   1 +
>  .../cache/bb_persist_data.sqlite3             | Bin 0 -> 12288 bytes
>  vscode-bitbake-build/conf/bblayers.conf       |  12 +
>  vscode-bitbake-build/conf/local.conf          | 277 ++++++++
>  vscode-bitbake-build/conf/templateconf.cfg    |   1 +
>  vscode-bitbake-build/executeBitBakeCmd.sh     |   3 +
>  vscode-bitbake-build/tmp/hosttools/[          |   1 +
>  vscode-bitbake-build/tmp/hosttools/ar         |   1 +
>  vscode-bitbake-build/tmp/hosttools/as         |   1 +
>  vscode-bitbake-build/tmp/hosttools/awk        |   1 +
>  vscode-bitbake-build/tmp/hosttools/basename   |   1 +
[long list of files truncated]


These vscode/bitbake build files should definitely not be included.

Cheers,

Richard


