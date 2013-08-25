Return-Path: <rewitt@declaratino.com>
Received: from p3plwbeout15-06.prod.phx3.secureserver.net
	(p3plsmtp15-06-2.prod.phx3.secureserver.net [173.201.193.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1F87B6010E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 17:43:43 +0000 (UTC)
Received: from localhost ([173.201.193.117])
	by p3plwbeout15-06.prod.phx3.secureserver.net with bizsmtp
	id H5ji1m0012YSTK9015ji2B; Sun, 25 Aug 2013 10:43:43 -0700
X-SID: H5ji1m0012YSTK901
Received: (qmail 1606 invoked by uid 99); 25 Aug 2013 17:43:42 -0000
X-Originating-IP: 74.131.113.133
User-Agent: Workspace Webmail 5.6.41
Message-Id: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
From: <rewitt@declaratino.com>
To: "Elvis Dowson" <elvis.dowson@gmail.com>
Date: Sun, 25 Aug 2013 10:43:41 -0700
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Sun, 25 Aug 2013 17:43:45 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=0A> =0A> Thanks! Any idea why the qemu with hard float configuration has a=
 kernel panic with linux-yocto?=0A>=0A=0Ainit is going away so the kernel p=
anics. Usually this means it couldn't=0Arun the init on the rootfilesystem.=
 Try adding keep_bootcon to your=0Akernel command line and see if that give=
s anymore debug.=0A =0A> Elvis Dowson=0A> _________________________________=
______________=0A> Openembedded-core mailing list=0A> Openembedded-core@lis=
ts.openembedded.org=0A> http://lists.openembedded.org/mailman/listinfo/open=
embedded-core

