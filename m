Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtYIV-0001UX-32
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 07:04:11 +0200
Received: by pzk2 with SMTP id 2so524288pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 21:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=WunOJuQPcM4glBk7C5sOeluMxvuzsI+lGfKUllj/uMU=;
	b=n9cyNBZZ7XqV1bDp2FAuIB3e7mBRwPVVSEo/mGbLp84jdhEqBGANqX5Pa8FMvGjo93
	+DKOEPEuHpkxZwOY3J2NxqQ5iBnSNBwDRew6YIl9rqR0VgaS/j6b4OyHGKEBkJTVAFyT
	8c9Qs9PRC71W1UrqptsH2YTsv81xARu8Fx9MM=
Received: by 10.142.187.3 with SMTP id k3mr254251wff.233.1313557172121; Tue,
	16 Aug 2011 21:59:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.197 with HTTP; Tue, 16 Aug 2011 21:59:02 -0700 (PDT)
In-Reply-To: <CAD=GYpbqB0RzfOoKAfFaPmJgPmTyExHpBUqFEBQE2sz-KH1eBQ@mail.gmail.com>
References: <1313525796-21604-1-git-send-email-agnel.joel@gmail.com>
	<23CB1EF8-9ACB-4F95-BE6A-F084E515837A@beagleboard.org>
	<CAMKF1spbd4NEHoP-aRk6qorPLR079F33JwH8c7BOZpwOwcBRZg@mail.gmail.com>
	<CAD=GYpbY-DYM77_JV_-8fL2eKKj5Nk1yKp2sL5EErfUdQLq5Qg@mail.gmail.com>
	<FA0B50F8-A4DD-4C28-9FCB-EB4F63486087@ti.com>
	<CAD=GYpbqB0RzfOoKAfFaPmJgPmTyExHpBUqFEBQE2sz-KH1eBQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2011 21:59:02 -0700
Message-ID: <CAMKF1spBkx6OmN8qfhA5LAS8zU27Ae4Ock3+VjH7XU07oHLmdw@mail.gmail.com>
To: Joel A Fernandes <agnel.joel@gmail.com>
Cc: "Kooi, Koen" <k-kooi@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Dmytriyenko,
	Denys" <denys@ti.com>
Subject: Re: [PATCH] angstrom-task-gnome: Added gedit to task-gnome dependencies
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
X-List-Received-Date: Wed, 17 Aug 2011 05:04:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 7:12 PM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
> Sorry to bother you but are you sure?
>
> "if this is a patch against angstrom on top of oe.dev then it should go
> to oe-devel list too"
>
> meta-angstrom patches are not ontop of oe.dev
>

yes meta-angstrom patches go to angstrom-devel list. No need to send
them to oe-devel
or oe-core mls unless there is some change that affects these other layers

> On Tue, Aug 16, 2011 at 8:16 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
>> He meant angstrom-devel and/or oe-devel, =C2=A0not oe-core.
>>
>> Denys
>>
>>
>> ----- Reply message -----
>> From: "Joel A Fernandes" <agnel.joel@gmail.com>
>> To: "Khem Raj" <raj.khem@gmail.com>
>> Cc: "Patches and discussions about the oe-core layer"
>> <openembedded-core@lists.openembedded.org>, "Kooi, Koen" <k-kooi@ti.com>=
,
>> "Dmytriyenko, Denys" <denys@ti.com>
>> Subject: [OE-core] [PATCH] angstrom-task-gnome: Added gedit to task-gnom=
e
>> dependencies
>> Date: Tue, Aug 16, 2011 18:07
>>
>>
>>
>> On Tue, Aug 16, 2011 at 6:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Tue, Aug 16, 2011 at 2:24 PM, Jason Kridner <jkridner@beagleboard.or=
g>
>>> wrote:
>>>> I see the README says this should be on the OE-core list, but maybe th=
is
>>>> should go on the Angstrom list?
>>>>
>>>
>>> it should go to angstrom-devel list in anycase
>>> if this is a patch against angstrom on top of oe.dev then it should go
>>> to oe-devel list too. oe-core is not needed
>>
>> Hi Khem, just confirming that you mean meta-angstrom patches should go
>> to both oe-core and angstrom lists?
>>
>> Thanks,
>> Joel
>>
>


