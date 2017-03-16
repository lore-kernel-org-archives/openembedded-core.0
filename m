Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6270B77690
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 22:16:48 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g10so7546360wrg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 15:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rku1eN+bgt/G0AqTWoRDFKMiU4T0wVLhfLVxlPD7Gxw=;
	b=gVpauY5S3ROuwYqoRiZDMr1j81l9lbGk1NTYm3zntjrY+MeMSRhqN2X1blF2rVjfL5
	0xSb789qePeRZB2rP0puGMnA3VgaufF/IbiN2vYAr8j6kUDhcaBHj+XxoWPkYsToDlfB
	1rggX7au/fjRJUvJHRJ1Zh4BQVvqQ31T8dtIg0d3odQUxto83p4Mm4ne2tvoiSggfChr
	ngva9AypndbPMZvtF4GvaQmex5+0hpANKJ9EaQVvIayOJh7Na/nRC2PLq1+HBLmsJCmX
	8tXbmu4gTCek9ug7au/zjo+ABrRFAO17WIYgbIwjgSQVHDDypCQDtw8ghBLCMY5v3y7S
	lYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rku1eN+bgt/G0AqTWoRDFKMiU4T0wVLhfLVxlPD7Gxw=;
	b=jnYrhLQdOKkOERwva9q5LRWgryE6Het3YEI0rJCCLrrcqFm/rAPWOTiyoUpxZ4Uy4S
	i9rwpzHCG7ruasLzL7YwBTbgWaVAi4CYxVN6d5qXofNo87444SGOVJV/3z68DMYj7i0q
	MjVqNrY9U3U6CSFpbGMGH+QkMOSOe9vYi/sxAPSzxYxe4ZKwp7TWlyGUlMUzDVD5HV0C
	uTEZ/F2Q6orNnOEG11XmqFn2JDmXqFkoNJNbQNAy86Fe0SkSHXGIwHoBdBGUaT6Q3fom
	xSILRwcaO7lo/tL27fx7xJ5AbhkuGUT0S2RyQh1AV5PnXcc/gqVB40zOFTU/du2yD+0g
	zs9Q==
X-Gm-Message-State: AFeK/H3CSZS6HIH96vJsi5yRBT5yn+DrEa6ORC1MLkzOiG3Iq7QpDCgA1YE5AYSebJNBEaMUIhh1tCxLMMD8sQ==
X-Received: by 10.223.139.196 with SMTP id w4mr10466463wra.172.1489702610036; 
	Thu, 16 Mar 2017 15:16:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Thu, 16 Mar 2017 15:16:19 -0700 (PDT)
In-Reply-To: <CAJ86T=VgRt+tvWgT-_JbDuxw5ft2hGFi8jYTjzBDEkGvLjooPQ@mail.gmail.com>
References: <20170316214239.16243-1-raj.khem@gmail.com>
	<CAJ86T=VgRt+tvWgT-_JbDuxw5ft2hGFi8jYTjzBDEkGvLjooPQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Mar 2017 15:16:19 -0700
Message-ID: <CAMKF1spBVtKmog9u+7fQ6ucNJHFeM2vizDwgCaQcpC6UXnqrpQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go: Remove mips32r2 from mips
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
X-List-Received-Date: Thu, 16 Mar 2017 22:16:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 16, 2017 at 2:54 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Mar 16, 2017 at 2:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> mips32r1 is only one supported for mips32
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/go/go_1.8.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/go/go_1.8.bb b/meta/recipes-devtools/go/go_1.8.bb
>> index e7a6ab277e..091b1318af 100644
>> --- a/meta/recipes-devtools/go/go_1.8.bb
>> +++ b/meta/recipes-devtools/go/go_1.8.bb
>> @@ -1,2 +1,3 @@
>>  require go-${PV}.inc
>>  require go.inc
>> +TUNE_CCARGS_remove = "-march=mips32r2"
>
> Do you need to add "-march=mips32" ? Or do the go Makefiles etc
> provide that by default?
>

thats passed by default.

>> --
>> 2.12.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

