Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QU0c3-0007hi-Of
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 20:02:47 +0200
Received: by wye20 with SMTP id 20so4318907wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=lstVQp71UiuwF0LmmWbeHcBGkfPBPfu11eL3ZlpM4yk=;
	b=gd6PSJQsxejZPZUPqYXjbVoZflD82oUqj3ASPMHRYSZclR1GDfYMoJUC2PbNkxr304
	dbuRl79BR077yUMJqtQdczLJMGczceWClIwIZ4oWQczadTHL87Dq41U+jRcihBu+JBgY
	G5RcSVcK+UmMAipwoJENmncoeftBJWFHsdvW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=X/6sjnmzerrlm7ROXHwD1Y53W+Avr/ls9iZlA/qIKHNthMijPvunLEHZcjEwppE9sJ
	dhq4gv8sGGSjVGQ9pXl3JUExcVwADXAfLPOpGMvZe22eLvVSQjxJYaZHaG6HU3VuexX+
	dyjhI/YnNAF9Gt7ZvodtvNlm7ta2cNfRsm7mU=
Received: by 10.216.30.206 with SMTP id k56mr4183203wea.29.1307469570062; Tue,
	07 Jun 2011 10:59:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.28.19 with HTTP; Tue, 7 Jun 2011 10:59:00 -0700 (PDT)
In-Reply-To: <78A72393-6EF4-4508-AD33-AB232EFF50F4@dominion.thruhere.net>
References: <1307102133.2529.260.camel@phil-desktop>
	<1307439362.2529.4741.camel@phil-desktop>
	<BANLkTim4y6zp6nMOhNNhfxmZPdYuWjOimA@mail.gmail.com>
	<78A72393-6EF4-4508-AD33-AB232EFF50F4@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jun 2011 10:59:00 -0700
Message-ID: <BANLkTinAdoGGCgJ6ZP=aHNz3C=EcWHWMyw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Tue, 07 Jun 2011 18:02:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 7, 2011 at 10:48 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 7 jun 2011, om 19:43 heeft Khem Raj het volgende geschreven:
>
>> On Tue, Jun 7, 2011 at 2:36 AM, Phil Blundell <pb@pbcl.net> wrote:
>>> Ping?
>>
>> Both changes are fine.
>>
>> change from being machine specific is futuristic it will not work for
>> all architectures that
>> uclibc supports but is sufficient for what we support/use in oe for now.
>
> If uclibc is *really* machine specific then everything that links against it should be machine specific as well. Since, as you say, the current configs are rather generic we should make that clear by making uclibc stop pretending to be machine specific.
>

intention is to break that machine dependency if any. Since it used
kconfig like kernel

many things like tune options and some workarounds creeped in, uclibc
is intended to be made
clear of those and be machine independent thats why I am ok with this patch

> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


