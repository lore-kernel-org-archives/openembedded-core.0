Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4086FFD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 12:25:12 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id w9-v6so18008571otj.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 05:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ShzB8wtwl4wbcB5H9Iv5JYXtDko1k6/MBux12TRqvsc=;
	b=cgYsS4oaLdO+gG/1qJ1Wbln1UpmWN2POzeHYUO9vZW/arLNP2vERGJ76zVfXw3HuO9
	wi9b59hlDlfPwjySvqtsNkCTZL/6GKTI3bVk/ve8L5FwziT7f1IDa1qSQf/iGsR/cdyu
	3T9A2SHdw3R35971j7wsmeICKuSHDroU98ZPRoCVSKjqAY1tCn5Gl0+pJtCUCOLRib0/
	7zyofOlslTEnrjkt8vbPYy6tgGVv30uiagF/Szf+fHrgpM+MR3Mx1cs2HDlKniG8SitL
	rlhFg8r0fBfCYPwS9RwyDAA9mvsca2simxeO1rl7gGl8Jk8Vyg/XBBAU/Bm2Xvvb+URL
	AXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ShzB8wtwl4wbcB5H9Iv5JYXtDko1k6/MBux12TRqvsc=;
	b=hI9jUyaTbZeWabDK7vu0wspd60ji29vE2M++/hFY6d621kk2715zNvUta6+PiNdBas
	mkWDarAk9DgTGer5Hkv6pa8B6avgf8iVIfonz9UPXLMZAl2Qs6AHnNdQZn3OM9lfii54
	mOKocvakjwYrgZUMvI4uWYTaTyyfvDrUtsetREom3ryh4OspecQheA21I+A2Gri7jknU
	1t/4Ls0H1w5CfrIUZRFreM+lk/7Ax10kYqikOMjeQip2C8FkeeA+YM/KHSaRppbYVnpq
	RYrG5Tx97AToAzMwnZMabDMyxTC6/8Xrh4PbWotwWe2AWDK11EYRYG7fpCLjLebEZjg2
	tRXA==
X-Gm-Message-State: APt69E3f3SdOLWLMcFik4IQB7oG/cv8c9xHfRYyoBD08W+0vO7uLn1bk
	DtUIxryiD5G8dtb2YhfndBnu1amwYDk2L41dtH8DgA==
X-Google-Smtp-Source: ADUXVKL71RSssJ0/MPAACc8xE47OZysbOqJuRFYIpLRNe+qknNpCsLeFnNxOcJBH+H7T5du33CQlAsCxIdtE+iVF1Mk=
X-Received: by 2002:a9d:1553:: with SMTP id
	z19-v6mr9047299otz.135.1528719913533; 
	Mon, 11 Jun 2018 05:25:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 05:24:52
	-0700 (PDT)
In-Reply-To: <CAJ86T=XMSRRnwXqF2J8s=mTYx9rzuN49hRKKJphfPQx-EYj7dQ@mail.gmail.com>
References: <1527207259-30592-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=XMSRRnwXqF2J8s=mTYx9rzuN49hRKKJphfPQx-EYj7dQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jun 2018 13:24:52 +0100
Message-ID: <CAJTo0LZDpYLanarmFAURgDSWGmBgi1wumL7E3iKWnagwHUK+Gg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] cpio: move contents of cpio_v2.inc into the cpio recipe
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
X-List-Received-Date: Mon, 11 Jun 2018 12:25:12 -0000
Content-Type: text/plain; charset="UTF-8"

None, thanks for pinging.  Now in MUT.

Ross

