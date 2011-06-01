Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QRekh-0003vT-HV
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:18:00 +0200
Received: by pzk36 with SMTP id 36so2516271pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 23:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:reply-to:user-agent
	:mime-version:to:cc:subject:references:in-reply-to
	:x-enigmail-version:content-type:content-transfer-encoding;
	bh=9Q9UXtVbicVu4McmyJ/RIXkrzkZO+gRKVzPx/ngAyOg=;
	b=Nzi78porxuu/y9G/q5gIJiceWYuQucriGa7OjJa1HzX2tb+Wx/qd2NpGR8+gefOET+
	EKzyPhet7dxmbLcT8HO/oiqZQVOc5zgDfpuNepb3K22AUfRMYPtIUlP79n13AeDh5ey2
	FUlKwR5oWHsLtCQNzhzWLzr0FI1asnzITyw+4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=sE12U1u4EZWVKHnGyaMXeXnm3l4WOSSFF2PwAsJhcnKoQO7ZW9whOfMXoWqmTlkIFA
	GtnjEcX+TdvmUvAnnjfx9M1rskrXzrltWoOitswZxBHccjwviPt7zws0aHzKv8iu5Wxc
	qjsYDG4ZfVJUoJ+UOlEU46I/6YjXID9MzLcW4=
Received: by 10.142.214.2 with SMTP id m2mr975122wfg.330.1306908888553;
	Tue, 31 May 2011 23:14:48 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id k2sm470260wfe.3.2011.05.31.23.14.46
	(version=SSLv3 cipher=OTHER); Tue, 31 May 2011 23:14:47 -0700 (PDT)
Message-ID: <4DE5D8D4.3020408@gmail.com>
Date: Tue, 31 May 2011 23:14:44 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <4DE5CDA3.1020000@linux.intel.com> <4DE5D4AC.4090805@gmail.com>
	<20110601061050.GA3281@jama.jama.net>
In-Reply-To: <20110601061050.GA3281@jama.jama.net>
X-Enigmail-Version: 1.1.1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcmode-default: disable ARMv7 Optimization for qt4-x11-free
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: raj.khem@gmail.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 01 Jun 2011 06:18:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/31/2011 11:10 PM, Martin Jansa wrote:
> On Tue, May 31, 2011 at 10:57:00PM -0700, Khem Raj wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 05/31/2011 10:26 PM, Saul Wold wrote:
>>> [YOCTO #1030]
>>>
>>> This diables the ARMv7 optimizations that cause the compiler to fail
>>> with the following error
>>>
>>> | ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h: In function
>>> 'void qt_removeObject(QObject*)':
>>> | ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:361:35:
>>> error: output number 1 not directly addressable
>>
>> this is a coding error you can fix the source code I guess instead of
>> pessimising the whole package
> 
> FWIW: I haven't seen it in my armv7-a builds (nokia900), but I'm using
> gcc-4.6 from meta-oe.
> 
> Regards,
> 

this may give some hints on how to fix it in qt-x11
https://bugs.launchpad.net/ubuntu/+source/qt4-x11/+bug/673085
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3l2NQACgkQuwUzVZGdMxQ27gCeKEorKdMnEwd3rRqLAqQ6LX+s
90kAn3yx+/omTFUbM214frXzdDNQKEFR
=dO6F
-----END PGP SIGNATURE-----


