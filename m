Return-Path: <ygl@iot.bzh>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 06ECA600EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 08:57:23 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id x1so38313772lff.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 00:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q9+kdTzOjZwBLl6fp5hUNOULNjtVfNJdZzqeH9jd2xE=;
	b=hlVAtdw/awRfMVOOjlCIEA7fapFDW3BIRvDPVjVQ5JX5rLWwfMti+KY4jXFxyiO4Px
	o0TNUO9zHdh4PHdOsANRnPSXQsSzyaIXEZDuw9QXX8jteYJ+POmD9HyA9eXW88hSAlh9
	rI7XXGG78f26JOg6gGuGWZRAPW7BOm0xpikKo1g8p9ILYC4Od7ZInWNFOiLQiysdzAZH
	Sdnj0dOmPryYK2Ut+EBGyQ4I5cXmm1ZZDl0i02H+ZSk5tuUuqYK5QP+e1RBP6KlhdO/r
	LQeabeEVrWTcJVLo9rdjwiUHGx3Zt1fG5hFwbEQSV/k/DEnLUx5T8Qv3nVVDaonxr+Tl
	CUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q9+kdTzOjZwBLl6fp5hUNOULNjtVfNJdZzqeH9jd2xE=;
	b=NWPJQfI9HRS/uFIeTuTSN2iz5WW54QtBVZMa5GknEkwkCoq3zTSnmbuBhlMATIau1W
	atRv3bbdvUts6g6oEJOCKz7XSZXYrD8f7EasX3yW/DkgBPdjr7Jwhu4T2eXngLk2VrTo
	OONvEWMvQjQn6w1w7HFkrGClf5t4caK7sAn+FppLDN68RN572XZmKIERmwMCyXZQvM+Y
	5IfFq6Xnd0R/k0+oGilhVNraLgzNP/UxLjD58vCXgmTFonc/WGvBJ1HX82tahoecoEbB
	yDlc73C4WHPPYeKQG2ci358xATgNiCaWTyQPhc9jU85B4jvaTq0uOan5csGyQprD55nt
	ZZaA==
X-Gm-Message-State: AIkVDXI4uUmqK+FzoMAShrxUhxZ0AZbLgJ6D/u8sz7vPAsWsp78BtpDqESOCvCJuiDVf/GpBn9pnmXgjxgUpAA==
X-Received: by 10.25.22.96 with SMTP id m93mr13123194lfi.101.1485334643297;
	Wed, 25 Jan 2017 00:57:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.170.18 with HTTP; Wed, 25 Jan 2017 00:57:22 -0800 (PST)
X-Originating-IP: [82.253.123.24]
In-Reply-To: <CAJ86T=UaOFm4YqaYJDFouXnpbYj2XiWmdp=8FoODFJ50BSuE5Q@mail.gmail.com>
References: <1484838091-13265-1-git-send-email-yannick.gicquel@iot.bzh>
	<CAJ86T=W=moB9EoX+7dby4qCFM7+5+3Y7j_3=jSxAiUunHc1PpQ@mail.gmail.com>
	<CAMZwcMCzAe2GzweBMbruuTXN_OBeTcefco81zwPHfy=nxcTaHw@mail.gmail.com>
	<CAMZwcMBiX4aXD5K3s7fkvZNQ5L3YXqR06c5gwd75ogxp40rwNw@mail.gmail.com>
	<CAJ86T=UaOFm4YqaYJDFouXnpbYj2XiWmdp=8FoODFJ50BSuE5Q@mail.gmail.com>
From: Yannick GICQUEL <yannick.gicquel@iot.bzh>
Date: Wed, 25 Jan 2017 09:57:22 +0100
Message-ID: <CAMZwcMDTJe3mRoynYmK79npqF+=mjGPaUHsE3d6C2jQtUUWryg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Wed, 25 Jan 2017 08:57:24 -0000
Content-Type: text/plain; charset=UTF-8

