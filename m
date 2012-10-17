Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TObVz-0005Ai-CZ
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 23:50:59 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so6676395pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 14:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Y2RJ4fZYIZmpl50FWVXfbbbQvEqLnj8hWsxw1GpZRWs=;
	b=A4jwvT3jxvkgvFPmW1bgYHL4WSl+cNTp8SmwNzGaK0ZzN4d+EY/1V9RQdUukE09Axr
	mLILFtZNIWL73Mduo2eBu/mlY3hHMotU4sVa7RcIaIFUz7zz+7Axmb3XW/oVXxxLnoUP
	+4Tptmw5tlh37z16ZKhfTGdpQKlQ7mGYXK9vk0ufHqO2JQtH8O3/hW3LH2DYXWDyovvT
	S2O4mQQcQPNj/MTM34azecUGqCqpvLndCLRq6Qk2XCk+Yb2vxPeZWR7Agxw5CRULUaxN
	6AEB+k2sD7JbcV81UpLb0vz+R2VlMSynFEMuA++AXU56kJQ/8mWrNCZIp7zvcZOUZo97
	vajQ==
Received: by 10.66.79.195 with SMTP id l3mr53741259pax.33.1350509860176;
	Wed, 17 Oct 2012 14:37:40 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	w4sm13160873paz.38.2012.10.17.14.37.32 (version=SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 14:37:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1350509329.2185.136.camel@ted>
Date: Wed, 17 Oct 2012 14:37:42 -0700
Message-Id: <9A7DA54D-2FD2-4E5A-A055-81401A1481F8@gmail.com>
References: <1350500844-10356-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKpprdTNmgJCZvir9jM7mnpS9RN17G_s=mbNW0RL4ZvQww@mail.gmail.com>
	<1350509329.2185.136.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1499)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFT][PATCH V2] eglibc-2.16: Use tar ball instead of svn SRC_URI
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
X-List-Received-Date: Wed, 17 Oct 2012 21:50:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 17, 2012, at 2:28 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2012-10-17 at 17:42 -0300, Otavio Salvador wrote:
>> On Wed, Oct 17, 2012 at 4:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>        Adapt the recipes to fetch a tarball.
>>        Tarball is generated from latest 2.16 branch
>>        which has e500-math_private.patch already applied
>>        hence we remove that patch.
>>=20
>>        Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>=20
>> What the motivation to move to the tarball?
>=20
> svn:// recipes depend on subversion-native. Having switched to the new
> ubversion version, we've in a nasty position of it being hard to
> ASSUME_PROVIDED with the API breakage.
>=20
> Building subversion-native is a pain and delays the core part of the
> build significantly. Switching to tarball recipes should improve our
> build speed a lot.
>=20
> So its mainly for performance reasons that we should do this.
>=20
> My only question is whether we need to include the svn revision in the
> tarball name?

may be yes thats a fine idea, I thought I would do it but it slipped my =
mind
I think its fine to rename the tar files the revision they are generated =
from is
21224. I will ask them to be renamed.


>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20



