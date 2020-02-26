Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id A61A0615FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:12:29 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j6yMQ-00022Q-J9; Wed, 26 Feb 2020 16:12:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bUgZU+qVQT2/eORYeiuhX+I+EaTHMYU+sZ9QqZd2XRs=;
	b=FKlWoNUuH+WT9ZrhwAsxe2Nc5/
	OAE6kSlH8DaiqQ0zNWFOlg3Fhy76nOa9wd+EG49utt2GMaEJBFZpQSkm6z13hzBR6zy5lRjonltKz
	3tSfm0TY2R7d+t4NDPLCv47pK4llQEuEgTHHylDljODQjOjJ2EYdGbGpoUIkHSmt/XRuKcMyWRZ4W
	zl7qgBKGSk2nB7Bz5TmybR6dq/Kz11926CxKHDrrwD3u5jdjUv3UYhmam2g1X+qP5bqMjgSN0RuxC
	eN5vZk65CtM6JLyblJnuqukB3+wlKxj+8Ft7rRhIty7DGE9z4jrnCcXyd3DTxo1Kbwt7ZL4n2Utlh
	VNQrCZvw==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1j6yMM-0006O1-BF; Wed, 26 Feb 2020 16:12:28 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
	<CAMKF1sqrFju=q26M-wSuTDR7xjK9tycivhDGvR0eGqAa5g2Zog@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <3b6928cc-d872-a9c9-942a-67f58d152790@pr.hu>
Date: Wed, 26 Feb 2020 16:12:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqrFju=q26M-wSuTDR7xjK9tycivhDGvR0eGqAa5g2Zog@mail.gmail.com>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 8f5da0c40d649b22aaae3fc58f517802
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226151228Z
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libva-initial: New recipe to carry only pkgconfig files and headers
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
X-List-Received-Date: Wed, 26 Feb 2020 15:12:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2020. 02. 26. 15:58 keltezéssel, Khem Raj írta:
> On Wed, Feb 26, 2020 at 6:05 AM Böszörményi Zoltán via
> Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>
>> The package name exploits sstate.bbclass so it's not added as
>> implicit dependency to packages.
>>
> 
> what is the use of this recipe and why should it be added to core ?

I should have added a cover letter, shouldn't I?
See patch 3/5 in the series for enabling gallium-va in Mesa.

> 
>> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
>> ---
>>   meta/recipes-graphics/libva/libva-2.6.1.inc        | 4 +++-
>>   meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 5 +++++
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>>
>> diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc b/meta/recipes-graphics/libva/libva-2.6.1.inc
>> index ca1386d80b..5b1cdee7e3 100644
>> --- a/meta/recipes-graphics/libva/libva-2.6.1.inc
>> +++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
>> @@ -17,10 +17,12 @@ SECTION = "x11"
>>   LICENSE = "MIT"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
>>
>> -SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
>> +SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
>>   SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
>>   SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
>>
>> +S = "${WORKDIR}/libva-${PV}"
>> +
>>   UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
>>
>>   DEPENDS = "libdrm"
>> diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>> new file mode 100644
>> index 0000000000..828ef6fbca
>> --- /dev/null
>> +++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>> @@ -0,0 +1,5 @@
>> +require libva-${PV}.inc
>> +
>> +do_install_append () {
>> +       rm -f ${D}${libdir}/*.so*
>> +}
>> --
>> 2.24.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


