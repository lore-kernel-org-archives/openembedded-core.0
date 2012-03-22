Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAneE-00050l-5b
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 20:26:10 +0100
Received: by lagw12 with SMTP id w12so1913868lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FDReiRtBnfKQLnGiOVOToNRdo4JYRIaBmBwF650BIPo=;
	b=RZV+Fon66HIbEBR5x9n255s/DTIXBoKlXoLoxObWo81IpE3/HtxkKkrJtwovdRrjdV
	6y9+IKUsh+/fU9BOeBu47+7haQWQrq8n8F1SGdvmfgVvhx4ugmMC4cYaB0xn3cVpaPQk
	WTnufC/akj1TaSLhjIiK+KXTdtsiRZgTuZn6HZLIqwT/6HEhJH9tRRgAN05BIfrhZM9W
	zw32Chz2EGQcVa2SgxdvIdeCps5t7sIMWmWexsAUsCvuGXfM26XVeehGqmjwfn48jMrL
	lv0H7RwBikRowEpB/ayx6b98O3Gc6nBvX69bk8J62mu2Bm0nmOjDSTE0WL6lV+aU5tAV
	EwSA==
Received: by 10.152.127.136 with SMTP id ng8mr6735117lab.16.1332443834897;
	Thu, 22 Mar 2012 12:17:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Thu, 22 Mar 2012 12:16:44 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0137BEEB@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
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
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
	<CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
	<20120322141455.644058f0@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srd0KanO6NfQtm0U39GZS_ANsu9KdRR0hirpKQrhMCxzg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BEEB@ORSMSX106.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2012 12:16:44 -0700
Message-ID: <CAMKF1sr=PedPsmpPSGC42Wvof9fHbR26JM2hgEZjA3h621ynxA@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2012 19:26:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 22, 2012 at 10:38 AM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>> On Thu, Mar 22, 2012 at 9:20 AM, Kamble, Nitin A
>> <nitin.a.kamble@intel.com> wrote:
>> >
>> > Renaming the sdk python2.7/lib-dynload/readline.so to python2.7/lib-
>> dynload/readline_d.so gets the sdk gdb working for me too.
>> > So is this a workaround or solution to the problem? If it is a
>> workaround what should be right solution?
>>
>> I think we should be generating these _d.so files during python-native
>> build. So please look into why its not happening. I wont have much
>> chance
>> during the day to look at that
>
> Looks like we need this patch for the python recipe to generate debug modules:
> http://patch-tracker.debian.org/patch/series/view/python2.7/2.7.2-8/debug-build.diff

yep thats the one. Apply it to python and rebuild python-native and
stage it then see if that helps. You might have to adjust the FILES
and PACKAGES to put the new files in right places.


