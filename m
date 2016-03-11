Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6A6731DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 15:59:00 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id tt10so102069898pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 07:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-description:to:from:in-reply-to:cc
	:date:content-transfer-encoding:message-id:references;
	bh=/SwURSQ4VWaUrg5csvoeH8ZgZcWbTIRVOAp+WbC3Rmk=;
	b=uUPzCWJ0rk4+e4s6RN3kWU66LOCOb2/mK28EAnSBKHe3CZzNskOMLVrNh7q2o/UCQS
	ErWz1tUQoTmOQ3HFzn2+yZNSDmItMviCra8eEQlIN7lJ6E1CXMHemh4TqQAjGk5aC2gZ
	oLizhKwA5ozcNnhgxckV4cICbOj/J564KqgfvC2z5XcERYt6temXQq1MQK8DGcgOlmHV
	xDGRW7QuKPqDNqNav9p4mgafm7i2yBP7zt2umAp05lqNdIwa0F6hJHQ+6J04FON7L2xh
	PcrLVVqyIbam5telvkTt3qomvce0v//SCVmkF0ZHsiiCK6/ww9MCRx65nslpHm7EH3xC
	TKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-description:to:from
	:in-reply-to:cc:date:content-transfer-encoding:message-id:references;
	bh=/SwURSQ4VWaUrg5csvoeH8ZgZcWbTIRVOAp+WbC3Rmk=;
	b=ElJkPdKjd1wvswxsGJmZHtbBBktSoW4Gmit8D61Se8InVcvt5YA/ThgTNBjzYXCqro
	WWeQOJA21WKjsWX/LUJB1VO6ETjJ/SxEizKBrRQDNeY/vFIgr3I4MZtXAO0GxgzooLWm
	xrGUHUC1cPV7yiXggTu0o2LIqjw4ovEOQjIUg8REdaHzKBLIY7hPaY1okho8rCWS0J09
	aa7KIxAPslsHUSZcuLg03Nu4m1SN7O/+hnBact3OW92CdZhgiS6XjT7YIXlwworE+7RS
	7wDCUwFMuljTfrd1DVO0SAtOjVr2V72SSKpUOt6nK2UmWplQMHhAPBaazvYjmvBif8qQ
	IvJg==
X-Gm-Message-State: AD7BkJLB2kIEZ+mxKLSsXZbmecxyGgAv7z0S3iE3EswVCU3VsJGbA1+5c7wZcp99iiC3HA==
X-Received: by 10.66.159.232 with SMTP id xf8mr16663975pab.71.1457711941571;
	Fri, 11 Mar 2016 07:59:01 -0800 (PST)
Received: from 172-4-122-115.lightspeed.bcvloh.sbcglobal.net
	(110-170-137-253.static.asianet.co.th. [110.170.137.253])
	by smtp.gmail.com with ESMTPSA id
	sj4sm13884939pab.43.2016.03.11.07.58.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2016 07:59:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
To: "Burton, Ross" <ross.burton@intel.com>
X-Apple-Base-Url: x-msg://6/
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
X-Should-Pgp-Sign: YES
Date: Fri, 11 Mar 2016 22:58:03 +0700
Message-Id: <1FC09834-DC8A-477D-9C9F-B6D469A7E90E@gmail.com>
References: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>
	<CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
X-Should-Pgp-Encrypt: NO
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix the license on GNU OpenMP
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
X-List-Received-Date: Fri, 11 Mar 2016 15:59:03 -0000
X-Groupsio-MsgNum: 79479
Content-Description: OpenPGP encrypted message
Content-Type: multipart/encrypted;
	boundary="Apple-Mail=_A937E56C-B910-4209-A7A2-CC6C1FED235C";
	protocol="application/pgp-encrypted"; 
Content-Transfer-Encoding: 7bit

--Apple-Mail=_A937E56C-B910-4209-A7A2-CC6C1FED235C
Content-Transfer-Encoding: 7bit
Content-Type: application/pgp-encrypted
Content-Description: PGP/MIME Versions Identification

Version: 1

--Apple-Mail=_A937E56C-B910-4209-A7A2-CC6C1FED235C
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=encrypted.asc
Content-Type: application/octet-stream;
	name=encrypted.asc
Content-Description: OpenPGP encrypted message

-----BEGIN PGP MESSAGE-----
Comment: GPGTools - https://gpgtools.org

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
9JbD5eydrfBYP5HPSgvvrWpOMQLbO3JZJnc=
=fvEc
-----END PGP MESSAGE-----

--Apple-Mail=_A937E56C-B910-4209-A7A2-CC6C1FED235C--
