Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QJsmS-0001AC-68
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 21:39:40 +0200
Received: by vxd7 with SMTP id 7so1493555vxd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 12:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bfDStgxVMi5crgSkIwVJvWSAO675bv4+Fd7KpR1AYfk=;
	b=AzztMbmvipB1TQquc39AN9OXlNO52KdopUpn6SVyPv2WYOvbMBVV+eK5lUvA5ei9Ja
	TRKo0QV81bxwvO4ZUhUI4TyQOa7H1MDBgWkp5MoZeUbPOPNNr/LIf3rOZfxQK9jOpPlR
	qAdSJ9NTpGDfR5npZfAmYnqjYhWZ3vVq+8sOU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=wgeOBUgzXjJhcsqVSP42IDqaRJ0o8+rxvOPjUzgHrC/jYkvRnk2ZA5fwI97MGvNgsY
	fF8R4/90O4Oot050VYeBh3luNJQkn8SB88VmnFKm8FXm57IQYDg6PAemuhahydVEyWzc
	Gm78yJZFD6fx5tjGOkY2b9om4f5neYEs5eEzU=
Received: by 10.52.66.165 with SMTP id g5mr1947622vdt.61.1305056211053; Tue,
	10 May 2011 12:36:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.114.233 with HTTP; Tue, 10 May 2011 12:36:31 -0700 (PDT)
In-Reply-To: <BANLkTinT7bN=-QfQg24GtrOaRW4U3vv-zQ@mail.gmail.com>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
	<4DC8CA7E.4020302@linux.intel.com>
	<BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>
	<4DC97D27.9080602@linux.intel.com>
	<20110510181314.GF3673@jama.jama.net>
	<4DC98507.6070103@mentor.com> <1305054238.30391.283.camel@rex>
	<BANLkTinT7bN=-QfQg24GtrOaRW4U3vv-zQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 10 May 2011 12:36:31 -0700
X-Google-Sender-Auth: 5aVtngSzRwgXgC9xkbttRtQEAmw
Message-ID: <BANLkTinTRWV6fi1Wspb+0NsgWsod4TqLvg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Pull request with misc changes
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
X-List-Received-Date: Tue, 10 May 2011 19:39:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 12:15 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, May 10, 2011 at 16:03, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>> Hmmm. =C2=A0I'm going to take a stab at making this a create-pull-reque=
st
>>> option...
>>
>> Martin/Tom: Serious question - why not use the contrib repo for this?
>>
>> I have nightmares about all the development being spread to all the
>> corners of the globe and people not being able to see what is being
>> worked on. For short lived branches its not so much of a problem but as
>> we take on longer lived feature development it will be a problem. I'd
>> therefore like to understand why the dislike of it...
>
> Welcome to Distribute Source Control Management World; this is the
> beauty of it and I see no reason to restrict or enforce people to use
> a repository.
>
> In my personal case we have been using GitHub as a central place to
> put projects that O.S. Systems is contributing and this is good to
> gather us some visibility so OE will be there too.
>
> So I won't use contrib to share patches. I can send them to mailing
> list (as I have been doing). A merge on a topic branch is a git pull
> command from you so I see not much problem for you or whom is doing
> the pull job.
>
> As an example:
>
> =C2=A0git checkout -b otavio-20110510-review
> =C2=A0git pull git://github.com/OSSystems/oe-core.git master
> =C2=A0git shortlog origin/master..
>

Even easier, one command to get it into a local branch:

git fetch git://github.com/OSSystems/oe-core.git master:otavio-20110510-rev=
iew
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


