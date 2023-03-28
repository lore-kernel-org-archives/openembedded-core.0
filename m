Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F7CC77B61
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 13:13:16 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.65971.1680009185762542862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 06:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ES4URXvn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id t4so6931366wra.7
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680009184;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9MVDnH6C2PqFROK6FkumgSHPMJaN2Qv7rCnylg3yxQI=;
        b=ES4URXvnLRmTyvFzj+Zuh21MJX5b0Ev8xhLRmEsMuBhuumW98j3VrUoC4bCCRI9Mq0
         I+YDwdSst2R8IZqYrbS3qbhSKxE0Cj8tP4gBbJsCgXER1ra3wr5x+NcKKzZa9sN/jezu
         aXocRV18tOKgOERipsR+iyMSqRR/R8Nmump6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680009184;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9MVDnH6C2PqFROK6FkumgSHPMJaN2Qv7rCnylg3yxQI=;
        b=NXxi8wtFOIN42MjfEjUP2EkscSR/aR+3QDkeed1dRbD/rh/QX6OpKwrYp54ctHJznH
         1eEDlL+rDwt4mAD1hTFaLxvSgCSiUZGGdakCLmsdwrfOeaP5+BgguxPcGvES/vdIEg8M
         ArZousQ3m3OHeyauB5hQE6L2vkESsEB13G0q6nihGmbroIiYdER5K+g5dq37IBCkLZ3f
         8QoIVUp9Bb6b14dIoMbN0r5LkIdrVS6Cg1PsWESs4ZSnQ8f+ygvZg+duYYTUdIMdggbd
         6C/nQfwN1cVzjQYSaTTIbGufPD5yqvUSE+rjUmSqne7if4yi8NqqmzoseV0o95ECXrlh
         31Yw==
X-Gm-Message-State: AAQBX9fWNYNJtjLt8nEuUYhRlXyPw4XDzf8QmsfSdAjqcJqRsXCR92Qf
	azlfJ3FP5JouFrHaNivpqEd/Eg==
X-Google-Smtp-Source: AKy350YcdnQPkoVBsYP+gdAY8+CdnaxSldPde4MWBgl+0T03aM+wcAvDGFYXHYG3bYZKzw+a6qc/Ig==
X-Received: by 2002:a5d:4fc2:0:b0:2d1:947:318e with SMTP id h2-20020a5d4fc2000000b002d10947318emr12939929wrw.59.1680009183961;
        Tue, 28 Mar 2023 06:13:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad8e:6d69:16d:166c? ([2001:8b0:aba:5f3c:ad8e:6d69:16d:166c])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d4b07000000b002c56af32e8csm27452139wrq.35.2023.03.28.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 06:13:03 -0700 (PDT)
Message-ID: <72921856ae24cb434edf3698ea51614d7a73a4fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] oe-selftest for devtool failed
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2023 14:13:02 +0100
In-Reply-To: <CA+cAkeo_CnnQDLrrmcDE1PP_65qoxkAXU20Ho8r_N-BwqqbObw@mail.gmail.com>
References: 
	<CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
	 <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
	 <53196741237572435b0a5965aa77a72b021d6fed.camel@linuxfoundation.org>
	 <CA+cAkeo_CnnQDLrrmcDE1PP_65qoxkAXU20Ho8r_N-BwqqbObw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 13:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179234

On Tue, 2023-03-28 at 14:40 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> I just finished a pristine build of core-image-sato on poky master,
> and set up SSTATE_DIR in my local.conf.
> Tests are now ok, I can start to write some now.
>=20
> If anyone is interested , please find attached the full log of the
> two first failures.

Having the errors helps, thanks.

The short summary is these two lines:

libtirpc-native
| chown: changing ownership of '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/pok=
y/build-st/tmp/work/x86_64-linux/libtirpc-native/1.3.3-r0/image/var/lib/jen=
kins/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/libtirpc-na=
tive/1.3.3-r0/recipe-sysroot-native/etc/netconfig': Invalid argument

shadow-native
| chown: changing ownership of '/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/pok=
y/build-st/tmp/work/x86_64-linux/shadow-native/4.13-r0/image/var/lib/jenkin=
s/YOCTO_POKY_MASTER_TEST/poky/build-st/tmp/work/x86_64-linux/shadow-native/=
4.13-r0/recipe-sysroot-native/var/spool/mail': Invalid argument


I'm wondering if the fact the build is under /var might be triggering
something somehow...

Cheers,

Richard

