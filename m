Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 53DB76BA53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 04:49:22 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id fz6so4323691pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=UqLRsjMHfhVUJ996KEtd+emsAxqfsS4dFU4LPS1c7KY=;
	b=HBpkcO/JGpXwtXC+vpdbEMa2+35HCb1D6/Ew2f5fpWkNfzPMGcxgnzhuHFq+4o8z5F
	4Pz+aQB2r5F7UaN48bBEncmvs5FWf65XKq6knqBrLjxfbxLytb9fwDY/wRdyicgc0Htq
	5YPw9Im2Fj18uRpS1UpSj3HTYP4dn7HEZQqJ0XMz07oRLTGYyHlKy44VR4quMavHIhfJ
	ApHhHYmxX73IvfDvDV/2yoaWbJlirWTqVH8tu5VZooEzeKQhC3lXjfZKbetFk1up8L97
	A4AbreoQ3O3J8Mq/zMsFyUbJ4M2LNkfWNE+Fb2gyecBA/Rc6HLZSmEPJkcJxDJIzt/qm
	6RPg==
X-Received: by 10.66.150.41 with SMTP id uf9mr18323740pab.108.1377578962522;
	Mon, 26 Aug 2013 21:49:22 -0700 (PDT)
Received: from sa-nc-common2-240.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id s5sm21852406pbo.38.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 21:49:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <521BDF02.8010006@linux.intel.com>
Date: Mon, 26 Aug 2013 21:49:35 -0700
Message-Id: <BB5BF48C-4CF4-480B-BABE-AB1E19D9A0F4@gmail.com>
References: <cover.1377145501.git.raj.khem@gmail.com>
	<39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
	<5216888A.6050200@linux.intel.com>
	<DBCC9871-A9D3-438D-95B2-7F6797313633@gmail.com>
	<5217C7FA.7090703@linux.intel.com>
	<F8679751-F1B9-4AAD-A1EB-BDD909C90B3F@gmail.com>
	<7ED625B0-786B-4BCE-A043-D53C9A6F0162@gmail.com>
	<521BDF02.8010006@linux.intel.com>
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
X-List-Received-Date: Tue, 27 Aug 2013 04:49:24 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 26, 2013, at 4:04 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 08/26/2013 03:45 PM, Khem Raj wrote:
>>=20
>> On Aug 26, 2013, at 2:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>>> Machine are CentOS 6.4, Debian 6.0.7, but it worked on my F19 and =
Ubuntu 12.04 machines!
>>>=20
>>>=20
>>> I do not have access to Centos or debian to be able to reproduce =
this. If anyone has it please help in debugging it further. will try to =
offline try to poke around and see if I can get at something.
>>>=20
>>=20
>> The reason I think is that _Static_assert is too new a feature for =
gcc shipped with these distros, it was introduced
>> in c11 standards. So I have created a patch to define an equivalent =
for kmod-native and update the pull tree. However
>> I have no way to test it out quickly. I have made sure that it does =
not break the build on Ubuntu 12.04+ give it a
>> shot and let me know how it goes.
>>=20
>=20
> Yup, I have that capability and was actually working on a similar =
patch, you just beat me to it.
>=20
>=20
> Probably need a little bit more of a commit message about removing the =
older patch due it's being a config option and adding the Static_assert =
work around.

I did not remove anything. Infact I added a patch and patch header =
explains what it does. Since It was not merged
I took the liberty to squash it into the original commit.

>=20
> Please update and resend the series.
>=20
> Tested-by: Saul Wold <sgw@linux.intel.com>


Feel free to ammend the commits.

>=20
> Thanks
> 	Sau!
>=20


