Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id CE2256E26B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 23:39:37 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so56500177pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 16:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=c2e8X5H8YjCkreXjZv+ONwrjCghe9digOaLyjQuAH1g=;
	b=jragdZloOuWjFqwxoGbMFI6Tsq42VbqXrX4Iq30R4k6PA7NUOfPd4TEoO83LOv7ZI3
	v2NiehVCHQqr+Gq6xfVrcQtaYo2ePQc1067pKmQ+bsZERbGTG2hwCuwjyexDMMWgqrEe
	ag7H8E+UprB13ZkhMdXvGYTmtgHZj3iS9khWmNXdFyWxu1Nn85waShxVmO8sSJFl6psZ
	37MNVJy5d09zbIpbXiJmzNkwv3e44mVJ/f6kt/SgDV7zN2PYHzHmNBg/K61V0uJCmBCq
	cwdAf70a47S/JR3gPeekFeUDQ9Huc0Ngg5Rq4fkEKfOdxIvjhOl3g7Rfue1NDlCP3p+X
	3dVA==
X-Received: by 10.69.12.162 with SMTP id er2mr89705177pbd.24.1441928378147;
	Thu, 10 Sep 2015 16:39:38 -0700 (PDT)
Received: from [192.168.0.4] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	tz1sm14069215pbc.50.2015.09.10.16.39.37
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Sep 2015 16:39:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <FAAEAE1A-C2A9-43B9-8D6D-793AB27B6C61@gmail.com>
Date: Thu, 10 Sep 2015 16:39:36 -0700
Message-Id: <C673EC44-0C5C-4931-B92D-965D1528D46E@gmail.com>
References: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
	<a234814e2ad213dc69b90a3450d79b778c0e4c7c.1441552859.git.raj.khem@gmail.com>
	<1441654609.1680.79.camel@pbcl.net>
	<EC219B31-F312-41D6-81C9-D13213CB2759@gmail.com>
	<1441662490.1680.82.camel@pbcl.net>
	<434A343A-193D-4D65-BDE0-FC1BD2D79F28@gmail.com>
	<CAMKF1srrc_mumugSUWW5mhdip5mqK8J_OQkvuzwMY8O1Rjvzmg@mail.gmail.com>
	<1441900121.24871.366.camel@linuxfoundation.org>
	<FAAEAE1A-C2A9-43B9-8D6D-793AB27B6C61@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3094)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] rootfs: Do not uninstall update-rc.d
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Sep 2015 23:39:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Sep 10, 2015, at 4:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>>=20
>> On Sep 10, 2015, at 8:48 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>=20
>> On Tue, 2015-09-08 at 12:38 -0700, Khem Raj wrote:
>>> On Tue, Sep 8, 2015 at 12:03 AM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>>=20
>>>>> On Sep 7, 2015, at 2:48 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>>>=20
>>>>> On Mon, 2015-09-07 at 14:15 -0700, Khem Raj wrote:
>>>>>>> On Sep 7, 2015, at 12:36 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>>>>>=20
>>>>>>> On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
>>>>>>>> update-rc.d is now needed by systemd to interact with sysv
>>>>>>>> scripts, so if we have a mixed system, then we can not =
uninstall
>>>>>>>> update-rc.d as it is going to break systemd functionality
>>>>>>>=20
>>>>>>> The description above implies that you will only uninstall =
update-rc.d
>>>>>>> if systemd is present, but that doesn't seem to be what the =
patch does.
>>>>>>=20
>>>>>> I meant to not say its only for systemd. but that systemd now =
needs it.
>>>>>> so update-rc.d is no longer forcefully removed from image =
depchain.
>>>>>=20
>>>>> Well, right.  But wouldn't it be better only to leave it in there =
if
>>>>> it's actually necessary, i.e. if you have systemd and you also =
have sysv
>>>>> scripts and the rootfs isn't read-only?  As it stands, your patch =
will
>>>>> cause update-rc.d to be left around for people who aren't using =
systemd,
>>>>> which seems like a retrograde step.
>>>>>=20
>>>>=20
>>>> makes sense. I can improvise on it and check for all constraints in =
a follow up.
>>>=20
>>>=20
>>> I have updates this patch in pull branch
>>> =
https://github.com/kraj/openembedded-core/commit/c4c574dff9ef689c7694a6055=
907083e7a018d48
>>=20
>> Very good, how am I meant to deal with this though? You never =
published
>> a pull url in your original pull request and I can't figure out how =
to
>> get a patch file out the github web UI. I guess I can fetch the =
branch
>> somewhere, then extract it, but if everyone does this its going to be
>> rather annoying for me :(.
>=20
> Its was an update to usual pull request branch that I have published =
earlier and then notified to the thread
> some of us have been doing it for long.
>=20
> I have used create-pull-request script to generate the pull request, =
it is not supposed to work with github ?
> looking at the original mail I see the url is really not there. I will =
see why its happening and if its a pilot error.
>=20
> =46rom github you can append a .patch or .diff to the commit link and =
obtain a patch too e.g. above would be
>=20
> =
https://github.com/kraj/openembedded-core/commit/c4c574dff9ef689c7694a6055=
907083e7a018d48.patch
>=20
> There is no need to revert it. I have pushed a rebased patch to the =
original so you can pull that.
>=20
>=20
>>=20
>> I really wish people would just post the v2 on the list.

OK I Will send one.

>>=20
>> Incidentally, the wrong version of this has gotten merged, I'll =
likely
>> revert it then apply this.
>>=20
>> Cheers,
>>=20
>> Richard


