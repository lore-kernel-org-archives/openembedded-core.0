Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QeWzO-0000OV-R0
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 20:38:23 +0200
Received: by pwi1 with SMTP id 1so105282pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2011 11:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=hEvdAwbDSf9U43L5Z6Z7u06aMykPSBsxOuZbd+0nUVA=;
	b=P+yt/Rq+aw0aj7lxcz64HlxZzE1xfQL8Li+zz6lE1bC1GCdAB9JwjlqhiW2EyvIYS5
	d9ki8eaKCJrmfyM/LVelVZX1cvynSX20DDpzg7tO2Xns2uPGce1DxPBjP1F1sOtQHNzz
	xxOKe1E+0rwHlbikdsts0H140nQDMV3ph90lk=
Received: by 10.68.66.104 with SMTP id e8mr2566843pbt.29.1309977271060; Wed,
	06 Jul 2011 11:34:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.57.104 with HTTP; Wed, 6 Jul 2011 11:34:01 -0700 (PDT)
In-Reply-To: <1309975844.20015.798.camel@rex>
References: <cover.1309899985.git.raj.khem@gmail.com>
	<CAMKF1souQCFTzy4D9i1kWrS_y0fFZJb=00eDxtP5OtQE2tf73Q@mail.gmail.com>
	<1309939595.20015.766.camel@rex>
	<CAMKF1spy7d0yJu=EnbG-sKwxxgwB1Jz8S0k6D3Fr+KCUpRerjw@mail.gmail.com>
	<1309975844.20015.798.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2011 11:34:01 -0700
Message-ID: <CAMKF1srnb34qBnFOxBoVFep=xSAOhjKbAHFGOsq-OHhBaZdAow@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 Jul 2011 18:38:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 6, 2011 at 11:10 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-07-06 at 11:06 -0700, Khem Raj wrote:
>> On Wed, Jul 6, 2011 at 1:06 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Tue, 2011-07-05 at 23:48 -0700, Khem Raj wrote:
>> >> On Tue, Jul 5, 2011 at 2:09 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >> > With this changeset we add new recipes for 0.9.32 and make that def=
ault
>> >> > preference. Then the git recipe are moved to track the latest maste=
r.
>> >> > systemd related fixes are separately applied to both git recipe and=
 0.9.32
>> >> > recipes
>> >> >
>> >> > Both sets work for arm,mips,ppc,x86,x86-64
>> >> >
>> >> > Thanks
>> >> > -Khem
>> >> >
>> >> >
>> >> > The following changes since commit 4eb3abaa5f4b5df0314dc0d503298d65=
cd203259:
>> >> >
>> >> > =C2=A0uclibc-0.9.32: Implement execvpe and refresh scheduler functi=
ons (2011-07-05 13:53:05 -0700)
>> >> >
>> >> > are available in the git repository at:
>> >> > =C2=A0git://git.openembedded.org/openembedded-core-contrib kraj/ucl=
ibc-0.9.32
>> >> > =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded-core-contr=
ib/log/?h=3Dkraj/uclibc-0.9.32
>> >> >
>> >> > Khem Raj (5):
>> >> > =C2=A0uclibc: Add recipes for 0.9.32 release
>> >> > =C2=A0tcmode-default: Define UCLIBCVERSION and set it to 0.9.32
>> >> > =C2=A0uclibc_git: Move SRCREV past 0.9.32 release
>> >>
>> >> I have update PV in above commit to 0.9.32+0.9.33-rc0 instead of
>> >> 0.9.32+gitr${SRCPV} which is troublesome to use with git
>> >
>> > Can you expand a little more about what was troublesome with it?
>> >
>> > Is there a revision being specified for the uclibc git recipe?
>>
>> since its master git I have to change SRCREV frquently and if I do not b=
ump
>> PR it ends up with dependency problems while generating image since
>> the SHAs are random
>> and they are getting into PV sometimes opkg thinks the version is
>> smaller than the previous
>> one and opkg does not like it. that =C2=A0aside 0.9.32+0.9.33-rc0 explai=
ns
>> the recipes PV better IMO
>
> Could you at least add the SRCREV you're using the recipe please? I
> didn't look really hard but I couldn't seem to find it when I last
> looked...

huh. They are in recipes see toward the end here

http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/commit/?h=3D=
kraj/uclibc-0.9.32&id=3Dce07260090bbc11801e96657f1596ec23f793cce

and for 0.9.32 here

http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/commit/?h=3D=
kraj/uclibc-0.9.32&id=3D49aea570ecc45bb7a655d9ca955272c3734c8696

or do u mean in some other form ?
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


