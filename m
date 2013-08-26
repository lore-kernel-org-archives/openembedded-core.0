Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 83F7F60990
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 22:45:16 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id q10so4024419pdj.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 15:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=2CO9lPhfU3uAGl0GcsjRzfc4PNI0aFcM7veZ0deOwjY=;
	b=VI1Khw1gtnUHBSCsxmL5NnxFdneP/+vfDdv3RCNKoRSOvXjb0pXASC1ys2oKnHy//0
	53FH7sWQnmenAGv572b5MFzqGyLuPu1oCgInF+F40T396xm/UOqycHZ2WTQC4nRRpBp0
	KYhoGhJm4rYB9pKrZwKW94IhJ85PcML2JSr8VBZirM+9OsKsmmX102USlmbEHDJ8Yzn7
	4oUC0/92dpNLZfkgMn3n+qj6x55Wp+MROrAnr+wOo66+N1vXz82IeCKhwzC7TD/9UoIx
	kNEJ9hdCecRvvPFNuhfiPtCgJ6ulILQuYVXVeXCYeZyqVyxc1J/+MynZr2bTAw7io+Dh
	3i7Q==
X-Received: by 10.69.12.36 with SMTP id en4mr17694831pbd.54.1377557117364;
	Mon, 26 Aug 2013 15:45:17 -0700 (PDT)
Received: from sa-nc-common2-240.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	mr3sm20326107pbb.27.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 15:45:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <F8679751-F1B9-4AAD-A1EB-BDD909C90B3F@gmail.com>
Date: Mon, 26 Aug 2013 15:45:29 -0700
Message-Id: <7ED625B0-786B-4BCE-A043-D53C9A6F0162@gmail.com>
References: <cover.1377145501.git.raj.khem@gmail.com>
	<39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
	<5216888A.6050200@linux.intel.com>
	<DBCC9871-A9D3-438D-95B2-7F6797313633@gmail.com>
	<5217C7FA.7090703@linux.intel.com>
	<F8679751-F1B9-4AAD-A1EB-BDD909C90B3F@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] kmod: Upgrade to version 14
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
X-List-Received-Date: Mon, 26 Aug 2013 22:45:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 26, 2013, at 2:22 PM, Khem Raj <raj.khem@gmail.com> wrote:

>> Machine are CentOS 6.4, Debian 6.0.7, but it worked on my F19 and =
Ubuntu 12.04 machines!
>=20
>=20
> I do not have access to Centos or debian to be able to reproduce this. =
If anyone has it please help in debugging it further. will try to =
offline try to poke around and see if I can get at something.
>=20

The reason I think is that _Static_assert is too new a feature for gcc =
shipped with these distros, it was introduced
in c11 standards. So I have created a patch to define an equivalent for =
kmod-native and update the pull tree. However
I have no way to test it out quickly. I have made sure that it does not =
break the build on Ubuntu 12.04+ give it a
shot and let me know how it goes. =20=

