Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AE1C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 09:50:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.23405.1659952252835197449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 02:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QVxKEd3P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id l22so10250228wrz.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 02:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=nRIiCPd/9uk1IyCfZWDjfp4LMEoyNeMd+XIQk5ZGPig=;
        b=QVxKEd3PWGLwnwrxNRbhRfkSUJFMlZLAN3Nvr3MsbMcRNpeE7qGvqqdfx47hg2aO+j
         IMD+tS5r63bX1GvJKRbvsvsgNOtMFd03P/JwZsseyR2TOXHKv3/BKhK7Kd/rEnIxYj7n
         RBi5HUXXEc7/1XtGBpCZFjd7utt2lvo6lFpG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=nRIiCPd/9uk1IyCfZWDjfp4LMEoyNeMd+XIQk5ZGPig=;
        b=HPmEHZmFOzARVvEPjghbZAd4UUIQhWc89xSy+P2reKj9Ul0/mCKUedBsKdanxkFzYk
         eYuHhj2lsKY3uX01rsF+9H8c/Wg2wtVFMk2UFFVa+uDhY0JkVM7VUB5K0XEK8epnQARH
         CyBiEhFG6qp25ZRtvJTEYMPWe3CdzE4+vwmvtzBO795PDrgSB5aRjSWrIpJaB3Y/fO60
         OCZ5sMvgSFYgKFkRgKxT5t1Qax8P9C7PuLFV6qQLXWbgdflrHhHahORWXK1w3tU5OANF
         RnCYvKb2XEW4ndCfYlrDavcKRzBFWuKVDZMUvjYITaxGd4+jlwxu8Et+lH0OYyIk8T6B
         idTA==
X-Gm-Message-State: ACgBeo2oxo+Upv1lKQLFWha0S30j7PHZ90Pd+/3nudU1lMXdm7SH4s57
	vgvBNwEl7XB2HYTEYpwgnY38Fw==
X-Google-Smtp-Source: 
 AA6agR7Rh7cgC096/6mArM5ikaXmBKwhUWEX5U8cA20vVRYZ7EJ6bJMqhOIaezeFTOvDhoR2z4Ehrg==
X-Received: by 2002:adf:e54f:0:b0:21f:b4b:a1e5 with SMTP id
 z15-20020adfe54f000000b0021f0b4ba1e5mr11333015wrm.618.1659952251175;
        Mon, 08 Aug 2022 02:50:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d3ed:8697:1d83:a16?
 ([2001:8b0:aba:5f3c:d3ed:8697:1d83:a16])
        by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c4ec900b003a54109a6a0sm2520080wmq.3.2022.08.08.02.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 02:50:50 -0700 (PDT)
Message-ID: 
 <6394eb83aa0fa91f93c8b078aab9574f4fb98a38.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 09/45] patchelf: update 0.14.5 -> 0.15.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 08 Aug 2022 10:50:50 +0100
In-Reply-To: 
 <CANNYZj_p-n8KiaLcbqXZLrZNMNv1SjGdh4HaED6G9kmVUNjx0A@mail.gmail.com>
References: <20220808063843.3975130-1-alex@linutronix.de>
	 <20220808063843.3975130-9-alex@linutronix.de>
	 <5b490d3995e9290f4296a120870ad04c7be9d80a.camel@linuxfoundation.org>
	 <170951048C08C44A.7414@lists.openembedded.org>
	 <CANNYZj_p-n8KiaLcbqXZLrZNMNv1SjGdh4HaED6G9kmVUNjx0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 09:50:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169078

On Mon, 2022-08-08 at 11:35 +0200, Alexander Kanavin wrote:
> On Mon, 8 Aug 2022 at 10:23, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > Usage of patchelf in uninative seems to be contained in
> > uninative_changeinterp, which can be tweaked
> > to handle r/o files before invoking patchelf. Was it that all usages
> > of it need to be tweaked similarly?
>=20
> Ok, I couldnt find other usages of it that would require similar
> tweaking (icecc uses host patchelf if available, rust.inc/cargo.inc
> operate on only a few static filenames), so maybe it's ok to move what
> the patch does into uninative_changeinterp (add +r before invocation,
> restore original permissions after). Still better than carrying a
> rejected patch.

It feels like there is something we're missing. I wish I could remember
what :(.

Note that the testing cycle for changing patchelf is a pain as we need
to merge, create a uninative release and upgrade to before we have the
full cycle and know any change is fully working.

Cheers,

Richard

