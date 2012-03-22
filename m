Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAWRi-0007UG-BA
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 02:04:06 +0100
Received: by qao25 with SMTP id 25so48919qao.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 17:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=OzMoZgj0ixiM6mNiCUHXGDeReRblskaUe117wDpR7VI=;
	b=zLLfpZtMZQLurb2fWGeZo1XxU+wbRsoNBv+cWC06KZ5UBY1UDpuGtyL1WJ9fsAfYZh
	qZ4rlFe3mCQkT46cKBvITcKMKoKQuC0aUzeoIiRnv8IQCKhVtTbdzLKVsdgt4NnkKwVR
	HX5cboK1ZhE2uQZtEBxT6Un/5zsX5M/8L3pU9MGDTgs+zsLvKSYGxf2XmGG+Q2PL7A4B
	TeYX+brCZUlUWprWOeOw0WXWawkRjjiYawEj47qD1hPjWq6MV1KgIMx22awkp171SbK7
	mU1+mo3dFIwOVVEThG94GSI3/lY/XNa74ubW5hvdCmC6bekOmE94Un3Wsh808n/zIrGk
	jR6g==
MIME-Version: 1.0
Received: by 10.224.180.201 with SMTP id bv9mr8540289qab.69.1332377711564;
	Wed, 21 Mar 2012 17:55:11 -0700 (PDT)
Received: by 10.229.219.145 with HTTP; Wed, 21 Mar 2012 17:55:11 -0700 (PDT)
Date: Thu, 22 Mar 2012 01:55:11 +0100
Message-ID: <CALbNGRQzXtKdZ9AGCdeRU2LNfJrWmLH4g5DVVt9ak1qz2u_xDQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: systemd_unitdir's home
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
X-List-Received-Date: Thu, 22 Mar 2012 01:04:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

currently the meta-oe directory systemd_unitdir lives in
systemd.bbclass. This is suboptimal because some recipes not
inheriting systemd.bbclass need to know this location. Since oe-core
bitbake.conf is not the best place: Would it make sense to add

systemd_unitdir = "${base_libdir}/systemd"

in meta-oe's layer.conf?

Andreas


