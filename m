Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVt4V-0002Kg-1U
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:56:11 +0100
Received: by lagj5 with SMTP id j5so479099lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=1gtFVfL/ytStqgtIJMsxwrPbAuAHF/QA9cps0l8kG2Q=;
	b=cuHURst6ebLvvDqxkITZmuUWEhwHCXUYNL5OO+jzrZUbbd0kMWUak6VjYqLOTBriTS
	5Tu94G0UZm4VarAN3w2HGoHbwjEdMBrkUMZ8zdLmSO/z4gWykEaetSz4myBj2UjTAsnv
	9ZZp3H16RNcoI+ezPDREuhc/mWDEieutRjCxI=
Received: by 10.152.104.20 with SMTP id ga20mr2900689lab.13.1322693367318;
	Wed, 30 Nov 2011 14:49:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 30 Nov 2011 14:48:56 -0800 (PST)
In-Reply-To: <4ED6B025.1060705@linux.intel.com>
References: <cover.1322689519.git.darren@dvhart.com>
	<e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
	<6e118d2846f5606561b4ae1f3c3ae93fd69bc360.1322689519.git.darren@dvhart.com>
	<CAMKF1sotPRfvMtbMYRBCtqpAj7CfYMzOzh1EORaOtBajzywwkA@mail.gmail.com>
	<4ED6B025.1060705@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2011 14:48:56 -0800
Message-ID: <CAMKF1sojotYjyRDVaVu0poUDRpTYMhA_9sX7sNvLQW7n-bL5Uw@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] autotools.bbclass: Report the missing configure path
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
X-List-Received-Date: Wed, 30 Nov 2011 22:56:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal "no configur=
e script found"
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal "no configur=
e script found at $cfgscript"
>>
>> why not just do one line change something like
>>
>> bbfatal "configure script ${S}/configure not found"
>
> I prefer to use a variable when I need a value more than once. It avoids
> future bugs where one is changed and the others were missed. As this
> string is used 4 times, it seemed like the right call.

ok with variable still the cfgscript itself is the script and the
message "no configure script found at $cfgscript"
seems like $cfgscript is a location. you may want to make it
"$cfgscript configure script not found" or something


