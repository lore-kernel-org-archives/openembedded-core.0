Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id F27FE7295A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 11:47:47 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id E5DB53F4FA;
	Tue,  6 Jan 2015 12:47:46 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Tue,  6 Jan 2015 12:47:46 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Tue,  6 Jan 2015 12:47:46 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Tue, 6 Jan 2015 12:49:04 +0100
Message-ID: <54ABCB61.5080900@topic.nl>
Date: Tue, 6 Jan 2015 12:47:45 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1420540468-9062-1-git-send-email-mike.looijmans@topic.nl>
	<CAJTo0LbfRJBevSBkip+Rm5ma=Tp6_VT4_HXGtab-57nhm58Qgg@mail.gmail.com>
In-Reply-To: <CAJTo0LbfRJBevSBkip+Rm5ma=Tp6_VT4_HXGtab-57nhm58Qgg@mail.gmail.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: Fix QT4 applications spamming "QWSLock::down(): Invalid argument"
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
X-List-Received-Date: Tue, 06 Jan 2015 11:47:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOk, I'll add some extra information to the patch and submit a v3.

M.

On 01/06/2015 12:10 PM, Burton, Ross wrote:
>
> On 6 January 2015 at 10:34, Mike Looijmans <mike.looijmans@topic.nl
> <mailto:mike.looijmans@topic.nl>> wrote:
>
>     We have been using this patch for about half a year without problems,=
 and
>     the QT people
>     apparently don't care about the bug, hence there's no upstream status=
.
>     Including this
>     into OE core will at least save other people the trouble of having to=
 find
>     and apply
>     it for themselves.
>
>
> You still need an upstream-status - if it's been submitted to Qt but they=
're
> ignoring it then use Submitted and ideally put a link to the patch.
>
> Ross



Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


