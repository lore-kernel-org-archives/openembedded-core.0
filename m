Return-Path: <eu@felipetonello.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id CAAF26B23A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 23:09:03 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id m6so4733670wiv.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 16:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=hVXe8t2XNE/X32F6EUhLdQcnNUDYW7+1Is0/QrulLzI=;
	b=f/7T8anr0hxS3pcdZghaX1iCf0Z5f+f12ZvGV92xxqrBe9RjvaQcDrYceOZ5DsN90b
	WQf4uY9ggJvOaXSsFYolraOYH+wqr3pl2X2mj5DZF1Ix9xOypklkUFd7pSuN4jNwwtDI
	Jw7CmJkfhAlHY/9CqSXrwebg/IrZN+wV/53tSr4ofuwXHm6OV1hff7lAbHvfb87Cs/0C
	kdV/+4rzS6US8PJS08oW/3ITDdOj3Gbc70OHtp9l2u5vuTF6lvH0z65MPQ8FZZq5cVPU
	v2CKhdaowId0KjMkX8pSWtKz73+9MXV/1hh7yKR80KThSKFDvzXXwTSjhznTxnJ3sAit
	JIzw==
MIME-Version: 1.0
X-Received: by 10.194.103.226 with SMTP id fz2mr2817382wjb.75.1374016144014;
	Tue, 16 Jul 2013 16:09:04 -0700 (PDT)
Received: by 10.194.59.203 with HTTP; Tue, 16 Jul 2013 16:09:03 -0700 (PDT)
In-Reply-To: <51E5CF13.4090405@linux.intel.com>
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
	<1374012965-4556-1-git-send-email-eu@felipetonello.com>
	<51E5CF13.4090405@linux.intel.com>
Date: Tue, 16 Jul 2013 16:09:03 -0700
Message-ID: <CAGrhNMzURuresy3p3sCND6J1XUOSSJePYNof2OKGu99wdXww0g@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQnM6VfDzRxJ09ukSFRNRxjOaQ6fWby4FyB4vqjXOx0tQrU65j5GqXE5ttHPK00DSMV8JGd+
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] valgrind: added perl dependency
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
X-List-Received-Date: Tue, 16 Jul 2013 23:09:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hum, I didn't noticed. Sorry.

I will send another patch.

On Tue, Jul 16, 2013 at 3:54 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/16/2013 03:16 PM, eu@felipetonello.com wrote:
>>
>> From: "Felipe F. Tonello" <eu@felipetonello.com>
>>
>> This is necessary since the valgrind package depends on /usr/bin/perl.
>>
>> This patch will fix this error while installing into rootfs:
>> Computing transaction...error: Can't install
>> valgrind-3.8.1-r8@armv7a_vfp_neon: no package provides /usr/bin/perl
>>
>> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
>> ---
>>   meta/recipes-devtools/valgrind/valgrind_3.8.1.bb | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
>> b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
>> index 3520d49..4ee1b64 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
>> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=c46082167a314d785d012a244748d803 \
>>
>>   X11DEPENDS = "virtual/libx11"
>>   DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}',
>> '', d)}"
>> -PR = "r8"
>> +PR = "r9"
>>
> PR Bump is not needed, mentioned this in past reviews.
>
> Sau!
>
>>   SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>>            file://fix_issue_caused_by_ccache.patch \
>> @@ -37,6 +37,8 @@ do_install_append () {
>>       install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
>>   }
>>
>> +RDEPENDS_${PN} += "perl"
>> +
>>   FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
>>   RRECOMMENDS_${PN}_powerpc += "${TCLIBC}-dbg"
>>   RRECOMMENDS_${PN}_powerpc64 += "${TCLIBC}-dbg"
>>
>

