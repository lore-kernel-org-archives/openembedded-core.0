Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCto8-0007xz-Sd
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 16:25:05 +0200
Received: by lagw12 with SMTP id w12so1268057lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=IRirxnOl+uTOnThf1zRhtqVBMvQ+dTnv0iXk9soSeKc=;
	b=J45KhEGYQQfkpuLdpvFOkIEUMsXYuoloHVn8Q0CCXtqtkx/DjvQ4fWqWvEHnEN/t04
	rWer4xXx8NjS+/cHQzoW8KXnaidgoGunzsv/dHhdrm1bQHChEhCo0EGfWGqbQKJ6rv0b
	cLyvagCh/PSvzLu1DdZfCVsEd/UbmzK+uH+TfCuSKZoXZOpK4XiENEwYedbLpkKY/oRo
	UzDxRrdP9SWP4xwSUSTJ9n3bW/hba7ZBEsDyiab6ziqoW6RMQw1P1FrDVs5sYf4E7QfS
	AT4DUp79/q4kCgd4izf/guf8RoM5GgGETo5lFxXPYd1Nkyz/gBJCKk1uA+gc6zEbXA/r
	lawA==
Received: by 10.152.115.38 with SMTP id jl6mr23520068lab.24.1332944162451;
	Wed, 28 Mar 2012 07:16:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Wed, 28 Mar 2012 07:15:32 -0700 (PDT)
In-Reply-To: <20120324022639.GF4604@jama.jama.net>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
	<1332504325.9740.395.camel@ted> <20120323131701.GF3879@jama.jama.net>
	<20120324022639.GF4604@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Mar 2012 07:15:32 -0700
Message-ID: <CAMKF1souotjH46PYsQYC8LKDfa2ABD4FsrpxEUvCPqic3PnW1A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] eglibc-2.15: Update SRCREV
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
X-List-Received-Date: Wed, 28 Mar 2012 14:25:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 7:26 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Mar 23, 2012 at 02:17:02PM +0100, Martin Jansa wrote:
>> On Fri, Mar 23, 2012 at 12:05:25PM +0000, Richard Purdie wrote:
>> > On Thu, 2012-03-22 at 19:56 -0700, Khem Raj wrote:
>> > > Get new patches and remove the one that got merged upstream
>> > >
>> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > ---
>> > > =C2=A0.../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch =C2=A0 =C2=A0|=
 =C2=A0108 ++++++++++++++++++++
>> > > =C2=A0.../eglibc-2.15/armv4-eabi-compile-fix.patch =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 25 -----
>> > > =C2=A0.../eglibc/eglibc-2.15/initgroups_keys.patch =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 20 ++++
>> > > =C2=A0meta/recipes-core/eglibc/eglibc_2.15.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A05 +-
>> > > =C2=A04 files changed, 131 insertions(+), 27 deletions(-)
>> > > =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLRO_d=
l_debug_mask.patch
>> > > =C2=A0delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/armv4-=
eabi-compile-fix.patch
>> > > =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/initgr=
oups_keys.patch
>> >
>> > Since 2.15 isn't the default I'm tempted to merge this despite the poi=
nt
>> > we're at in the release cycle. I'd like to give anyone using this the
>> > opportunity to comment first though.
>>
>> I'm testing this on all archs I'm using (armv4t, armv5te, armv7a,
>> x86-64) and will report tomorrow.
>
> Doesn't look related to this change, but I got interesing error on other
> buildhost (on mine everything seems fine sofar including tests on
> target), I don't have log from armv4t build on mine, because it's on tmpf=
s
> and there was unexpected reboot when I wasn't home :/.

Hi Martin

Does it look good for your testing ?


