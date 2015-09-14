Return-Path: <nathan@nathanrossi.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id D31D973D13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 12:05:17 +0000 (UTC)
Received: by lbbmp1 with SMTP id mp1so66068905lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 05:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=RyFxzmWoiQbth4Wb4ApRLCjRo46/RI7swoRf8bA94AE=;
	b=e3g8YVJIdMlsrnDbQ/o2xbCt14A0gjJu0PILd/NKWzJi6OlvnDlynKx6wrFjLPTTIS
	0Z5KN3Xee+N//6c2uwFRiDnE44RUoKvoHIcrQGHdxfO8V2SYqA1HOdD+7I0elGs+PPcR
	LCz+72N75+Paxj1vvwK4Ah50aZ70M6q+fsG+q68zpkIpKUnWmQc2aK/Z/JOIEb4IQdQe
	2cxMMxm0OADFdq5YaixxZz5LV7ux697GEB0zkFIxYYw15SSgpwL3kVJx3Ec4QmaeqPpg
	hqGJjTTXl1wy17gJSyJAXFgQeIaU+/RAI0v4Ay1wjF0t50M6RWE1u/JSA21JoDbTifQx
	RPAw==
X-Gm-Message-State: ALoCoQlrntz5AyfV0sDm4GWcZZ9rC71+Xsh/Fwg7CMQBHp/YfSB1utxsehBSEPAwFMUmXVVt17Uy
MIME-Version: 1.0
X-Received: by 10.152.161.232 with SMTP id xv8mr13668641lab.32.1442232316963; 
	Mon, 14 Sep 2015 05:05:16 -0700 (PDT)
Received: by 10.25.155.13 with HTTP; Mon, 14 Sep 2015 05:05:16 -0700 (PDT)
In-Reply-To: <CAP9ODKpa9iFBdDfcRhkQbQFSAFqkkoojNRRvdvePNXO3EsBOoA@mail.gmail.com>
References: <1441880652-12645-1-git-send-email-nathan@nathanrossi.com>
	<CAP9ODKr=Sg2Gq8AghfQD-SFWWr2vF=wOo0VqStfjsjkYW2WDRw@mail.gmail.com>
	<CA+aJhH0B8WM-TOM_aL-7cPOA3z8H5y7KyT1DYq9AhizR2VydMg@mail.gmail.com>
	<CAP9ODKpa9iFBdDfcRhkQbQFSAFqkkoojNRRvdvePNXO3EsBOoA@mail.gmail.com>
Date: Mon, 14 Sep 2015 22:05:16 +1000
Message-ID: <CA+aJhH0vppTn6bA+EjVV=afUfS_EvLEvtjd6Lz7VO7toN6+Erg@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot.inc: Add host compiler flags and openssl-native dependency
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
X-List-Received-Date: Mon, 14 Sep 2015 12:05:18 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 14, 2015 at 9:49 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Mon, Sep 14, 2015 at 6:29 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
>> On Fri, Sep 11, 2015 at 3:50 AM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> On Thu, Sep 10, 2015 at 7:24 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>>> U-Boot will compile its own tools during the build, with specific
>>>> configurations (aka when CONFIG_FIT_SIGNATURE is enabled) the host tools
>>>> require openssl. This patch adds 'openssl' as a PACKAGECONFIG that
>>>> enables the use of openssl-native as a dependency and also adds the
>>>> HOSTCC flags that U-Boot uses when compiling the host tools.
>>>>
>>>> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
>>>
>>> Ideally we ought to ensure U-Boot stops to build the native part when
>>> doing the target one.
>>
>> Are you suggesting that the compile step (of the recipe) should build
>> the "tools"/native make target first, then execute the make target for
>> the rest afterwards as two separate steps?
>
> Two separated _recipes_.

Ah ok, to some degree that already exists with the u-boot-mkimage and
u-boot-fw-utils recipes. However the problem is that there is
currently no easy way (at least with mainline U-Boot) to get U-Boot to
use the tools provided by the host/sysroot/PATH instead of building
them.

Regards,
Nathan

