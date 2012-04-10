Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHXGC-00009p-Ud
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 11:21:12 +0200
Received: by wera1 with SMTP id a1so3071798wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 02:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Eh08j4pT1RXNk22LBo1JM2N2ClVVLcfJBXgWVCk4hXE=;
	b=ZfmSOWTWCFCNoxVhTHolkhbSJKzwdJz7S0ZaZVhOcOKlv+FDINpYapYHvPosfvHu5T
	cedjLEPeLCGf685Y0VdbV5h7eAENdo0uoyNYxU5qC941tX3K3fBJ68f3Y/+qvQt5CANJ
	v86Cb8mIUTo78jr0Ojq8aMgv/nj5Z+XgNUeGuRZjtBd2jtUZLjq4bRYfS3h/8qQvagre
	uASqUDAL7OxSDtoTA0oiP/uit7VF5a/sozv/94perQ3T6Iz3pKrnfuyrRk2dnnXuF6jE
	e4esczVU8sneQJR/z6JODz3oY8ldy5DarRSB+Ml8xLojWD7CEdRFxR4m5BCVDPvzi6IK
	Ohxw==
Received: by 10.180.96.228 with SMTP id dv4mr5089874wib.14.1334049115183;
	Tue, 10 Apr 2012 02:11:55 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b3sm36392723wib.4.2012.04.10.02.11.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 02:11:54 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334048766.6861.2.camel@ted>
Date: Tue, 10 Apr 2012 11:11:52 +0200
Message-Id: <A5A4632D-2BD8-486E-A7E5-BCBA23334368@dominion.thruhere.net>
References: <20120406001738.706A810217@opal>
	<20120410083815.GC3583@jama.jama.net> <1334048766.6861.2.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkJ7KE1AWulQ3c4ocby+LnQcxtqL76Lf7yN6FmoP536XE8IoxE8W2LkSUxX4Yi8z3VwpzIC
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Gherzan : gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/ gdbm
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
X-List-Received-Date: Tue, 10 Apr 2012 09:21:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 apr. 2012, om 11:06 heeft Richard Purdie het volgende geschreven:

> On Tue, 2012-04-10 at 10:38 +0200, Martin Jansa wrote:
>> On Fri, Apr 06, 2012 at 12:17:38AM +0000, git@git.openembedded.org =
wrote:
>>> Module: openembedded-core.git
>>> Branch: master
>>> Commit: e4d2ee00419f675ba8b7fb5d75256762253d8b32
>>> URL:    =
http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3De4d2=
ee00419f675ba8b7fb5d75256762253d8b32
>>>=20
>>> Author: Andrei Gherzan <andrei@gherzan.ro>
>>> Date:   Fri Mar 23 17:56:29 2012 +0200
>>>=20
>>> gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in =
include/gdbm
>>>=20
>>> ndbm.h is needed by python for dbm module. This is why =
-enable-libgdbm-compat was added
>>> to configure.
>>> The second change is because python is looking for the gdbm headers =
in include/gdbm.
>>> The easiest way to solve this issue is to add symlinks in =
include/gdbm.
>>>=20
>>> [YOCTO #1937]
>>>=20
>>> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>>=20
>> This breaks every package in feed which depends on old package name
>> libgdbm4 (>=3D 1.10)
>>=20
>> Because now there are 2 .so files in ${PN} and no LEAD_SONAME =
defined.
>>=20
>> Are you going to=20
>>=20
>> 1) send PR bumps to all packages which depends on libgdbm4
>>   (e.g. apr-util python pulseaudio perl gst-plugins-good and probably =
more)
>> 2) define LEAD_SONAME and bump PR in gdbm recipe
>> 3) move -compat libs to ${PN}-compat or some other package name, so =
that
>>   old libgdbm4 still exists (and maybe + 1) because some people could
>>   build those with gdbm as dependency now)
>=20
> I like the idea of putting the compat libs into a separate package...

me too

regards,

Koen=


