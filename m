Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF0DCCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 14:14:53 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.web10.22286.1761228886460137255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 07:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OlobmLJK;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63d8788b18dso958588d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 07:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761228885; x=1761833685; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06AgcCY9/DwUwHFHGeoHYEeN46PdLjT83+OfA+fDKsw=;
        b=OlobmLJKcj4v8MrVYdhscRTDpIiir1qOV1JQzqwRjrHLlxSMAXDqJmEYZB0SKnolCn
         0mEbzH1lYWEwdGzvDqI9L8NctL0HbVECr93C7zsBNOfPYB0ZmKmBbXYdz5j/CuJIk/yP
         Lgv2hBuirtGU4820rfeDPRKxhU4gb/744uROVFJj2xvv9GfWyRMeksU9siV6mZbtn9Nh
         We3lMMLnI6xqIs274lONJm9eMUIiVfq3NSPOAt9sx2GNtqZE8Nqbe2Ol0LVcEfZOovb7
         uHCRwqBa9jWoG57ufjufsJ4A98UUR42+OqJLLX8cPbJZFgKTvy2qKTDq6/A2PqJkEEL+
         bwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761228885; x=1761833685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06AgcCY9/DwUwHFHGeoHYEeN46PdLjT83+OfA+fDKsw=;
        b=R/tHhjGEpHaEMA7RZ9yesu2qgTiCt9/I4RdaY496cQD/puxZbwuslUte3GZZBxXp8J
         TLkLS4+K82iWwpYC0b9gYLb4x0UQpFHwORXPE2jxxBvxchWM9zF6ReLWNQKUQ4F/oQzj
         xf9S3dpu75zHZtUL3rRDIKH2wR1w8XL+zu50Sb1Us5GJLbTUEinUnrTBGCCg8dUvWM22
         ALaxKHwUqMK33IxVfPqVzRnCcwy4ejOvZLBsBVQxVNvU8wXJ0cReg/FLb9fnfu6nPXVT
         C1oJJ0ZBCUlJtBYjGSMVfmXoLeUOabieSPgU7Vfakl+hGCFgjVCPiJ6Jjp2kjJSYdhKM
         4Q3g==
X-Gm-Message-State: AOJu0YyP73L/9Mj7rG2ug5ic9pwtlIb4F4x0NokyiNnCh3DyT4f3rtQM
	AvW7YYAjbt15mxr5NIf4VtkeLdZYskpfPHYULqzBsCp0PwdJDHs952ssn3wRRMFW0qtF090/Jqb
	QpdWsWhKEA+ptGVn2lEmWNXQE/iSChN4=
X-Gm-Gg: ASbGncugM2210lyIBxI/tZsAi96RlmKvI5Z285L1B0/RVINccLJFbPIEtfE+luqnm2a
	X1wt8FNYOfFEi+zmpEVi2bUMXEOqV/b9p4CaT5rRW1WJp+S68EHwJr7TsorULrQ7kTRX6xPRkm/
	+B+CP5OKH5+VjrjjrRdlqylr+dqWJeNWwVg8GaF6M90rs5LCkY7UMS8eQRl6Cmd9vV/3sXrtXfc
	Sp4XCTVC/KEHG4383V0guliZnaP5fTFlawVa9QTbhxtcVe7wbyuEZw8sbHkSM6MYZgSkEHLy6Fc
	QQxyxf/MAQ==
X-Google-Smtp-Source: AGHT+IGYD7lc67OLo2anhQrKwI00CQwwl+QoaDIeNj7J2aD4knbtv2+v3EoNt/Ox4MxWdFpqiQsd4M0dlz4Q44EnoVc=
X-Received: by 2002:a05:690e:1687:b0:63e:19a7:b9d9 with SMTP id
 956f58d0204a3-63e19a7be40mr17146154d50.57.1761228885390; Thu, 23 Oct 2025
 07:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251020072228.2819750-1-Maganuru.Jayasurya@windriver.com>
In-Reply-To: <20251020072228.2819750-1-Maganuru.Jayasurya@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 23 Oct 2025 08:14:34 -0600
X-Gm-Features: AS18NWDLx6gQlTbPngkkVU5Xn5uc_Gvq6BEhojP-iUVwvWIS_m6FOJWA87uQ52I
Message-ID: <CAJdd5GZyh381SpfD-bUe5tZn5NtbV7-AgB2mmdNSs8XUrujo0w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spdx_common: Fix invalid SPDX downloadLocation
 for Rust crates
To: maganuru.jayasurya@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	SunilKumar.Dora@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 14:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225264

On Mon, Oct 20, 2025 at 1:22=E2=80=AFAM Jayasurya Maganuru via
lists.openembedded.org
<maganuru.jayasurya=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Jayasurya Maganuru <Maganuru.Jayasurya@Windriver.com>
>
> Fixes [YOCTO #15909]
>
> SPDX validation was failing due to the use of `crate://crates.io/...` as =
the
> `downloadLocation`, which is not a valid SPDX URL as per the 2.2 specific=
ation.
>
> This patch updates `fetch_data_to_uri()` in `spdx_common.py` to detect wh=
en the
> fetcher type is "crate" and instead use the `url` attribute, which contai=
ns a
> valid HTTP(S) URL in the expected format, e.g.:
>
>   https://crates.io/api/v1/crates/<name>/<version>/download
>
> This aligns the SPDX metadata for Rust crates with the specification and =
avoids
> validation errors in tools consuming SPDX documents.
>
> Tested with the `python3-bcrypt` recipe and verified that the
> generated `spdx.json` contains a valid `software_downloadLocation`.
>
> Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15909

LGTM, Thanks,

Reviewed-By: Joshua Watt <JPEWhacker@gmail.com>

>
> Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@Windriver.com>
> ---
>  meta/lib/oe/spdx_common.py | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index c2dec65563..72c24180d5 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -230,6 +230,11 @@ def fetch_data_to_uri(fd, name):
>      Translates a bitbake FetchData to a string URI
>      """
>      uri =3D fd.type
> +
> +    # crate: is not a valid URL.  Use url field instead if exist
> +    if uri =3D=3D "crate" and hasattr(fd,"url"):
> +       return fd.url
> +
>      # Map gitsm to git, since gitsm:// is not a valid URI protocol
>      if uri =3D=3D "gitsm":
>          uri =3D "git"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225110): https://lists.openembedded.org/g/openembedde=
d-core/message/225110
> Mute This Topic: https://lists.openembedded.org/mt/115849909/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

