Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 025B5731B2;
	Mon,  4 Jan 2016 19:01:22 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id q21so163554976iod.0;
	Mon, 04 Jan 2016 11:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=yd5xhbkbt9gdSnFUQN8TsZAuPndel9Z31f3yNPXwKi8=;
	b=HYJsxJtKlV7XXjmsI07RSa3v2RhGcIwskCpMXLJCTl3LUObqISpCLtBtPZGAyLLfY1
	5MhtJhVPfcy0qJC6gXfVCrncsSLowFXeMPGqEXuN3EuTp7bxY4jrMteozkQ7p1Szl+Gr
	Wj6GUNXGX1HHC6t5OMOHY9DGYQ69040sWuSTGuMBCNPCk6tJO9qfep4xnrexcYUrsmFC
	W6yj2xxjX2RfSfYJITIhQyyg8gj1et9+w5dAHOei05IkLZa19VQ2+xIlBlX6U6EgRk0F
	UoIsgmV3FGCUpSwBBDU86dWvOyPwwkEM2fpWzZ4V0Zr2xuvr/CBpLHzpNWI8U9emIEl3
	HZVQ==
X-Received: by 10.107.165.14 with SMTP id o14mr24107497ioe.49.1451934083265;
	Mon, 04 Jan 2016 11:01:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Mon, 4 Jan 2016 11:00:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jan 2016 11:00:53 -0800
Message-ID: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: [RFT] glibc 2.23
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
X-List-Received-Date: Mon, 04 Jan 2016 19:01:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

I have put together patchset for upcoming glibc 2.23 release here

https://github.com/kraj/openembedded-core/tree/kraj/glibc-2.23

There are two patches that you would need to cherry-pick

https://github.com/kraj/openembedded-core/commit/8f6392f59c83117da07a1ebe25b9cbbdf79a6df5
https://github.com/kraj/openembedded-core/commit/5f89cddb83a2682dc17b115940cc519dde83e4ae

This has kconfig and options-group support dropped.

I have done OE-Core only clean world builds for all Qemu machines
without a single build failure and
runtime boot tested.

Let me know if you see issues in your environments and machines
especially when bringing in other layers.

Thanks
-Khem

