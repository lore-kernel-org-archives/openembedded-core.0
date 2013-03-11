Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UFBun-00045G-FS
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 00:13:59 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so455085dak.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 15:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=VUIlSiMg/ThHHn6wC+AuDj+eCRTWPticu1R8oZxiImk=;
	b=yuLHD+mW93JNEn2VFrf55vxuQt8bAkhwhzucMyOxs0ymrmaXRM+79Gz8q/nTzUm/UF
	rQvfE9ci1N2gFYEzKJmjQwZ6kuGNr2Tt0OAH5nv3NvQ4ZQgIk7orlxzrYP9gleDOoJeU
	jM2RND2VJQ99JSNsFk8kNNVyGUobDZWjEO+E3Yxf0U1783FXL95RO6kKi5VwLXsaPl1R
	68VK4wOkWTcSOJe5fbYCgUeXoiCirAkA7oGHrJc2rbSjJZhZ9w4X3pVAcNcNL4OcQPE7
	4YKSQqM7atkepNBiBQAfr09GUFytcVSu4HcGZuwO1l6bgUG0oPUnITEa1DPggXY5X/V1
	36Fg==
X-Received: by 10.68.138.225 with SMTP id qt1mr25377907pbb.82.1363042638133;
	Mon, 11 Mar 2013 15:57:18 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id zm1sm22201032pbc.26.2013.03.11.15.57.16
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 15:57:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0La30wR3sLJfc+7QckZdqXzugAJctZJHVDEbXQosKuuVKg@mail.gmail.com>
Date: Mon, 11 Mar 2013 15:57:14 -0700
Message-Id: <5DABFFAA-FF18-47E9-86AA-C4CF0458BA3F@gmail.com>
References: <f805a0ed9311848da0a412346bc8c0baf8473d2e.1362873102.git.raj.khem@gmail.com>
	<8f815c617b69812e749a5a197a3903fe8daaf645.1362873102.git.raj.khem@gmail.com>
	<1C3733EF-6163-4090-949C-5B73BBE02DEB@dominion.thruhere.net>
	<CAJTo0La30wR3sLJfc+7QckZdqXzugAJctZJHVDEbXQosKuuVKg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1499)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] systemd: Package hwdb data
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
X-List-Received-Date: Mon, 11 Mar 2013 23:13:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 11, 2013, at 11:15 AM, "Burton, Ross" <ross.burton@intel.com> =
wrote:

> On 11 March 2013 07:00, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> It's a udev hwdb, so calling it systemd-hwdb would be very =
misleading. And aren't you missing a RRECOMMENDS?
>=20
> postinsts to run udevadm --update would be useful too (I've got these
> changes in my branch too, but this network is trying to stop me do any
> git pushes).

If you have this taken care of then I am willing to drop this patch.

>=20
> Ross



