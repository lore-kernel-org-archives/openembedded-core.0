Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F5EC7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 11:29:36 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.10750.1686655772370021584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 04:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=KqFqphqY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f61b45ee0dso6610283e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 04:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686655770; x=1689247770;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FrtyyiyeBrdAIkqGCp4O0mHoNMx6/U9PdQfLZrd+Hek=;
        b=KqFqphqYTpmhIyFv1pMUD+ipgLAGHu95Byv79HnVUSnnncWU6KBQaw8paTMs8NeNQT
         zsEDtKb8bz8PS5t9GOXum72Z4DtP72gI38rRGmep7FUJUOenrX4O4mvlbiKSXmkp3zcH
         IAhiA/cKy7p/DyjXDAcG/qwTIvbhAlfO8sqSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686655770; x=1689247770;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FrtyyiyeBrdAIkqGCp4O0mHoNMx6/U9PdQfLZrd+Hek=;
        b=jDKGmaf/Q/hsOoPPh/dkJuvOhbzFecrUgw+EoZDSXYiC/5CfRmuR3/rMb0onFDCQJa
         EP4YBkfhIqATsPnhLoNh+l/F6QnB7kRTHdEyisOifGSQwl6WBzy074aOZA4qnlVYYqBl
         B1OYexSPKywz6OgRjJGY3otXAJOpZ9aR8RcWd7Oo5/4Z/e64qp+gBxgHmxf82Iv4tk+D
         4bgfTlGHhyHqpG6nAVLIBZwLzld/z8eQAqmj1dVeqH/8nnV2H7gpSEnH37tK8N4bnpt7
         q7QIA+y//si7Der+KU1iZ8ASoNO+Rp5YCUZKFwDMc4ThcT5DnpXg4u6Y+k3dKfmg1hTj
         Yndg==
X-Gm-Message-State: AC+VfDwWtHsKjxWIjWQpuJvi7w+W59X2RmkvR2DmMHfpXBJNMBVzn90o
	jHu48yZlHvYrilxITrqbN+GaEw==
X-Google-Smtp-Source: ACHHUZ4eV/4N2HTaxuWJH8gf/FBNujWa4TMLQlh5zZ5JAky2sQb9tc/q4gr92Fsr997tzNAVrc1DWA==
X-Received: by 2002:a19:8c52:0:b0:4f6:19cc:7047 with SMTP id i18-20020a198c52000000b004f619cc7047mr4488120lfj.9.1686655770215;
        Tue, 13 Jun 2023 04:29:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9a70:bab1:9f22:b535? ([2001:8b0:aba:5f3c:9a70:bab1:9f22:b535])
        by smtp.gmail.com with ESMTPSA id c17-20020adffb51000000b00307bc4e39e5sm15107466wrs.117.2023.06.13.04.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 04:29:29 -0700 (PDT)
Message-ID: <4055832f44f587778acdfbf1fc7d4dac6fbb7faf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] testimage: Set nostamp for
 do_write_image_test_data
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Hoyes <peter.hoyes@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com
Date: Tue, 13 Jun 2023 12:29:28 +0100
In-Reply-To: <20230613095148.1269420-2-peter.hoyes@arm.com>
References: <20230613095148.1269420-1-peter.hoyes@arm.com>
	 <20230613095148.1269420-2-peter.hoyes@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 11:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182711

On Tue, 2023-06-13 at 10:51 +0100, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>=20
> The testdata.json file generated as part of the rootfs postprocess
> commands contains almost all Bitbake variables and is used by OEQA test
> cases to inspect the build environment. However it is not automatically
> regenerated, complicating the process of developing OEQA test cases.
>=20
> Set nostamp on the new do_write_image_test_data task so that it always
> runs.
>=20
> Add a demonstrative OE selftest.
>=20
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> ---
>  meta/classes-recipe/testimage.bbclass     |  1 +
>  meta/lib/oeqa/selftest/cases/testimage.py | 26 +++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/testimage.py
>=20
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
> index b23340420f..67f7f3629e 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -118,6 +118,7 @@ python do_write_image_test_data() {
>                  os.remove(testdata_link)
>              os.symlink(os.path.basename(testdata_name), testdata_link)
>  }
> +do_write_image_test_data[nostamp] =3D "1"
>  do_write_image_test_data[vardepsexclude] +=3D "TOPDIR"
>  addtask write_image_test_data after do_rootfs before do_image_complete

I'm torn on this. What this means is that all other tasks depending on
do_image_complete will now also rerun. I suspect that will cause a
cascade of selftest failures as they aren't written to expect that.

I know there was an alternative patch of injecting all the values into
the checksum, I suspect that suffers the same issue as we'd need to
filter it a bit to stop things like TIME changing it. We can't need
*everything* there!

What we really need to do is filter the list of variables being written
out to some set of what is really needed rather than everything.

Cheers,

Richard

