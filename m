Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 57743606B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 14:46:10 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id g12so2272144ild.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 06:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J6sRtaB0i8TQLgILhvxTfb+rbvpvkOrb+OxVuCeFcmY=;
	b=GFG0CwFTlySP4pqis9CnJrgHUnvM4DJLUuAdFkeQz+dKMy1tEsiWL4M0Qori7p4G0K
	Jk+k1uY018HpQQSv5k1VJazxsrDB2HufVs0U1jlKGWpumi/qEA9q2HwlWFKP4qCr9bZ0
	ih8u6Pn5dmivOrhHMysRdpWLuGwmsqwVGoB1Zt1rTZAdFby2IOFb5AKLfcA9dGbgZd6W
	fgJcIvC71oXqey+uuuHjaEOVWBaxe7Ro+lB7EHSsneOSSggq7FoHcJtKUykkniwAtPDG
	rHKJseggu1LL/TrCjWIPBio95lmqy+car2sQahXwimX97q2z5fn6im8g7NQaSdoLNd7P
	pUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J6sRtaB0i8TQLgILhvxTfb+rbvpvkOrb+OxVuCeFcmY=;
	b=lRSW6dCwgMEApn6Ed6QNNKqt9DBS2ek4ejVAEPWOzS40YgqdhMEyEKChz9dKC7B90a
	Xc19VbJ4XXUtaUbRnn0aI1defDAV6LEH2Ld6aSa6XfJoaK93z8jEvTY3BC60fzKpNrCo
	0+IaA1PMBNyQWL37a+iwBlORi2Ad4gfqIqRdnWS3s93jSq7eQ5a1uAW8vfbRyco+VJsv
	xkM1LbBRDfo5pSRv5Se1uojNORHYszv5vtA7HJ9QipPFepFvHqy/rZyjGt7rHxN17hpu
	U54z8i4wuvQHcdWGJwYUNbnDlWmSuQXc0Dk+FoFUL0SZhZMN4V+02YiwdsHoSQMktFnf
	uREg==
X-Gm-Message-State: APjAAAUftOsP6XjpK9xyg5dKdB2HW1hxPtTTDwAkPPybl94YInxOk4u+
	lxaFys+UPHph2LGkOxShBbrkGRtpckuRsmKm9qA=
X-Google-Smtp-Source: APXvYqwHDXVQTgJvAPMRtQEUw8s7Nr68rW4ppsOtb1yMMi6Fn0VFx19NPTZQ5872MAqa8noo7XAJgHXEs8ZwKBHoYdg=
X-Received: by 2002:a92:d30e:: with SMTP id x14mr14456196ila.108.1576248371499;
	Fri, 13 Dec 2019 06:46:11 -0800 (PST)
MIME-Version: 1.0
References: <1575472180-11923-1-git-send-email-wangmy@cn.fujitsu.com>
	<699e48bc46b4e96c13393b2d61dbe366c3c88825.camel@linuxfoundation.org>
	<CANNYZj8u8ZkM1ZbbKnXpnUL8LtUwChAtJRi3pfsfeek3BzEa8Q@mail.gmail.com>
In-Reply-To: <CANNYZj8u8ZkM1ZbbKnXpnUL8LtUwChAtJRi3pfsfeek3BzEa8Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 13 Dec 2019 15:45:59 +0100
Message-ID: <CALbNGRSHCS1B_SfjWuGVmgh9t+=A=jPFU5ZY4hnvz1rJCJbdMw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jon Mason <Jon.Mason@arm.com>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] nss: 3.45 -> 3.47.1
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
X-List-Received-Date: Fri, 13 Dec 2019 14:46:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 13, 2019 at 2:22 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 4 Dec 2019 at 19:00, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Wed, 2019-12-04 at 07:09 -0800, Wang Mingyu wrote:
>> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
>> > ---
>> >  meta/recipes-support/nss/{nss_3.45.bb => nss_3.47.1.bb} | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >  rename meta/recipes-support/nss/{nss_3.45.bb => nss_3.47.1.bb} (98%)
>>
>> Fails on beaglebone:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/1327
>
>
> I had a look into this: the issue is that new versions of nss require hardware crypto capabilities on ARM (both 32 and 64 bit).
Do you have an link for this?
> This means we have to disable the recipe when that is not the case; a quick fix would be:
>
> COMPATIBLE_HOST_armv7a = 'null'
>
> but I would like to hear other ideas too :)
>
I think we should not do that because:

Build log says:
| cc1: error: switch '-mcpu=cortex-a8' conflicts with '-march=armv8-a'
switch [-Werror]
| cc1: all warnings being treated as errors

Nss sets '-march=armv8-a'. Checked in their sources and found that
this is done in lib/freebl source path [1]. With latests sources from
gihub-shadow they introduced 'disable_arm_hw_aes' [1]. Have no idea if
3.47.1 already supports that but we should use it as packageconfig.

I think open questions are still:
* will aarch64 accept their flags?
* isn't something wrong in their logic? They build armv8_c_lib based
on conditions like ''disable_arm_hw_aes==0 and (target_arch=="arm" or
target_arch=="arm64" or target_arch=="aarch64")'' e.g [2] Hmm arm???

[1] https://github.com/nss-dev/nss/blob/4703a817f8b90cc3423620e5c7606bdbcedbcf2e/lib/freebl/freebl.gyp#L170
[2] https://github.com/nss-dev/nss/blob/4703a817f8b90cc3423620e5c7606bdbcedbcf2e/lib/freebl/freebl.gyp#L226

Andreas

