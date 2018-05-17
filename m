Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 32D8560068
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 08:03:39 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id e20-v6so965248iof.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J9+j71Fs4ldbl3skd4AqIpwQPcDSTb/nAAL7NkRoK6g=;
	b=vpmyXQ6aU4G8IVulYjGnvSNii/6jpQTwT6ZZXJxPuXf5t1Tnl3QdGWWDjcMDGjfVW3
	ODRzlaFDfoYmwNsVm8hrmDmaBLMege7v/O6eXq1OakQtwBQhF9Of/zW3ZTaIxxuAVmoB
	bxhLsH9uBhUO98w1zwUpJiGofw8AJ8cz61r2p26jTK0QmqFShRGE12wxV5vmn7Int0ke
	xiKnk0IZhWFYahB5KE1mpE4vno+E9Vj65y8WiQq262XRgke7uQr+hbWBnHvtjvZALcS4
	fuu0Yo6ACeopd7IafA5BIF8y7s00Cg0XUBGgNyQit+UDexBQPMwv2etK3hj3K/05DroR
	Cxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J9+j71Fs4ldbl3skd4AqIpwQPcDSTb/nAAL7NkRoK6g=;
	b=WSSxBFf+Z2gajf1itmZiZj1KzSip2CDfCF2TglTDSvHrz9q8xEh/Qt/tdURvjpmQzi
	XyAvIZUnRftXumOn5KWt01J6yWE9VNtQXdLjNE5qN4tlsfz3nwBpKbZ+bNEx7dG2tPpP
	WZ38Jyf8fbaEpb1IKIEBbGLPQXTkuDN2y3UEOHL7VFZCzdLkBYQKmt8comyrTwGEpRBd
	6hukdPDoURiENM6o9bp1eAM6EL9yy/x8qbWtC2OozdGwiV/hw6PKXKSJB9rnMkOfTfwB
	3DEOMPpZ9Muxy4pJu6CJaL4dHTqe3k7xeavR6wgOEqn8rbB3jpVizfrM6EBvc8Ov1Xom
	dtuw==
X-Gm-Message-State: ALKqPwfTgbmeF3q9OkOloi5+8NVFxkP+0EtW9u7V0zy+pIA5rlUxQul8
	58jOQunxNEXDprxvoNl8rNqPrynzuC1QWiqts4s7Pg==
X-Google-Smtp-Source: AB8JxZrlhleFwgZmDhlolUUEnNS/cv4v7JWuvPsKcgnYyccxKjegnY0a/bSTENm4Znnwj6UP95JsJKco2BA1jlTZMl8=
X-Received: by 2002:a6b:5507:: with SMTP id j7-v6mr5038194iob.23.1526544220647;
	Thu, 17 May 2018 01:03:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Thu, 17 May 2018 01:03:20 -0700 (PDT)
In-Reply-To: <CAJ86T=UXSzh13a9WGy20s7VG-gWebybN7raSL2eFawPXRtQGsw@mail.gmail.com>
References: <20180516233046.10217-1-ross.burton@intel.com>
	<CAJ86T=UXSzh13a9WGy20s7VG-gWebybN7raSL2eFawPXRtQGsw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 May 2018 09:03:20 +0100
Message-ID: <CAJTo0LYrmZiScL_wf8_+-Sg=t23-QgpyzGV=xgmTLpWB0rig8g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][rocko] libnl: protect against buffer overflow (CVE-2017-0553)
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
X-List-Received-Date: Thu, 17 May 2018 08:03:40 -0000
Content-Type: text/plain; charset="UTF-8"

Certainly does, sorry about that!

Ross

On 17 May 2018 at 01:44, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, May 16, 2018 at 4:30 PM, Ross Burton <ross.burton@intel.com> wrote:
>
> Looks like a duplicate of:
>
>   http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150743.html
>
> ?
>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-support/libnl/libnl/overflow.patch | 39 +++++++++++++++++++++++++
>>  meta/recipes-support/libnl/libnl_3.2.29.bb      |  1 +
>>  2 files changed, 40 insertions(+)
>>  create mode 100644 meta/recipes-support/libnl/libnl/overflow.patch
>>
>> diff --git a/meta/recipes-support/libnl/libnl/overflow.patch b/meta/recipes-support/libnl/libnl/overflow.patch
>> new file mode 100644
>> index 00000000000..777fac3ea1a
>> --- /dev/null
>> +++ b/meta/recipes-support/libnl/libnl/overflow.patch
>> @@ -0,0 +1,39 @@
>> +CVE: CVE-2017-0553
>> +Upstream-Status: Backport
>> +Signed-off-by: Ross Burton <ross.burton@intel.com>
>> +
>> +From 3e18948f17148e6a3c4255bdeaaf01ef6081ceeb Mon Sep 17 00:00:00 2001
>> +From: Thomas Haller <thaller@redhat.com>
>> +Date: Mon, 6 Feb 2017 22:23:52 +0100
>> +Subject: [PATCH] lib: check for integer-overflow in nlmsg_reserve()
>> +
>> +In general, libnl functions are not robust against calling with
>> +invalid arguments. Thus, never call libnl functions with invalid
>> +arguments. In case of nlmsg_reserve() this means never provide
>> +a @len argument that causes overflow.
>> +
>> +Still, add an additional safeguard to avoid exploiting such bugs.
>> +
>> +Assume that @pad is a trusted, small integer.
>> +Assume that n->nm_size is a valid number of allocated bytes (and thus
>> +much smaller then SIZE_T_MAX).
>> +Assume, that @len may be set to an untrusted value. Then the patch
>> +avoids an integer overflow resulting in reserving too few bytes.
>> +---
>> + lib/msg.c | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/lib/msg.c b/lib/msg.c
>> +index 9af3f3a0..3e27d4e0 100644
>> +--- a/lib/msg.c
>> ++++ b/lib/msg.c
>> +@@ -411,6 +411,9 @@ void *nlmsg_reserve(struct nl_msg *n, size_t len, int pad)
>> +       size_t nlmsg_len = n->nm_nlh->nlmsg_len;
>> +       size_t tlen;
>> +
>> ++      if (len > n->nm_size)
>> ++              return NULL;
>> ++
>> +       tlen = pad ? ((len + (pad - 1)) & ~(pad - 1)) : len;
>> +
>> +       if ((tlen + nlmsg_len) > n->nm_size)
>> \ No newline at end of file
>> diff --git a/meta/recipes-support/libnl/libnl_3.2.29.bb b/meta/recipes-support/libnl/libnl_3.2.29.bb
>> index 7d4839ba506..746fd3d4153 100644
>> --- a/meta/recipes-support/libnl/libnl_3.2.29.bb
>> +++ b/meta/recipes-support/libnl/libnl_3.2.29.bb
>> @@ -12,6 +12,7 @@ DEPENDS = "flex-native bison-native"
>>  SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
>>             file://fix-pktloc_syntax_h-race.patch \
>>             file://fix-pc-file.patch \
>> +           file://overflow.patch \
>>  "
>>  UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
>>
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

