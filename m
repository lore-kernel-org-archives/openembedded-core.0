Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFZmF-00041u-Hy
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 00:33:39 +0200
Received: by ewy5 with SMTP id 5so1006201ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2011 15:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=8wEpki41AvTRUVc5r6XBQlXi8mgnQ3Ww/g5/9nH5FLA=;
	b=aeh6JFaFwlVqj8J8hWFi72bvbl1pioUc0GsBkErDrJLYAoakutyByN2u+BXLzoeX6/
	e1vyP77tMmQg5S0T3xTSBaAP5GI7zUJZs7f3FcGMbaN/7EmJ3PPTXdhaF3ZemBCqz2hL
	DDTLJamoNcIopM9w6yv13mk1GG0Wm/is+FXDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Ai7dWMIgdcypSaFFhE31CxY6/PAZAKLa+H77MXP+oqfeefW3Y0R9yI0xgK1k+nVSKe
	Wyp1rMacrTUcP1NuLa97KKcoXxkNXfm6j/q0W/aJ+BbjvG9OeUvXNWhVoOCztkKeTkux
	ma65yxmH9Kj8vnyppiHKsrLWz3tNXVw+U+FEg=
Received: by 10.14.11.132 with SMTP id 4mr1875754eex.45.1304029867331; Thu, 28
	Apr 2011 15:31:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Thu, 28 Apr 2011 15:30:37 -0700 (PDT)
In-Reply-To: <4DB9E439.5020009@linux.intel.com>
References: <BANLkTimY=T0BNMLWm+Ez9N1ug+_XOdaGpg@mail.gmail.com>
	<B7450533-1402-4465-A3C8-6CFF10BF4A82@dominion.thruhere.net>
	<BANLkTikjpjVK40B4OO6a4BqB3ys_7hxbmA@mail.gmail.com>
	<4DB9E439.5020009@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2011 15:30:37 -0700
Message-ID: <BANLkTi=OLNtQ1Ab5ncLzP-7UD47pLfrErQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Apr 2011 22:33:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 3:03 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 04/27/2011 01:13 PM, Khem Raj wrote:
>>
>> On Wed, Apr 27, 2011 at 9:44 AM, Koen Kooi<koen@dominion.thruhere.net>
>> =C2=A0wrote:
>>>
>>> Why not move those srcrevs into the recipe? IIRC these ones aren't
>>> affected by RPs concerns
>>
>> I am ok doing that but here
>>
>> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-April/001536=
.html
>>
>> it seems we still need to investigate it before we start moving
>> SRCREVs to recipes.
>>
> We are days away from having this implemented (early next week is the pla=
n
> right now). Once you see the big pull that moves SRCREVs, then you can go
> ahead with your upgrade.
>
> Also creating a new recipe instead of moving the old one will cause a los=
e
> of history in git, we would prefer moves or create new / delete.

I would move if we decide that its an upgrade and we dont need
2.12 anymore othereise It will be created new along side 2.12 problem
with creating
new is that it carries lot of history from 2.12 but does not associate
with it directly
renaming/moving will atleast have that link but thats besides

>
> Sau!
>
>>>
>>> Op 27 apr. 2011 om 18:21 heeft Khem Raj<raj.khem@gmail.com> =C2=A0het v=
olgende
>>> geschreven:
>>>
>>>> Hi
>>>>
>>>> I have eglibc 2.13 upgrade done locally and has been building fine for
>>>> all architectures. I have added 2.13 recipes and not
>>>> deleted the 2.12, This works ok except when setting the SRCREV. Since
>>>> we have a single file called
>>>> conf/distro/include/poky-default-revisions.inc to store this
>>>> information there can not be two SRCREV for two versions of same
>>>> package unless we move them to
>>>> recipes which is under work but not yet done. Thats one reason to hold
>>>> these patches. I can propose them if we are ok with
>>>> removing 2.12 recipes then it becomes straight forward
>>>>
>>>> Opinions ?
>>>>
>>>> -Khem
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


