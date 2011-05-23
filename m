Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QOWg8-00065n-8L
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 17:04:20 +0200
Received: by pzk36 with SMTP id 36so2646413pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=QE12VTfQQeOgvZJ4vQpMilrjCtRN8vGT5apCExRlZ9M=;
	b=Z0KE0Ej3f0vRB28E9MgpOSPBLHhR4tq965AJKwG3/s4SFVL5kqiw76NirHZaPmN8Ia
	yPbSEehVbSO6qfRcZWefXaW8lkJvFbdH8AjBFFIjiQNTihZQ0jsPo6dsBZjlFGsqOrNj
	GDyQuWZDli2QKeafgfZugJ/NK9bXOx+Pdc2iE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=t7jicjHVtAaIYyyAx/YguOMWAkCeH8Bu0SN4oomSYGb+g4HZo5+eL54XlT9rINkL8W
	ivJHIxoBvrTvjmajokoEFm2Y/VkeU9/Pv4WDYqV7r7I/c6hR0AtTfuSLYCJFY/Mtzhb+
	/V+e51ukU4nN4aNVB7kj+H9QBT5xN/SxkCZNI=
MIME-Version: 1.0
Received: by 10.68.69.43 with SMTP id b11mr2029995pbu.18.1306162877956; Mon,
	23 May 2011 08:01:17 -0700 (PDT)
Received: by 10.68.42.5 with HTTP; Mon, 23 May 2011 08:01:17 -0700 (PDT)
In-Reply-To: <1306161789.3424.856.camel@rex>
References: <1304755709.30391.187.camel@rex>
	<BANLkTi=x2xuJaGGNSq4eT5Cp2wVW0NnhBA@mail.gmail.com>
	<BANLkTi=J5nGBSUVMLSfbJo+RpsMk-OCU9g@mail.gmail.com>
	<1304756644.30391.189.camel@rex>
	<BANLkTikVXbDNTE_Nt-ptxGjeQN5_RYcp-A@mail.gmail.com>
	<1304758267.30391.190.camel@rex> <1306161789.3424.856.camel@rex>
Date: Mon, 23 May 2011 11:01:17 -0400
Message-ID: <BANLkTi=X=KYL=7BQ+yRpaRE9D7QAUsQa1w@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Unable to push to the repository?
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
X-List-Received-Date: Mon, 23 May 2011 15:04:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2011 at 10:43 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2011-05-07 at 09:51 +0100, Richard Purdie wrote:
>> On Sat, 2011-05-07 at 01:37 -0700, Khem Raj wrote:
>> > On Sat, May 7, 2011 at 1:24 AM, Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> > > On Sat, 2011-05-07 at 01:21 -0700, Khem Raj wrote:
>> > >> On Sat, May 7, 2011 at 1:13 AM, Khem Raj <raj.khem@gmail.com> wrote=
:
>> > >> > On Sat, May 7, 2011 at 1:08 AM, Richard Purdie
>> > >> > <richard.purdie@linuxfoundation.org> wrote:
>> > >> >> Hi,
>> > >> >>
>> > >> >> It seems something on the server was broken and I'm unable to pu=
sh to the repository:
>> > >> >>
>> > >> >> $ git push origin master:master
>> > >> >> Counting objects: 9, done.
>> > >> >> Delta compression using up to 2 threads.
>> > >> >> Compressing objects: 100% (5/5), done.
>> > >> >> Writing objects: 100% (5/5), 490 bytes, done.
>> > >> >> Total 5 (delta 4), reused 0 (delta 0)
>> > >> >> remote: sed: can't read ./description: No such file or directory
>> > >> >> remote: *** Project description file hasn't been set
>> > >> >> remote: error: hook declined to update refs/heads/master
>> > >> >> To ssh://git@git.openembedded.org/openembedded-core
>> > >> >> =A0! [remote rejected] master -> master (hook declined)
>> > >> >> error: failed to push some refs to 'ssh://git@git.openembedded.o=
rg/openembedded-core'
>> > >> >>
>> > >> >> Any ideas what's wrong?
>> > >> >
>> > >> > hmmm I added ml hooks but they are same as classic oe so it shoul=
d
>> > >> > have worked but let me see.
>> > >>
>> > >> OK I think I used wrong repo name probably that was it. Please retr=
y
>> > >> and see if it works
>> > >
>> > > No, still the same error :(
>> >
>> > one more time. Now I have added description files.
>>
>> It worked this time, thanks.
>
> and its broken again once more :(

Its fixed now.  The root cause has also been fixed, so I don't expect
this to be a problem in the future.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


