Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8E773943
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 16:03:38 +0000 (UTC)
Received: by paceu11 with SMTP id eu11so59731066pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=efVIDqnTSqvMrdvkF/ggJ7DQziW9oJcOScspgw458OA=;
	b=dhUsO3WBwHvVrnAZx9hgUvyx2mZyqBV7KCGSQb1otia7T5aQHtVsZ/ZCOOSRbv7qID
	sN436MGmNe1d5Crlb5DeYp0gkyNLZb1IZ504UmCom5OVxqJOzeTwhe/NX8jALazDMqES
	Ep2s40lA9BpghyhnW+Cd8AVHqIF4pD1N+aLDcMFkLhjvKYNI91nyd0jk+q75bWiy6tdE
	SyBIX/PV9lkw0/Ix2sxeFtAmEtnv0Mm17Hndw051wm5c95lb09m0FPK+P8ZF+IY3mv+K
	RzJQUCLjT3l+0G1VhqMZYNKiARIhKu3ABEPjMcEXyupfPNmMDMtxjnyCXMM4ry3y7fiP
	SMeg==
X-Received: by 10.66.175.107 with SMTP id bz11mr54273770pac.91.1425917019735; 
	Mon, 09 Mar 2015 09:03:39 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:5dec:324d:fc8d:ab4d?
	([2601:9:3580:84c:5dec:324d:fc8d:ab4d])
	by mx.google.com with ESMTPSA id
	xh3sm20015272pab.25.2015.03.09.09.03.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 09:03:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <a27ea935811250778c8d581dbe107a7151b2ac5f.1425885208.git.liezhi.yang@windriver.com>
Date: Mon, 9 Mar 2015 09:03:38 -0700
Message-Id: <C089D3E9-4157-4FCA-B39D-7A3FF80B97D2@gmail.com>
References: <cover.1425885208.git.liezhi.yang@windriver.com>
	<a27ea935811250778c8d581dbe107a7151b2ac5f.1425885208.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] net-tools: fix SRC_URI
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
X-List-Received-Date: Mon, 09 Mar 2015 16:03:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 9, 2015, at 12:15 AM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
> -SRC_URI =3D =
"${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=3Dtarba=
ll \
> -           =
${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=3Dno;name=3Dp=
atch \
> +SRC_URI =3D =
"http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/n/${=
BPN}/${BPN}_1.60.orig.tar.gz;name=3Dtarball \
> +           =
http://snapshot.debian.org/archive/debian/20130511T214653Z/pool/main/n/${B=
PN}/${BPN}_${PV}.diff.gz;apply=3Dno;name=3Dpatch \

it would be nicer to use =
http://archive.debian.org/debian/pool/main/n/net-tools/ instead of =
snapshot.debian.org through out this series=

