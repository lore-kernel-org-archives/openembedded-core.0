Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFBAH-0007na-7h
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 22:16:49 +0200
Received: by ewy5 with SMTP id 5so649222ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2011 13:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=h/o+WlNeri7BoGARojM37R9yByWUHNfJmw5sDltxN8Y=;
	b=Sju6VdqZ1iuCL9HfmUeH4S61Z9saZdqtfiMn5SpAEWgHeC1NQTKzMEVge/9AawTv4z
	AQR2jhvxKl2RCNHES36syxyPKYWyu1Pc21UDHdBIcFJvb+bHXRAqEyXyJp3Yza8c5LnH
	2GbhcuyPf5JrZO6dStSbaxZbA2Rd7co4GMWKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=FVcOVCfTfnB5ojV4qAG8zVIu6ovWd86yahVOl8L6lJU5dkUSMS24hsUJfrptCepQsC
	HoGG0dlMWKVTDLs/l7w5c6hMgBHlMDnpA44WKSDH7BrHVsRDy4Xw/5xjxizx4OBkGViy
	5LaOK/oGlHr3B2ZLM3QXvVuQENe4EriQVQH8M=
Received: by 10.14.52.132 with SMTP id e4mr1249407eec.173.1303935258253; Wed,
	27 Apr 2011 13:14:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Wed, 27 Apr 2011 13:13:48 -0700 (PDT)
In-Reply-To: <B7450533-1402-4465-A3C8-6CFF10BF4A82@dominion.thruhere.net>
References: <BANLkTimY=T0BNMLWm+Ez9N1ug+_XOdaGpg@mail.gmail.com>
	<B7450533-1402-4465-A3C8-6CFF10BF4A82@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Apr 2011 13:13:48 -0700
Message-ID: <BANLkTikjpjVK40B4OO6a4BqB3ys_7hxbmA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: eglibc 2.13 upgrade
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
X-List-Received-Date: Wed, 27 Apr 2011 20:16:49 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 27, 2011 at 9:44 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Why not move those srcrevs into the recipe? IIRC these ones aren't affected by RPs concerns

I am ok doing that but here
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-April/001536.html

it seems we still need to investigate it before we start moving
SRCREVs to recipes.

>
> Op 27 apr. 2011 om 18:21 heeft Khem Raj <raj.khem@gmail.com> het volgende geschreven:
>
>> Hi
>>
>> I have eglibc 2.13 upgrade done locally and has been building fine for
>> all architectures. I have added 2.13 recipes and not
>> deleted the 2.12, This works ok except when setting the SRCREV. Since
>> we have a single file called
>> conf/distro/include/poky-default-revisions.inc to store this
>> information there can not be two SRCREV for two versions of same
>> package unless we move them to
>> recipes which is under work but not yet done. Thats one reason to hold
>> these patches. I can propose them if we are ok with
>> removing 2.12 recipes then it becomes straight forward
>>
>> Opinions ?
>>
>> -Khem
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


