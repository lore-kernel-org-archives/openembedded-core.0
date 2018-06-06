Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8DDAF771BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 17:45:16 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id h79-v6so6020033oig.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 10:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UQj/qVLDGksCgp34A/HNfWHf+RjFIZ+e5iGEtx5GBw4=;
	b=Dcnzvu1/Ymnc7m/iJBJ1RtRg0sG8UN656NSx9Zh6NhSoCCI9I5/42p8l4IKZniiwRi
	YxRMmHRXmavT3FiM/fI1qiskcfgLOD9KthLyLFu6WwlnCoqI5C7oLEQxKVkBKEjPAqgv
	yQrl3oUnt/yBASvyWUDGD2NHZTh9SQxpJjed5mCPboNGO7/H+HDf8VX+54Uy8xML1JVo
	OCfQngxGDSfsjQhbqjqX3UwRVnqj+OMNB3PZHfu4CztVQmFhHQSPhnfmvva9Jbyll/zm
	KvTYIS6GRpiLWI2m15mIkdUQMpLp+Q/vO7uOoIsjZ02kUf1gpAO9hgqiDiIc9SeY8BXt
	9sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UQj/qVLDGksCgp34A/HNfWHf+RjFIZ+e5iGEtx5GBw4=;
	b=azTSM42bwk7IA3B5zSxFhNNGZg5pgcRav+GwsJUNxt5CYLG+wTYIDoJc0+FDSmXnlN
	tZsgmAS7TzTSFaJvfJv60NjmTqES1NIb0SHuBN2OLEe0DYQ8WEk4rrF9RAAD7MP06jz2
	oVnqJPFU8nZ7J82FhGPrzfx//igt33G6AWuOCisPMezI3CmsjFJ/ZBtmhOpyr3++KtfL
	kdpwjoMjtMQUMYuIlNRiUvTQOzy0zGbnX+AYXqNXoAUyRAP0Csc9id3dV31cFEexR0oX
	vZchnbFlMIl1pP/RUB3zO4/HnVkblxKQ+QSWfhh1QoOaJcYj1PnvgOa4xlAny2gY8sDz
	hZyg==
X-Gm-Message-State: APt69E2g4QIqK81hAzvRLFiUHHYe/YQN27krXHdAfRiihL4Jx796LHHk
	zgV1WvY8ASLj2oa9dqlMWaFTHVIjYSKihdJp1x4=
X-Google-Smtp-Source: ADUXVKKu69YK81agCCJzz9pACpbQO1BH7JF1ItyMbfAV00KJyW2rdwcxOuZ3TbqP/5GEpJtoFioTS7j24u0av95Dyk8=
X-Received: by 2002:aca:47c6:: with SMTP id
	u189-v6mr2404784oia.100.1528307117533; 
	Wed, 06 Jun 2018 10:45:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 10:45:16 -0700 (PDT)
In-Reply-To: <6930e1ac-2a66-5160-1374-b97e67f84cf1@sashko.rv.ua>
References: <20180604163905.17292-1-dev@sashko.rv.ua>
	<CAJTo0Lb6RUUcs4Xv+OOo7N8pHyAW2Oeg60jNTeprxiNrA_5MwA@mail.gmail.com>
	<6930e1ac-2a66-5160-1374-b97e67f84cf1@sashko.rv.ua>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Jun 2018 20:45:16 +0300
Message-ID: <CANNYZj84o35Apa=kG4KokVe7dBFgdO0iR1QmhCUihhvF3hX10w@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] minicom: fix SRC_URI
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
X-List-Received-Date: Wed, 06 Jun 2018 17:45:16 -0000
Content-Type: text/plain; charset="UTF-8"

http://snapshot.debian.org/archive/debian/20180606T155409Z/ .... for
SRC_URI (fill in the rest).

${DEBIAN_MIRROR}/..... for UPSTREAM_CHECK_URI (as the above snapshot
site is static, and won't be receiving new versions).

Alex

2018-06-06 20:25 GMT+03:00 Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com>:
> Gentlemen,
>
> Could you please clarify which source should be used for SRC_URI instead of
> alioth.debian.org?
>
> Thanks.
>
>
>
> On 05/06/18 21:35, Burton, Ross wrote:
>>
>> The Debian mirror network can't be relied upon as files are removed
>> once they're not in any releases.  For this reason, we prefer
>> snapshot.debian.org for SRC_URI (with DEBIAN_MIRROR for the upstream
>> check).
>>
>> Ross
>>
>> On 4 June 2018 at 17:39, Oleksandr Kravchuk
>> <open.source@oleksandr-kravchuk.com> wrote:
>>>
>>> The original source, alioth.debian.org has been permanently taken down
>>> by the Debian Project. Use Debian mirrors instead.
>>>
>>> Source: https://wiki.debian.org/Alioth
>>>
>>> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
>>> ---
>>>   meta/recipes-extended/minicom/minicom_2.7.1.bb | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb
>>> b/meta/recipes-extended/minicom/minicom_2.7.1.bb
>>> index e6afe2b655..d963da7436 100644
>>> --- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
>>> +++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
>>> @@ -1,5 +1,5 @@
>>>   SUMMARY = "Text-based modem control and terminal emulation program"
>>> -HOMEPAGE = "http://alioth.debian.org/projects/minicom/"
>>> +HOMEPAGE = "https://salsa.debian.org/minicom-team/minicom/"
>>>   DESCRIPTION = "Minicom is a text-based modem control and terminal
>>> emulation program for Unix-like operating systems"
>>>   SECTION = "console/network"
>>>   DEPENDS = "ncurses virtual/libiconv"
>>> @@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645
>>> \
>>>
>>> file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
>>>
>>> -SRC_URI =
>>> "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz \
>>> +SRC_URI = "${DEBIAN_MIRROR}/main/m/minicom/minicom_${PV}.orig.tar.gz \
>>>              file://allow.to.disable.lockdev.patch \
>>>              file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
>>>              file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
>>> @@ -16,7 +16,7 @@ SRC_URI =
>>> "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz
>>>   SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
>>>   SRC_URI[sha256sum] =
>>> "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
>>>
>>> -UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
>>> +UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/minicom/"
>>>
>>>   PACKAGECONFIG ??= ""
>>>   PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
>>> --
>>> 2.17.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

