Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5E9C6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 13:59:33 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.9615.1681826370566876873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 06:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YYVXJFzT;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id fy21so30457731ejb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681826369; x=1684418369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKSnURzg+QR8PJ1FPGvBK5LtWsAumm3GAHkdynQwHgw=;
        b=YYVXJFzTR7bw+5p7QwndxNZBlqK7lMSJEuYadY9blTTrjX0b8sLgJKKMZvzEksdTem
         iAq5wURWlXZb0wxTdvtpSTySpHmZN1edWPZXmegM8tXE5Z+IJhzVKwGGlu7puXS+MlMm
         DFTOC/4WzebzgXW6+MLZYbG7q9Zpfs6HPD8zXDvTfZLSDowzK0sgbIaekiVAAKeCoTw4
         60kZgp3dAhlcsMV5xafZcoahN0KSd99sk6fbDVLZ5d7PZegO/O+a0qSMrDPI4UnGbwEw
         iNnIlJ+2fpb3arlivbTJAX2DZ8qBBw0Tp5N+TglrCpR6+IC0zKvGuCZ+MCcTTY97yiuZ
         BO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681826369; x=1684418369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKSnURzg+QR8PJ1FPGvBK5LtWsAumm3GAHkdynQwHgw=;
        b=S2Wynt4ZD/6YCByjlfurSKmn5I1N4yrfz4e7w3+n20gQE53ZvFKI9WqQANh57caLDb
         qN1f/baRj9bLUTpb7FlOpzcmfypTpEWrsLYTt0M4hKsH+tfT2kB2btjnIk5eqR8yjPjd
         LlMYPTks/tOVd45SNsnZBTTHDvcc+pwlWl3dfraMRG7OSbYHaQ2Qe5ihy7uatgeRM/JA
         1Iedj721a5W6wGg0MhZg0vzLIeRHzNbjhoT0DtYRT+MXDUnj2jlRgn+mEH9osqtj3g6V
         rbyIgKPiLBkpk1nTqUCtUZJ3qIDlUywdUg/7Raj/fR1Z3ALakyTXw6ObJOmiUl79dysY
         p3yA==
X-Gm-Message-State: AAQBX9c2KBqdyob9vpJOODgDJ4WXVIIw04HGMA9539SIb/HD2zvgK6SI
	hKhKJ7gaFd3uQmeUURjsRA/uVzekG9psPP7BJDjHRw==
X-Google-Smtp-Source: AKy350YEURLqdCRnqtibLfgBGz4Eala6bY1MsTGaPU5bfXqgDBRrVUATDCo3PIwj/hTgp7oD5IHkuckXI3ArroD+8dg=
X-Received: by 2002:a17:906:8447:b0:94f:99:858e with SMTP id
 e7-20020a170906844700b0094f0099858emr5371448ejy.3.1681826368745; Tue, 18 Apr
 2023 06:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230402152836.9157-1-sundeep.kokkonda@gmail.com> <CH2PR11MB4470098ED8A0713564517D43899D9@CH2PR11MB4470.namprd11.prod.outlook.com>
In-Reply-To: <CH2PR11MB4470098ED8A0713564517D43899D9@CH2PR11MB4470.namprd11.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 18 Apr 2023 03:59:16 -1000
Message-ID: <CAOSpxdZ6gZX9EVcJYE-fwqHaf0uKV3=7GR_jiQOb-PeomqLtEA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] cargo : non vulnerable
 cve-2022-46176 added to excluded list
To: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 13:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180191

On Tue, Apr 18, 2023 at 1:46=E2=80=AFAM Kokkonda, Sundeep
<Sundeep.Kokkonda@windriver.com> wrote:
>
> Hello Steve,
>
> When this patch is planned to take into Kirkstone?

It is in the set of patches being tested today.  So if all goes well
it should hit the kirkstone branch later this week.

Steve

> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> on behalf of Sundeep KOKKONDA via lists.openembedded.org <=
sundeep.kokkonda=3Dgmail.com@lists.openembedded.org>
> Sent: 02 April 2023 20:58
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Cc: rwmacleod@gmail.com <rwmacleod@gmail.com>; umesh.kalappa0@gmail.com <=
umesh.kalappa0@gmail.com>; pgowda.cve@gmail.com <pgowda.cve@gmail.com>; shi=
vams@gmail.com <shivams@gmail.com>
> Subject: [OE-core] [kirkstone][PATCH] cargo : non vulnerable cve-2022-461=
76 added to excluded list
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> This cve (https://nvd.nist.gov/vuln/detail/CVE-2022-46176) is a security =
vulnirability when using cargo ssh.
> Kirkstone doesn't support rust on-target images and the bitbake using the=
 'wget' (which uses 'https') for fetching the sources instead of ssh.
> So, cargo-native also not vulnerable to this cve and so added to excluded=
 list.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/conf/distro/include/cve-extra-exclusions.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
> index 8b5f8d49b8..cb2d920441 100644
> --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -15,6 +15,11 @@
>  # the aim of sharing that work and ensuring we don't duplicate it.
>  #
>
> +#cargo https://nvd.nist.gov/vuln/detail/CVE-2022-46176
> +#cargo security advisor https://blog.rust-lang.org/2023/01/10/cve-2022-4=
6176.html
> +#This CVE is a security issue when using cargo ssh. In kirkstone, rust 1=
.59.0 is used and the rust on-target is not supported, so the target images=
 are not vulnerable to the cve.
> +#The bitbake using the 'wget' (which uses 'https') for fetching the sour=
ces instead of ssh. So, the cargo-native are also not vulnerable to this cv=
e and so added to excluded list.
> +CVE_CHECK_IGNORE +=3D "CVE-2022-46176"
>
>  # strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2000-000=
6
>  # CVE is more than 20 years old with no resolution evident
> --
> 2.34.1
>

