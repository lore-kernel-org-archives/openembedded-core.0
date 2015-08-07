Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE2D7676B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 09:40:52 +0000 (UTC)
Received: by igfj19 with SMTP id j19so8733183igf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 02:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aSY+ZyUUTH1d9nl+n1u3mWiMYKtsCwz4R4o97JjfewY=;
	b=mVa2GxqMPjwvt4v8IplQ/yJpo599pnm2plocaUCXBEHcv7GUIYG4ho63ORIdjXq7sa
	wGWBkeu+OcqCo6eRzEFuTmlJRyqrY1euJbuMykHmnFbX533mWKAgztdbzANFoo8h8+Po
	3ZViKA8ylm4aJffBU3ATDixH1SxxITbv2yemnYPut+wvc9tf6M7FerBwDOjoTscwz/9x
	aqhODuv7h/IEM/flVfTDmbSyoAlzu218NR0yhnFXAPysW7SzanApe4uwEuK5M+TaD/Cs
	gj/DwTmBI3Ge60g3BC4nFSUW1mzrwguC9K9IHrf3hx493p9/x5xSHZL6nGPZSsCeG6N3
	nogQ==
X-Received: by 10.50.112.166 with SMTP id ir6mr1990693igb.75.1438940452508;
	Fri, 07 Aug 2015 02:40:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Fri, 7 Aug 2015 02:40:23 -0700 (PDT)
In-Reply-To: <55C47974.9030201@windriver.com>
References: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
	<0321088b6ef57a419568c584ef1cc791bb40218b.1438619216.git.alexander.kanavin@linux.intel.com>
	<55C47974.9030201@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Aug 2015 02:40:23 -0700
Message-ID: <CAMKF1sr8YrSdqxG=kW6A+2QHYm0QEJKyHkXc8t2VetkC4koLqA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] distcc: update SRC_URI to not use Google Code
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
X-List-Received-Date: Fri, 07 Aug 2015 09:40:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 7, 2015 at 2:25 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Hi Alexander,
>
> I think that one or more autobuilder failures related to this patch:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/430/steps/BuildImages/logs/stdio
>

so it seems it was not tested to even see if patches apply ?


> // Robert
>
>
> On 08/04/2015 12:29 AM, Alexander Kanavin wrote:
>>
>> Google Code is shutting down soon and distcc has moved to github.
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>   meta/recipes-devtools/distcc/distcc_3.1.bb | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb
>> b/meta/recipes-devtools/distcc/distcc_3.1.bb
>> index e4b9313..8ea3cac 100644
>> --- a/meta/recipes-devtools/distcc/distcc_3.1.bb
>> +++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
>> @@ -17,16 +17,14 @@ PACKAGECONFIG[popt] =
>> "--without-included-popt,--with-included-popt,popt"
>>
>>   RRECOMMENDS_${PN} = "avahi-daemon"
>>
>> -SRC_URI = "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
>> +SRC_URI = "git://github.com/distcc/distcc.git \
>>              file://separatebuilddir.patch \
>>              file://0001-zeroconf-Include-fcntl.h.patch \
>>              file://default \
>>              file://distccmon-gnome.desktop \
>>              file://distcc \
>>              file://distcc.service"
>> -
>> -SRC_URI[md5sum] = "a1a9d3853df7133669fffec2a9aab9f3"
>> -SRC_URI[sha256sum] =
>> "f55dbafd76bed3ce57e1bbcdab1329227808890d90f4c724fcd2d53f934ddd89"
>> +SRCREV = "9a172d3d20042754a30c0cd9a5d63fd1a8120c31"
>>
>>   inherit autotools pkgconfig update-rc.d useradd systemd
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

