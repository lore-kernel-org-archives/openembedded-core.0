Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8F08373181
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:14:39 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id 3so83106675uaz.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=gLSP76nnnadKeeL8jseM7sxc19aYBzwXby8P4lfPyiI=;
	b=aUN01ALjdHsKdMY0o7PSayyiW9u1yQGrS9udUV4C/AASKe9OC6NAhUkY3C9udtBMdL
	Bikqm9Q48Wwf8V+FLWFG4d794TOsmB/ZBv6TjtXZh1QmGU0/gqqyvAWSrfMvDPMb1f3s
	Tlu3Um5qCv6qKE69PXXL5l0INRm6Ozu2ZIt9o/6t/famfyL5aFuh9Uah9MERaaFFs3lW
	c/S7VYEQZrKhINeRtq+Jz31Y4oxiwadfgzlwHD/XW/+c5NrI7sixU75msXBtsubkEnDS
	BJzzTbVdlI0MY5SyDeEJUR7W49N5CV78lZ4qaItk9UJdJnCMgoP1Q5kUj3qbjYGJczzl
	GbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=gLSP76nnnadKeeL8jseM7sxc19aYBzwXby8P4lfPyiI=;
	b=KVHmxht6p2ALyPGRz9ty0N72Xj7zwvJYpR4QbaBDvPBL0L1Li0qieJCjaX6/RMNS0d
	XbZkDvNFqZ3mpc32z4J/D77OaFSx3cP2mC6z8EckErGMU5BHNfcGxJeVnlsTCxiwK5Wh
	B/LUYYOUVeZdewr87qkbsjFDxqEbhXHBE05fzBliIx7nv57DVgGoJz/0HeJv9l8cnCJ/
	KvszZ8uxkI/GT6s870Zaufsx0zAOIG2+eCtduroOZ+cgyme8rKcqxt2FfngflCIYgjJU
	l0B9LCwuY4hMYX3cFEy1UicbpQCBJpU279pE3JkulOmQYlvw1ac3F8+i38nlAhn42mrh
	vSvg==
X-Gm-Message-State: AIkVDXJfIutaZn2WQuTrKTQh18C2GCtHkqYMVMA3Fa+FyO0qHXnEEoh7dcGN9Mhn+uzOECUcCnvn3aVmqedmVQ==
X-Received: by 10.176.0.180 with SMTP id 49mr12306158uaj.32.1482146080359;
	Mon, 19 Dec 2016 03:14:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Mon, 19 Dec 2016 03:14:40 -0800 (PST)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 19 Dec 2016 12:14:40 +0100
Message-ID: <CALbNGRThWRoOfZjN1BaQpT2hAGzuRCfHUnfG89gxQcDE=6cgUw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: 'From OE-Core rev: <commit-id>' in recent master commits
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
X-List-Received-Date: Mon, 19 Dec 2016 11:14:39 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

just updated to latest HEAD and checked commits. Found a lot of commits with

(From OE-Core rev: <commit ID>)

If I try to check the commit mentioned with 'git show' I get 'fatal:
bad object ..'.

I thought the tag was meant for release branches when backporting
master commits.

What am I missing - or did these tags come in by accident?

Regards

Andreas

