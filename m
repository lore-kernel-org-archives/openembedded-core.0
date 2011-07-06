Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QeWYi-0008Qr-8R
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 20:10:48 +0200
Received: by pwi1 with SMTP id 1so81382pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2011 11:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=mftTMGo1rMGVKiTmf9QRB+3ML+krD9ArOe1D3r5U31Y=;
	b=rfQSuhGXvnHPZ0jClR8ihX5d/Z56nBEV2SlV0H3yPQ+7+kldMQOn9IA1Mqqchoy6Ed
	eLF/nUbPhLaYz0jghRcMr9dTKyCTaFDepEHqpEd5lUjiCBXLJQME73jgGIvxj9tuL/r2
	q1XB+SVh8zMylACJJ6kVM00R+tUv/HkDOAhZs=
Received: by 10.68.66.104 with SMTP id e8mr2531831pbt.29.1309975616376; Wed,
	06 Jul 2011 11:06:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.57.104 with HTTP; Wed, 6 Jul 2011 11:06:26 -0700 (PDT)
In-Reply-To: <1309939595.20015.766.camel@rex>
References: <cover.1309899985.git.raj.khem@gmail.com>
	<CAMKF1souQCFTzy4D9i1kWrS_y0fFZJb=00eDxtP5OtQE2tf73Q@mail.gmail.com>
	<1309939595.20015.766.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2011 11:06:26 -0700
Message-ID: <CAMKF1spy7d0yJu=EnbG-sKwxxgwB1Jz8S0k6D3Fr+KCUpRerjw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Add recipes for 0.9.32 release
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
X-List-Received-Date: Wed, 06 Jul 2011 18:10:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 6, 2011 at 1:06 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-07-05 at 23:48 -0700, Khem Raj wrote:
>> On Tue, Jul 5, 2011 at 2:09 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > With this changeset we add new recipes for 0.9.32 and make that defaul=
t
>> > preference. Then the git recipe are moved to track the latest master.
>> > systemd related fixes are separately applied to both git recipe and 0.=
9.32
>> > recipes
>> >
>> > Both sets work for arm,mips,ppc,x86,x86-64
>> >
>> > Thanks
>> > -Khem
>> >
>> >
>> > The following changes since commit 4eb3abaa5f4b5df0314dc0d503298d65cd2=
03259:
>> >
>> > =C2=A0uclibc-0.9.32: Implement execvpe and refresh scheduler functions=
 (2011-07-05 13:53:05 -0700)
>> >
>> > are available in the git repository at:
>> > =C2=A0git://git.openembedded.org/openembedded-core-contrib kraj/uclibc=
-0.9.32
>> > =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/=
log/?h=3Dkraj/uclibc-0.9.32
>> >
>> > Khem Raj (5):
>> > =C2=A0uclibc: Add recipes for 0.9.32 release
>> > =C2=A0tcmode-default: Define UCLIBCVERSION and set it to 0.9.32
>> > =C2=A0uclibc_git: Move SRCREV past 0.9.32 release
>>
>> I have update PV in above commit to 0.9.32+0.9.33-rc0 instead of
>> 0.9.32+gitr${SRCPV} which is troublesome to use with git
>
> Can you expand a little more about what was troublesome with it?
>
> Is there a revision being specified for the uclibc git recipe?

since its master git I have to change SRCREV frquently and if I do not bump
PR it ends up with dependency problems while generating image since
the SHAs are random
and they are getting into PV sometimes opkg thinks the version is
smaller than the previous
one and opkg does not like it. that  aside 0.9.32+0.9.33-rc0 explains
the recipes PV better IMO

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


