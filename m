Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id B3C2A60116
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 21:40:08 +0000 (UTC)
Received: by wmww144 with SMTP id w144so86400369wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=W82vIiaNO1JRFjTmB1tkJxY27Y/Fky0Z5sHOVVsC/8M=;
	b=P2sqp7qmN+SWynRFCwNRPzp0L18i5oBB8ytBy/xqaEVRtLS9tkOmxLz3jqX27vL3e4
	ywDTdHKfBofRuVOv+h9lM96Urn5Jzw/z21/PhqiLaJkJHSwZjTFTvK5HIDyUOJSqKkdF
	A7GjBsv0RoXjrbgbtj/rMvQrGpLyufaJtaFQZhlvBlNUF6MQZvCbneasZs1FpfxP+LFv
	2Vea4kdoBSPSoj7dfdFl8jD56F+gtYKyW2bgJP4pBM4IQVKo+6B/YzEabffFLmI2wnIO
	7MoZutIDBhLCdX+8cMjJCh4alvBUpRPX7aBnzHnBqV5b/zLabiLAa8Mz0KcJUmSLeeHg
	+hxg==
MIME-Version: 1.0
X-Received: by 10.194.93.164 with SMTP id cv4mr44626243wjb.43.1448487608843;
	Wed, 25 Nov 2015 13:40:08 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Wed, 25 Nov 2015 13:40:08 -0800 (PST)
In-Reply-To: <CAMKF1spXxarTUskBgB6ABdL-yn4wSm1cOZSBKdCpyxQzDg_a8g@mail.gmail.com>
References: <CAJ86T=VBh-TsnaSyNVSxmbEJz7TbFcDmNBVP4_4PhXB=YMrm5w@mail.gmail.com>
	<CAMKF1spXxarTUskBgB6ABdL-yn4wSm1cOZSBKdCpyxQzDg_a8g@mail.gmail.com>
Date: Wed, 25 Nov 2015 13:40:08 -0800
Message-ID: <CAJ86T=X_r_OU1RfN8nYJAJSYXwqEgvK17Hn87_+AfoGQAn2ocw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: vmdk images with musl libc
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
X-List-Received-Date: Wed, 25 Nov 2015 21:40:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On Tue, Nov 24, 2015 at 12:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Nov 24, 2015 at 10:58 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> It's currently not possible to build a vmdk image when TCLIBC = "musl"
>> due to the following dependencies:
>>
>> do_bootdirectdisk -> syslinux -> mtools -> glibc-gconv-ibm850
>>
>> Creating an mtools .bbappend containing:
>>
>> RDEPENDS_${PN}_libc-musl = ""
>> RRECOMMENDS_${PN}_libc-musl = ""
>>
>> seems to be a workaround.
>>
>> Does anyone see a better solution?
>
> That should be fine for musl.

So would it be correct to add exactly those lines to the oe-core mtools recipe?

>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

