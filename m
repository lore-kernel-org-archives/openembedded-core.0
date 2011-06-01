Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QRerg-00041i-WB
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:13 +0200
Received: by pxj25 with SMTP id 25so2349145pxj.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 23:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:reply-to:user-agent
	:mime-version:to:cc:subject:references:in-reply-to
	:x-enigmail-version:content-type:content-transfer-encoding;
	bh=G4itQv9MY5OK5SLjX1THuPuPinXiJpNEHrPQtCzwwYc=;
	b=QqpJxWwHhYacoW4QlnY+Vl+Q4xLW9zfxKutexRLZqlaL5D3J2lTkEOqfChFS0ujyMn
	5YgknmyxLNTB5+hK7dc3zHpC5FsQDlh33j8/gdWjGDzPc9ntJtP07bUSuruBh3yEUfrk
	sDywiniIg5cJYbwL29a9l6tRAsdncS1r+vDus=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=ciboOfEH33ojyflpp+G/TfeTDCLpSjbR2h9Z7VQNoSJ4dbrxpSKhTKyt0/87FXz7OM
	CqPh9/zf1HGseGw7hUCG+Qa0GnyyvIi6CflxPNzTQkKKs63eWNJnQi84OuCuRXmA55AI
	hJOxmVHi6XQvG2CXgMjqdlTu3WMqOuClwc2Wg=
Received: by 10.142.7.4 with SMTP id 4mr1073001wfg.386.1306909321579;
	Tue, 31 May 2011 23:22:01 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id o16sm474808wff.1.2011.05.31.23.21.59
	(version=SSLv3 cipher=OTHER); Tue, 31 May 2011 23:22:00 -0700 (PDT)
Message-ID: <4DE5DA86.7040808@gmail.com>
Date: Tue, 31 May 2011 23:21:58 -0700
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:13 -0000
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

this is because gcc 4.6 in meta-oe has fix for it its this patch here
http://gcc.gnu.org/ml/gcc-patches/2011-03/msg01477.html

a patch developed by linaro folks but now is committed to FSF as well.
this patch has not been backported to FSF 4.6 branch

> Regards,
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3l2oUACgkQuwUzVZGdMxQa1ACfaHP5ur/Dlh78nAPI9ViqPaK1
G60An3/34c1z9ZoM3y8o62fvke32xI9J
=hDdS
-----END PGP SIGNATURE-----


