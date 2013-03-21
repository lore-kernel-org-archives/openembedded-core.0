Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UIkMs-0002lY-7C
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 19:37:54 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so2425623pbc.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 11:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=BkLFXTD+R6zLmTfBRNuY90rK+ZKvX+8aw8f6hP2UBgE=;
	b=o5IjvnIZWCQhHhV5sBNL58XhG+zaYblTStceJBhe6m16z7NQcH7i2XyXQ0SKz7fkfT
	yQUUS/uNvL9Jjn+C7bRWvyfBXDFLSonY+2Ee03MfXId3ySWJ4VyJhZZpv8bg752apZUm
	Kxdw3zSu1//iL8QUPoreT3UTdFhx033V9x6aUAmBPKUsBIWOKFMo8wpHaZYdodtaon8I
	20cQzpG/xQfbCLFE0Qjm4Fk8JAZmnheSwjZlBixc9qmRBEINeol+Kd+7bq4itTTTdPMW
	rFLqPhup/yZ5urN5BlkCe+S6z0hcktWxH43q4QDkoai4/ahgC522fVCrAT+wPsfwh5ty
	Edaw==
X-Received: by 10.69.0.36 with SMTP id av4mr16035476pbd.126.1363890044947;
	Thu, 21 Mar 2013 11:20:44 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id ri1sm6930913pbc.16.2013.03.21.11.20.43
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 21 Mar 2013 11:20:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbXkrf=8ii=OfStD03jQXM_Rxy4baoshQ_VXttgydFgcA@mail.gmail.com>
Date: Thu, 21 Mar 2013 11:20:44 -0700
Message-Id: <E7E52452-31CB-497E-B1BE-35D9961884B4@gmail.com>
References: <1363816759-24737-1-git-send-email-obi@opendreambox.org>
	<CAJTo0LbXkrf=8ii=OfStD03jQXM_Rxy4baoshQ_VXttgydFgcA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: fix FILES_${PN}-syslog assignment
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
X-List-Received-Date: Thu, 21 Mar 2013 18:38:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 21, 2013, at 3:55 AM, "Burton, Ross" <ross.burton@intel.com> =
wrote:

> On 20 March 2013 21:59, Andreas Oberritter <obi@opendreambox.org> =
wrote:
>> This variable was assigned twice.
>>=20
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>=20
> Squashed into my pending systemd branch, thanks Andreas.
>=20

Ross, I have 198 update pactch in branch here

=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/sys=
temd-198&id=3D51d4993c7375a7339a3ee91cf6b24da25b2d9b50

this one is good. Other two I need to address comments
can you pick this one too into your branch ?
so I can ride with you

> Ross
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



