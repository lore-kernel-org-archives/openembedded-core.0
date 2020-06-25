Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web12.7616.1593081681321741860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=leEfr8L0;
 spf=pass (domain: konsulko.com, ip: 209.85.167.196, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f196.google.com with SMTP id h17so4544825oie.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 03:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JeyaYT2artF1ReoezT7+d5k5UzCuIOc5ygjPWWtLFRs=;
        b=leEfr8L0PduLe5vJQDy+PSNpkfOPksI+wbdFeP9t7DjyQHawyaKeGyDB44nBlEZIdx
         1IbwXQPFgx9NbBkD/IUTk6kfc+lkqLmnksJPXaAuqx6bMXFQpfiNniTbQu9qsXEZt1xK
         3cO407Hl3+fQs6MrRlqr7jmkqT+02pCPtnDsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JeyaYT2artF1ReoezT7+d5k5UzCuIOc5ygjPWWtLFRs=;
        b=tAHF2hzb1hGRLARY2+ay82jKdtMMLalFGblrrHioA5V49k+1qMyohHGxsmAAk+mb6k
         qwxPqqO5spUxXOtz1SrOPBXRdpWFfwMdrsbD/ana4Enf+le/nphs0HkQS1nJV3a86QrT
         CbR2pAK4/nlXXzrBcHJOaBmoESYEy+6Fjun2o3Y+xj3eYlOyzgNlLT40WEKRCeKPL1cs
         2vhhxZTQRCv5tAX/NnUPHxLPnuhxfArVBx/kA2Ycb+ia435zys10OnYWg5CIB8bBrLw/
         5OIn01+zItvhk6tpFUWmOs6D/iLvtJpPesfWRjMeGMseo7R28qb/zpudyOR8UkjHwa6Y
         y3uA==
X-Gm-Message-State: AOAM531KnT27uj19fGzMy/JWBXW6LW83apoG/d953PZ6hk21Pe5S6KqQ
	z1Z2y+hcLgDQIZiC6MLQSc5tCG7et2V9+wVrF689gQ==
X-Google-Smtp-Source: ABdhPJy7x2gwsAB+U4Nsm2Zg84/M+2xR+jWCmWJXk6LH1ueImf9/jxb9iudF2QrOhKLk6VG/GqVabvrF6ANDyD+1MFI=
X-Received: by 2002:aca:49cb:: with SMTP id w194mr1527351oia.152.1593081680717;
 Thu, 25 Jun 2020 03:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200625102145.7139-1-fredrigu@axis.com> <20200625102145.7139-3-fredrigu@axis.com>
In-Reply-To: <20200625102145.7139-3-fredrigu@axis.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 25 Jun 2020 11:41:10 +0100
Message-ID: <CAM9ZRVvBLbcXePdwH8iHQ_aFEpUttceiDd+APETmgirTiRhuvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 02/26] package_managers: Add directory structure
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall <hugo.cedervall@axis.com>, 
	Fredrik Gustafsson <fredrigu@axis.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2020 at 11:22, Fredrik Gustafsson
<fredrik.gustafsson@axis.com> wrote:
>
> This is first part of a refactoring to split up the package managers to
> different files making it easier to extend OE-Core with more package
> managers.
>
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> ---
>  meta/lib/oe/package_managers/deb/__init__.py | 3 +++
>  meta/lib/oe/package_managers/ipk/__init__.py | 3 +++
>  meta/lib/oe/package_managers/rpm/__init__.py | 3 +++
>  3 files changed, 9 insertions(+)
>  create mode 100644 meta/lib/oe/package_managers/deb/__init__.py
>  create mode 100644 meta/lib/oe/package_managers/ipk/__init__.py
>  create mode 100644 meta/lib/oe/package_managers/rpm/__init__.py
>
> diff --git a/meta/lib/oe/package_managers/deb/__init__.py b/meta/lib/oe/package_managers/deb/__init__.py
> new file mode 100644
> index 0000000000..a2094304c9
> --- /dev/null
> +++ b/meta/lib/oe/package_managers/deb/__init__.py
> @@ -0,0 +1,3 @@
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> diff --git a/meta/lib/oe/package_managers/ipk/__init__.py b/meta/lib/oe/package_managers/ipk/__init__.py
> new file mode 100644
> index 0000000000..a2094304c9
> --- /dev/null
> +++ b/meta/lib/oe/package_managers/ipk/__init__.py
> @@ -0,0 +1,3 @@
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> diff --git a/meta/lib/oe/package_managers/rpm/__init__.py b/meta/lib/oe/package_managers/rpm/__init__.py
> new file mode 100644
> index 0000000000..a2094304c9
> --- /dev/null
> +++ b/meta/lib/oe/package_managers/rpm/__init__.py
> @@ -0,0 +1,3 @@
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#

These directories can be created as needed in later patches, there's
no need to break this out into a separate commit.


--
Paul Barker
Konsulko Group
