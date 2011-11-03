Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RM1Zr-0002lI-Vi
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 18:59:48 +0100
Received: by iafj26 with SMTP id j26so1654522iaf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 10:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=qMNH10Ouwq7AJYfiYl5vm0q/s3Dn28zAM4/jP5VJJ3c=;
	b=qEVmNqhXZl+VsU8x1aTr7+RhJIPHfJTTaGtVg4yPS2zu4pKlS7DRnXLs6BAFiGW+4P
	/8lGP7bA905YI6bpX6n1nNuHKo6FkkK/4lwKE25njLs7wdktPS2zVNdk2uX+8kFNRqWU
	0hegTqZLmZMpNbtexG6m6rP5bWGE2+jRh4iSE=
MIME-Version: 1.0
Received: by 10.42.157.135 with SMTP id d7mr9958892icx.19.1320342812456; Thu,
	03 Nov 2011 10:53:32 -0700 (PDT)
Received: by 10.142.231.12 with HTTP; Thu, 3 Nov 2011 10:53:32 -0700 (PDT)
In-Reply-To: <8B9E217B-2135-4E8D-9180-FAFD7E7478E0@dominion.thruhere.net>
References: <cover.1320340081.git.bruce.ashfield@windriver.com>
	<8B9E217B-2135-4E8D-9180-FAFD7E7478E0@dominion.thruhere.net>
Date: Thu, 3 Nov 2011 13:53:32 -0400
Message-ID: <CADkTA4PQspBbSFTVS9GZcGokvSR7zgyAqSq_kEE-EUqxpbfYQw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: dvhart@linux.intel.com, saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto: update base to v3.0.8 + meta config changes
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
X-List-Received-Date: Thu, 03 Nov 2011 17:59:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 3, 2011 at 1:22 PM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
>
> Op 3 nov. 2011, om 18:11 heeft Bruce Ashfield het volgende geschreven:
>
>> Richard/Saul,
>>
>> Here's a bump to 3.0.8 for the 3.0 kernel, and some config changes from =
TomZ.
>> These are destined for master and separate from any point updates to the=
 1.1
>> release.
>>
>> In case anyone cares my -dev kernel also has these changes, and it will =
take
>> them to the latest kernel shortly.
>>
>> This also doesn't bump the preempt-rt branches, since they'll be updated
>> to the new -rt first, before taking the 3.0.x stable updates.
>>
>> Built and booted for all the qemu targets.
>>
>> cc: Tom Zanussi <tom.zanussi@intel.com>
>> cc: Darren Hart <dvhart@linux.intel.com>
>>
>> Cheers,
>>
>> Bruce
>>
>> The following changes since commit 9b76e6a2cfc5a4d779f3b06e3acc5ff7b8275=
470:
>>
>> =A0meta: glib-2.0: don't apply qsort_r test removable patch for native v=
ersion (2011-11-02 09:08:28 +0000)
>>
>> are available in the git repository at:
>> =A0git://git.pokylinux.org/poky-contrib zedd/kernel
>> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel
>
> Do you also have a tree against oe-core?

I don't have a contrib branch, I asked a few week ago, but still don't have=
 it
created. So I have a tree, but no where to push submissions.

Bruce

>
>
>
> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk6yzdIACgkQMkyGM64RGpEQuQCffGS2j803QX+Ze5+EEwkAOils
> ES0An1cDdXsDcZw8vf79N172276ugIE8
> =3D7lU5
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


