Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5960BC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 13:55:51 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.72499.1656942947759762186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M3k0O5do;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id s1so13605021wra.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=6q4tmSa09aA1o9n1N52h7IXjMWV1toZnZABIAYjk83I=;
        b=M3k0O5doGE4XAcurl2xVOIdmvaMDQllD5xySAotrmXF7EcdfT99fnOkCXh8yYCNLBy
         ftYozn6xGTZ7jIKzSduneczmS5LtDEpwXCgk6rjRZyFew3hj/QYlnGGiIQqFObrmsglP
         7KnrPvWAcJhyzupZApn3Rpp4Dv/JINJ042eUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=6q4tmSa09aA1o9n1N52h7IXjMWV1toZnZABIAYjk83I=;
        b=eypQYlOPK4miP+QSpdoEyFLxYgbLNfK54Yq0DagJdkzNHwrPXNxJ8KaoMM+YcQO9ZF
         RcUdiEHJPuby/aVYRDT3YDc0fsmzXhBhnccvzruNFEncezJtEVw5rws0lN0IxSsmOk8F
         zUUytC/IHx27erH4nlHZgQslxs85dU0390Zl9TXzhJxLx62vvXqYUpIPuH1FYKj+06DH
         9I5jQacMl2t1WIk/8ILblXHxoCKVedspCs1oFNV743xnzU649DF+UrVTTjEFUYgE++qo
         PCq31jDiluOhmeIa1xuQwkhPLKJKcA/em9ZgxzzKiArx41jcWIGmnPCgdabnL1ukWg0N
         /B9w==
X-Gm-Message-State: AJIora8htL05liyUx1HbZLWgtJ5lCCkQyJcPCEGiT9WpBzaZRZ/60rLX
	xrjpg317wNDFRItckqo5Bs9uOQ==
X-Google-Smtp-Source: 
 AGRyM1uDKx90RiSo1ffhvLT218HdrKocnobOqWr2PJpRFRTirIizURcbI6Y9diu6WdX/RBuGuyVNBw==
X-Received: by 2002:adf:fb0b:0:b0:21a:b15:6013 with SMTP id
 c11-20020adffb0b000000b0021a0b156013mr27547985wrr.268.1656942946192;
        Mon, 04 Jul 2022 06:55:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2?
 ([2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2])
        by smtp.gmail.com with ESMTPSA id
 z2-20020a5d44c2000000b0021a3d94c7bdsm30403072wrr.28.2022.07.04.06.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 06:55:45 -0700 (PDT)
Message-ID: 
 <576a6c208bd89721228fa201212a557778f01079.camel@linuxfoundation.org>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
	Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 04 Jul 2022 14:55:45 +0100
In-Reply-To: 
 <CANNYZj_vu9dY==pXQE6VMB_cYKuq3T0TK-g0U4jv2kKHTzuA+g@mail.gmail.com>
References: <16FE039DA287E43E.1980@lists.openembedded.org>
	 <4770b1475916c1c4e8b7118dab2ba934af604c03.camel@linuxfoundation.org>
	 <CANNYZj_vu9dY==pXQE6VMB_cYKuq3T0TK-g0U4jv2kKHTzuA+g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 13:55:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167612

On Mon, 2022-07-04 at 15:47 +0200, Alexander Kanavin wrote:
> On Mon, 4 Jul 2022 at 15:35, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > With oe-core (systemd enabled):
> > > stdio: WARNING: go-helloworld-0.1-r0 do_package_qa: QA Issue: File /u=
sr/bin/go-helloworld in package go-helloworld contains reference to TMPDIR =
[buildpaths]
> > > stdio: WARNING: glibc-tests-2.35-r0 do_package_qa: QA Issue: File /us=
r/lib/glibc-tests/ptest/tests/glibc-ptest/tst-timer4-time64 in package glib=
c-tests contains reference to TMPDIR
> > > stdio: WARNING: systemd-1_251.2-r0 do_package_qa: QA Issue: File /usr=
/src/debug/systemd/1_251.2-r0/build/src/login/logind-gperf.c in package sys=
temd-src contains reference to TMPDIR
> >=20
> > I think I have patches sent out which should address the above issues.
>=20
> Can you send these patches upstream as well please?

The glibc-tests one is totally inappropriate for upstream and would
need reworking.

I guess the go one might, and using it as a template for some of our
other workarounds might also help some of the other patches upstream
but I have no connection to golang so help there from anyone with
better connections might help.

The gperf one is a workaround, I doubt it would be accepted upstream
unfortunately but I'm also not sure what else we can do about the
issue.

Cheers,

Richard



