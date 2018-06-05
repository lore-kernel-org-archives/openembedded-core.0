Return-Path: <cjp256@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id AA5196010D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 14:39:56 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id t6-v6so3615359iob.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=oVyG7YVJc0wP8OAX/9+0zDkLX+inDWRL07h7DZxR/eU=;
	b=QzbnB2glv/hTvtNz/oyFVDe7wYRI8CrF15AapevHws0dnRpOYaS9OT3oqQONY0fyay
	PU+1OOqhysYRgRYjLds4JAhs84G1qWplOH5n507MZd1WeXnEkF6DvS+A1Gnx/j5JFG6i
	jvZdvokLizRMa6YTA77bJXIYVQvWNzr9/rgQgqjYo15diSO4RCjwuUBTAR+DtOdvV5fi
	Mzm4pYyvH31Ze26BYO79EfYoJPH9KnIuGF4W1mWqYYghhIjPL8cSB91k0LSBlvFibQza
	WowBHKLDNlsRAUdU9IG2N6Yk4npzSWaVvRvyrz9Pp2zH+1KWa2n7aMX7+3iXLnrB7DDD
	PwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=oVyG7YVJc0wP8OAX/9+0zDkLX+inDWRL07h7DZxR/eU=;
	b=XKQ61zag6HXzfUscWe02INC35spmsPAapArWPwOwifpB4iviwJUnUwRofChkAUvvlE
	tlq003UCbo4v2+5kNCt6nubPwVrRpISWEe7W5CWAY6WxxswIx0nT1wXWWvaJvaNgIiV4
	vIiSkFZlPpmCOW9FOizB9+xOOVjNboTEigZBsBx4LwpfUIDBltrruPfnzlLp5TuhIlaf
	ikMxgP7ZjH18CfSHsVfrks9wbEdsGceXu/DSuRiwPrRJqnjQcAokW94OiWI7KuwbdslU
	qKuqVR7DTrtvRuR04M1P/hS8mo2ocPcR1dt8bQeqdYGi9MRxPEzky5/2T0LFQ8gmIss6
	ZRdg==
X-Gm-Message-State: APt69E3g5WY3Rr0OPKx3mj3Go2ardJ+MkBmawLZ1xFChynGK4pfWQAfO
	rWBfGZI1GmKeB4SHQXoh7f2doffmlxY5gCWWqUmwFQ==
X-Google-Smtp-Source: ADUXVKKpMVyA5r79Awnv8FBJ7OMgtNigcp650QaAlj6DNxeZFTvcGIZ58KnLqUmSzF0OM3PwuHCxOcKQO+1bhL48CAE=
X-Received: by 2002:a6b:ab01:: with SMTP id
	u1-v6mr25471934ioe.214.1528209597405; 
	Tue, 05 Jun 2018 07:39:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:7111:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 07:39:36 -0700 (PDT)
In-Reply-To: <CABZSBQeejuzPgb1LjjtqSvObDdC59nsHaB3FMsFmpQFoO+bvtA@mail.gmail.com>
References: <1526063923-32176-1-git-send-email-cjp256@gmail.com>
	<CABZSBQeejuzPgb1LjjtqSvObDdC59nsHaB3FMsFmpQFoO+bvtA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
Date: Tue, 5 Jun 2018 10:39:36 -0400
Message-ID: <CABZSBQfe_Enb6Vnn_O0+mr5QiVq6LnLwo1BevQSu7dNa=xwDEA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] strongswan: package up sbin debug files
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
X-List-Received-Date: Tue, 05 Jun 2018 14:39:56 -0000
Content-Type: text/plain; charset="UTF-8"

(after looking at it again, I realize I misfired on the prefix tag and
maintainer CC - will resend)

On Tue, Jun 5, 2018 at 10:35 AM, Chris Patterson <cjp256@gmail.com> wrote:
> ping :)
>
> On Fri, May 11, 2018 at 2:38 PM, Chris Patterson <cjp256@gmail.com> wrote:
>> From: Chris Patterson <pattersonc@ainfosec.com>
>>
>> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
>> ---
>>  meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
>> index f2fe1f1..5cae6ac 100644
>> --- a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
>> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
>> @@ -46,7 +46,7 @@ inherit autotools systemd pkgconfig
>>  RRECOMMENDS_${PN} = "kernel-module-ipsec"
>>
>>  FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
>> -FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
>> +FILES_${PN}-dbg += "${bindir}/.debug ${sbindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
>>  FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la"
>>  FILES_${PN}-staticdev += "${libdir}/ipsec/*.a"
>>
>> --
>> 2.1.4
>>

