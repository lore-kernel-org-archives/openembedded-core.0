Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0509A73232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 23:35:14 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so56059601pad.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 16:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=3gxZKTqv9TAROKaGhwNVmSobyCPjexkRvI3lv4H0ybU=;
	b=HCv1dVFPKtX5E22zfD72LKj0eKAHQXdDszqU6JOyqEXJOs5xi7UeQzmO4T30KTwd2A
	1nvbO9uiRLG9udEg76i7TQQ9zRhIkt33MYBkkUR2p87FHkCkcloxi7Vqyyo3LOTNWrQ/
	F3IFnt1sjG8As1CPwOAor6A736uL9DnC2tjSdgHm9wafz4btdLBcSLxN5+wXxFRrxND6
	Irh77pannLaCdPU3IR9FpuScfSH0ZUA/LA/N8GOU6IsgMVjA8tcODCiVlP5Q0caO7TI/
	H/yXM4DF8gQDGwyEIZ0XRYp4mB30GnQxvlXly5qRKCbWcCMdjhmP/Hodaj3ucdysRrNA
	AI1Q==
X-Received: by 10.68.172.97 with SMTP id bb1mr85751524pbc.143.1441928114936;
	Thu, 10 Sep 2015 16:35:14 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f8b7:d295:103d:7fdb?
	([2601:646:8601:4580:f8b7:d295:103d:7fdb])
	by smtp.gmail.com with ESMTPSA id
	ns3sm14055773pbc.77.2015.09.10.16.35.14
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Sep 2015 16:35:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441900121.24871.366.camel@linuxfoundation.org>
Date: Thu, 10 Sep 2015 16:35:13 -0700
Message-Id: <FAAEAE1A-C2A9-43B9-8D6D-793AB27B6C61@gmail.com>
References: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
	<a234814e2ad213dc69b90a3450d79b778c0e4c7c.1441552859.git.raj.khem@gmail.com>
	<1441654609.1680.79.camel@pbcl.net>
	<EC219B31-F312-41D6-81C9-D13213CB2759@gmail.com>
	<1441662490.1680.82.camel@pbcl.net>
	<434A343A-193D-4D65-BDE0-FC1BD2D79F28@gmail.com>
	<CAMKF1srrc_mumugSUWW5mhdip5mqK8J_OQkvuzwMY8O1Rjvzmg@mail.gmail.com>
	<1441900121.24871.366.camel@linuxfoundation.org>
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
X-List-Received-Date: Thu, 10 Sep 2015 23:35:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Sep 10, 2015, at 8:48 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Tue, 2015-09-08 at 12:38 -0700, Khem Raj wrote:
>> On Tue, Sep 8, 2015 at 12:03 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>=20
>>>> On Sep 7, 2015, at 2:48 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>>=20
>>>> On Mon, 2015-09-07 at 14:15 -0700, Khem Raj wrote:
>>>>>> On Sep 7, 2015, at 12:36 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>>>>=20
>>>>>> On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
>>>>>>> update-rc.d is now needed by systemd to interact with sysv
>>>>>>> scripts, so if we have a mixed system, then we can not uninstall
>>>>>>> update-rc.d as it is going to break systemd functionality
>>>>>>=20
>>>>>> The description above implies that you will only uninstall =
update-rc.d
>>>>>> if systemd is present, but that doesn't seem to be what the patch =
does.
>>>>>=20
>>>>> I meant to not say its only for systemd. but that systemd now =
needs it.
>>>>> so update-rc.d is no longer forcefully removed from image =
depchain.
>>>>=20
>>>> Well, right.  But wouldn't it be better only to leave it in there =
if
>>>> it's actually necessary, i.e. if you have systemd and you also have =
sysv
>>>> scripts and the rootfs isn't read-only?  As it stands, your patch =
will
>>>> cause update-rc.d to be left around for people who aren't using =
systemd,
>>>> which seems like a retrograde step.
>>>>=20
>>>=20
>>> makes sense. I can improvise on it and check for all constraints in =
a follow up.
>>=20
>>=20
>> I have updates this patch in pull branch
>> =
https://github.com/kraj/openembedded-core/commit/c4c574dff9ef689c7694a6055=
907083e7a018d48
>=20
> Very good, how am I meant to deal with this though? You never =
published
> a pull url in your original pull request and I can't figure out how to
> get a patch file out the github web UI. I guess I can fetch the branch
> somewhere, then extract it, but if everyone does this its going to be
> rather annoying for me :(.

Its was an update to usual pull request branch that I have published =
earlier and then notified to the thread
some of us have been doing it for long.

I have used create-pull-request script to generate the pull request, it =
is not supposed to work with github ?
looking at the original mail I see the url is really not there. I will =
see why its happening and if its a pilot error.

=46rom github you can append a .patch or .diff to the commit link and =
obtain a patch too e.g. above would be

=
https://github.com/kraj/openembedded-core/commit/c4c574dff9ef689c7694a6055=
907083e7a018d48.patch

There is no need to revert it. I have pushed a rebased patch to the =
original so you can pull that.


>=20
> I really wish people would just post the v2 on the list.
>=20
> Incidentally, the wrong version of this has gotten merged, I'll likely
> revert it then apply this.
>=20
> Cheers,
>=20
> Richard


