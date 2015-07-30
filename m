Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A418476398
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id F3DC52E09D;
	Thu, 30 Jul 2015 09:04:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id a9Fhya1p7qLq; Thu, 30 Jul 2015 09:04:05 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 5ECEE2E4AF;
	Thu, 30 Jul 2015 09:04:05 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 412E71229;
	Thu, 30 Jul 2015 09:04:05 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 34C8A1139;
	Thu, 30 Jul 2015 09:04:05 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 30D8C3E049;
	Thu, 30 Jul 2015 09:04:05 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Thu, 30 Jul 2015
	09:04:04 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id E31109C68B; 
	Thu, 30 Jul 2015 09:04:04 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
In-Reply-To: <CAP9ODKob+TVBpb1jrzVueZT0w2DQpP5X0YBAwy-RFEoh615rHw@mail.gmail.com>
References: <cover.1438161068.git.liezhi.yang@windriver.com>
	<5755146.lYtmNt1cvb@peggleto-mobl.ger.corp.intel.com>
	<55B8A89A.6050406@windriver.com> <1438170429-sup-8609@axis.com>
	<CAP9ODKob+TVBpb1jrzVueZT0w2DQpP5X0YBAwy-RFEoh615rHw@mail.gmail.com>
Date: Thu, 30 Jul 2015 09:04:04 +0200
Message-ID: <1438239812-sup-93@axis.com>
User-Agent: Sup/0.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] bitbake.conf: add GITHUB_GIT
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
X-List-Received-Date: Thu, 30 Jul 2015 07:04:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Excerpts from Otavio Salvador's message of 2015-07-29 18:27:32 +0200:
> It allows for people to add local mirrors for example and even remap
> fetching without touching the recipes. It is a good addition IMO.

Can't you use PREMIRRORS for that?

-- 
olof johansson

