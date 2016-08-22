Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id A3D0A607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 11:16:05 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7MBG36R022377
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:16:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1471864564;
	bh=7aGrRkMs0M5ecemL4TQgD9mhtQUfC7nn+D5DqcSazNo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=Y7fy+Aos9oTaZwX34YEPL0mKVfQf6nmmtn9IAY3KYlDN17jR+aUEbOjvvsG84xYIO
	B8MuYX8TtL0H22lcvMg76aKxUf9YJnmUM+tRVfA7HART+BSGDXup65nRubjuS9Hh5e
	NkjZGaG9eEheK44E4d+n3R9AeASawtv5tehRR73U=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7MBFlr7014564 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Mon, 22 Aug 2016 13:15:48 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 2D2CEAFC4B7;
	Mon, 22 Aug 2016 13:15:38 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7MBFj8u014561
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 22 Aug 2016 13:15:45 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1bbnCj-0005Ag-M1; Mon, 22 Aug 2016 13:15:45 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1471246474.git.hongxu.jia@windriver.com>
	<f2d0736dd176c21c4ef1d539a7e82dbfd1367f2a.1471246475.git.hongxu.jia@windriver.com>
	<ly1t1hjg44.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LY1L1zadYdw+AH=hVD6xu5r9sRap_G7+iALhf9q41Excw@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 22 Aug 2016 13:15:45 +0200
In-Reply-To: <CAJTo0LY1L1zadYdw+AH=hVD6xu5r9sRap_G7+iALhf9q41Excw@mail.gmail.com>
	(Ross Burton's message of "Mon, 22 Aug 2016 11:18:22 +0100")
Message-ID: <lywpj9hx5q.fsf_-_@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.0.95 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -1.9
X-Spam-Level: -
X-Spam-Tests: AWL, BAYES_50, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.78
Subject: sysroot flags in $CC (was: [PATCH 3/3] ncurses: upgrade to 6.0+20160625)
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
X-List-Received-Date: Mon, 22 Aug 2016 11:16:09 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

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
>
> I've long wondered about changing our abuse of CC to hold the sysroot,

I do not think, that this is such a big abuse.  There are no flags
where these options can/should be placed instead of.  CPPFLAGS would
work for automake projects but lot of other buildsystems do not know
this variable.

Writing them into CFLAGS (and CXXFLAGS and FFLAGS and ...) would still
require them in CPPFLAGS too (for 'gcc -E' cases).  They will appear
twice (CPPFLAGS + xFLAGS) in automake project which is not a big deal
but a little bit ugly.


Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz

