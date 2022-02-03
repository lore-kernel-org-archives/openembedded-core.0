Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A400C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 12:35:22 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.8480.1643891721584368975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 04:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EkmldNnw;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id s10so2204888wra.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 04:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gE+YEr0YUApxg7xAR03prvRtlDFCmUXRGPVEvA323lg=;
        b=EkmldNnwHN+fhd+X9kZFsvKpnNrfNKvHqJwZ5iiDVJyKA6I4A+Qttl9LfdrxC1T2m/
         4v2ci4l960lAMCuu9MzrAapp5fjawOsLJxEpPmpY8kAlVmOyhiyi/N4pXcuQ144U+wZ2
         e4GSUJ1Euxyv3B+LhN5nulaPPUabmMPkV+2CIS2v4aXPaElbBnWzqz62m2EtOmcX7cbU
         wdseVYGWRr0Ck/e6TXUjhkA5/oEYpHm+JCzKIWn0Jnm7/FqXQrn0eNKStwVs5h1KQRNz
         nDOy4CoCD4s065sHXoPStdH08dco2nFPzS67lOweZ4xvtrcjvD2IV7nczNJ3gaSE1m/2
         95XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gE+YEr0YUApxg7xAR03prvRtlDFCmUXRGPVEvA323lg=;
        b=m+ebt3+riYH+ayrgTEs1vFLWl5DvRA5g8+5T7fMfCncOHwXGvLOG1yIQziyIR4xAgl
         T56cGdaYGLWbTv6rUWsZHBRIBOXcfEZRTjCdmwevoF9OUsToNZhYdfEgJfCHd10WBFd4
         dm4Lx2jv+va0k2ZCzYgZHYGt8iJlO5RWu+gCNr3qY6zSZQG3+CkCJshwHSWbjUEbP914
         Nvj5rJoFmh5jycnRFglB0NPLY8qdSoUAQWqOPbBOyiS0Y2ERvNtMXqefSp5bBDTjb1jU
         YwUuqcXtzv6vE9zojqW8llfJ7TsafTPZxjz4hq04BN83Km1cXG1iF8l84/Pp+nb5s3+i
         Q4Dw==
X-Gm-Message-State: AOAM532V1x5IRrQ+xj43AOzyJpy2UWgtORvqaoxB19bNroTXgnNT1Roy
	8J0hbbondiscUJSGhSAERpw4BK32tGwqpv8qW1M=
X-Google-Smtp-Source: 
 ABdhPJx2fsvqK6651uVfSrQfw8qNAashTflvr9rql3G7yuMYvWeKJ63wQv8O1id1J4VG/SbsVidLYUNT9OhUIBhGnxc=
X-Received: by 2002:a5d:430f:: with SMTP id h15mr8177797wrq.15.1643891720041;
 Thu, 03 Feb 2022 04:35:20 -0800 (PST)
MIME-Version: 1.0
References: <16CD7B14CA920DD3.31937@lists.openembedded.org>
In-Reply-To: <16CD7B14CA920DD3.31937@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 3 Feb 2022 13:35:08 +0100
Message-ID: 
 <CAApg2=RhczFO-Q5nn9K_kmqhjMz9xBro-dOXKwEQPT8a+Yz0Pw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: add json format
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, ross.burton@arm.com,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000005bbd805d71c5e6d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 12:35:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161276

--00000000000005bbd805d71c5e6d
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 25, 2022 at 10:59 AM Marta Rybczynska via lists.openembedded.org
<rybczynska=gmail.com@lists.openembedded.org> wrote:

> Add an option to output the CVE check in a JSON-based format.
> This format is easier to parse in software than the original
> text-based one and allows post-processing by other tools.
>
> Output formats are now handed by CVE_CHECK_FORMAT_TEXT and
> CVE_CHECK_FORMAT_JSON. Both of them are enabled by default.
>
> The JSON output format gets generated in a similar way to the
> text format with the exception of the manifest: appending to
> JSON arrays requires parsing the file. Because of that we
> first write JSON fragments and then assemble them in one pass
> at the end.
>
>
Any comments on this approach? It is also building a foundation
for adding also per-package statistics and easier post-processing.
For example, I do have a script processing the JSON to get a CSV
spreadsheet.

Kind regards,
Marta

--00000000000005bbd805d71c5e6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 25, 2022 at 10:59 AM Mart=
a Rybczynska via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Add an option to output the CVE check =
in a JSON-based format.<br>
This format is easier to parse in software than the original<br>
text-based one and allows post-processing by other tools.<br>
<br>
Output formats are now handed by CVE_CHECK_FORMAT_TEXT and<br>
CVE_CHECK_FORMAT_JSON. Both of them are enabled by default.<br>
<br>
The JSON output format gets generated in a similar way to the<br>
text format with the exception of the manifest: appending to<br>
JSON arrays requires parsing the file. Because of that we<br>
first write JSON fragments and then assemble them in one pass<br>
at the end.<br>
<br></blockquote><div><br></div><div>Any comments on this approach? It is a=
lso building a foundation</div><div>for adding also per-package statistics =
and easier post-processing.</div><div>For example, I do have a script proce=
ssing the JSON to get a CSV</div><div>spreadsheet.</div><div><br></div><div=
>Kind regards,</div><div>Marta<br></div></div></div>

--00000000000005bbd805d71c5e6d--

