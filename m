Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CC4AD79BEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 08:52:08 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f17-v6so12219041wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 01:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=I6sasBc1B+W9WSxUjDO6JhPgpkMTGvjkoct218q4JDM=;
	b=RSbJ4mkTqFp9ueRuBMVd3OwIN5c2gZ6fBSRL0hB1/p4PQBWjbgLbc6kYHZ93IKVnNa
	ZglW0naXz67gBEyD10JXz4UvtGI03uf1tiMZG5hBEYa/MykC5MZD+Jn37Qd1fkT3/Anv
	f4FpmcMlIu7aUs776EJq0TibzICjOGIn63RQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I6sasBc1B+W9WSxUjDO6JhPgpkMTGvjkoct218q4JDM=;
	b=ZazJrkmwyo+B9eTxSFot7rJy6bpFBKsTbme1IhrG7HUOigwBr7wToOFDZiNduRDf7S
	gjvWTiDHkcolpcElTnHH7gKabQnzM5zF+SIsnjGGP4WxjcIsW14YHuiyAiLauRt/J3ZT
	tK6rrFLV5dKe6qJnBXeREvv9q3fgdnTqzfRmALDGlPnvBbvvHnmxveLypiK7hRpvj0vi
	9vUmTdqZXlpx5vQPpJkb/nquO7kxjS4g/bD9HiM0TPodbIv5Ulosa2e0z5ppkD/0fmNj
	ot2ykD8oK2i+ZNqepRpUL5wPaW6k7rq2uZ4OUelKUb2Wr3c4q7pr0oe0ypE6Ul9hFwmP
	8FGg==
X-Gm-Message-State: AGRZ1gKfCxTUQNcBXUSy5dta2XX+Z9pkzwuoU243yCdCRnNZ2Rkf8a45
	C7nPJJil79IaPeP5mKc3OKKJmg==
X-Google-Smtp-Source: AJdET5fOHI14vUXiEjznMPfjoeU7/mfgjKOpGClLr9990wfWu3g+zcrqSiUHR+PVT7S7RLZvojjCCA==
X-Received: by 2002:adf:b30b:: with SMTP id
	j11-v6mr1710754wrd.207.1540198329471; 
	Mon, 22 Oct 2018 01:52:09 -0700 (PDT)
Received: from hex ([185.7.230.214]) by smtp.gmail.com with ESMTPSA id
	i13-v6sm14231247wrn.62.2018.10.22.01.52.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Oct 2018 01:52:08 -0700 (PDT)
Message-ID: <bf5ae576c3e8de42eab98ccd3c4d3738798ec32f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2018 09:52:07 +0100
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D04335ECDDB6@KMSMSX155.gar.corp.intel.com>
References: <1539588294-5532-1-git-send-email-ee.peng.yeoh@intel.com>
	<1539588294-5532-2-git-send-email-ee.peng.yeoh@intel.com>
	<ad34c69dbab91a7250874cb70d0c03a62adc3e2c.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04335ECCCF0@KMSMSX155.gar.corp.intel.com>
	<5b431318cc50402e32836dbf42398e59ae323bee.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04335ECDDB6@KMSMSX155.gar.corp.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/5] oeqa/core/runner: write testresult to json files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2018 08:52:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-22 at 08:17 +0000, Yeoh, Ee Peng wrote:
> Please ignore the two patches below for testimage.bbclass and
> testsdk.bbclass, initially testing successfully when running these
> patch separately but I am finding one issue with method namespace
> collision after testing both patches together.  I am in progress of
> resolving it. Sorry for the inconvenience.

I think if your code appends to the results file, things should work
better and we can remove the split level directory structure. Merging
the results file will help the autobuiler process the results.

Cheers,

Richard


