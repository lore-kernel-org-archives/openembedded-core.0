Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1RuKem-00038g-Tw; Mon, 06 Feb 2012 10:14:41 +0100
Received: by lbol12 with SMTP id l12so974466lbo.6
	for <multiple recipients>; Mon, 06 Feb 2012 01:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Xpe4YDAtxCqkS82ARs0dJGJFeCFO5mjFz9YY/+MFdFo=;
	b=UuMmjDHy6Q36wpoHc1mvrQDdWDfPedG8VGuuybfyIqFamDyq/CqtVcywcWTPguG+uk
	BFJzV8wCI+EH0/EWae30l56MSVS6L3YaThW0whYlBF7OM91eaGLmY2/346/mfJr0SmYT
	D70wqKA/0cW2zsglpR5PLD7kG+m8fBcS5aGrU=
MIME-Version: 1.0
Received: by 10.112.8.41 with SMTP id o9mr1219289lba.9.1328519200021; Mon, 06
	Feb 2012 01:06:40 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Mon, 6 Feb 2012 01:06:39 -0800 (PST)
In-Reply-To: <CALbNGRQ4pvGoiv8DopfhgcujQffqOkPpS2+ON8-ad12GDdfH=w@mail.gmail.com>
References: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
	<FA3D8228-A311-4588-90C8-0A12F89723AC@dominion.thruhere.net>
	<CALbNGRQ4pvGoiv8DopfhgcujQffqOkPpS2+ON8-ad12GDdfH=w@mail.gmail.com>
Date: Mon, 6 Feb 2012 10:06:39 +0100
Message-ID: <CALbNGRQ6K5=wTW4+CBNox6o5DzGvY1KfrXmGV6ru9QvN-mS8tQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] Buildhistory, was Re: do rootfs does not create log files
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
X-List-Received-Date: Mon, 06 Feb 2012 09:14:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 6, 2012 at 10:04 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Feb 6, 2012 at 8:46 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>>
>> Op 5 feb. 2012, om 23:16 heeft Andreas M=FCller het volgende geschreven:
>>
>>> Hi,
>>>
>>> is it a bug or a feature that do_rootfs does not create the package
>>> information (packed_files / packages ..) in a deploy sub-folder did I
>>> miss a switch for this?
>>
>> It's this one: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/met=
a-angstrom/commit/?id=3D370a884b2372b7ddd5f0876119b5f28a2b20074f
>>
>> The matching commit it missing, but you can add something like this to y=
our local.conf:
>>
>> INHERIT +=3D "buildhistory"
>> BUILDHISTORY_COMMIT =3D "1"
>> BUILDHISTORY_DIR =3D "/data/ssd/OE/buildhistory/"
>>
>> That will create a tree that looks like https://github.com/Angstrom-dist=
ribution/buildhistory/. It it's missing a feature that you were using in te=
stlab, let us know and Paul or I will try to add it to buildhistory.
>>
>> regards,
>>
>> Koen
> Thanks for the info - will give buildhistory a test.
>
> Without having experience on buildhistory I have a question: As you
> might know there was a discussion about the order of packages in
> bitbake.conf [1]. I have no idea of the workflow for this issue:
>
> 1. Enable buildhistory as said above
> 2. Build from scratch
> 3. change the PACKAGES order in bitbake.conf
> 4. ??
>
> If I just rebuild without any PR-bumps I assume buildhistory can do
> nothing for me. Correct?
>
> Andreas
>
[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/016=
916.html


