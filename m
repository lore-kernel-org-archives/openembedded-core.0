Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1A97B6010B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 07:15:53 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id x19so157435929oix.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 00:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=rN58zt7lT5hmiSTx53yp1GrND/Cm/4r+2V+sX5ty6Po=;
	b=dkDWbWYGuFUAijI+WEFbqOjJ8PpQyv00Ohhh9xVmiEfskMJI4GQXmwgcFWsf+tjk6s
	qepN2uNSC4KdZdhRih3iS3KcCAwD2p3Q77QaThV7/+2l68u8SKSwNFvY1JpmXdeq/br5
	ILLzst9ohR0IkkBiqOJcZm4lnlkIFlUPQlVFtF6JrBlBZawgbUGFchvsxeuMjf7cA/vX
	/PBUWJlI0lnzxtA5fZsBrfDiHTow34YoVOgMByC4DcuNBGhb2GTd9JHHmYX257YPYLK1
	y4QzLT+vvLXmFMIPbYMDlqXN1yugBqzWnoBhYMgVghBFpVw6He8VPhrlIAJi2l+HoMLC
	81XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=rN58zt7lT5hmiSTx53yp1GrND/Cm/4r+2V+sX5ty6Po=;
	b=CbFLhXjN5NiVyaRwRsHvv4WHLt3DlkWXnq7v3D2nXfwE3Z/7yMGI92+cuxra+9COqB
	58dMUeunHTsNCgxRvA0rCGMLd5YkxI2N06VjkAzRPLCoY/Jo5cUmnO8PGb93LGIsgzo/
	laco4HkseEszP606qPkzdK330TM+X/8hNqlnH5GoDACu/Rfl3FVBHPRco+uxyf92MycY
	l35RRIEtVyT4o1wQvqYLME3DRTMSWL2t++zbri66WWBQL1sAjSYhH0TRfrfBaETK2enx
	bqnMcg+n859dowGFWEfFUXvTZZHTQ8rokazdSS/npyhW9Qyr5leVTAprfPnGIU4ws1vu
	WhZQ==
X-Gm-Message-State: AOPr4FUnUXCpZBn9dduFgAy7+w6pHsuBBn8iQZyAsEboLi+4GKa6yrv6jBPqx3U0UKpNGZ6/Okxz79Dw5OC233bp
X-Received: by 10.202.197.70 with SMTP id v67mr6851909oif.63.1463123754110;
	Fri, 13 May 2016 00:15:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Fri, 13 May 2016 00:15:24 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 13 May 2016 10:15:24 +0300
Message-ID: <CAHiDW_Hu7dZYxLD0cCEbV_M=-VtQF0s7O_8aZxZrXof2LXa5gw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: augeas: oe-core removal warning
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
X-List-Received-Date: Fri, 13 May 2016 07:15:54 -0000
Content-Type: text/plain; charset=UTF-8

Morning,

I'm considering removing the augeas recipe from oe-core: it has not
really been depended on by anything since Danny (rpm has a non-default
PACKAGECONFIG but even that is accompanied by comments about no
testing) and we have nothing testing its functionality. Please speak
up now if you think augeas should stay in oe-core.

There is one reverse dependency in meta-oe/meta-networking (netcf) so
I'll propose adding augeas there before the removal happens (other
suggestions are welcome).

Thanks,
  Jussi

