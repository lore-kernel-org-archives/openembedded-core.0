Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5623C43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 14:14:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.42206.1656339264532238027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gmmAvBZh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 189so5045007wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=GHI8Qhi//7+bHxWIiu1Xw4BOWlJk8gtjAKvHxVVfi1c=;
        b=gmmAvBZhyl2IE4UdBMM5AUEmlTQYZ2AuaBnFV/Jp4TqycdH7JFgQ2RYQkSO219C2uS
         lgg5NY/u7SIKSp6K/81BjHpTdJn4PWDmxBDJD70YH1cAr8rFUV6dPphcZCoBSfU+/moF
         oR9E99z6zzZfOAA9+unmPljoHCCTrDLFHfFEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=GHI8Qhi//7+bHxWIiu1Xw4BOWlJk8gtjAKvHxVVfi1c=;
        b=PKnAkO+X2YmE5CQLvhgUm2NjxWXWCUmUFIUtt6omkSgTjXFf69pQldFXYxQVH+Tce5
         qyf3YVvCzz4Bb0HfwWh5kwboPmLl9SsYoFsprViWGPF5oeH1sbXyPArHKjFpVfLXEGaX
         VImcL2+eFoZTd007co8mMkBiZAESQc+pEgaaeRiSkq7BXPRfWYidD7aMWEe3APlFxBUD
         zGqnx9dOcmzPHbReM0rjfJivLnDpQawoMo4NQCndUTlKSndF8c1sQ2UN6Y3+4QYZtoxF
         4H+2BO2wtzmYsT8OQGL/3Bf1IjIDlnw9QWGL8seUyo3v6lhq9TQK+fVdoDMXPDQrCTue
         +YVQ==
X-Gm-Message-State: AJIora88Ea79E/xyj7CT1Gz1w4GE6nR17JDtW3uGnA+hZKmMKxETHS1D
	esf5ZZB94w8AAWMusMyyA6VFMQ==
X-Google-Smtp-Source: 
 AGRyM1vpylH3Rec3m4HZMT9n8iVJbWBdBnlxLeLffSBD0Ui2YVvDwlgeE8LcBLTCpqNhiDyk9RHTtQ==
X-Received: by 2002:a05:600c:a47:b0:39e:f953:84e2 with SMTP id
 c7-20020a05600c0a4700b0039ef95384e2mr20311447wmq.202.1656339262732;
        Mon, 27 Jun 2022 07:14:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033?
 ([2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033])
        by smtp.gmail.com with ESMTPSA id
 ib3-20020a05600ca14300b003a04e6410e0sm1137174wmb.33.2022.06.27.07.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 07:14:22 -0700 (PDT)
Message-ID: 
 <3d05eb221799078000ed3a636776a311692cac7f.camel@linuxfoundation.org>
Subject: Re: pseudo database integrity checking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jun 2022 15:14:21 +0100
In-Reply-To: <20220627091101.44f09689@seebsdell>
References: 
	<ced1bde4cd0d5ef021c13088ffe4fd522648811c.camel@linuxfoundation.org>
	 <20220627091101.44f09689@seebsdell>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 14:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167324

On Mon, 2022-06-27 at 09:11 -0500, Seebs wrote:
> On Mon, 27 Jun 2022 14:52:39 +0100
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>=20
> > b) We could add a new command to run an integrity check on the DB to
> > pseudo. If we do that, we would then be able to show the user a decent
> > error and above the timeout issue. The question is where/when to
> > trigger it and whether races could occur against the check (e.g. where
> > multiple fakeroot tasks are running in parallel against the same
> > WORKDIR).
>=20
> I thought there was a function that did roughly this once at some point.

There is, triggered from a commandline option currently. I'm not sure
how well it would get on with a resident server in it's current form
but I've been using that function code in my experiments. The challenge
is how/when to trigger it.

Cheers,

Richard

