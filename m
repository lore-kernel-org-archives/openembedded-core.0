Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SXWLD-0005hk-ME
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 13:36:27 +0200
Received: by eaal1 with SMTP id l1so2821462eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 04:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=eyVisKBXh9LQPjjKlREW5niPQqUf9ls5bjjnVFexy7U=;
	b=cOuZvFvlhNrIeUSaHF3WpqiYalKSJ3/6xOPqrZDXFOAQ6Jofvw05FpXI47H6yRRi/q
	2I8q881WuWvMlh+qFNeoz6HHo96KPdx4hwmpIepgRTRf4qvyPT6QNeoK4RPzbxNwIDQN
	elzPOlPM6tm4AfvXyrxOtw0EL5LBiUyYn3YO4TEkLdoiAj14B5Cg/6rJbTwGObiTAjEM
	uJrFjgzUqsxlLVxviXUMdRQsKexAyu8rWNGYgJgGKViwhSfuMJM48btMAMgUBlk093uf
	jLp/7qBZm2o/fu40OZ6MBw8aOuthGzjaACThRR5ftm0UllOxdKiUmfQMl5l0/pDhd5PZ
	y0FA==
Received: by 10.213.16.142 with SMTP id o14mr2109267eba.119.1337858776518;
	Thu, 24 May 2012 04:26:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z5sm138082870eem.3.2012.05.24.04.26.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 04:26:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FBD5E10.3070403@intel.com>
Date: Thu, 24 May 2012 13:26:13 +0200
Message-Id: <223B4521-59A6-42A5-9F1F-71B67C12B8E9@dominion.thruhere.net>
References: <4FBD5E10.3070403@intel.com>
To: Scott Garman <scott.a.garman@intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlaAVF/uVe6G3KvcoR9pF6QWjmqfzEk0I2nQzkFqQrWC2KXQ7ZqNBHSArzK3pChaqQ3spEh
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] RFC: Merging commits from into the main denzil branch
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
X-List-Received-Date: Thu, 24 May 2012 11:36:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 24 mei 2012, om 00:00 heeft Scott Garman het volgende geschreven:

> Hello all,
>=20
> As most of you know, I've been pulling commits into a pair of =
sgarman/denzil-next branches which are intended to eventually become the =
next Denzil point-release, 1.2.1.
>=20
> oe-core based branch:
> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dsgarman/den=
zil-next

Would it be possible to do that in the main repo? That saves people from =
needing to add and fetch yet another repo.

> poky based branch:
> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dsgarman/de=
nzil-next
>=20
> So far I haven't merged or requested to merge any of these commits =
into the main denzil branches of oe-core and poky, for two main reasons:
>=20
> 1. I've only performed the most basic build testing of these branches =
on a desktop system, building core-image-minimal and core-image-sato for =
our 5 qemu machines.
>=20
> 2. To date, we haven't had a clear process on how to transition from =
the maintainer's personal branch into the official repo branch. I'd like =
to develop a clear and documented process on doing this that involves =
community feedback on the commits.
>=20
> Just this week I've been able to start using the Yocto autobuilder to =
do more comprehensive testing of my denzil-next branch, so issue #1 is =
finally resolved, and I've got a green build to raise my confidence =
level:
>=20
> http://autobuilder.yoctoproject.org:8010/builders/nightly/builds/462
>=20
> So now to address issue #2. The goal is to incorporate community =
feedback, so I'm looking to get ACKs or NAKs for these commits before =
they go into the main denzil branch.
>=20
> My proposal is to send denzil pull requests to the appropriate mailing =
lists, and Richard can merge them into the main repo denzil branches =
once they've received review by the community.
>=20
> My goal is to send these pull requests about once per week, once I've =
managed to get a green build out of the Yocto autobuilder for my contrib =
branch.
>=20
> What do folks think about this? Now's your opportunity to offer =
feedback and influence this process.

You're missing a process for people to propose commits for the denzil =
branch. How about this:

	If you want to propose a commit from master cherry-pick it into =
a local denzil branch and then send if for review to the oe-core list =
with the [for-denzil] subject prefix. Scott will take care of putting it =
in the pull requests based on the feedback the patch gets.

What would be nice to have is a (soft) requirement to add the testing =
data in the commit e.g. "Runtime tested on beaglebone/angstrom". Not =
sure how to automate it, but pull-requests should include a buidhistory =
diff when possible.

regards,

Koen=


