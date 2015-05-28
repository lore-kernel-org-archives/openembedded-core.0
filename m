Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACA17568E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 04:55:48 +0000 (UTC)
Received: by iepj10 with SMTP id j10so29844498iep.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=H32DNvtIjMESbO5Jz8tZt17n/9FQh0Z9WYo9aL/DJLk=;
	b=ldRJG+leI2hs33BJuphEBWlmOQot1A8TD35Ybg5Pw6bWcAn62/zga1yccMAJmOTghb
	xv1XiHJnoFNf5iuXidL8THgg/jjVb+gQyM8C9sMsR0FcrcnTvXXS+ixAA3Roy67k1Ub6
	ceVCOKTlMO1ZmcjrguUIdARiA4HKCd01sY0M3qKCSIOfsAG1uj5HXeZHUCcSrQw3QPZw
	0BoKPpN713YFJGDFvFp1rD1UsW5Lh0ggcYJCLtuBRf6Z8UFd+QxcDFAKXfEYt3FvfRLE
	7g+AHv/cWm5Hy1rNbHrBi3UTeu/vcpNon+d5Jru3bscEm1pE8JMGq6zw2P/3nEOlsYlQ
	CvqQ==
X-Received: by 10.107.8.40 with SMTP id 40mr1145161ioi.38.1432788949348; Wed,
	27 May 2015 21:55:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Wed, 27 May 2015 21:55:18 -0700 (PDT)
In-Reply-To: <2981463.2asXSZhTDk@peggleto-mobl.ger.corp.intel.com>
References: <cover.1427186518.git.Qi.Chen@windriver.com>
	<5564081E.1050401@windriver.com>
	<2981463.2asXSZhTDk@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 May 2015 21:55:18 -0700
Message-ID: <CAMKF1soUQf-mTLfAMDDDh=_vMDss6qu5UVF9QUK=BDOSod7jKQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Randy Witt <randy.e.witt@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Support persistent /var/log
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
X-List-Received-Date: Thu, 28 May 2015 04:55:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 26, 2015 at 2:15 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Randy, Khem, Otavio - this area was the subject of a discussion involving you
> around the 1.8 release, if you could review this set and comment that would be
> great.


Looked at it but it didnt sound like it considered read only rootfs case at all.

>
> Thanks,
> Paul
>
> On Tuesday 26 May 2015 13:43:58 ChenQi wrote:
>> ping ....
>>
>> *ANY* comment would be welcome, really ...
>>
>> Thanks,
>> Chen Qi
>>
>> On 03/24/2015 04:42 PM, Chen Qi wrote:
>> > The following changes since commit
> d3fcfe346b3472170641d9194243c4bbe06b8585:
>> >    systemd: fix firmware path to match linux-firmware (2015-03-23 11:27:13
>> >    +0000)>
>> > are available in the git repository at:
>> >    git://git.openembedded.org/openembedded-core-contrib
>> >    ChenQi/persistent-var-log
>> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h
>> >    =ChenQi/persistent-var-log>
>> > Chen Qi (4):
>> >    bitbake.conf: add VOLATILE_LOG_DIR variable
>> >    base-files: respect VOLATILE_LOG_DIR
>> >    initscripts: support persistent /var/log
>> >    package.bbclass: support persistent /var/log
>> >
>> >   meta/classes/package.bbclass                       |  2 +-
>> >   meta/conf/bitbake.conf                             |  4 ++
>> >   meta/files/fs-perms-persistent-log.txt             | 66
>> >   ++++++++++++++++++++++
>> >   meta/recipes-core/base-files/base-files_3.0.14.bb  |  4 +-
>> >   .../initscripts/initscripts-1.0/volatiles          |  1 -
>> >   meta/recipes-core/initscripts/initscripts_1.0.bb   |  3 +
>> >   6 files changed, 76 insertions(+), 4 deletions(-)
>> >   create mode 100644 meta/files/fs-perms-persistent-log.txt
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

