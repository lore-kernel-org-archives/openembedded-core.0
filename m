Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4707852C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 14:59:15 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q189so24940627wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pmHAwrzUvzeyPd8g0/pcPbS+akrYQ73EdJyFa4ISpFg=;
	b=DzGZjvREWl7ztIIkdwAE2nvzgkoMvIc9g3SfqMX45zLrSxKGllNDbEYYhAhPtkunIS
	ycdRf6npdq67dJKz1q5jcDMYRFSEO9Xrw7vmyff1cnXOo+t5YKkIhLc0Wo80sg9iCY5P
	qZc7jchXR/267BXul92JfAgRk0sKxhHJcSyHdch6lmkdFRG7aP208Zih7g15zg71jNkO
	dqvESNQoulFaY7fWMajaiOZLihVUMjUpf/riqa6hcCuwM97iWlvBjQb0jG0mSDna2/M3
	yo0cqVN0kU/c8U8xOQGBMgCjcIOpyQNoBnq6qsf4Bjx6FEl4/H1IsyArXqrhObQPzOD8
	w5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pmHAwrzUvzeyPd8g0/pcPbS+akrYQ73EdJyFa4ISpFg=;
	b=F2pDvaZ+qbO5LuX/cqLBIy7PVC2tPj9gNzrs4ptwPZs8SfZNIcsMjw2ugyQq5rEN/R
	NTwdiZsvBTxJen46oEgnEWR6qu6f64HIfXKpq6gJ1VccSsiZ2stDzyIXJFUe3S5l2V4U
	rnYnOeDcw3v8iE5kkX9FuzgkOEa5/RbopDlw1rOancCLN2rCvKKyq8i8UpBw+LyV/aK+
	8vONdqaQuzvQKk3HsNtf0KmZHOMym7FOhi2o3mQD+oB7DS99QzGa3fTVpE7MtHuoD6kr
	nw8jK1bdUQ4O7pNWWa2/df2PNuj+F8p5jcdEjZ4RFdhicPYdEDscokbFkuqlQHgtYjij
	C5aQ==
X-Gm-Message-State: AIVw110/gGCOePwXu9SrNMO1fGRcSlluKSQ9/vdxlRFGZFI4X0Vjvq4y
	GhG8xEz2pIjMukvGhJoG8iqmpS7BjA==
X-Received: by 10.80.159.227 with SMTP id c90mr8644746edf.11.1501513156659;
	Mon, 31 Jul 2017 07:59:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Mon, 31 Jul 2017 07:58:46 -0700 (PDT)
In-Reply-To: <CAJTo0LaVVvB2GG2PN3ub_18FZimsPC9tTHhQ2HbfAPHKm0NAqg@mail.gmail.com>
References: <20170724142818.44403-1-alexander.kanavin@linux.intel.com>
	<20170724142818.44403-5-alexander.kanavin@linux.intel.com>
	<CAJTo0LbJvsviFJGW8k=Hgsr=kCgFhv7MX=wyjxYz2t23zkSQ1Q@mail.gmail.com>
	<CAMKF1so7BKN37KMUBDcDw9zHqZmO6YJuFpM8igAHo40QG_CkkQ@mail.gmail.com>
	<CAJTo0LbDLYh1vOOt6UqjbMpK86b5TuhcXRBqFz=EhzjEp0J1mA@mail.gmail.com>
	<287709d4-1010-10fa-fd94-929e4c465e49@linux.intel.com>
	<1501494217.18633.0.camel@linuxfoundation.org>
	<6b824286-9d84-5b3c-3106-40b35bc4050b@linux.intel.com>
	<b80a80e1-1384-3702-fe94-61315c502f85@linux.intel.com>
	<CAJTo0LaVVvB2GG2PN3ub_18FZimsPC9tTHhQ2HbfAPHKm0NAqg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Jul 2017 07:58:46 -0700
Message-ID: <CAMKF1srGwqMPUSnKTkNcqUuj63Z39O7t8L=OeEbxGqMw3y3ziQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] gperf: upgrade to 3.1
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
X-List-Received-Date: Mon, 31 Jul 2017 14:59:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 31, 2017 at 7:55 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Neither Debian not Fedora rebuild dependencies, you'll see a lot of
> "rebuild" changelog entries where API changes demanded it to happen.
>
> Our builds take longer but you know the build always works.  Their builds
> may be broken without anyone noticing for a while.
>
> Ross
>
> On 31 July 2017 at 11:18, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>>
>> On 07/31/2017 12:53 PM, Alexander Kanavin wrote:
>>>
>>> The only thing I found was this email:
>>> http://lists.gnu.org/archive/html/bug-gperf/2017-01/msg00004.html
>>> which was ignored by upstream.
>>>
>>> However, both debian testing and fedora rawhide have gperf 3.1, so I'm
>>> not sure how they made it work. I'm running debian here, so can look into
>>> this.
>>
>>
>> Right. Debian dropped the updated gperf package into repositories, but did
>> not rebuild anything that relies on it. When I tried that with libcap, I got
>> the exact same error as we've seen.

they do mass rebuilds but thats not like us where we build it daily.

>>
>> Not sure what's going to happen when they discover the incompatibility.
>> I'm a bit surprised they don't do such dependency rebuilds when changes are
>> introduced.
>>
>> Alex
>
>

