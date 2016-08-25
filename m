Return-Path: <niqingliang2003@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 08B9160762
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 07:45:08 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id n59so70399800uan.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=E1iO3PENhoIW0+d4qjfOwPqYxH6fPu8ndlAkWYs2lo8=;
	b=KwsXKxSr/3CG7wDbeLkVcUeB4lAcUFMdRhkz8En13x5MEyYZr9CHMBK2cj7MuK7HoV
	Y1ydTIlkYu320C50r++QteP+60Kxem2vDp57pX2tu/6mPXy/kxNbxKdIjhBlZ/9EuBE4
	OkyIhZjeV+7Nv2sdD87I/bJdkdYrZ++EKNH0V4PUoHNdadH6kVfLOKiHmaA30JnenkM4
	LlibnbwKdVOQpjTJ+SSVe0URgsjhEIyDQJYO+v33N5f3OLk1FEzO/O6m5oel3xaxi3Hm
	BGeVgPACB9MnckzjwEhDsj4x9P09ShvpxabguC4nQMcnHPZI8qdtowqHvOiZ1EYk3To6
	v6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=E1iO3PENhoIW0+d4qjfOwPqYxH6fPu8ndlAkWYs2lo8=;
	b=frZI/GrvIOk+h+M0P3GcY5YqUVKpp/jiYOuVKxfpnmVIBbnvokg/NcksAFMJU5RTt8
	JGsQJp9si1CqGUNHZD7fA/cFyO455H8YIWm0katWInjnAHCo3s9H8IwDgXDbgDEiLBDy
	FI7DSFfuXMMYISf9O544qMIroTLi20LRcJLS368xW3R5oZgbbcb9BqpB/1hPftIBAwlw
	M8R2yNXmDcLSHn06cvNHNxdCWFZSUO/Oti7yxatwHMhJLneDx2sVN8s3GjqrPCaXmZUw
	Pka604k5bui1yzInhuIIPbf90aeHd2aYQ2jlSEt8lGmAfWyqAQvDmjpoauaPfWJ1F9lU
	plvg==
X-Gm-Message-State: AE9vXwOCVNw14eTFJoqhpjgICscECR/vCTsm50GMEX43JAH1mnKlEQ2FdW6JqW4UNxYOW7/WCMh70vwZOIS4hA==
X-Received: by 10.176.64.138 with SMTP id i10mr4108347uad.110.1472111108613;
	Thu, 25 Aug 2016 00:45:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.14.71 with HTTP; Thu, 25 Aug 2016 00:45:08 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
Date: Thu, 25 Aug 2016 07:45:08 +0000
Message-ID: <CADwFkYehX7aM8Oqiu+jv85iOe54J6wUFbKUs7OdENoUsF_rUfA@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [meta-qt5] the QV4 engine will crash result in SIGSEGV
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
X-List-Received-Date: Thu, 25 Aug 2016 07:45:09 -0000
Content-Type: text/plain; charset=UTF-8

bug detail:
https://bugs.archlinux.org/task/49723

patch:
https://git.archlinux.org/svntogit/packages.git/tree/trunk/qt5-declarative-gcc6.patch?h=packages/qt5-declarative

Yi Qingliang

