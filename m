Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDAF76FC9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 23:17:35 +0000 (UTC)
Received: by padhy1 with SMTP id hy1so10522415pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 16:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=mVwA4WwNieWyqDjkwccHBUyYT0vmsxjOav4dBHmxIAQ=;
	b=jHq8PewxHn5kTGh/qFjuPRAaIXzrbLXxyMlDmh5Vd+H4+ucosFY+7BTzDjx0rwN/vn
	udkBU5x+ktCnqR7yAxB4tyO7IF8Qw420BnHJ/CohMfJZHXMRPJXDkx6pHiTrXY8Q4MSg
	vL50JN2nZY4+MPTcLDhnVhln6xGTuEw3GNFJsVfX4ERtKBPKn1544PHVdXTxrmxHIxkb
	5ILN/gLY8xpMgAfqL+RlKJevLFWYVPd0mBzcCB3ghprUMqe5lYnu/P7th95bTa5A4V2a
	xCnPBcSlPdAJavM3EJTIK/OzkMapYdG/TiawndA6A0hpK4sQiPt0GLcOUIYNlPwTfiCi
	9BHQ==
X-Received: by 10.68.230.33 with SMTP id sv1mr51287177pbc.160.1441149455822;
	Tue, 01 Sep 2015 16:17:35 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:49fd:b69d:583d:d543?
	([2601:646:8601:4580:49fd:b69d:583d:d543])
	by smtp.gmail.com with ESMTPSA id
	k10sm19330689pbq.63.2015.09.01.16.17.34
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Sep 2015 16:17:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441137870.24871.11.camel@linuxfoundation.org>
Date: Tue, 1 Sep 2015 16:17:29 -0700
Message-Id: <6BBD8EEF-2579-4C56-98E2-BAC8B974E3FE@gmail.com>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<1441137870.24871.11.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Tue, 01 Sep 2015 23:17:37 -0000
X-Groupsio-MsgNum: 70453
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B0C8EE2C-0359-474F-8C18-7DB0598B6334";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B0C8EE2C-0359-474F-8C18-7DB0598B6334
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 1, 2015, at 1:04 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Tue, 2015-09-01 at 10:40 -0700, Khem Raj wrote:
>> I thought of bringing this up for discussions, I am seeing that, in
>> some pull requests some patches get dropped and I understand
>> that there might be a reason for that but that reason is not
>> communicated in proposed patch mail often. I have experienced with
>> some of the
>> pull requests myself and seen it with some others. I think we are not
>> responding to patches as it should be. Since we follow
>> just mailing list as upstreaming process thats the only channel that
>> developer is engaged w.r.t. patches and there should be a conclusion
>> on the mailing list itself for a given patch. So I would request to
>> whoever along with Richard is validating the patches and bringing =
them
>> to OE-Core from mailing lists to respond to the patches especially =
the
>> ones that are not applied with reasons why its not applied and
>> similarly to the ones that are applied but has been rejected by some
>> reviewers. It would also be good to document the commit criteria
>> somewhere, so developer can do rework and ease the pressure on
>> maintainers. Can we explore some tools that can help here ? May be
>> failed errors.yp.org output can be sent to list of developers whose
>> patches has been part of staging ?
>>=20
>> I think its extremely important to keep a developer informed and
>> engaged about the upstreaming if we want to encourage more voluntary
>> participation in the project.
>>=20
>> It would be good to identify where we have bottlenecks and how can we
>> improve upon the situation, ideas are welcome.
>=20
> The problem basically comes down to this. We have:
>=20
> * two people who put patches together into blocks and try and test =
them
> * a single autobuilder instance capable of running the tests we need =
to
>  verify a set of patches

will results from other auto builders reporting to errors.yp.org can =
create some confidence

> * test runs that take around 10 hours (substantially increased =
recently
>  by more test automation)
> * ever increasing expectations that OE-Core master doesn't break

> * ever increasing problems of 'random' autobuilder failures which seem
>  related to auto builder load


I understand these issues, however response would engage the developers =
and keep them in loop even if it is delayed.

>=20
> Put all this together and its turning into a nightmare to keep things
> flowing. The increased QA automation is catching a lot more issues =
which
> is good, but its also making the cycles longer. The increased load is
> also shaking out all kinds of races and qemu issues.
>=20
> There is a SWAT team who is meant to help try and take the load off
> Ross/I for some of the process. The processes there are being changed =
to
> try and better help Ross/I. I'd ask anyone reading this and frustrated
> with the patch merge process, when did you last help with SWAT? When =
did
> you last help with any of the random autobuilder failures we're seeing
> or with general YP bug fixing (not just bugs you yourself run into)?

I think there could be better message reports that can be sent to =
mailing list on auto builder failures. Many devs
may not know about the YP=E2=80=99s build schedules and nomenclature.

I am particularly talking about OE-core, many devs may not be involved =
with Yocto project activities, even though those
activities may improve the quality of OE-core. Its just the reality.
many developers may folks chimes in when it breaks them with patches or =
reports and thats not a bad response, It
would be much worse if they abandoned to use the project.

>=20
> One problem is that we have to test the patches in a block due to the
> long test cycle. If something fails, we can't know who broke it, that =
is
> up to someone's best guess so it can't be automated. Yes, you could =
send
> out block emails but those tend to confuse people. Heck, even getting
> the autobuilder to send email at all at the moment is proving
> problematic. I also literally spent two days last week trying to fix
> basic issues ensuring the autobuilder actually builds the revision we
> think its building!

I agree CI is not easy while you are also doing system integration =
iteratively.
while the build infra issues would remain, some of these concerns can be =
addressed if we were to use some code review tool
which can interface with auto builders and provide quick smoke tests on =
per patch bases, with sstate in place this could be achieved in minutes.

>=20
> We are trying to send out info where and when things break and we know
> the cause. Equally, some things have been removed as "best guess" and =
we
> sometimes forget to either add them back, or follow up with a reply
> about a likely failure they introduced :(. It comes down to simply =
being
> overworked. Equally, the work in doing this is to be quite honest =
pretty
> thankless and some of the lack of basic testing sometimes seen doesn't
> really help :(.

I think its because the process is quite manual probably, you could send =
an auto email to patch when its picked to a staging branch
and when its deleted/changed, many review tools do this automatically. =
=46rom personal experience I now believe that with a code review tool we =
can have lot more developers participate concretely in the code flight =
and since it provides good staging it scales quite well. So I would =
think using some review tool might help, at this time

>=20
> That all said, I will do my best to try and send more informative =
emails
> about patches=E2=80=A6

appreciated.

>=20
> Cheers,
>=20
> Richard
>=20
>=20


--Apple-Mail=_B0C8EE2C-0359-474F-8C18-7DB0598B6334
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXmMg0ACgkQuwUzVZGdMxTo9gCfb8OfcdxFdBFbPGW3wV7dvpip
ywwAn1MFhl2YQ2ZdH3qUZH1MfnagSUMF
=Tezn
-----END PGP SIGNATURE-----

--Apple-Mail=_B0C8EE2C-0359-474F-8C18-7DB0598B6334--
