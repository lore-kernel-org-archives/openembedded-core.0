Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UPcnS-0006RI-FY
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 19:57:30 +0200
Received: by mail-pa0-f54.google.com with SMTP id fa11so3892256pad.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=+nXs1C/eXlBJx0qSFRji9Z2hVFqjjsx671WpdRPFMvg=;
	b=eAjbivK/N6AfHNkgQU98M0lcg1UYlsCQ4E9DIDcgz33RznxB4bT05V/IoIENmIM8yc
	u/7ONjlHu7gWgDSBMvGT5rE+FAb1QwvQBgJBfrlb4fmwbWRUxOMfmAfvReMbxIFBNYi7
	epkxZHaWnLLQSI7MoVtrno+Y/fY9NT1AnbqKyxs5fnFtAnRyR11eSeTGNzRoHOhZfLTV
	LzFx8RIbM/jIxrdb86vRR9nLviLvNL/erS8Yliqph4WjK0UGCGp1xLIQTe5NVCCQSlO3
	69d8kyTQqX/APf88zgf5Z1LkcPVggph5Vn/Eb0HXlB/JX3mRZvd62KBseFDgq03j5NM4
	Awtw==
X-Received: by 10.66.232.97 with SMTP id tn1mr41884451pac.121.1365529209266;
	Tue, 09 Apr 2013 10:40:09 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id dg5sm2983201pbc.29.2013.04.09.10.40.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 10:40:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHUNapTSbxqXuj7LOsNSrZL5Ank+ngvkXF=cnhvM7aUK-DQZZA@mail.gmail.com>
Date: Tue, 9 Apr 2013 10:40:06 -0700
Message-Id: <D6F0C55F-CFD3-4E80-9F13-FD3DADF5DDFF@gmail.com>
References: <cover.1365179842.git.pkj@axis.com>
	<a20f68229f1499d9020bd9cd8dc593e5f6635967.1365179842.git.pkj@axis.com>
	<CAHUNapRCw6pqVL1MfSkPqDZQL-adp-AHQba8+nGTPoi44BTguQ@mail.gmail.com>
	<3664366.6RB48HkoAG@helios>
	<CAHUNapTSbxqXuj7LOsNSrZL5Ank+ngvkXF=cnhvM7aUK-DQZZA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] oe-buildenv-internal: Only add to $PATH if needed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 17:57:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 9, 2013, at 10:29 AM, Trevor Woerner <twoerner@gmail.com> wrote:

> On Mon, Apr 8, 2013 at 1:48 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> Unfortunately I think this is specific to bash, so it may not be =
portable.
>> Maybe the equivalent can be achieved with sed however.
>=20
> Under which shells do we expect a Yocto build to succeed? The latest
> version of this change wouldn't work under tcsh, for example. (Not
> that I'm suggesting it should!) Isn't there already an inherent
> Bourne-ish expectation?
>=20

well we try to not depend on bash or any other shell. e.g. I can use =
dash with no problems



