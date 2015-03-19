Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id C645665CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 17:48:26 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so72005245qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 10:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=vlEPsHt6yxy3xMP/hm4DgRF4eOdPILWI9q3yIWG7NOQ=;
	b=DW6rtg5Wq9hVuNOpZaOvsZDBiS9Cb7p5AjEmi6deY2RqresWHOgFaobbeysuYKtsNd
	zpNVez9HU4fCQ3k1HfxKJiHp0oXh3vbr27DIH+Ipe5WJ3rtO9glE4XVHiHwdtzqO0iS9
	010fbaRqz0pEOUsFK/PfLGILMwy7m1FQgeYf0J29BNyIlv1o9+JtJNkz/EP3SemKJbEX
	tf6i/kQKsbh/p3acyIUSpVYrKDwcxwgIY9IDhiPRzUh5bgV3IPS/KZs/fDAcuIWbDZ6U
	32i9C7R78wLZHunhCMun8IMSuV5KecP4QGKGfpDUjlc38rL0w9iohjJjrMLj5VwbiYAS
	PJ5w==
X-Received: by 10.140.97.203 with SMTP id m69mr94719420qge.39.1426787307857;
	Thu, 19 Mar 2015 10:48:27 -0700 (PDT)
Received: from 10.25.255.72-ra01.westchester.pa.bo.comcast.net ([68.87.42.115])
	by mx.google.com with ESMTPSA id a77sm1250728qkh.42.2015.03.19.10.48.26
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Mar 2015 10:48:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84776A1D91@ALA-MBA.corp.ad.wrs.com>
Date: Thu, 19 Mar 2015 10:48:32 -0700
Message-Id: <FA76AC4C-F70F-4BE2-BB65-A2F781911D98@gmail.com>
References: <1426718042-18369-1-git-send-email-jslater@windriver.com>
	<CAMKF1so99EyEXQhDT9kp+NPp1Zu0HHWMov6-wJU3MV5bUksnxg@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84776A1D91@ALA-MBA.corp.ad.wrs.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ltp: find all .debug directories
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
X-List-Received-Date: Thu, 19 Mar 2015 17:48:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 19, 2015, at 9:44 AM, Slater, Joseph <joe.slater@windriver.com> =
wrote:
>=20
>=20
>=20
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Wednesday, March 18, 2015 4:37 PM
>> To: Slater, Joseph
>> Cc: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [oe-core][PATCH 1/1] ltp: find all .debug =
directories
>>=20
>> On Wed, Mar 18, 2015 at 3:34 PM, Joe Slater <jslater@windriver.com> =
wrote:
>>> INHIBIT_PACKAGE_STRIP =3D "1"
>>> +# However, test_arch_stripped is already stripped, so...
>>> +INSANE_SKIP_${PN} +=3D "already-stripped"
>>> +
>>=20
>> Can this be avoided in the component make system instead
>=20
> Do you mean not strip it when we build it?


yes

>  I hesitate to have some named _stripped
> not be.

?

>  Since nobody seems upset by the current qa "error", I guess we could =
also
> just ignore it.

I think it can cause debugging gripes. So its good to fix it

>=20
> Joe
>=20


