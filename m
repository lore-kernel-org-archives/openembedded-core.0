Return-Path: <Matthew.Zeng@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B400661624
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:05:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01LH5jnA029263
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 21 Feb 2020 09:05:45 -0800 (PST)
Received: from mzeng (128.224.141.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 21 Feb 2020 09:05:45 -0800
References: <1582255767-74523-1-git-send-email-anuj.mittal@intel.com>
	<80d58477f0a13b2218d351c61f9ca7d54491b8ac.camel@linuxfoundation.org>
	<CAO5Uq5TgKyVMx205U65bUg=UU9q8uf=7TVtJAcpyOB1cg9f9cQ@mail.gmail.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
In-Reply-To: <CAO5Uq5TgKyVMx205U65bUg=UU9q8uf=7TVtJAcpyOB1cg9f9cQ@mail.gmail.com>
Date: Fri, 21 Feb 2020 12:05:55 -0500
Message-ID: <874kvjdg5o.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.141.67]
Subject: Re: [zeus][PATCH] openssh: backport patch to fix "cert not yet valid" test
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
X-List-Received-Date: Fri, 21 Feb 2020 17:05:45 -0000
Content-Type: text/plain


Alex Kiernan <alex.kiernan@gmail.com> writes:

> On Fri, Feb 21, 2020 at 11:28 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Fri, 2020-02-21 at 11:29 +0800, Anuj Mittal wrote:
>> > Fixes [YOCTO #13796]
>> >
>> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>
>> Is this issue already addressed in master (maybe through upgrade)?
>>
>
> We already had that patch in master which I dropped that patch as part
> of the move to 8.2p1 (was
> 0001-Manually-applied-upstream-fix-for-openssh-test.patch)

Right, there was an upgrade to 8.2p1. We can do the same for zeus.

>
> --
> Alex Kiernan


--
Mingde (Matthew) Zeng

