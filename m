Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAicN-0001cF-PP
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 15:03:55 +0100
Received: by lagw12 with SMTP id w12so1650448lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 06:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=a/ZgCwJjh8ZlV8ydHx14/1KKj9xPnLjXNaAot5CZdj8=;
	b=gF62R97qln8f5rLnNYlXYDw5Mh8vQaeztY0m1QBUS2uAytZxgu3rt7gtKxTWy2lLwp
	2rDAsKUIcJm60jCwQSKtELqouMCGu4Deq2xQdMTLQHiTSsuc95oFIo7pJSOUlwfuAwxE
	xowAXXta3KzPkkMsh3cjaRWypgO2a/JA7RfWr3gGe9q3n2+B2RBcdUzTyfLwfiATzGZb
	UJOE+H3iSHrWo8unC/r8opflAVEQKpI2MiqKqhpkTETj19MMuPIMBkFifRtMZfO/By0h
	oD5gnWbOTEQt7FiqnthP1r0Hsml1MYct2zM/wN6Dt7YcgBiHp5zz/qMHA5wlf4QU79r6
	6bEg==
Received: by 10.112.84.42 with SMTP id v10mr2980398lby.50.1332424500591; Thu,
	22 Mar 2012 06:55:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Thu, 22 Mar 2012 06:54:29 -0700 (PDT)
In-Reply-To: <20120322143427.3d54b5bd@eb-e6520>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
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
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
	<CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
	<20120322141455.644058f0@eb-e6520> <20120322143427.3d54b5bd@eb-e6520>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2012 06:54:29 -0700
Message-ID: <CAMKF1sqQ7O1DOKDDwU99ZmKvv=n=MMrPOPoYNG294xOuOtAnHQ@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Cc: Jansa Martin <martin.jansa@gmail.com>,
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
X-List-Received-Date: Thu, 22 Mar 2012 14:03:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 6:34 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
>
> Le Thu, 22 Mar 2012 14:14:55 +0100,
> Eric B=C3=A9nard <eric@eukrea.com> a =C3=A9crit :
>> [ebenard@eb-e6520 lib-dynload]$ sudo mv readline.so readline_d.so
>> [ebenard@eb-e6520 lib-dynload]$ arm-oe-linux-gnueabi-gdb
>> GNU gdb (GDB) 7.4
>> Copyright (C) 2012 Free Software Foundation, Inc.
>> License GPLv3+: GNU GPL version 3 or later
>> <http://gnu.org/licenses/gpl.html> This is free software: you are free
>> to change and redistribute it. There is NO WARRANTY, to the extent
>> permitted by law. =C2=A0Type "show copying" and "show warranty" for deta=
ils.
>> This GDB was configured as "--host=3Dx86_64-oesdk-linux
>> --target=3Darm-oe-linux-gnueabi". For bug reporting instructions, please
>> see: <http://www.gnu.org/software/gdb/bugs/>.
>> (gdb) quit
>>
> please note that cp readline.so readline_d.so didn't work, I had to
> do mv readline.so readline_d.so

yeah mv is ok in this case since it should be otherwise in the usr/debug di=
r
OK so I think the problem is this we are not generating *_d.so files
in python-native.
 when using python in gdb debug interpreter expects the _d.so files


>
> Eric
>


