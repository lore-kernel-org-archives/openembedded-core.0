Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHL0g-0005a7-73
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 21:11:50 +0200
Received: by eye27 with SMTP id 27so127477eye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 12:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Xjbqh+LXxpMaX0RcXZxoPHublgmST9uSfjkEZuxCzAY=;
	b=iQXqBniTZshY534qBqeoUYSGPhaCOqrfUmmI4QPUFRGrhsLI7CBXEp5EofdgVfD+Zz
	MNTELBVjkb0P2BagzMhNeDmfI1FINmSH4uP9fldQDy1muNzvilVvdsgxtOMYK/kV8EVy
	zNQPt6DKL8BJNLiSPQ8nn9LEW/ZeXJ8SRDsak=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=j5C8FWoCN1oHC1mhFn+iJSMb5ew71kzf1yZWK3w9hJPnT0sqfOjkkEdq9YGV4Hui+c
	FI31DqGvTvZCb6NIlWMctlcVud0IfXyZOfFtrRQHP9Cq2L2Vl2JqcZC+dNKJS2Ee/8Gq
	6EmJRLPYuVwCylT2IqHRRoaOMsa0xCfEfYey0=
Received: by 10.14.4.32 with SMTP id 32mr100866eei.141.1304449751112; Tue, 03
	May 2011 12:09:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Tue, 3 May 2011 12:08:41 -0700 (PDT)
In-Reply-To: <4DC04CCA.2030100@intel.com>
References: <BANLkTi=f-GL8RbJLCAikFTtkON5C9NDvDw@mail.gmail.com>
	<4DBF4F26.90404@intel.com>
	<BANLkTimUw9+kWHwdw5dZ0=kUZuNSsorsdA@mail.gmail.com>
	<4DC03C43.8080507@windriver.com> <4DC04CCA.2030100@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 May 2011 12:08:41 -0700
Message-ID: <BANLkTikmGcS4hJY0+vmo-sGTTurFbY6HuQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu segfaulting when booting ext3 image
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
X-List-Received-Date: Tue, 03 May 2011 19:11:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 3, 2011 at 11:43 AM, Scott Garman <scott.a.garman@intel.com> wr=
ote:
> On 05/03/2011 10:32 AM, Mark Hatle wrote:
>>
>> On 5/3/11 12:27 PM, Khem Raj wrote:
>>>
>>> On Mon, May 2, 2011 at 5:41 PM, Zhai, Edwin<edwin.zhai@intel.com> =C2=
=A0wrote:
>>>>
>>>> Did you installed Nvidia proprietary driver? Any error mesg from the
>>>> runqemu
>>>> script?
>>>
>>> yes I did and I think that could be a culprit but then why would it
>>> work with nfs boot.
>>> there is no useful message from script it just collapses
>>
>> The script tries to detect the nvidia drivers. =C2=A0If it finds them is
>> supposed to
>> issue a warning. =C2=A0Sounds like your system might not have a version =
that it
>> knows
>> how to detect.
>
> The Nvidia libGL bug caused a segfault in qemu when booting images, so it
> should be pretty obvious if that's what's causing it.
>
> Given that Khem is booting the nfs version successfully, and not seeing a=
ny
> error message, I think this might be a new error.
>

the host system is 64-bit kubuntu 11.04 with nvidia proprietary
drivers. IIRC it worked fine without them but that was a month back.


> Scott
>
> --
> Scott Garman
> Embedded Linux Engineer - Yocto Project
> Intel Open Source Technology Center
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


