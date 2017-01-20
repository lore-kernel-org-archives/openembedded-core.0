Return-Path: <ygl@iot.bzh>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1A72B71E4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 16:47:43 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id z134so61679843lff.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 08:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=k2iEf8uPjDTrIm1+8yFUY0nV1Tw2YNT7UxDCbHWWkLM=;
	b=mCyjGs8S1pHcEvjwMtzqbFEOzEOvNyOLOW0t6u/VM0FqHtICl1r51kVaH9HBOGpjUN
	zWrqH1eCwgmDPRWwBNDLnYHeisq+gHQv5hj38piLEo8NPTm5ocyvL0K94YYl6Y6SBfAL
	EaknGH8GWLqyzC70Woo758wcAFnA4nYGBbJlVvia8KBaJkOdeZxBnjEC0HfUq1FC5ydM
	qIa8iIuESvBAynpTi9pDqYQf8s7bAQt8W3LkCcuWwNO5RPIIW6BhtolYj3ufRkHzFcrV
	IJ83AnfDWQyN/mYohqykHdHSRfvexnYl8g2sMVQp3AStPNHohr0kcu6GP/X61SNR4tkW
	Y/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=k2iEf8uPjDTrIm1+8yFUY0nV1Tw2YNT7UxDCbHWWkLM=;
	b=uQkA9I3TdibpiiRT1DujQ4XDBMkSSzfjKlMrXWGVj6UjkOrAdKE6Gq+FvkljFhrd+/
	BWvunEXFeSGamx90CMr5bK5X5Ff9AqbTdaGdxAGklzdirgxAq484LV/qVTpgpMhsqDj4
	yI5xI5+1cII8EwyNIOrpyamgLfAEthedHj5mqRpIb5FwKOZU8v5b2G52rGztbQzQN/06
	xLIUR9E+FeMetGayaaGjCJsOwgOhsbmv1bMayPDgGGefUlGqWtdpvDYs/33SIUxAJ1iN
	R7Cm9mQzBQcw+fjbKD5tq84gNA5Q649FxMdbbQLJomy1cRLEgWzzj4RjqDHsc7pO/XYq
	btag==
X-Gm-Message-State: AIkVDXLD1ZkfslxfxNP7hWK7YQeIuooLgvlWI6o4Zi+4tpxz6QG0v1VDAcJKUuMtYeyKYHX8HSOUALnf6/bS2A==
X-Received: by 10.25.67.84 with SMTP id m20mr5514188lfj.106.1484930863364;
	Fri, 20 Jan 2017 08:47:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.170.18 with HTTP; Fri, 20 Jan 2017 08:47:42 -0800 (PST)
X-Originating-IP: [82.253.123.24]
In-Reply-To: <CAMZwcMCzAe2GzweBMbruuTXN_OBeTcefco81zwPHfy=nxcTaHw@mail.gmail.com>
References: <1484838091-13265-1-git-send-email-yannick.gicquel@iot.bzh>
	<CAJ86T=W=moB9EoX+7dby4qCFM7+5+3Y7j_3=jSxAiUunHc1PpQ@mail.gmail.com>
	<CAMZwcMCzAe2GzweBMbruuTXN_OBeTcefco81zwPHfy=nxcTaHw@mail.gmail.com>
From: Yannick GICQUEL <yannick.gicquel@iot.bzh>
Date: Fri, 20 Jan 2017 17:47:42 +0100
Message-ID: <CAMZwcMBiX4aXD5K3s7fkvZNQ5L3YXqR06c5gwd75ogxp40rwNw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 20 Jan 2017 16:47:46 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Some comments inline below (with oe-list this time),

Regards,

2017-01-20 17:23 GMT+01:00 Yannick GICQUEL <yannick.gicquel@iot.bzh>:
> 2017-01-19 20:02 GMT+01:00 Andre McCurdy <armccurdy@gmail.com>:
>> On Thu, Jan 19, 2017 at 7:01 AM, Yannick Gicquel
>> <yannick.gicquel@iot.bzh> wrote:
>>> ccache directories are limited to 1G by default.
>>
>> 1G has been the default for a long time, so maybe it's time to propose
>> an upstream change to increase, e.g. to 10G, giving the size of the
>> webkitgtk build as justification?
>
> You are right, 1GB was the default cache size limit in old versions
> and it's up to 5GB since release 3.2 [1].
>
>>
>> Since we build ccache-native within oe-core, any such patch could be
>> applied to our version of ccache right now (ie we don't need to wait
>> for it to be accepted and merged upstream).
>
> Current ccache.bbclass implementation is using the host ccache, so the
> default limit can be different depending on the version deployed on
> host distro. The point is that even if we use ccache-native, their
> still will be a default size limit set.
> Even if 5GB (or 10GB) limit should fit the webkitgtk cache size
> requirements, some other recipes can require more space to gain full
> benefit of the ccache (e.g. chromium from meta-browser) and for those
> it can be useful to tune the size.
>
> Does it make sense?
>
> Yannick
>
> [1]: https://ccache.samba.org/releasenotes.html#_ccache_3_2
>
>>
>>> This patch enables the configuration of their limits, and as default
>>> location is TMPDIR, it proposes a size limit to "0" (unlimited).
>>>
>>> The setup can be overloaded in local.conf by setting
>>> CCACHE_MAX_SIZE to a custom value if needed.
>>>
>>> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
>>> ---
>>>  meta/classes/ccache.bbclass | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
>>> index 93fcaca..b6643a1 100644
>>> --- a/meta/classes/ccache.bbclass
>>> +++ b/meta/classes/ccache.bbclass
>>> @@ -1,6 +1,14 @@
>>>  CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
>>>  export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
>>>  CCACHE_DISABLE[unexport] = "1"
>>> +CCACHE_MAX_SIZE ?= "0"
>>>
>>>  do_configure[dirs] =+ "${CCACHE_DIR}"
>>>  do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
>>> +
>>> +ccache_init() {
>>> +    if [ -n "${CCACHE}" ]; then
>>> +        ${CCACHE} -M ${CCACHE_MAX_SIZE}
>>> +    fi
>>> +}
>>> +do_configure[postfuncs] += "ccache_init"
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

