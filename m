Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGIRd-0002Du-W1
	for openembedded-core@lists.openembedded.org;
	Sun, 01 May 2011 00:15:22 +0200
Received: by ewy5 with SMTP id 5so1447844ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Apr 2011 15:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=B1NzgVZSCXnFlgwRrPvAFRPk+ii5QFYcum7kJyMdnG8=;
	b=WVm9mo9de36TZ8dleNsK8C916SEaiRSU4Nn9UXduJTfs7j/lgLUegefGP+oxfH6NbQ
	/PmND5FtitUeqGMgTWDrudgFWfxRd6T1HSUFVRADqkvoIxLpGKbdxiboid7XeWHE5eUo
	ysJU0R65og9+MYc2Ml1KstPRoOzbcH9gMzwTI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=tTOKXPB7gEeOyts+LDaHcSUEEXcVjq108sl6FzhbAIJopyKJfQnnQbeiGwsw0ubBoH
	JHjzvjSGiWoNhNgvzKuo0FKWOOUv0VWYETF2MLurjufTilPH/+jW6/iynEkatQCb0mRh
	6jhqEbOB2Ks9FN5is3zLtvE9xIKpGz64RLGp0=
Received: by 10.14.52.132 with SMTP id e4mr2868796eec.173.1304201567391; Sat,
	30 Apr 2011 15:12:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Sat, 30 Apr 2011 15:12:17 -0700 (PDT)
In-Reply-To: <BANLkTi=OLNtQ1Ab5ncLzP-7UD47pLfrErQ@mail.gmail.com>
References: <BANLkTimY=T0BNMLWm+Ez9N1ug+_XOdaGpg@mail.gmail.com>
	<B7450533-1402-4465-A3C8-6CFF10BF4A82@dominion.thruhere.net>
	<BANLkTikjpjVK40B4OO6a4BqB3ys_7hxbmA@mail.gmail.com>
	<4DB9E439.5020009@linux.intel.com>
	<BANLkTi=OLNtQ1Ab5ncLzP-7UD47pLfrErQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Apr 2011 15:12:17 -0700
Message-ID: <BANLkTimiPpDhexMpHyJZnBBUO-ownZ1faA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 30 Apr 2011 22:15:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 3:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Apr 28, 2011 at 3:03 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 04/27/2011 01:13 PM, Khem Raj wrote:
>>>
>>> On Wed, Apr 27, 2011 at 9:44 AM, Koen Kooi<koen@dominion.thruhere.net>
>>> =C2=A0wrote:
>>>>
>>>> Why not move those srcrevs into the recipe? IIRC these ones aren't
>>>> affected by RPs concerns
>>>
>>> I am ok doing that but here
>>>
>>> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-April/00153=
6.html
>>>
>>> it seems we still need to investigate it before we start moving
>>> SRCREVs to recipes.
>>>
>> We are days away from having this implemented (early next week is the pl=
an
>> right now). Once you see the big pull that moves SRCREVs, then you can g=
o
>> ahead with your upgrade.
>>
>> Also creating a new recipe instead of moving the old one will cause a lo=
se
>> of history in git, we would prefer moves or create new / delete.
>
> I would move if we decide that its an upgrade and we dont need
> 2.12 anymore othereise It will be created new along side 2.12 problem
> with creating
> new is that it carries lot of history from 2.12 but does not associate
> with it directly
> renaming/moving will atleast have that link but thats besides
>
>>
>> Sau!
>>
>>>>
>>>> Op 27 apr. 2011 om 18:21 heeft Khem Raj<raj.khem@gmail.com> =C2=A0het =
volgende
>>>> geschreven:
>>>>
>>>>> Hi
>>>>>
>>>>> I have eglibc 2.13 upgrade done locally and has been building fine fo=
r
>>>>> all architectures. I have added 2.13 recipes and not
>>>>> deleted the 2.12, This works ok except when setting the SRCREV. Since
>>>>> we have a single file called
>>>>> conf/distro/include/poky-default-revisions.inc to store this
>>>>> information there can not be two SRCREV for two versions of same
>>>>> package unless we move them to
>>>>> recipes which is under work but not yet done. Thats one reason to hol=
d
>>>>> these patches. I can propose them if we are ok with
>>>>> removing 2.12 recipes then it becomes straight forward
>>>>>
>>>>> Opinions ?
>>>>>

I have staged a contrib branch with eglibc 2.13 upgrade

its here

http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dkra=
j/eglibc-2.13

(top 1 patch)

Please try it out and report any issues you see

Thanks

-Khem


