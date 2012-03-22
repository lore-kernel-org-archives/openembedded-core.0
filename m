Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAavr-0007U8-Lm
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 06:51:31 +0100
Received: by lagw12 with SMTP id w12so1390124lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 22:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=2cnUftxhVEPWjMBtNYQFIhm+RyKmv58d4JcQUb1SQM4=;
	b=HS8G66rk5U0MdHBjNbKAZfGXu4wQCfkS7Oi4kKsWWKQNZx2TbjqQR1YG0n3NX9RaIa
	PO5UH7kZ0I+pbwxKxWIDc+eTtHOlY02w8tJ+YcHkVjHasb8rbO/WkM9e/jpbhLNK7y/b
	NiFZTV5EmVYiGHQtl7J8qMvJRmn+ixIIDsR+88NyGU/LaLDi5rhtjl6PSGpBwoO6sApJ
	RSpQKMQe9wXrFYwtNboWvPhopkH4EaxteXKqkOxRJT6v59C0BgyDI0v2kv8eko3my4Hh
	wIN0cuK7LOPDMw6SWUtnB03+7PCWKx4V0yaVsYuuYEwMJH1MjqD2MNrdYi/mU87apaGM
	wzVA==
Received: by 10.152.102.145 with SMTP id fo17mr4820433lab.2.1332394956923;
	Wed, 21 Mar 2012 22:42:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Wed, 21 Mar 2012 22:42:06 -0700 (PDT)
In-Reply-To: <CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Mar 2012 22:42:06 -0700
Message-ID: <CAMKF1spWEBuDOsT7_nKwd-8SizYZZinWqojDE-An3hdBqvks2g@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 05:51:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 10:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Mar 21, 2012 at 9:55 PM, Kamble, Nitin A
> <nitin.a.kamble@intel.com> wrote:
>>> On Wed, Mar 21, 2012 at 6:58 PM, Kamble, Nitin A
>>> <nitin.a.kamble@intel.com> wrote:
>>> > Actually we noticed that Eric=E2=80=99s working sdk gdb was getting l=
inked
>>> with the
>>> > host libpython.so, And if it is linked with the sdk libpython.so then
>>> he is
>>> > able to see same issue what I am seeing.
>>> >
>>> > So look like issue is in the generated libpython.so.
>>> >
>>> > And in failing case, somehow ldd is not reporting that sdk gdb is
>>> > dynamically linked with libpython.so. That is also strange.
>>> >
>>>
>>> OK can you generate the gdb core and post it. I can debug whats causing
>>> it.
>>>
>>
>> Khem,
>> Thanks for helping out. I also have uploaded the core file here: http://=
min.us/mbii28QmkZ
>
> ok also try setting MALLOC_CHECK_=3D2 in environment and run gdb again
> this should dump the core
> I dont have gdb handy right now its building

just for test try to move
sysroots/x86_64-pokysdk-linux/usr/lib/python2.7/lib-dynload/readline.so
out of way and retry see if this works ?


