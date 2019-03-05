Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 562E77CA6A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 11:20:02 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id w18so3575215itj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 03:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZoXrZOz0qRINkJMK3IEW14CVv9JcvtRc6V4ZBw1Jc3M=;
	b=VSnD7NFdJsGvP1kXukpeztOFc6ZlpKD1S1/o5oJEZivfDnQWaiIk6Ah9rWcm4EjFEI
	wdyH7c/94ided1VAkNORc3Oa/hmosOBV7XvYby6ki7t0coGTohWbL3QB9cb7x0vzX1GS
	pHbVTIv5i42gweoHokJ9GHx0DPe9yImusl6Xl5dgO7kBJVl3UDciLCSHIIFgJVLy+ajz
	XgbiMMtbyYHbRy7/QoN8GyNdHddcafNhTK50FYhae9qPvyq1G7vOqGTOwT6B55QABDXQ
	RNiXbeD899yMReaGhiaiTQS686utPEEHNYXzJhUUEcETu/OSVLXBhp5dJKn4ZxEAUN7E
	A5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZoXrZOz0qRINkJMK3IEW14CVv9JcvtRc6V4ZBw1Jc3M=;
	b=rQMI56N6HIM3RT3dilsxROTHF+JD3IAYNCWA4J0khZh7tq/1WWe7jTu6rWZr+tBCXF
	fquovcUXJVgNaGJ33AmVZZ0/+W846PjTahk2x3l1UxFOwA54a9yNOpodm4Y8blkKrqha
	Qv4EzBH3w9NzfaYj0okw1TbCJMAvu5/sdjCtWidwHmKgihCK1zbw8bvTnv2QbxDQc1u3
	Ha6rgooTrPLQq9G/jXuSB/6+mtYTGIm0HptoPMpteOmSjo4nykmeLBz4WJVkUd17M8Gd
	WpfAoPCWJC9n1+mwgdd2aQOjBkO+0/TwWJvNzyWXf+fLBo/8etOJPTa4cyueY9jB94n5
	AXOQ==
X-Gm-Message-State: APjAAAV0h7acKcc7RkEH2IbTMjlKy54I8PpO7yn31US0LyDD2MF6ax3y
	9QmrBgLzn0CI6K4ALkhBuVTcIPtEhnyJMXzBLc/+FrTo
X-Google-Smtp-Source: APXvYqwqbHNEAdFUe8rtn6nZO7hQcNKqTrjq7fQ+2XnHTCoOy7f5iG5MLfi2ulAqiq6chHboo9fDf23IBeu9bXttLiU=
X-Received: by 2002:a24:2405:: with SMTP id f5mr2526404ita.130.1551784803473; 
	Tue, 05 Mar 2019 03:20:03 -0800 (PST)
MIME-Version: 1.0
References: <20190305024514.14753-1-JPEWhacker@gmail.com>
In-Reply-To: <20190305024514.14753-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Mar 2019 11:19:52 +0000
Message-ID: <CAJTo0Laz4+bSQOxvoijuHq382fuYrRBBDxG7FW4s3TsdqouJvg@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add source package to ${PACKAGES}
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
X-List-Received-Date: Tue, 05 Mar 2019 11:20:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Mar 2019 at 02:46, Joshua Watt <jpewhacker@gmail.com> wrote:
> +ALLOW_EMPTY_${PN}-src = "1"

Is that what we want?  Empty PN-src packages for packages which have
no source code, or when source splitting is disabled?

Ross

