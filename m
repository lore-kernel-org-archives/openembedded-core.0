Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id A3B1B6ACED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 00:28:50 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so10749324pdj.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 17:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=pZ+lYBetlGxgpCuSccTYDVn1CtpP1vBWwRMtQcPQFLs=;
	b=HrAIeB4kJKMyC2sTmRHCC6qgjBHfY2XzeOaPl4zVw8byNoLmMplaFUYZJ2TeLHsKda
	1LylCCyXokJZiU0j+uLg2FmU5weJeOk3MAu7/KKxLR1anpXyI6TB2D/wGyH/oomP1Uym
	YWVHIXGtcKmqR2zzFWTpBUO13r/o1bZA3frlHsfeQD2aTXgKxKWdUzYqW/fDjvizUi4C
	lMJ3UqEZjPh8gNFsfhCK4cLpYuLDv4En3HhhSzQ4ontvxEsBaJ158RKQJp1SQkA8wf/4
	OZVSdMn8DJQHafSMupnz0N1s+wKCHuZYff9SuAD3TNKae0IPt1DAANyYnsU7pGU2cHWI
	rkyQ==
X-Gm-Message-State: ALoCoQmQ+GhAF4QUrK204jmJFXDch7WKSRE41eqjZ8mxUGnKmG4n6tY36PuK7HMjrmGtir1sKpZy
X-Received: by 10.68.139.194 with SMTP id ra2mr41756313pbb.20.1406593731995;
	Mon, 28 Jul 2014 17:28:51 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:d0e4:20cd:a8cf:9a4a?
	([2601:c:9380:601:d0e4:20cd:a8cf:9a4a])
	by mx.google.com with ESMTPSA id
	eh4sm18899957pbc.79.2014.07.28.17.28.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jul 2014 17:28:51 -0700 (PDT)
Message-ID: <53D6EAC1.2030802@mvista.com>
Date: Mon, 28 Jul 2014 17:28:49 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <53D2DE13.9010007@mvista.com>
	<CAMKF1son3T9fsuF9X0Px4hirfk7Ezguy4s5Zit6-0JvfmXDV5A@mail.gmail.com>
	<53D65F40.7010701@windriver.com>
In-Reply-To: <53D65F40.7010701@windriver.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libpcap-ng
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
X-List-Received-Date: Tue, 29 Jul 2014 00:28:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/28/2014 07:33 AM, Mark Hatle wrote:
> On 7/25/14, 10:02 PM, Khem Raj wrote:
>> On Fri, Jul 25, 2014 at 3:45 PM, akuster <akuster@mvista.com> wrote:
>>> Meta-security and Meta-selinux both have libcap-ng. Instead of
>>> maintaining
>>> the same package in both places, can we get it into OE where libcap
>>> resides?
>>
>> I think at very least you can propose it for meta-oe if not or-core.

I think core libcap-ng recipe belongs in a common layer and not 
maintained in two places.

>> But I also wonder why meta-selinux is not a sub-layer under
>> meta-security,
>>
>
> meta-selinux existed first... no other reason.
>
>
> The last time I looked at meta-security (well over a year ago), it
> wasn't terribly useful.

Well when a security package like 'snort' and maybe others are in other 
locations, I can see why meta-security won't be very useful.

  It was just a random collection of
> security-like packages, some worked, some didn't.

Hopefully that will change.

- Armin

>
> If it has grown since then to be more of a cohesive set of packages,
> then meta-selinux being part of it may make sense.
>
> --Mark

