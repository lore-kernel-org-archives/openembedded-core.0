Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE6A731DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 11:21:48 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7MBLlWS024563
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:21:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1471864908;
	bh=KlmghrDcfH6vzPcFIob4nf1Q/CWLAk1TmpqQ97M10Sg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=ESMsIJTKniNP24GZgNIXPutOWwMG5TdOwNpT0WAcAmKQ3fIzwiWft54fYNu075qbF
	3mwtIsSJ3wVu5ZYKCXqglZSw7g7A25QYgFdd0Zlg2tjrSt9pOqNEqpBCBqNcXkgXQr
	ZE4hfP4nJY1CsrJhLTeoYT4OzzZ4agkvbf28aEbY=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7MBLTSE014671 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Mon, 22 Aug 2016 13:21:30 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id E6E0F8454B;
	Mon, 22 Aug 2016 13:21:21 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7MBLSTx014668
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 22 Aug 2016 13:21:28 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1bbnIG-0005DF-0Z; Mon, 22 Aug 2016 13:21:28 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <cover.1471246474.git.hongxu.jia@windriver.com>
	<f2d0736dd176c21c4ef1d539a7e82dbfd1367f2a.1471246475.git.hongxu.jia@windriver.com>
	<ly1t1hjg44.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LY1L1zadYdw+AH=hVD6xu5r9sRap_G7+iALhf9q41Excw@mail.gmail.com>
Date: Mon, 22 Aug 2016 13:21:27 +0200
In-Reply-To: <CAJTo0LY1L1zadYdw+AH=hVD6xu5r9sRap_G7+iALhf9q41Excw@mail.gmail.com>
	(Ross Burton's message of "Mon, 22 Aug 2016 11:18:22 +0100")
Message-ID: <lyshtxhww8.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.0.95 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: 2.1
X-Spam-Level: ##
X-Spam-Tests: AWL,BAYES_50,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] ncurses: upgrade to 6.0+20160625
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
X-List-Received-Date: Mon, 22 Aug 2016 11:21:50 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

>> This breaks the build with OE because it tries to split our $CC.
>> E.g. with
>>
>> | CC = ccache arm-linux-gnueabi-gcc -march=armv7ve ... --sysroot=...
>>
>> configure will warn
>>
>> | your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options
>>
>> and messes up CFLAGS completely so that 'arm-linux-gnuebi-gcc' becomes
>> part of it :(
>>
> ncurses isn't the first recipe we've had to patch over this...

ncurses is ugly because it uses its own private version of autoconf.  We
will have to patch a lot of (compiled) 'configure' scripts, or (which I
prefer) create a local wrapper script for $CC.

I wrote an upstream bug report ([1]), but it probably has to go through
moderation first and is not visible yet.



Enrico

Footnotes: 
[1]  https://lists.gnu.org/archive/html/bug-ncurses/

