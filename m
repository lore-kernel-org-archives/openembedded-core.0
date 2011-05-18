Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMlCv-0006zx-Jg
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 20:10:53 +0200
Received: by eye27 with SMTP id 27so554994eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 11:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Y3VQDkIZXulASqLmx7jrXjvfRwMK9pPdv7RqQf4dA+w=;
	b=PLh/3RAiuSBfXqz5MbxFolXggiC2U7hB4Ilv7EXuw11VuIWOD8lrNEwzgc71Brk84k
	Uuyz7HW9Ivy17GMtqUcu8HpOvviSVPXiQhYIEirjMWxek/06Dju3mdZFTPzundgyb9uL
	rLLiO/WR/ILUcRTpBvbKjKlXdcgsIyilQ1t8Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=pp6fS5MuxqY7cUuOa6ThTqkb03DrY55LvBgHefpZ//eQ/DXdz66r1k06GD8R/cAk33
	TjcxR1RXKylegLPtcttwfyMuTt5XbYetrA6FFrUfXexZdXvz2ulW5psXDVLxlUI4Uq/3
	2wDnMIbiFYfxBZXZ57piGkFtXlw53C2PM7plk=
Received: by 10.14.7.198 with SMTP id 46mr819993eep.108.1305742078167; Wed, 18
	May 2011 11:07:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Wed, 18 May 2011 11:07:28 -0700 (PDT)
In-Reply-To: <BANLkTinvqEeyXsiH79UHb3Zhx+qkXZRJ5w@mail.gmail.com>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
	<1305734038.18415.108.camel@lenovo.internal.reciva.com>
	<BANLkTikiNW0UEfLM_UtKeekTcrW5UNNfUA@mail.gmail.com>
	<1305738527.18415.126.camel@lenovo.internal.reciva.com>
	<8A91C5F6-313A-4A0F-A18E-094CFC3BB337@dominion.thruhere.net>
	<BANLkTinvqEeyXsiH79UHb3Zhx+qkXZRJ5w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 May 2011 11:07:28 -0700
Message-ID: <BANLkTinwdO5XBGH=py2iw0kyJt6o77q7rw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Wed, 18 May 2011 18:10:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2011 at 10:52 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello,
>
> On Wed, May 18, 2011 at 7:29 PM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>>
>> Op 18 mei 2011, om 19:08 heeft Phil Blundell het volgende geschreven:
>>
>>> On Wed, 2011-05-18 at 09:40 -0700, Khem Raj wrote:
>>>> Problem I have is, I dont want udev in RDEPENDS which is added by
>>>> task-core-boot
>>>> and task-core-boot is added to DISTRO_EXTRA_RDEPENDS through
>>>> default-distrovars.inc -> defaultsetup.conf -> bitbake.conf
>>>>
>>>> and my distro adds DISTRO_EXTRA_RDEPENDS to its RDEPENDS
>>>> as I think the variable is meant for distro's to define some extra
>>>> stuff if needed.
>>>>
>>>> How should I solve this problem ?
>>>
>>> Well, what I did in micro-base-image was simply to not use
>>> task-core-boot at all. =C2=A0But in your case I was thinking that you c=
ould
>>> overlay that recipe with from your distro's layer and make it do
>>> whatever you wanted.
>>
>> The fact that we have layers does not mean we need to follow the silo me=
ntality you seem to prefer. If task-base in oe-core stops being usefull we =
should fix it, now play around in our own little sandboxes.
>>
> If task-base is getting less useful, removing it altogether (I found
> the =C2=A0reasons mentioned by Phil convincing) =C2=A0should be at least
> considered as an alternative.
>
> I am not sure why we should keep task-base as something generic --all
> distro's have their own specific requirements and configurations, even
> for task-base, so why not move this functionality into the distro and
> out of oe-core?
>
> I never quite saw what task-base gained us on a netto basis, but I
> think I am biased towards small tweaked images, so these are just my
> two cents.
>

there are certain common parts that can be abstracted
and can be maintained in oe-core so everyone benefits
from it and certain image specific parts can be done in
distros. So keeping common parts in core would still
be better IMO

> Regards,
> --
> Leon
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


