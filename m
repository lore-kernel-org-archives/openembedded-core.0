Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAC3795CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 16:43:22 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id m11-v6so22799126oic.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mbGjrfgYOkKXJEsw1t/OaVB6qk4K6y402+O2+iSm+oY=;
	b=ZiODxwOT8JanpYdyAM5iNczDNFc/dSiEbl9OCE6aEghOsV5+SBPrlgQmm3vV3MYH1J
	xTKeaAnvKe2AkFA6kWbIl8q3U0o5O6+xWIrB/zjHo4+FWJ93y3K5x0W7G5+9iJXcV7xO
	5U+3RvQY6lAMK6sD0JeFgCV6DazlgubN53sfAIGRBMLmYAMA20XVouPK/1qo6BKFdQON
	glpw/v6AhPxeNnDHqsJOtEiqACkopsS5VKihinEncMJCsypzWL4Yr1wkpLo/1oXeyNQG
	pSZ0ECBFd2+HWlU13ScRQvBDaLQXLDw4lt9+b2AKJp3kZz5lOB7wJeOyAKl7TIS42HB2
	YjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mbGjrfgYOkKXJEsw1t/OaVB6qk4K6y402+O2+iSm+oY=;
	b=R5kw0KyKd8vyXk8a8pLKP/6CeQdiyDSQZ/pfGqNUyi72AmEw9WvOfRbxkSESDEVxpC
	ZY5VlPtB8hw7asWNbr7vHK7B8IrH5xWWP4RH8lpKo+/Z6qyN0HhcVcFMt5tfaGoi8HUk
	pRjGGldpV6FROwF9qZKML3cGq9NicFsfyUYgqAmK1KbEVMjQh4hpKCF6tJalkxbOoa/5
	N6dLb/WHAsfzCtUuowuY2t6r4GvJyOROnaxhl9VL14wtEJubowpyW1x3/BTJlIqdaKYK
	UwZ8LFXFaNYH+EM3COpv+LLPs/zFO+YciElsau4XChtV+UteZA4Lg1abkBhELurFSHjZ
	uEMA==
X-Gm-Message-State: APzg51CY+RukAWV0oigOmW+JFMVGz05GFae25q18QztjYwPNR6Hv9esr
	2yIyqc6KGh4AdfoGArKA0v0tNoXmZWYc69Y6xJnPTA==
X-Google-Smtp-Source: ANB0VdbCsHd21C3BwHk2P9vli7RWqynwyS2rMcvOofvUxIXEjP4Y2evO11zuZaezbesDWcUTFwbzdzPOQCYa0QMpJqE=
X-Received: by 2002:aca:506:: with SMTP id 6-v6mr8457931oif.23.1535733803428; 
	Fri, 31 Aug 2018 09:43:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7c0c:0:0:0:0:0 with HTTP; Fri, 31 Aug 2018 09:43:02
	-0700 (PDT)
In-Reply-To: <CAMKF1srq3a0vAd=8Y3kcRAeNvRfAnKdkZQm17Y81f5ErPUjD0A@mail.gmail.com>
References: <20180831134136.18889-1-ross.burton@intel.com>
	<CAMKF1srq3a0vAd=8Y3kcRAeNvRfAnKdkZQm17Y81f5ErPUjD0A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Aug 2018 17:43:02 +0100
Message-ID: <CAJTo0LZj_P2mZKGRUgtGaxP3pHrutsev0Z_Q0dQj286VVX0xww@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] fribidi: add (from meta-oe)
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
X-List-Received-Date: Fri, 31 Aug 2018 16:43:22 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry, should have mentioned this.

Hard build-requirement for the new Pango.

Ross

On 31 August 2018 at 17:25, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 31, 2018 at 6:41 AM Ross Burton <ross.burton@intel.com> wrote:
>>
>> Originally this was fribidi 0.19.7 from meta-oe, with the following changes:
>>
>> - Upgrade to latest release (1.0.5)
>> - Drop GLib and PCRE build-dependencies (removed upstream)
>> - License is *or newer*
>> - Upstream has moved to Github
>> - Remove the historical PROVIDES (patches for meta-oe sent)
>>
>
> this use to be in oe-core and it was dropped and then used from meta-oe
> what is rationale to move it ?
>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-support/libfribidi/fribidi_1.0.5.bb | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>  create mode 100644 meta/recipes-support/libfribidi/fribidi_1.0.5.bb
>>
>> diff --git a/meta/recipes-support/libfribidi/fribidi_1.0.5.bb b/meta/recipes-support/libfribidi/fribidi_1.0.5.bb
>> new file mode 100644
>> index 00000000000..303ccb71d0d
>> --- /dev/null
>> +++ b/meta/recipes-support/libfribidi/fribidi_1.0.5.bb
>> @@ -0,0 +1,19 @@
>> +SUMMARY = "Free Implementation of the Unicode Bidirectional Algorithm"
>> +SECTION = "libs"
>> +LICENSE = "LGPLv2.1+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
>> +
>> +SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.bz2"
>> +SRC_URI[md5sum] = "0f97f65038545340316ec0f4bd53df0b"
>> +SRC_URI[sha256sum] = "6a64f2a687f5c4f203a46fa659f43dd43d1f8b845df8d723107e8a7e6158e4ce"
>> +
>> +UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
>> +
>> +inherit autotools lib_package pkgconfig
>> +
>> +# TODO use Meson instead of autotools when
>> +# https://github.com/fribidi/fribidi/issues/87 is solved
>> +
>> +CVE_PRODUCT = "gnu_fribidi"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

