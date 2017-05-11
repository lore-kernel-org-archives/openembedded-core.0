Return-Path: <marek.belisko@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 18F7271AC0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 18:50:08 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id p144so117447ywp.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 11:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=woaeptCcVY1TeOv2HjE/uKVIk/LOx3XbMHFBO7GZHoA=;
	b=IZBshrWOYicS3QOuKRIqpTGmqMBVmeHxlanw9RDl7GVZ4iug0TXZetAgp6TgQIL4gX
	HTJtZuYOVSP6A+F4igstf8QlISJF2UsOX/bY0U7Jh2pRR0C71fQNs1ULF3fBwO3WieWZ
	rSoUbEka5OY+o34mAXCDhOuByoq9zM+op/7LV1BNLswg64VbdEaeLju+dJbSgWZY9R0v
	iO6IdC6Vwd7Tb5vEyYZdyXYdzPYYhMADGUqlixNuu9uAbbxqNcq06qnY6cl1/+q2YAz3
	XhI5QOIvX20xiM7tmIBQf89qKcSi+WGh2sPl/WzfEucDF8WUHG17+chByrRApfbB83hs
	cAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=woaeptCcVY1TeOv2HjE/uKVIk/LOx3XbMHFBO7GZHoA=;
	b=rvStcUT2yw49SyFhF1RJlMgObP47i5SZc3xFPQN5YWmNITQs2E0YXWuGCmG30sxQlR
	J2TT+n3ZqUWS40t7NWY5HICAF18B672+wD7YBLRdj2bCQIf8N0ElimVadbhKvzC4dyGe
	qUgAP4s2POj2vshNylCEoBkQMAr8mlCbtSX6DqvmOagBLO7KNgX2BWR0lBU0Dqe2kvpk
	QKo8FCQ3n7AWPR93LW9kvRX7iSDd3mfB1+zS3u4znUQveet4S/9BDhjvD7tTVK3mCDN0
	2RKzTXi1+DFYzheKAVRnbo60c3gxfQTdXrOBgoisoAdwIahS4kFiIWRVKcrFvwsrpppJ
	/CeA==
X-Gm-Message-State: AODbwcCZuvmsojD6b86SkRhIDLAg52NG+sQQ5ACubO4QsaE5EXD49ACP
	XZUGSyh3ZlPt23Bt95bMoeOh/225+g==
X-Received: by 10.129.41.142 with SMTP id p136mr213524ywp.149.1494528609816;
	Thu, 11 May 2017 11:50:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.176.129 with HTTP; Thu, 11 May 2017 11:50:09 -0700 (PDT)
In-Reply-To: <20170511181928.GB28053@denix.org>
References: <1494524580-21718-1-git-send-email-marek.belisko@open-nandra.com>
	<20170511181928.GB28053@denix.org>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 11 May 2017 20:50:09 +0200
Message-ID: <CAAfyv35qUs=f3SPk=jNzwJOA+czWhT=3VQ0GKbjG7c2+z0Kv0A@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-support: Add recipe for libgpiod
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
X-List-Received-Date: Thu, 11 May 2017 18:50:09 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 11, 2017 at 8:19 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Not to derail your enthusiasm, but since this is being proposed for OE-Core,
> how is it better than libsoc by Jack Mitchell?
libsoc is fine but libgpiod will implement correctly gpio handling in
userspace as gpio sysfs is deprecated.
What is the problem to have libgpiod available for other potential
users? Thanks.
More here: https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1392949.html
>
>
> On Thu, May 11, 2017 at 07:43:00PM +0200, Marek Belisko wrote:
>> libgpiod - C library and tools for interacting with the linux GPIO
>> character device
>>
>> Since linux 4.8 the GPIO sysfs interface is deprecated.
>> User space should use the character device instead.
>> This library encapsulates the ioctl calls and data structures behind a
>> straightforward API.
>>
>> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>> ---
>>  meta/recipes-support/libgpiod/libgpiod_0.2.bb | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 meta/recipes-support/libgpiod/libgpiod_0.2.bb
>>
>> diff --git a/meta/recipes-support/libgpiod/libgpiod_0.2.bb b/meta/recipes-support/libgpiod/libgpiod_0.2.bb
>> new file mode 100644
>> index 0000000..fe2cd80
>> --- /dev/null
>> +++ b/meta/recipes-support/libgpiod/libgpiod_0.2.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY = "C library and tools for interacting with the linux GPIO character device"
>> +HOMEPAGE = "https://github.com/brgl/libgpiod"
>> +
>> +LICENSE = "LGPLv2.1+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
>> +
>> +UPSTREAM_CHECK_URI = "https://github.com/brgl/libgpiod/releases"
>> +
>> +SRC_URI = "https://github.com/brgl/libgpiod/archive/v${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "e3430f35b6efa842693d659c0bfb7ad5"
>> +SRC_URI[sha256sum] = "de1947f3cb2cc4174364af430309fe6238976658575655bdbd76c60cffa7df92"
>> +
>> +inherit autotools pkgconfig
>> +
>> +# enable tools
>> +PACKAGECONFIG ?= "tools"
>> +
>> +PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
>> +PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
>> +
>> +PACKAGES += " ${PN}-tools"
>> +
>> +FILES_${PN} = "${libdir}/*"
>> +FILES_${PN}-tools = "${bindir}/*"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

