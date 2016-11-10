Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 42CDE6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 20:14:36 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g23so62706519wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uJGhZ16EKFcfKNqhKyca0OfqSHAh4T3WuUNd8HUoM/A=;
	b=NR0L5u3tFa7V5Axqn0k611FtimpuNByhGTXvNUARcs0tAlKPVIwz+lB+KDkAqB71qO
	M2W6Ireq53xwXrriWy1uU/radjFrzNELjHe4jgPIIYBVGdm+awPzvkifNd6gzHdjrtzs
	0lzl8PEN1oYrd5nst8iVRpzzgVNsJCr1nV0lIVG7icUJFHvqn0wEr746iDYzWLOzMq/j
	P9W0/Cvjy+m9qQ/ZS0mMngsNx+Q80SFPIMeIdMQvQ6gad4dKp+ASF7PtPs9PtEEHqcss
	5Jz9td2bMkHieBshus/gfC5NMXDL2Z7F7DM3XCuM2mtdvicIjC1N2ADDmw+FJs1ljgf+
	6Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uJGhZ16EKFcfKNqhKyca0OfqSHAh4T3WuUNd8HUoM/A=;
	b=fCEF7WYK9vzAAZEjYg+ktBVKjGHau3rTiEIzVYf2kObCkiK8cqetL5FAEg099ko/i9
	hIzswWtCb9oC68ZLJGRHrpmap04NomGWteCweqRayFgtt/najIM98XPjF77bQIkmpiEO
	mpSt/EpUAe+pVo/ZMgR76TDRkzX9dLKXHjkamyORFUjkUvldnqeqB0W80n3sVh/mMPZf
	h/Pi9H4d7o/AMnE0FUktNMT/7pqUSmtbmMJBy4FyDoZhqfYBOzZHwtx77dqBQokZr39C
	HX4OyKBIiAWtZOAG03uiebf5b7iJMmESSlY62gecf38E82+yI6PZcXm44VBFVajrHaOw
	kl8Q==
X-Gm-Message-State: ABUngvew32J/b/wnBZKj8iJ2Z1D0D7I986MX02fIAYDwvP1l8OFLH08REvuqVTqEHvoqRDASJTNdv1s1LK6Mrg==
X-Received: by 10.28.152.79 with SMTP id a76mr7430415wme.47.1478808876943;
	Thu, 10 Nov 2016 12:14:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Thu, 10 Nov 2016 12:14:16 -0800 (PST)
In-Reply-To: <CAJTo0LbnJydYvd8a7e_AXM-h3v7pHB0S_EQUsZyBFu=mS7_L1g@mail.gmail.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<cdfe7f669ad98f3d36c074e847e9ecd29eeab86b.1478779674.git.maciej.borzecki@rndity.com>
	<CAJTo0LbnJydYvd8a7e_AXM-h3v7pHB0S_EQUsZyBFu=mS7_L1g@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Thu, 10 Nov 2016 21:14:16 +0100
Message-ID: <CAD4b0_JE7s7QHyjCZv5rDYxFm0gHQs+S337QzAeJoA_uGx2HoQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 06/10] oe-selftest: fix handling of test cases without ID in --list-tests-by
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
X-List-Received-Date: Thu, 10 Nov 2016 20:14:38 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 10, 2016 at 9:05 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 10 November 2016 at 12:18, Maciej Borzecki <maciej.borzecki@rndity.com>
> wrote:
>>
>> -    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule)
>> for tc in get_testsuite_by(criteria, keyword) ])
>> -
>> -    print('%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name',
>> 'class', 'module'))
>> +    def tc_key(t):
>> +        if t[0] is None:
>> +            return  (0,) + t[1:]
>> +        return t
>> +    # tcid may be None if no ID was assigned, in which case sorted() will
>> throw
>> +    # a TypeError as Python 3 does not allow comparison (<,<=,>=,>) of
>> +    # heterogeneous types, handle this by using a custom key generator
>> +    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule)
>> \
>> +                  for tc in get_testsuite_by(criteria, keyword) ],
>> key=tc_key)
>
>
> Wouldn't a shorter (but untested!) form alternative be just?
>
> -    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule)
> for tc in get_testsuite_by(criteria, keyword) ])
> +    ts = sorted([ (tc.tcid or 0, tc.tctag, tc.tcname, tc.tcclass,
> tc.tcmodule) for tc in get_testsuite_by(criteria, keyword) ])
>

Well, yes, that would work too. A downside though, is that the output of
--list-tests and --list-tests would be different. For --list-test, TCs without
ID would have None in the first column, while the same TCs in --lists-tests-by
would end up having 0.

I've tried to keep the output of both tools consistent. Also, 'None' seems to be
more a better fit in this case, as there's no ID.

Cheers,
-- 
Maciej Borzecki
RnDity

