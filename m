Return-Path: <nathan@nathanrossi.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id E21E073CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:29:13 +0000 (UTC)
Received: by lahg1 with SMTP id g1so52878396lah.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 02:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=TyFwoCdqd32b3XKihTd0vyVyRD5euleSzFAp1PYYkC0=;
	b=mHDhzEzCwLLp/KyFPGilh7W/cROHnaqscPRstR4bmnS/LUpFbg6al2LHV9141p4P0R
	j+cmK9dwsA0v3vVSEcj/5bSqViXSeBJczurLa0VqGTNbJRnuNqZHJSxTmizTca4F0zuQ
	O8u7r4QqDDKEtisMCdj4RUbo3rGCaukSx+17dyAZ8v7PbsnqcvXOZQqzhmcSZzS8EBsT
	4rWUg/dzabuQ8+TRkQFobogVfmTOYMUQAQltJMmjAFBc++02T5zK9xmJncXAafhKINR+
	FAJi+wjNmEusnBlPN2ByFyU5d96lTFEd5kyaz2pAba4O4xSFqFLPNv0f1QO23RMGG3HX
	m20g==
X-Gm-Message-State: ALoCoQm+H4vJsUbblzCwd4Hs+RIczA+NTBvxQsqk5plE33QyESUl5SqMusoJhkvaxZ+ddjJPZpXG
MIME-Version: 1.0
X-Received: by 10.152.161.232 with SMTP id xv8mr12898140lab.32.1442222952517; 
	Mon, 14 Sep 2015 02:29:12 -0700 (PDT)
Received: by 10.25.155.13 with HTTP; Mon, 14 Sep 2015 02:29:12 -0700 (PDT)
In-Reply-To: <CAP9ODKr=Sg2Gq8AghfQD-SFWWr2vF=wOo0VqStfjsjkYW2WDRw@mail.gmail.com>
References: <1441880652-12645-1-git-send-email-nathan@nathanrossi.com>
	<CAP9ODKr=Sg2Gq8AghfQD-SFWWr2vF=wOo0VqStfjsjkYW2WDRw@mail.gmail.com>
Date: Mon, 14 Sep 2015 19:29:12 +1000
Message-ID: <CA+aJhH0B8WM-TOM_aL-7cPOA3z8H5y7KyT1DYq9AhizR2VydMg@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 Sep 2015 09:29:15 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 11, 2015 at 3:50 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Thu, Sep 10, 2015 at 7:24 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
>> U-Boot will compile its own tools during the build, with specific
>> configurations (aka when CONFIG_FIT_SIGNATURE is enabled) the host tools
>> require openssl. This patch adds 'openssl' as a PACKAGECONFIG that
>> enables the use of openssl-native as a dependency and also adds the
>> HOSTCC flags that U-Boot uses when compiling the host tools.
>>
>> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
>
> Ideally we ought to ensure U-Boot stops to build the native part when
> doing the target one.

Are you suggesting that the compile step (of the recipe) should build
the "tools"/native make target first, then execute the make target for
the rest afterwards as two separate steps?

For reference the U-Boot makefile setup handles the dependence on the
tools, and will ensure they are built before needed. So splitting out
the steps is probably not necessary.

Regards,
Nathan

