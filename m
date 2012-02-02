Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RspoO-0003Q6-E3
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 07:06:25 +0100
Received: by daln34 with SMTP id n34so327686dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 21:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=eEQVKsGsxYr+hJ0hJHVepa0BNLuv1r7Jo9pyTNbOBqQ=;
	b=FmI9AY1VY2ZoDzaCqtCd7SHUsnUb3H0IILBKt5C8OLJ+874na+aXHabfgA4vJjrzaA
	ExVbEIJPQLIEZhRn+fCyp+EtxgTE9rMrYvkNVjg4Winn0av81+KJ8heM/2hvXcq9DWB1
	Jvdk/2qe4voFjmSvFQ1cadtUs41OhXKgDnbvM=
MIME-Version: 1.0
Received: by 10.68.218.5 with SMTP id pc5mr4738237pbc.101.1328162307201; Wed,
	01 Feb 2012 21:58:27 -0800 (PST)
Received: by 10.142.113.20 with HTTP; Wed, 1 Feb 2012 21:58:27 -0800 (PST)
In-Reply-To: <CAMKF1sp=xQVj6ujdnTXKLE9NSivwmZpWXxwmLQBsNSvw77TQPA@mail.gmail.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
	<6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
	<5c0971fd58af250c14b7eeaa3206e1b8c5bff840.1328133261.git.nitin.a.kamble@intel.com>
	<CAMKF1spB8Sji8p5ZY-czfLn44axDKNYUxgkb7PA2D-rNmVTfZw@mail.gmail.com>
	<CADkTA4P4_=Sge32w4UrP+CM5n5wvoV_G_5LcoZiWGPbNdYd-pg@mail.gmail.com>
	<CAMKF1sp=xQVj6ujdnTXKLE9NSivwmZpWXxwmLQBsNSvw77TQPA@mail.gmail.com>
Date: Thu, 2 Feb 2012 00:58:27 -0500
Message-ID: <CADkTA4Pb4vKhfN4dSXUf6y-P7_R140VSZ=ERSxx2Eb9XjOcxeQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] linux-libc-headers: new recipes for latest upstream 3.2.2
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
X-List-Received-Date: Thu, 02 Feb 2012 06:06:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 2, 2012 at 12:14 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Feb 1, 2012 at 5:01 PM, Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
>> On Wed, Feb 1, 2012 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Wed, Feb 1, 2012 at 1:55 PM, =A0<nitin.a.kamble@intel.com> wrote:
>>>> +SRC_URI +=3D " file://connector-msg-size-fix.patch"
>>>
>>> I happen to peek into this patch. It seems this patch should not be app=
lied
>>> since its specific to a wrs kernel and linux-yocto does not apply this =
patch
>>> as well.
>>
>> The latter is true (this isn't applied to linux-yocto), but the former
>> isn't quite true.
>> It was required in 2.6.34, where we used the Wind River kernel
>> directly. It wasn't
>> specific to the Wind River kernel, it was associated with the kernel ver=
sion.
>>
>
> in nutshell it can be dropped now. Right =A0?

There's no longer any 2.6.34 and no mismatch to fix up .. so from everythin=
g I
know about this patch, it can go now.

Bruce

>
>> Cheers,
>>
>> Bruce
>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
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



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


