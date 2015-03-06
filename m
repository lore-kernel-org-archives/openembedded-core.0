Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 752FE738CC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 09:28:02 +0000 (UTC)
Received: by pdbfl12 with SMTP id fl12so42587495pdb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 01:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=HB6wbz1npx9SLZt2DHXLKdnybX2PicuW8OwrHXQvToo=;
	b=X09n8a9qkJY/lM0HBx7iJ2ZDkoZEwSzzRIeJU6NAF0H57fLFZda2Zunk0SOOJg6jDN
	/HSQWgF6jabR7EdG0TfYK0JnDNxKXJEAfswzaZpJDN84A/A3/milXlJ+U0TqvR3BNB71
	MkARlGB+N8G507vWgcM3VPC/fj3N2/TIAPfQ4SChimJWp0pjcNAN9agWujr4hKPz5UGx
	3qCDIuLiQKqwz2ZKccZ0NlAkUBslNpgrkkdgz8pIxIE++5EDWCUZ/o7AHNOh3TCIxRlH
	72BrtjO/RF2SMGI+u1davVI5IEGLyRr9GSNot609t3zCR5PoFhl3d4mOchsH5pMDYmhr
	JIlg==
X-Received: by 10.66.142.131 with SMTP id rw3mr24146997pab.34.1425634083246;
	Fri, 06 Mar 2015 01:28:03 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:c942:8a96:3860:e4e6?
	([2601:9:3580:84c:c942:8a96:3860:e4e6])
	by mx.google.com with ESMTPSA id bc4sm9154674pac.4.2015.03.06.01.28.02
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Mar 2015 01:28:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <54F7FD57.6000601@windriver.com>
Date: Fri, 6 Mar 2015 01:28:01 -0800
Message-Id: <1C7909EB-9E59-41C3-A3C3-3550FDAEC754@gmail.com>
References: <1424759999-25846-1-git-send-email-raj.khem@gmail.com>
	<54F7FD57.6000601@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glibc: Help compile with -Os
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
X-List-Received-Date: Fri, 06 Mar 2015 09:28:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


> On Mar 4, 2015, at 10:53 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
>=20
> Hello,
>=20
> I get errors when:
> MACHINE =3D "qemux86"
> DEBUG_BUILD =3D "1"
>=20
> $ bitbake glibc


We use -O  ( which is -O1) when we do DEBUG builds. So same logic as -Os =
needs to go for -O as well.
I will send a patch over weekend if no one does it before that


