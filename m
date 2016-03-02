Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 33F25770AF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 14:31:08 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id u110so40860420qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 06:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OOR+wAlUz5+SfvPIx54+jNTj+DInM6jZKXMzQw+Mo7s=;
	b=gKqLpXa1gz/GRxrOQilIZII9YBbrWlnCuEAAzlvy2rL3HZH6W6oLtZXc4OFyprPArF
	lj9qRFOai+NlFBSSmpfo0cULna7FcD6VHa3kVzrA9zzBW3ImOGEonFtZJj28kzdpi2NA
	sOyr+RGPp9tMPlO8u0tnvY/xWDcPqKB2AialWNlSdf/G8hLGJYTiCK73gI/exfeA8u/L
	NVuDZyiwClem7KvzgEecnEG2HHPxg6V5jd6hbTXx/Kc6aNchObLjwjccXaISzvYn6iXl
	LZsS7r4nplWRIPu6rxp7mr/0jCxfXk82/zgtuGSgfXkTE/e+hDA8W6Q2+wpJdNJwXmAN
	n7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OOR+wAlUz5+SfvPIx54+jNTj+DInM6jZKXMzQw+Mo7s=;
	b=EMmdyaNj1j5+VcrISM2qzI8Kju9VcIb4Xc1S3P5qJZmb88sozLFyAg0qC3zgrPgBG3
	/4OoboYWJY940EkcYHhPmgeyv33GfQjXWJyIFd6qoRe/dPdaz5NM6LNqbe4UU13q6flX
	MtFZHivwTzVsyTfhs14gpB/AawPeF486f5sRVamjnXcxeBbTZZ3S+vPXXIG7r3XZ0yfM
	UH0s+F6inQOv1vpmrq133WvQSXXQXKFA/iE0Rocryf2js3TBEeKnpAbJtCbEQlCcWqr+
	VuhUaxf5wGY/waFQImm7EB0ctp4Tam+ASU92Ne/a6YZlHrFugVRLVIkJjh86jHASuOU0
	w0Ag==
X-Gm-Message-State: AD7BkJKGOK2poBxR51ZmY3PKiMV/o4FDmAAf1kYkK99jaLb34Pnipp4Z+rqKr3Q7kyyw/svs8mQ1yA4EPkJzQQ==
X-Received: by 10.141.4.135 with SMTP id g129mr36141276qhd.31.1456929069489;
	Wed, 02 Mar 2016 06:31:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Wed, 2 Mar 2016 06:30:39 -0800 (PST)
In-Reply-To: <56D6F62C.2020000@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
	<549d5d18a9fe89af398559b3f8df60bb66643392.1456415870.git.alexander.kanavin@linux.intel.com>
	<89F0A1C5-6710-4F62-A646-0A2FDDDC75D8@gmail.com>
	<56D5A3B1.8080008@linux.intel.com>
	<CAMKF1sqDVjNH_XLhbY+86BdFx9vZZpaw8j-XNDTM67st=LWW=Q@mail.gmail.com>
	<56D6F62C.2020000@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2016 06:30:39 -0800
Message-ID: <CAMKF1sqNKzREAVcpQQry9preJf0Jnj6U245CcTE-vpubQ9jJ1w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/19] nspr: update to 4.12
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
X-List-Received-Date: Wed, 02 Mar 2016 14:31:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 2, 2016 at 6:18 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 03/01/2016 04:58 PM, Khem Raj wrote:
>
>>> The failing patch is applied only when musl is in use (and so the
>>> regression
>>> went unnoticed). Can you rework it so that it can be applied
>>> unconditionally?
>>
>>
>> This probably could be however OE-Core supports musl and poky-tiny
>> defaults to it. It will be good to test
>> changes for it when changing OE-Core at the least bitbake -cpatch <recipe>
>
>
> Yes, but that's a job for autobuilder,

There is a musl job on autobuilder. Not sure if its run daily. Ross ?

I'm afraid. When doing local changes,
> I have to draw the line somewhere about what I test, and what I don't, and
> testing builds against various libc providers is outside of that.

Thats good to please mention that in your patch submissions especially
when you touch a recipe which is using such overrides for anything so
maintainers know testing it has received.

>
> Generally, patches should be unconditional, because a) we should be able to
> send them upstream, b) conditional patches create several slightly different
> versions of source code, which is a maintenance headache.
>

We understand that, sometimes its not possible.

