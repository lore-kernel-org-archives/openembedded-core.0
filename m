Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD6B6DD22;
	Mon, 16 Dec 2013 20:04:16 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id x13so6910521ief.24
	for <multiple recipients>; Mon, 16 Dec 2013 12:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=z9NHtOIEcKQIg7lLMU3nXpORw5WaRuAMOixVWsjOG+M=;
	b=KLwUmCe2ov7TGjADh78FZ9csuJpx45Uw7SBf5i0kB5CskJhx6VrauThthQI8a54s5O
	QiMhK3uRNurGzCj/3C6j/1q2IqAIsMPrUE/FLu3rDSotIjkT2Af8MJgtsPS36KLYDU/1
	WnacijI12c5NuHZlTh3bdIb3d5Fp9HHbRl1I6yNXNw9m52yjWX+wF43aVmL9ujoLkyQ7
	hdLIGrFiLESBuXKEhQETqHncP5+TkfMa34rM+9yo6v5Q1jR2YnmnoJf+hXW734XHLFkp
	3J+2NUKEC0DTeF+kH0haFLLpn8fV2BdaUTsabwVoC3qJV2VCd9Rc153lQdA7WJfd7d+U
	Inng==
X-Received: by 10.50.136.165 with SMTP id qb5mr17299532igb.2.1387224255429;
	Mon, 16 Dec 2013 12:04:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Mon, 16 Dec 2013 12:03:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Dec 2013 12:03:45 -0800
Message-ID: <CAMKF1spWnFvXRAp-GuoBL9vXceg29h5Numv7PYhZNWUJu8rMRw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] Binutils upgrade to 2.24
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
X-List-Received-Date: Mon, 16 Dec 2013 20:04:16 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I have pushed a contrib branch for binutils 2.24 upgrade here

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/binutils-2.24

I have tested it on both uclibc/eglibc and qemu machines. But it would
be nice if
it gets more testing for machines I havent tested

Thanks

-Khem

