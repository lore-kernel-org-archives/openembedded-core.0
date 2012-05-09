Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SS9H2-0002i8-28
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 17:57:56 +0200
Received: by eaal1 with SMTP id l1so169576eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=oZ5biYDAsTlF5lOeUnLIXt+iDDtCCVSWGZi725Axe6M=;
	b=ByiqPNpw9lxeucMVUOy4HQA5mboO4D6Ia7hYQc8BBeHCLYd+BvzG0bCHrW3ivCLDrZ
	4GPpO04lxOYJ9jGQrSe9QQ4DNxj9cna/3udmYPoE2U1lroB/DSyqznWbnwgoShCFJpBk
	TWAQqECRfUyJ7lI3RLi7dGQmBAqBVs1gfMx3V0jYO9rjHfViFf5J4qj4fNPrBfoYa9LZ
	QTnWBauSB5QXlLrYT/3v3CQO8OXAv13MH3KFSFIBkQrqd5+/ySpUZcskbzWETC5FuqOy
	uf/2tqrVDDjTLPpYJe42a0SKuoCKTg4r4cQyiwz51HmRMqseN1WfB9/b0F6w8CQ6DPDg
	mYmA==
Received: by 10.213.20.200 with SMTP id g8mr706836ebb.103.1336578483318; Wed,
	09 May 2012 08:48:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 9 May 2012 08:47:33 -0700 (PDT)
In-Reply-To: <4FAA8415.40006@windriver.com>
References: <cover.1336524034.git.raj.khem@gmail.com>
	<fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
	<CAF6bG8f21=Pcxjt3-pPemiBiF0TqPT2e8snxry_7VQWGa5BcNw@mail.gmail.com>
	<CAMKF1so-48aBWL7VytBmtuQt8rhdp6x05r8oJT5RZ3CB8cnrNQ@mail.gmail.com>
	<CAF6bG8fr9fMQjd4Gxt9uukj=UKDHUxyhmptTiZOM1EPeW8qcqQ@mail.gmail.com>
	<CAMKF1sp0-We3JrGue+J-scDv0JCOHg5O44G9AZaPO3xfzNO2AQ@mail.gmail.com>
	<4FAA8415.40006@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 May 2012 08:47:33 -0700
Message-ID: <CAMKF1sp2x-JmNkx4+Exg=jFndVk_mfTfvNLO7DrUB-KhZPqbGw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] uclibc.inc: uclibc rtld does support GNU_HASH
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
X-List-Received-Date: Wed, 09 May 2012 15:57:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 9, 2012 at 7:49 AM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> The per-file "advanced" dependencies, which are not yet being used by ipk=
g
> or deb, include a marker for rtld support. =C2=A0The libc on the system n=
eeds to
> have a provide that it supports GNU_HASH, otherwise a missing dependency
> occurs and the system knows the package and libc has a mismatch.

I would assume that this was needed when transition for sysv hash to
gnu hash was going on. Now that GNU_HASH is default in OE for long
time this kind of
makes it redundant unless I am missing something w.r.t. advanced dependency
support. What is it exactly doing ?


