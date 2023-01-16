Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A22C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 23:42:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.184005.1673912540983562687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 15:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=budkYrW+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id z5so27851301wrt.6
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 15:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U+ApfsDV/thHCZfyjDLx3IFo9YT6e2BCQ0u2ZK/CP1c=;
        b=budkYrW+iQdZOZGrngpQ3iLUB+axl6zGGjTbPqbRADgvkZZxjMsXvLbiKG8ByAFqsO
         v39e6bT+rGD+vBdNxeT4TdI0SQ2/DjL/Sz6BTv1XM5M/N2+o22V9OVuP1CxMVjpdathT
         KpMYdNjP5mIThhMdwrBKDz6gqBM7IQ4JpFVxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+ApfsDV/thHCZfyjDLx3IFo9YT6e2BCQ0u2ZK/CP1c=;
        b=YpViVIWZQbFpqB5M+jaHN/F+POSw0X0aHQ2znuCfFC/Bol6rmvp0JzLeaR75Nicw+B
         Tq1jjaLq0qcasY9IwqQsMMRmKLhuofNhdCXMe0QGc3IN8xJkIeKNiWn7vWsv1K2NUQzD
         KHTnh4rq1ImEdBR+864eUFHZ45w0Ue9LflfBbTgHWf9ejUx/Lt1Ut2vrW1P+MUWc8kpC
         37twiwwq4z1PT3efHoQfjfW8Oj8TBCsgHJbYFIvheg1rq6dh/wa5A1CVLH2c/wGhff7c
         J4UOP3kCBIz9WpT+qbNVPntMPNcPQ+iSCGH6sq60N0o1stdVaqr5pvOu9ye49nWxo9f5
         LddQ==
X-Gm-Message-State: AFqh2kpD7P/oH3yQ7gT8sAEvFn18+C9ZNTFLoRcUu6v0kS0wq5ufnrXr
	25uSKc9Dz4Qpmqw4+anM24H0tA==
X-Google-Smtp-Source: AMrXdXtMI0q5npvtFOXbGxckbDCBRvrHI5mVSDcLhrnwy6+jYU6M2dYFXPP+Nlvsplrt3jOAwD6sbQ==
X-Received: by 2002:adf:cf0f:0:b0:242:5d8e:6c35 with SMTP id o15-20020adfcf0f000000b002425d8e6c35mr1049901wrj.28.1673912538730;
        Mon, 16 Jan 2023 15:42:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b2e7:7f75:b78d:7617? ([2001:8b0:aba:5f3c:b2e7:7f75:b78d:7617])
        by smtp.gmail.com with ESMTPSA id bx11-20020a5d5b0b000000b002366f9bd717sm33869642wrb.45.2023.01.16.15.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 15:42:18 -0800 (PST)
Message-ID: <60471b4cad9af5016e08174e3e7d7878be89d5a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] uninative-tarball: Add libgcc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2023 23:42:16 +0000
In-Reply-To: <CANPvuRmQiEXiZ7+9_N5O=FmKcMPcjhqBU-Fn8bJ-KYirNg0Z3g@mail.gmail.com>
References: <20230109134930.1409270-1-richard.purdie@linuxfoundation.org>
	 <CANPvuRmQiEXiZ7+9_N5O=FmKcMPcjhqBU-Fn8bJ-KYirNg0Z3g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 23:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176015

On Mon, 2023-01-16 at 19:21 +0000, Jose Quaresma wrote:
> Hi=C2=A0Richard,
>=20
> I am seeing some build errors=C2=A0like this at the end of the build whre=
 bibake segment fault.
> My problem is this happens on a build that doesn't=C2=A0use uninative,
> does bitbake require uninative to build on master?

No, it doesn't.

My worry was that uninative didn't contain libgcc which meant that
builds could fail like this if it wasn't present. The reason for the
change is threading in bitbake itself and the thread.join() calls which
seem to trigger pthread_cancel() calls under some circumstances. Having
libgcc present in uninative seemed like a good idea so I've ensured
that.=C2=A0I wasn't entirely convinced it would solve it, I half expected t=
o
see a new/different error replacing it.

Is libgcc present on your build system? It would seem strange for it
not to be but that is what the error message suggests.

I've also seem mention of issues with this in some versions of python
but I've not seen any errors on the autobuilder since I ensured it was
present in uninative.

> This is my build log where=C2=A0bitbake crash at the end:
>=20
> INFO: Build completion summary:
> INFO: =C2=A0 do_populate_sysroot: 100.0% sstate reuse(387 setscene, 0 scr=
atch)
> INFO: =C2=A0 do_deploy_source_date_epoch: 100.0% sstate reuse(5 setscene,=
 0 scratch)
> INFO: =C2=A0 do_deploy_archives: 100.0% sstate reuse(400 setscene, 0 scra=
tch)
> INFO: =C2=A0 do_create_spdx: 100.0% sstate reuse(364 setscene, 0 scratch)
> INFO: =C2=A0 do_create_runtime_spdx: 100.0% sstate reuse(342 setscene, 0 =
scratch)
> INFO: =C2=A0 do_package_qa: 100.0% sstate reuse(243 setscene, 0 scratch)
> INFO: =C2=A0 do_package: 100.0% sstate reuse(26 setscene, 0 scratch)
> INFO: =C2=A0 do_packagedata: 100.0% sstate reuse(243 setscene, 0 scratch)
> INFO: =C2=A0 do_package_write_ipk: 100.0% sstate reuse(243 setscene, 0 sc=
ratch)
> INFO: =C2=A0 do_populate_lic: 100.0% sstate reuse(395 setscene, 0 scratch=
)
> INFO: Writing buildhistory
> INFO: Writing buildhistory took: 10 seconds
> libgcc_s.so.1 must be installed for pthread_cancel to work
> /lmp/bb-build.sh: line 24: 91770 Aborted =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (core dumped) bitbake -D ...

This is the build system's python saying it can't find libgcc_s.so.1 so
I'd start by checking it is there. I'm assuming you're not using
buildtools?

Cheers,

Richard