On 8 June 2018 at 20:52, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, May 24, 2018 at 5:14 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Merge contents of cpio_v2.inc into the only recipe which uses it.
>
> Ping.
>
> Any issues with this (ie the whole series of 3)?
>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-extended/cpio/cpio_2.12.bb | 40 ++++++++++++++++++++++++++++--
>>  meta/recipes-extended/cpio/cpio_v2.inc  | 43 ---------------------------------
>>  2 files changed, 38 insertions(+), 45 deletions(-)
>>  delete mode 100644 meta/recipes-extended/cpio/cpio_v2.inc
>>
>> diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
>> index 405a90e..0b83e9b 100644
>> --- a/meta/recipes-extended/cpio/cpio_2.12.bb
>> +++ b/meta/recipes-extended/cpio/cpio_2.12.bb
>> @@ -1,8 +1,13 @@
>> -require cpio_v2.inc
>> -
>> +SUMMARY = "GNU cpio is a program to manage archives of files"
>> +DESCRIPTION = "GNU cpio is a tool for creating and extracting archives, or copying files from one place to \
>> +another. It handles a number of cpio formats as well as reading and writing tar files."
>> +HOMEPAGE = "http://www.gnu.org/software/cpio/"
>> +SECTION = "base"
>>  LICENSE = "GPLv3"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
>>
>> +DEPENDS = "texinfo-native"
>> +
>>  SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
>>             file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
>>             file://0001-Fix-CVE-2015-1197.patch \
>> @@ -10,3 +15,34 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
>>
>>  SRC_URI[md5sum] = "fc207561a86b63862eea4b8300313e86"
>>  SRC_URI[sha256sum] = "08a35e92deb3c85d269a0059a27d4140a9667a6369459299d08c17f713a92e73"
>> +
>> +inherit autotools gettext texinfo
>> +
>> +EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
>> +
>> +do_install () {
>> +    autotools_do_install
>> +    if [ "${base_bindir}" != "${bindir}" ]; then
>> +        install -d ${D}${base_bindir}/
>> +        mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
>> +        rmdir ${D}${bindir}/
>> +    fi
>> +}
>> +
>> +PACKAGES =+ "${PN}-rmt"
>> +
>> +FILES_${PN}-rmt = "${base_sbindir}/rmt*"
>> +
>> +inherit update-alternatives
>> +
>> +ALTERNATIVE_PRIORITY = "100"
>> +
>> +ALTERNATIVE_${PN} = "cpio"
>> +ALTERNATIVE_${PN}-rmt = "rmt"
>> +
>> +ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
>> +
>> +ALTERNATIVE_PRIORITY[rmt] = "50"
>> +ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
>> +
>> +BBCLASSEXTEND = "native"
>> diff --git a/meta/recipes-extended/cpio/cpio_v2.inc b/meta/recipes-extended/cpio/cpio_v2.inc
>> deleted file mode 100644
>> index 31adb71..0000000
>> --- a/meta/recipes-extended/cpio/cpio_v2.inc
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -SUMMARY = "GNU cpio is a program to manage archives of files"
>> -DESCRIPTION = "GNU cpio is a tool for creating and extracting archives, or copying files from one place to \
>> -another. It handles a number of cpio formats as well as reading and writing tar files."
>> -HOMEPAGE = "http://www.gnu.org/software/cpio/"
>> -SECTION = "base"
>> -
>> -DEPENDS = "texinfo-native"
>> -
>> -SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
>> -    "
>> -
>> -inherit autotools gettext texinfo
>> -
>> -S = "${WORKDIR}/cpio-${PV}"
>> -
>> -EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
>> -
>> -do_install () {
>> -    autotools_do_install
>> -    if [ "${base_bindir}" != "${bindir}" ]; then
>> -        install -d ${D}${base_bindir}/
>> -        mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
>> -        rmdir ${D}${bindir}/
>> -    fi
>> -}
>> -
>> -PACKAGES =+ "${PN}-rmt"
>> -
>> -FILES_${PN}-rmt = "${base_sbindir}/rmt*"
>> -
>> -inherit update-alternatives
>> -
>> -ALTERNATIVE_PRIORITY = "100"
>> -
>> -ALTERNATIVE_${PN} = "cpio"
>> -ALTERNATIVE_${PN}-rmt = "rmt"
>> -
>> -ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
>> -
>> -ALTERNATIVE_PRIORITY[rmt] = "50"
>> -ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
>> -
>> -BBCLASSEXTEND = "native"
>> --
>> 1.9.1
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

