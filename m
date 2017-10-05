Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 88B2E60685
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 11:17:51 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id l39so10599148wrl.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=44eBlb5sMj+7Zj9CSo+SeR/aHJAHcFW620xfM8hImUU=;
	b=wFfdGnWawSSQEeVO5bReDME/J33NmWR0a9vakcPRcB/Cpqy0yVAnv9Eb6BanQmDfGk
	1GJ3SYdYvWCzjIxg1HAvzlqpDCxgdkarjtndDZx+8V+sVQEt3jLnX/LdOmAvN9cKuxy3
	sJ4yoQcq+Vz8XFZ9NMEj75RtYi5rjSzBDriPiWrm1wGQ3Ta6czQB+9NkW0dlkjGF1P1s
	ErO64/F495XxXeGXtXIniEt2kUECJ2U4G2kMSPxHhhquL66bl9pqqgSRoIEnHX57xd1S
	UkRfJ7RXffYwUKwDZfpjfdt1bpe8BR0RCw0+V/tlL/8ZY4OLyb4Df/5B2tJNiLCIo893
	SyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=44eBlb5sMj+7Zj9CSo+SeR/aHJAHcFW620xfM8hImUU=;
	b=RLqJCFU+r/46Zwh1mSENU1jfFTBBIoFZt6ukx9CwPefNSXZapQ8o2hHB1QjlmwKWPx
	8dd3+yR105Cqz8BTtI15tK1Ch3Zd1cmj3K3V/ApFzDdiaYy58go75RhXSpcxTVpo22tT
	SnG+/iY34YuhnOEfzS6z0jQrexfsiS0UvLj8P6GINXLEb1KDDQnEPy2vaHvOEJHNJBSR
	r6T0CNWIxhhHkaFwnNG7AqPqWx74btRUwh04RYwZSHEAyk2QlfdRURQPmkIQMDb5fUMQ
	5tNCN9ojZCNjYt6L85Ocmb6Ybnn4DKExoM4BET6cJDeJ5ssO9McANYXpOpCsmWxrpcY5
	iE6Q==
X-Gm-Message-State: AHPjjUiNRt/h21lALxySUSe4sQM2r05Ibm23dMFmVct0FwdpT5rvgALO
	2jZhGUEjvhR52cDMMvCsmUmSSR0=
X-Google-Smtp-Source: AOwi7QB5SokncMITYEPp2UJN/9oEX65zsQXUwXg05Dvp9PlSXjPQy1GAQnt/iP4VWQHaW6rTd0XpHw==
X-Received: by 10.223.199.130 with SMTP id l2mr21081764wrg.113.1507202272368; 
	Thu, 05 Oct 2017 04:17:52 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C2E3.dip0.t-ipconnect.de. [93.232.194.227])
	by smtp.gmail.com with ESMTPSA id 92sm5600260wrd.15.2017.10.05.04.17.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 05 Oct 2017 04:17:51 -0700 (PDT)
Message-ID: <1507202270.25153.19.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 05 Oct 2017 13:17:50 +0200
In-Reply-To: <1492996572-11939-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1492996572-11939-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] libarchive: 3.2.2 -> 3.3.1
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
X-List-Received-Date: Thu, 05 Oct 2017 11:17:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-04-24 at 09:16 +0800, Huang Qiyu wrote:
> 3) Delete three patches, since they are integrated upstream. 
...
>    non-recursive-extract-and-list.patch
...
> -Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/812]

What made you think that this patch had been integrated upstream? It
was submitted, but unfortunately has not been merged yet despite a
favorable review.

Please be a bit more careful in future updates. Removing the patch
causes meta-swupd to break.

I've sent a patch adding back the patch ("libarchive: re-add non-
recursive extract and list support") but it is not clear whether that
can be merged in time for 2.4.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



