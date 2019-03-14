Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 9DEA07C40C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 16:29:23 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 6C7E2134644;
	Thu, 14 Mar 2019 12:29:24 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id nyjOJEHNgSaT; Thu, 14 Mar 2019 12:29:23 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id D3D4B134635;
	Thu, 14 Mar 2019 12:29:23 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com D3D4B134635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552580963;
	bh=mzTA6IiJtJrxVirYGcIMBIrr9uadNGOor8SeqC0B3mI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=CESXSAT34r5qwSYAzepfd+t8mh/juL/EybQ41ZlywD+zkLvtGyPC92K0qMTCl63X+
	TparoPn2twRyqEPz+uK1Shx/ERpR7HRk8g+HMv19de9tSlOOO+b4Wh6H+P7ZCSibe4
	/sxUdVzPrfQyiRcdgOhbnkLQyMkJNE84aCcOJacV2c2dPiHRxqH4w34ruz5LsPFP5S
	IEC9fkfEO24/kvw6kMOKLbPBTFeEdy4yFX0zfhrzf6wj4GUlGpfLNAvfzN6qy43an7
	QkuewogfjENjfT4pRMIJVgnc835ITfD7sBuqlR7+tXNu7rUGV89Sl2rfeMMcHk7SsF
	nHeUmyym/ovGA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id 6VSOPp1TjsFK; Thu, 14 Mar 2019 12:29:23 -0400 (EDT)
Received: from joraj-alpa (192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id AB71413462B;
	Thu, 14 Mar 2019 12:29:23 -0400 (EDT)
Date: Thu, 14 Mar 2019 12:29:23 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190314162923.GF14253@joraj-alpa>
References: <20190313205555.10007-1-jonathan.rajotte-julien@efficios.com>
	<20190313224749.GC14253@joraj-alpa>
	<cd83f247-3a1e-64d9-bc76-e0c05b4745f1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cd83f247-3a1e-64d9-bc76-e0c05b4745f1@gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Thud][PATCH 1/3] lttng-ust: update to 2.10.3
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
X-List-Received-Date: Thu, 14 Mar 2019 16:29:23 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Disregard this series. It does not follow the project guideline regar=
ding recipe
> > update for stable release.
> There are exceptions when a package update is a bugfix only change. I
> know the kernel, openssl, bind, curl and a few others fall into that
> category. Many minor version updates tend to be=A0 bug fix only but tha=
t
> all depends on the upstream project policies. Binutils does not follow
> that scheme as they add features in minor version updates. This is what
> I know from personal experience. What helps the project along with the
> maintainer is=A0 having a brief summary of the changes in the commit
> message. I am at the mercy of commit message.

I get that. I assumed that most project are *sane* and stick to something
similar to SemVer. Sorry for that.

We follow SemVer [1] for the following projects:

    Babeltrace
    LTTng-tools
    LTTng-ust
    LTTng-modules
    userspace-rcu

This series contains only PATCH level update (MAJOR.MINOR.PATCH).

You will note that the lttng-tools recipes was not updated to the 2.10.x =
release
in this series.

Side note, as a project (lttng) we recommend that lttng-tools and lttng-u=
st be
upgraded in lockstep (MINOR =3D=3D MINOR). But since we also conform to S=
emVer there
is no problem using an older MINOR version of lttng-tools with a newer MI=
NOR
version of lttng-ust. The other way around is not recommended and will si=
mply
not build most of the time.

lttng-modules is *special* since we fix thing to allow support of
newer kernel as time goes by. Again, we do not add features across PATCH =
level
release.

Still, I think I understand a bit more the constraint oe-core and yocto s=
table
branch are facing and would not mind if the recipes stay at the version t=
hey are
now.

[1] https://semver.org/

>=20
> Can you confirm this is bug fix only update?
>

Yes it is.

Cheers

--=20
Jonathan Rajotte-Julien
EfficiOS

