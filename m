Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RjCOQ-0001jW-Hc
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 17:11:46 +0100
Received: by qabg14 with SMTP id g14so1143012qab.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 08:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=7r1EDn8Q0cS7GNFYz/N+pP3ECu5iIn/A9jNF1YZB0OM=;
	b=G1RJZOu7su8UGcjm/kQZhDBPggjQGGfG6TthrWf9Kpb7BYHW8Y3m57h5JCKYFe/RmP
	Ak+clGo9j2zWL02b6LIF2/1uGQMlZfeHC4MqpEZGA9QRNIF81px2nLiyJjjYcwbiRZb/
	lZiBBrI/hg2bzpu/doDqFM+3S5YSCiSm6IspQ=
Received: by 10.224.186.130 with SMTP id cs2mr8374901qab.82.1325865862240;
	Fri, 06 Jan 2012 08:04:22 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Fri, 6 Jan 2012 08:04:01 -0800 (PST)
In-Reply-To: <4F071A65.90708@windriver.com>
References: <20120106100934.GA3879@jama.jama.net>
	<77ADD6E7-5632-4B1A-ABC3-6E4DAEEAE3B6@dominion.thruhere.net>
	<4F071A65.90708@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 6 Jan 2012 09:04:01 -0700
X-Google-Sender-Auth: F_FBloSJK7PlMD1i_fey7cQQfpU
Message-ID: <CABcZANk=sg=oj+KyVcBF=UoC460EV-QtiW4B=wKXPBSLrV4HOQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libs transition /usr/lib -> /lib questions
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
X-List-Received-Date: Fri, 06 Jan 2012 16:11:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 6, 2012 at 8:59 AM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 1/6/12 4:34 AM, Koen Kooi wrote:
>>
>>
>> Op 6 jan. 2012, om 11:09 heeft Martin Jansa het volgende geschreven:
>>
>>> FWIW today I've noticed that systemd is going other way around
>>> http://www.freedesktop.org/wiki/Software/systemd/separate-usr-is-broken
>>
>>
>> And http://fedoraproject.org/wiki/Features/UsrMove
>>
>> I guess it's time to publish my angstrom branch doing that after the
>> holidays :)
>
>
> I respectfully disagree with both of the above URLs.
>
> The root partition is still very useful as a "small" set of applications =
and
> libraries required for booting.
>
> Most systems these days contain a combined root and usr partition, which =
is
> fine. =C2=A0However, there are a lot of systems that I've worked on in th=
e past
> and I expect in the future that, root being a small R/O system is necessa=
ry.
>
> initramfs can solve some problems, but introduces other issues. =C2=A0Man=
y of the
> systems I've worked on simple don't have enough flash to be able to store
> the bootloader, kernel and an initramfs [as well as other system items
> required by the devices]. =C2=A0In this case a base rootfs makes the most=
 sense.

In my opinion, what's proposed in the two links is a good thing even
for embedded. Not that we'd use that structure necessarily, but
removing the usr vs non-usr separation for binaries and libs is a good
thing regardless. Putting /usr in the rootfs still would still work
fine, or you could drop usr entirely and move everything to / the way
micro does.
--=20
Christopher Larson


