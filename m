Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8E0A77D74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:03:39 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id z78so318822lff.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=suv7sQ+je+QWtzdNodPtQf+zLHPHXLPC99I1P5+W8HI=;
	b=rv5lc7c2kBF5sY5BucnJf/Kf5w8WooYL0/J752U1m8yElO+AN//H55sHl8o/5/99yn
	n4icGVt1cGwwImRD1AWz4uuUAfXKh93nxPyrJvxLJ3yah31UdQ63im6m4CW+T8WbgIKr
	xDY8BtvMP/32PcB24jIK8Z4CLBvtl+M3O3Mc5dRC/fsfkRQganYbaaCQ9m0G3rpq8A3z
	gYkCFs7N/LaHwE4B3uIk+FpP0UJkBvs267xWaY4csfHvn30NYb/4ckiwkGQ/oEeQC9su
	Cc0taCHcwb2NuaQ/kOK7pDP0aod29mhvUVgqJi2CLIxEhrRTCnBGseqSxhcQIWRmHdVE
	vgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=suv7sQ+je+QWtzdNodPtQf+zLHPHXLPC99I1P5+W8HI=;
	b=IpZxUmeH1d2P1gNCQaa0DKFHyGpRQZulh4DmEqJTHj5PNEPbEUGuQksaf8rkFMX0HR
	FhpowK3HMVNzWk9ULuyq6yfwe0N9oPY+HkA070B1/B0C33+7V/WoIgMOMLcuiBZ+WNk3
	bvC+U5ta6IvHRfHhik+rsCwG4jU6UxoBWZMCG1Lx1obge/m4qs1MMHyL1+wsLBXmGVu/
	nWYDdgUBY4dNsl3iBiebUh0lDuNGc19/xjq6ub8hpC0J1fe4TxJzcF8o3suCUpzAgrXr
	ZI+sGBaaaTVqdjWve3TS3/Tk1kqt6gbKyDj1gB1SGOFPd2BnadrNYBla5hmsplhxU3K1
	+UjQ==
X-Gm-Message-State: AIVw113zPCr49CXW3nOcFVbDON7A1JYEsfJoRBjALqUQFtyjy46p0jXx
	9iAqGfnUqiSqu9jKLy9pdLuQ4ySzKw==
X-Received: by 10.80.164.185 with SMTP id w54mr3703464edb.76.1499801998869;
	Tue, 11 Jul 2017 12:39:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Tue, 11 Jul 2017 12:39:28 -0700 (PDT)
In-Reply-To: <f0a5eec9-abde-b2c2-cc54-e1ec930374cb@xevo.com>
References: <20170526070344.6053-1-mirza.krak@endian.se>
	<cda9bddb-3f96-4c9b-1c9e-25dbd5afd7a3@xevo.com>
	<f0a5eec9-abde-b2c2-cc54-e1ec930374cb@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jul 2017 12:39:28 -0700
Message-ID: <CAMKF1spNN9vPHf=Dx6GLdriG387gcG3rTTc7tiXwPKcdxyGq9g@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Mirza Krak <mirza.krak@endian.se>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH 1/1] openssl-native: Compile with -fPIC
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
X-List-Received-Date: Tue, 11 Jul 2017 20:03:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 12:07 PM, Martin Kelly <mkelly@xevo.com> wrote:
> Hi,
>
> Is there any issue with backporting this to morty? It would help me fix a
> build crash I'm seeing on morty, and I'm currently using the backport in a
> separate repo with no issue.
>

there should be no issues. Let Armin know of your request.


> On 06/28/2017 11:06 AM, Martin Kelly wrote:
>>
>> On 05/26/2017 12:03 AM, Mirza Krak wrote:
>>>
>>> From: Khem Raj <raj.khem@gmail.com>
>>>
>>> Fixes
>>> | /usr/bin/ld: libcrypto.a(sha1-x86_64.o): relocation R_X86_64_PC32
>>> against undefined symbol `OPENSSL_ia32cap_P' can not be used when
>>> making a shared object; recompile with -fPIC
>>> | /usr/bin/ld: final link failed: Bad value
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> (cherry picked from commit 0a19e72081771fca8ed94fb2a2a8996fd3dce00c)
>>> Signed-off-by: Mirza Krak <mirza.krak@endian.se>
>>> ---
>>>
>>> I hit the same compiler error as in above commit message when running
>>> on morty branch.
>>>
>>> I simply cherry-picked that fix in to morty branch. I looked in the
>>> git log of oe-core and it seems to me that it shall be ok to do that?
>>>
>>> This is a re-send since I messed up Subject the first time around [1]
>>>
>>
>> I want to put in my $0.02 that I have hit the same issue and would also
>> like the fix to be cherry-picked into morty. I tested and agree that it
>> seems to work with no issue.
>>
>>> [1].
>>>
>>> http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136489.html
>>>
>>>
>>>  meta/recipes-connectivity/openssl/openssl_1.0.2j.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>>> b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>>> index 9a7cdedd05..b6fb126349 100644
>>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
>>> @@ -5,6 +5,7 @@ require openssl.inc
>>>  DEPENDS += "cryptodev-linux"
>>>
>>>  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>>> +CFLAG_append_class-native = " -fPIC"
>>>
>>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
>>>
>>> --
>>> 2.13.0
>>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

