Return-Path: <miroslav.kes@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6E36FC89
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 16:51:52 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id bs8so1229790wib.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 09:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=txtzC9xl/gSbwI3AtpxujsHn1UC3q1Ffc6jDtPzt6Tk=;
	b=uwzoNROTncveh1eL0Ku2SIJ1pUS8eeVK66p7S15enbvol0BhLQYG4VJLRvjG11AIJW
	6MP+xY1BBxnGYsWcx2RNfKaOybyAlQ4aZktzHoZqo7LvKtgQkA3wI1H0Obu3M5tredHo
	CcUJ39qa9Ot29ZgApM/2i9ZUwNKod62Pvfp1zDELUR7Binnwlts39DrnOoKdpSdy4Rfv
	dSpaI1OaN+BXGHZlOoZ7LsRDmaXILskRJT3GYjEbSllo7KivJZbKr7dYZc0/tznU1UJL
	c3O2/29rRPkb/o1Qjg0MTxjf3COTxBAI2xK7zVUoIgSzyw76uQyyDiHRJAx5/slOzKKU
	sbPg==
X-Received: by 10.194.77.39 with SMTP id p7mr6087654wjw.85.1402678313505;
	Fri, 13 Jun 2014 09:51:53 -0700 (PDT)
Received: from [192.168.1.100] ([188.175.125.133])
	by mx.google.com with ESMTPSA id l4sm3444352wiy.0.2014.06.13.09.51.52
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Jun 2014 09:51:52 -0700 (PDT)
Message-ID: <539B2C27.4070803@gmail.com>
Date: Fri, 13 Jun 2014 18:51:51 +0200
From: =?UTF-8?B?TWlyb3NsYXYgS2XFoQ==?= <miroslav.kes@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <539B27F0.90109@gmail.com>
	<CAJTo0Lauenh9=Mep+4ZUVPnjf0yJDdaCxbrNcB5vXEmtjn5-iA@mail.gmail.com>
In-Reply-To: <CAJTo0Lauenh9=Mep+4ZUVPnjf0yJDdaCxbrNcB5vXEmtjn5-iA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: cmake: respect ${S} and ${B} patch problem
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
X-List-Received-Date: Fri, 13 Jun 2014 16:52:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/13/14 18:38, Burton, Ross wrote:
> On 13 June 2014 17:33, Miroslav Keš <miroslav.kes@gmail.com> wrote:
>> +    if [ -z "${OECMAKE_SOURCEPATH}" ]; then
>> +        OECMAKE_SOURCEPATH="${S}"
>>      fi
>>
>>      if [ "${S}" != "${B}" ]; then
>> @@ -84,7 +88,7 @@ cmake_do_configure() {
>>
>>      cmake \
>>        ${OECMAKE_SITEFILE} \
>> -      ${S} \
>> +      ${OECMAKE_SOURCEPATH} \
> A better idiom that's more self-documenting would be to set
> OECMAKE_SOURCEPATH ?= "${S}" at the top-level.

You are right.

> Would it be sensible to give that variable a different name as it
> refers specifically to the location of the cmake file, and not the
> rest of the source?

I was thinking about a better name too.
The reason why I stayed with the OECMAKE_SOURCEPATH is that the cmake
man page says:

USAGE

  cmake [options] <path-to-source>

And that's the directory that I want to set. So I thought that it would
be understandable for people familiar with cmake.

Mira
> Ross


