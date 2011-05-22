Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QO106-000432-5u
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 07:14:50 +0200
Received: by pxi6 with SMTP id 6so3610248pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2011 22:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:references:in-reply-to:mime-version
	:content-transfer-encoding:content-type:message-id:cc:x-mailer:from
	:subject:date:to;
	bh=mHqG115D0hJFo+RzOEYWfkRHfcsRXNe3rjOJYWwNDcA=;
	b=p9akOCozhDlmtJvpCZtDCoxbLWoLeEERNEnGwvWp3Wv59GvKpnAxXPWk8d05RnBBr4
	RwP+4vVSqa0cLuq7Pu/2DRw6bvCBwrQVZV+dA94p9N1AqM/+QiW9etFbDPQmo4F+n1QP
	K6fLX1uY6UlB5kjK6I0DhJfD6PaV8rzq7meE4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	b=KprWWXlp5L0kpOcAI5hXg/TM8Ea9i2S8cNSoqavyvca4pRLmhoZx9ZdqKxXAIPDgT3
	y8j6qPyOY63WsOfJdzh5VdjHOHCPw8WjvJ+sHnoOjt/MbJxe4IgDoOloURNbvZ6GVdXp
	FArklgnugOTjzeIAacygdnUlcUoAZW/TdY6cY=
Received: by 10.68.32.10 with SMTP id e10mr1438620pbi.408.1306041107394;
	Sat, 21 May 2011 22:11:47 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 3sm3517292pbd.100.2011.05.21.22.11.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 May 2011 22:11:46 -0700 (PDT)
References: <cover.1305580484.git.sgw@linux.intel.com>
	<674a00cdafa9b97a66d1139ce2279c3b8f660299.1305580484.git.sgw@linux.intel.com>
	<BANLkTimLuL1MRqK_xx+bsjrQZf0MDJO=1w@mail.gmail.com>
In-Reply-To: <BANLkTimLuL1MRqK_xx+bsjrQZf0MDJO=1w@mail.gmail.com>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <2EE92FB6-7C05-4E5F-BF51-110A26874884@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 May 2011 22:12:12 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/14] perl-native: create_wrapper on perl${PV} too
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
X-List-Received-Date: Sun, 22 May 2011 05:14:50 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On May 21, 2011, at 4:57 PM, Leon Woestenberg <leon.woestenberg@gmail.com>=
 wrote:

> Hello,
>=20
> On Mon, May 16, 2011 at 11:44 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> From: Tom Rini <tom_rini@mentor.com>
>>=20
>> perl${PV} becomes hostperl when building for the target so we need a wr=
apper
>> on that too.
>>=20
>> This is 1e255fbd296e95ff178d66c4a1fe4875a988d7e1 in OE.
>>=20
>> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>> ---
>>  meta/recipes-devtools/perl/perl-native_5.12.3.bb |    1 +
>>        create_wrapper ${D}${bindir}/perl PERL5LIB=3D'$PERL5LIB:${STAGIN=
G_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl/'
>> +       create_wrapper ${D}${bindir}/perl${PV} PERL5LIB=3D'$PERL5LIB:${=
STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl/'
>>  }
>> --
>=20
> Heads up:
>=20
> Andreas Mueller today reported that this commit breaks his perl build.
>=20
> See http://article.gmane.org/gmane.comp.handhelds.openembedded/45640
>=20

http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=3Da10bd9=
76f4cef54ac50b0c82f885c17a26e5989f

Has already fixed it in oe-core few days back
> Regards,
> --=20
> Leon
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