2017-01-24 0:20 GMT+01:00 Andre McCurdy <armccurdy@gmail.com>:
> On Fri, Jan 20, 2017 at 8:47 AM, Yannick GICQUEL
> <yannick.gicquel@iot.bzh> wrote:
>> 2017-01-20 17:23 GMT+01:00 Yannick GICQUEL <yannick.gicquel@iot.bzh>:
>>> 2017-01-19 20:02 GMT+01:00 Andre McCurdy <armccurdy@gmail.com>:
>>>> On Thu, Jan 19, 2017 at 7:01 AM, Yannick Gicquel
>>>> <yannick.gicquel@iot.bzh> wrote:
>>>>> ccache directories are limited to 1G by default.
>>>>
>>>> 1G has been the default for a long time, so maybe it's time to propose
>>>> an upstream change to increase, e.g. to 10G, giving the size of the
>>>> webkitgtk build as justification?
>>>
>>> You are right, 1GB was the default cache size limit in old versions
>>> and it's up to 5GB since release 3.2 [1].
>>>
>>>> Since we build ccache-native within oe-core, any such patch could be
>>>> applied to our version of ccache right now (ie we don't need to wait
>>>> for it to be accepted and merged upstream).
>>>
>>> Current ccache.bbclass implementation is using the host ccache, so the
>>> default limit can be different depending on the version deployed on
>>> host distro. The point is that even if we use ccache-native, their
>>> still will be a default size limit set.
>>> Even if 5GB (or 10GB) limit should fit the webkitgtk cache size
>>> requirements, some other recipes can require more space to gain full
>>> benefit of the ccache (e.g. chromium from meta-browser) and for those
>>> it can be useful to tune the size.
>>>
>>> Does it make sense?
>
> Yes, it does. If 5GB isn't enough, then enabling compression of files
> in ccache ( https://ccache.samba.org/manual.html#_cache_compression )
> may be a better solution than removing the 5GB limit, but I do see the
> argument that since we don't place arbitrary limits on downloads or
> sstate directory sizes, why limit ccache?
>
> However, calling "ccache -M XXX" after every recipe's do_configure()
> still doesn't seem ideal. Firstly because the command will run many
> more times than necessary but also because, for users who over-ride

This add a call to ccache binary once per recipe build. In term of
execution time, IMHO it looks quite reasonable compared to the
drawback of a rebuild with limited cache size, but...

> CCACHE_DIR to try to share ccache files between builds, it will
> silently and permanently over-write any existing "max_size" option
> which they may have manually configured.

... I agree : the default behavior proposed can silently change some
user's custom setup, which may not be a good thing. (Same remark can
be done on the activation of compression, which may be kept to the
user's preferences)

>
> As an alternative, does simply exporting CCACHE_MAXSIZE=0 from
> ccache.bbclass work?

With recent ccache release, yes it does (v3.3.3 at least). But
depending on the host distro, it may not.
I had some experiment about using "ccache-native" binary, and I also
agree it can provides more flexibility : most (all?) of the
configuration variable can be tuned by exporting relevant environment
variable.

Updating ccache.bbclass to use ccache-native is not an easy task :
basically we could add a DEPENDS on "ccache-native" to all recipe
which inherit this class, but it can bring some dependency loops on
ccache recipe itself, which I do not know how to fix in a generic way.

About this patch serie, I propose to split it and keep this "max_size"
tune feature on a separate scope.

>
> (In general, I'm all in favour of improving ccache support in oe-core
> so it's good to see these changes being proposed and discussed).

You are welcome, thanks for your feedbacks.

>
>>> Yannick
>>>
>>> [1]: https://ccache.samba.org/releasenotes.html#_ccache_3_2
>>>
>>>>
>>>>> This patch enables the configuration of their limits, and as default
>>>>> location is TMPDIR, it proposes a size limit to "0" (unlimited).
>>>>>
>>>>> The setup can be overloaded in local.conf by setting
>>>>> CCACHE_MAX_SIZE to a custom value if needed.
>>>>>
>>>>> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
>>>>> ---
>>>>>  meta/classes/ccache.bbclass | 8 ++++++++
>>>>>  1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
>>>>> index 93fcaca..b6643a1 100644
>>>>> --- a/meta/classes/ccache.bbclass
>>>>> +++ b/meta/classes/ccache.bbclass
>>>>> @@ -1,6 +1,14 @@
>>>>>  CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
>>>>>  export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
>>>>>  CCACHE_DISABLE[unexport] = "1"
>>>>> +CCACHE_MAX_SIZE ?= "0"
>>>>>
>>>>>  do_configure[dirs] =+ "${CCACHE_DIR}"
>>>>>  do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
>>>>> +
>>>>> +ccache_init() {
>>>>> +    if [ -n "${CCACHE}" ]; then
>>>>> +        ${CCACHE} -M ${CCACHE_MAX_SIZE}
>>>>> +    fi
>>>>> +}
>>>>> +do_configure[postfuncs] += "ccache_init"
>>>>> --
>>>>> 1.9.1
>>>>>

