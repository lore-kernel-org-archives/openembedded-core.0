Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRv0l-0000lN-8h
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 02:44:11 +0200
Received: by eaae1 with SMTP id e1so1715286eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 17:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=WHKNpzOA0hCWwNVCHQUrOLKTWfte7t7QK/hafeBzw14=;
	b=t5AEe8GopQ+HsPoRM2b/CwsQQmMnjeTQxUnxsnhQZ3rcHKyHXRAXUND7NAbR+75IjH
	vtmaP2Nz4B5AlbK4WI/ltcd2PlKGU3NHO+sm/08+RTdYfDRhVPVhdE6RauHTr5CaeTS3
	WhbQXnCvNcK0zZX9CtLBIAir6e9ZgmSG5J0FEXhQPkg30SuLwCLXqNLc29+MfKN0DYPf
	PEIgdqpaBYX1sU/z9CrPpIsnh7Sr7O/qCpjYwb9xBdR7j2AhuxxIqZOLud1idPOH7/aN
	aIriLS79a+Os9/swIHoNxvZv3lxui5IFxIQVmeitXg1ixT0E5UE8gVfBRZVxLIpvUZxM
	IPcg==
Received: by 10.14.149.129 with SMTP id x1mr3594284eej.108.1336523658937; Tue,
	08 May 2012 17:34:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Tue, 8 May 2012 17:33:48 -0700 (PDT)
In-Reply-To: <4FA9B12F.4040209@linux.intel.com>
References: <cover.1336015963.git.raj.khem@gmail.com>
	<4FA998F8.8060306@linux.intel.com>
	<CAMKF1srhrwcEks0rGssCXQdyEFa9wYX6zVp14qAKns7wLHeJVA@mail.gmail.com>
	<CAMKF1sr_KgMb+5fsrWhjvGh-BmKHyjMF4+25yBR0szeijLF9aQ@mail.gmail.com>
	<4FA9B12F.4040209@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 May 2012 17:33:48 -0700
Message-ID: <CAMKF1soByHB7DSKgSsH-ivFGt9MD-9stBQsjpDSa68yNJndr5w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Enable xserver-xorg for all qemumachines
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
X-List-Received-Date: Wed, 09 May 2012 00:44:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 8, 2012 at 4:50 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/08/2012 03:18 PM, Khem Raj wrote:
>>
>> On Tue, May 8, 2012 at 3:09 PM, Khem Raj<raj.khem@gmail.com> =C2=A0wrote=
:
>>>
>>> On Tue, May 8, 2012 at 3:06 PM, Saul Wold<sgw@linux.intel.com> =C2=A0wr=
ote:
>>>>>
>>>>>
>>>> Khem,
>>>>
>>>> Not sure what I am doing differently, but I am not getting the xserver
>>>> to
>>>> start on at least ppc and mips (two that I tried just now).
>>>>
>>>> Are you build a Yocto sato image or oe-core sato image?
>>>>
>>>> I get the following on a ppc:
>>>>
>>>> Fatal server error:
>>>> no screens found
>>>> xinit: giving up
>>>> xinit: unable to connect to X server: No such file or directory
>>>> xinit: server error
>>>>
>>>
>>> hmmm I have booted core-image-sato but I have bare OE-Core
>>> Do you have
>>>
>>>
>>>
>>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/=
qemu-xserver-xorg&id=3D8a60dabb7902b7be42d06cb735e96248e2e67dba
>>>
>>> is some layer on top changing it in some way ?
>>
>>
>> hmmm another think I have is this patch
>>
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/m=
isc&id=3D955dee621361e01627ebfde152f25873070cf301
>>
>> which deletes kdrive recipes. I did not propose it for inclusion yet
>> but I wonder if there is any mix and match happening when these
>> recipes are not deleted.
>> You can cherry-pick it and see if that helps.
>>
> So I found that task-core-x11.bb also sets XSERVER
>
> XSERVER ?=3D "xserver-kdrive-fbdev"
>
> And this was being picked up it seems when I did the build.
>
> I commented that line out and it worked correctly.
>
> That seems wrong, since I thought the ??=3D should not allow the ?=3D to
> override, or do I have it backwards?


I think that was the real problem why my ??=3D was not working thanks
for finding it out. I have gone ahead and posted a v2 of this patch
series which should now
work out better.

>
> Sau!
>
>
>
>
>>
>


