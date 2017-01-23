Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 54176719BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 23:20:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r126so30178510wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 15:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LY53qtUxQcXgTY8DPzDjVDWvs1J7YbS6stffVlJ6naE=;
	b=Am9AmrGi/bYyV+V+Co+z7COzYRQYRABdt5BfmdB+2KnR4tM/LCQBaN9Z+Gx2xEy0Am
	+hsiZ+814endd0wqOWYzNhojAtJ6H5Nas3fdHVatRH8KFg/kI6Gb3tagdLiU5hoSVeyB
	CKCTBFkQtsGaBoSvKo4u7KrhDraa6IalM05NVVGEx2vtLpinxHuBK7LVL23I7N5AxyE9
	4s5BbGURu5cZnQqOxwMvSqZpvjqpVY7IYf4sRTEbly9LvHh+J8MKXEBeguvJI8uHpaGy
	Jf9XIRDCpknuKz5YDEHtV8tTA1ntzUSl0LKLkMnAhQ0Ua0ZJ6nuEhAyfcjs9VAD/fwHK
	hAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LY53qtUxQcXgTY8DPzDjVDWvs1J7YbS6stffVlJ6naE=;
	b=exDRVwRO0KfANPXIav2aUF9HXTvHJm4vARY8ExxYcxXVIvt05PEyNWn4Oy9/2ayDE4
	/4c1rucdSlW/HooLQshBSjU/5/9+wp78idQJZydUgduYdfD46W/U9Uxb0gziqloFL/iW
	aNs/QnEy7+4ZURfu/qVZrgzcPfR3YEPeRvIJ05JCUr43igZLT+rcYPubKBqwQa1jEYYU
	UyPOpblmhnc4iO6pHx59xsAQzASDwaAHxzZC45oIexrpc2b+QIStkSaUh0AU37rs5GUj
	r0XgcHY3pYnAvqHFoFCKJ8wDCo7HrJX+AHyglUho34ATqQONvQxlT3SU3x5onHG+Tomg
	r0gg==
X-Gm-Message-State: AIkVDXK/AMZtdETlycRcDm7lV5dV2nBRzq84te3esD5p5EHKeZtTRmOvVYOw4ls8FXMPmX+ytLo+SENrcCBEFA==
X-Received: by 10.223.160.43 with SMTP id k40mr29317326wrk.24.1485213617550;
	Mon, 23 Jan 2017 15:20:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.248.129 with HTTP; Mon, 23 Jan 2017 15:20:16 -0800 (PST)
In-Reply-To: <CAMZwcMBiX4aXD5K3s7fkvZNQ5L3YXqR06c5gwd75ogxp40rwNw@mail.gmail.com>
References: <1484838091-13265-1-git-send-email-yannick.gicquel@iot.bzh>
	<CAJ86T=W=moB9EoX+7dby4qCFM7+5+3Y7j_3=jSxAiUunHc1PpQ@mail.gmail.com>
	<CAMZwcMCzAe2GzweBMbruuTXN_OBeTcefco81zwPHfy=nxcTaHw@mail.gmail.com>
	<CAMZwcMBiX4aXD5K3s7fkvZNQ5L3YXqR06c5gwd75ogxp40rwNw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 23 Jan 2017 15:20:16 -0800
Message-ID: <CAJ86T=UaOFm4YqaYJDFouXnpbYj2XiWmdp=8FoODFJ50BSuE5Q@mail.gmail.com>
To: Yannick GICQUEL <yannick.gicquel@iot.bzh>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] ccache.bbclass: enable max size setup for ccache dir
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
X-List-Received-Date: Mon, 23 Jan 2017 23:20:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 20, 2017 at 8:47 AM, Yannick GICQUEL
<yannick.gicquel@iot.bzh> wrote:
> 2017-01-20 17:23 GMT+01:00 Yannick GICQUEL <yannick.gicquel@iot.bzh>:
>> 2017-01-19 20:02 GMT+01:00 Andre McCurdy <armccurdy@gmail.com>:
>>> On Thu, Jan 19, 2017 at 7:01 AM, Yannick Gicquel
>>> <yannick.gicquel@iot.bzh> wrote:
>>>> ccache directories are limited to 1G by default.
>>>
>>> 1G has been the default for a long time, so maybe it's time to propose
>>> an upstream change to increase, e.g. to 10G, giving the size of the
>>> webkitgtk build as justification?
>>
>> You are right, 1GB was the default cache size limit in old versions
>> and it's up to 5GB since release 3.2 [1].
>>
>>> Since we build ccache-native within oe-core, any such patch could be
>>> applied to our version of ccache right now (ie we don't need to wait
>>> for it to be accepted and merged upstream).
>>
>> Current ccache.bbclass implementation is using the host ccache, so the
>> default limit can be different depending on the version deployed on
>> host distro. The point is that even if we use ccache-native, their
>> still will be a default size limit set.
>> Even if 5GB (or 10GB) limit should fit the webkitgtk cache size
>> requirements, some other recipes can require more space to gain full
>> benefit of the ccache (e.g. chromium from meta-browser) and for those
>> it can be useful to tune the size.
>>
>> Does it make sense?

Yes, it does. If 5GB isn't enough, then enabling compression of files
in ccache ( https://ccache.samba.org/manual.html#_cache_compression )
may be a better solution than removing the 5GB limit, but I do see the
argument that since we don't place arbitrary limits on downloads or
sstate directory sizes, why limit ccache?

However, calling "ccache -M XXX" after every recipe's do_configure()
still doesn't seem ideal. Firstly because the command will run many
more times than necessary but also because, for users who over-ride
CCACHE_DIR to try to share ccache files between builds, it will
silently and permanently over-write any existing "max_size" option
which they may have manually configured.

As an alternative, does simply exporting CCACHE_MAXSIZE=0 from
ccache.bbclass work?

(In general, I'm all in favour of improving ccache support in oe-core
so it's good to see these changes being proposed and discussed).

>> Yannick
>>
>> [1]: https://ccache.samba.org/releasenotes.html#_ccache_3_2
>>
>>>
>>>> This patch enables the configuration of their limits, and as default
>>>> location is TMPDIR, it proposes a size limit to "0" (unlimited).
>>>>
>>>> The setup can be overloaded in local.conf by setting
>>>> CCACHE_MAX_SIZE to a custom value if needed.
>>>>
>>>> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
>>>> ---
>>>>  meta/classes/ccache.bbclass | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
>>>> index 93fcaca..b6643a1 100644
>>>> --- a/meta/classes/ccache.bbclass
>>>> +++ b/meta/classes/ccache.bbclass
>>>> @@ -1,6 +1,14 @@
>>>>  CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
>>>>  export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
>>>>  CCACHE_DISABLE[unexport] = "1"
>>>> +CCACHE_MAX_SIZE ?= "0"
>>>>
>>>>  do_configure[dirs] =+ "${CCACHE_DIR}"
>>>>  do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
>>>> +
>>>> +ccache_init() {
>>>> +    if [ -n "${CCACHE}" ]; then
>>>> +        ${CCACHE} -M ${CCACHE_MAX_SIZE}
>>>> +    fi
>>>> +}
>>>> +do_configure[postfuncs] += "ccache_init"
>>>> --
>>>> 1.9.1
>>>>

