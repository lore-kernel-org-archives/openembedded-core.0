Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id B949B6FB3B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 20:52:57 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id m1so65160oag.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jun 2014 13:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=rc6qzPY+BShrW0Fd0fw4frE1kF+cwUA3QCRPzwnpr58=;
	b=gXV44J4vZ2AHYghnJ+Ir6x06TupC/ocaAiY6pwTuTBGDFOya4x0DxNSR3aE7ALkmub
	2hLyfdKtdDvXri5RXSuSoXCsfJPBAL51DjSZlBrjaQyCOxJBUvu+OTMrLF8wiJi403pT
	+yM/GgBqEC3GhkoRdFncYxuI5uS0zqeMUWF6xVcenaamEWifKgNucH5CSCtz5sDbKMRw
	Yq3+q2nKvpf1c1TP/PsxwVeC1hSN0xGwDOPaq7muadZuMKE9oqaaAODqYTDeCFPSnVCz
	PcuQ86VfeT9pa9X3HTlGIOOQEXhMsOGD2wdpf9dGbjSMKR02nwZVbN5Ys+Up9Ot1TyLj
	mbFQ==
X-Received: by 10.182.229.101 with SMTP id sp5mr61929346obc.52.1401915178423; 
	Wed, 04 Jun 2014 13:52:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.111.133 with HTTP; Wed, 4 Jun 2014 13:52:38 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 4 Jun 2014 22:52:38 +0200
Message-ID: <CAPybu_3Jz=KNmYjE+crCFBuxpmJGmS7DfOM9fmDXFGOADmwyFg@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: PR_Service. Sync database only on clean stop?
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
X-List-Received-Date: Wed, 04 Jun 2014 20:53:00 -0000
Content-Type: text/plain; charset=UTF-8

Hello

I have been running happily with pr_service for two months.
Unfortunately, due to a power down the computer running the pr server
has stopped.
When I have started the server I have discovered that all the
information about PR was lost :S. I assumed this was due to a db
corruption, but I have later discovered that the database is not
synced after every insert.

I guess this is to improve the performance, but I don't think that
everybody prefer this behaviour, right now I have to remake and
distribute only 10 flashes, something reasonable, but it would have a
disaster later in our development cycle.

Is somebody working on a parameter for the db to be persistent? Would
a patch to implement this be considered?

Regards

-- 
Ricardo Ribalda

