Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C51C360197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 11:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 39F2A183A0;
	Tue, 11 Dec 2018 12:31:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ZOI5ZfRNc9kw; Tue, 11 Dec 2018 12:30:59 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 76DBD182BB;
	Tue, 11 Dec 2018 12:30:59 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 387CF1A07B;
	Tue, 11 Dec 2018 12:30:59 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D0FF1A070;
	Tue, 11 Dec 2018 12:30:59 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 11 Dec 2018 12:30:59 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 212D556D;
	Tue, 11 Dec 2018 12:30:59 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 11 Dec 2018 12:30:58 +0100
Received: from lnxolani1 (10.0.5.60) by xbox04.axis.com (10.0.5.18) with
	Microsoft SMTP Server id 15.0.1365.1 via Frontend Transport;
	Tue, 11 Dec 2018 12:30:58 +0100
References: <20181211085706.25762-1-olani@axis.com>
	<CAJTo0Laa7E=sO3emE1n6vNya6V1UOdaa400qoJidxqzMeRKzig@mail.gmail.com>
User-agent: mu4e 1.0; emacs 27.0.50
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0Laa7E=sO3emE1n6vNya6V1UOdaa400qoJidxqzMeRKzig@mail.gmail.com>
Date: Tue, 11 Dec 2018 12:30:48 +0100
Message-ID: <jwqftv4ti53.fsf@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/package: Correct format arguments in test_gdb_hardlink_debug
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
X-List-Received-Date: Tue, 11 Dec 2018 11:31:00 -0000
Content-Type: text/plain


On Tue, Dec 11 2018, Burton, Ross wrote:

> On Tue, 11 Dec 2018 at 08:58, Ola x Nilsson <ola.x.nilsson@axis.com> wrote:
>> -            self.logger.error("GDB result:\n%s: %s" % output)
>> +            self.logger.error("GDB result:\n%s: %s", status, output)
>
> Isn't status an integer so should be %d?
>

Both seem to work, but I'll resend.

-- 
Ola x Nilsson

