Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SXagu-0002na-Tu
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 18:15:09 +0200
Received: by eaal1 with SMTP id l1so2935938eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 09:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=94kQBmdnffyQdcgxX7r/ewC6mVhwo+PRuxo6GmJ1eOs=;
	b=GyvE6FBKzGu+C6gXTU0FWeEcLOlJn54cAyjR++Q9/oQvGFsHwTZ2lYJzcbnAr5EoZp
	VIXnuGNKvC4FFatHy5316Mj4tLGVi8b6R8s7TTjBkE0XlumLowpz7cMdbxbi7jlMpR9z
	BG1bwqH03SfUXjKJPcqeeNvI3maG3wyh86f70axAlXTwDscEqJ8a8getw3D9eJ5qLgS7
	pO9xTDleeGhOWTJ/rgCsLXxYc6KKR2pb5N2us6sPWc2tq+XPfhlNTkL8fCggz7W7uyty
	+2vMRHnj2kkW4MxNleoHlrJcpCpdY1aT1Q2x9V4K2S7mL9Hw7K6JBztlS64VpFz/DLVt
	ioeA==
Received: by 10.14.99.139 with SMTP id x11mr6763390eef.116.1337875497565;
	Thu, 24 May 2012 09:04:57 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v7sm2496721eem.6.2012.05.24.09.04.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 09:04:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FBE57CA.6010307@intel.com>
Date: Thu, 24 May 2012 18:04:54 +0200
Message-Id: <22FC307C-7108-4DDC-9671-23AA109E964B@dominion.thruhere.net>
References: <4FBD5E10.3070403@intel.com>
	<223B4521-59A6-42A5-9F1F-71B67C12B8E9@dominion.thruhere.net>
	<4FBE57CA.6010307@intel.com>
To: Scott Garman <scott.a.garman@intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmT+hA4A2px7oOxb5j06J6rbhK7Ws7fQemLwpZaYpZLnP/F4wzhHa4T++pZH+p94djm2IGk
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
X-List-Received-Date: Thu, 24 May 2012 16:15:09 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 24 mei 2012, om 17:46 heeft Scott Garman het volgende geschreven:

> On 05/24/2012 04:26 AM, Koen Kooi wrote:
>> Op 24 mei 2012, om 00:00 heeft Scott Garman het volgende geschreven:
>>=20
>>> Hello all,
>>>=20
>>> As most of you know, I've been pulling commits into a pair of
>>> sgarman/denzil-next branches which are intended to eventually
>>> become the next Denzil point-release, 1.2.1.
>>>=20
>>> oe-core based branch:
>>> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dsgarman/den=
zil-next
>>=20
>>>=20
>> Would it be possible to do that in the main repo? That saves people
>> from needing to add and fetch yet another repo.
>=20
> I can't start with the main repo, because I don't have commit access =
to
> it, and until I have done some significant testing with my commits, I
> want to preserve the ability to rebase my branch.
>=20
> However, now that I have some autobuilder resources to do more =
extensive
> testing, what I'm proposing is to get my *tested* commits moved from
> sgarman/denzil-next into the denzil branch after review from the
> community and a merge that Richard will do.
>=20
> That means the denzil branch will lag my sgarman/denzil-next branch by =
a
> certain amount of time, which I intend to keep down to less than a =
week.
>=20
>>> So now to address issue #2. The goal is to incorporate community
>>> feedback, so I'm looking to get ACKs or NAKs for these commits
>>> before they go into the main denzil branch.
>>>=20
>>> My proposal is to send denzil pull requests to the appropriate
>>> mailing lists, and Richard can merge them into the main repo denzil
>>> branches once they've received review by the community.
>>>=20
>>> My goal is to send these pull requests about once per week, once
>>> I've managed to get a green build out of the Yocto autobuilder for
>>> my contrib branch.
>>>=20
>>> What do folks think about this? Now's your opportunity to offer
>>> feedback and influence this process.
>>=20
>> You're missing a process for people to propose commits for the denzil
>> branch. How about this:
>>=20
>> If you want to propose a commit from master cherry-pick it into a
>> local denzil branch and then send if for review to the oe-core list
>> with the [for-denzil] subject prefix. Scott will take care of putting
>> it in the pull requests based on the feedback the patch gets.
>=20
> I can work with that. But keep in mind that if the request is not =
associated with a current bug marked for 1.2.1 in the Yocto bugzilla, I =
will need to see strong community support for including it (aka, =
multiple ACKs). This is needed to avoid scope creep in the =
point-release.

I think you're confusing oe-core with yocto=


