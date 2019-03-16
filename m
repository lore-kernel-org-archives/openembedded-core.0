Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id E94326D51A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2019 15:50:14 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i19so8397673pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2019 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jQgiIX5+3/KgT0xJcS1pHJQ00zllC5mLl3f9cllUTQ0=;
	b=SZ6oHam9OZFdy5h+i8ZVoBcrZ3ErQWEQaAjpkzDmzF8FApDOgRFECaDkLkNew7SK05
	Rk7valQQtCGKW7T8m9j6bphbAA6/+LuiALzX3G3RaDlL7yKilpd78FyjAlPrndKAGG3T
	0N76LTeqdhAqXiOGljzX4F+MGvjlz9Z4VZcZ27bCVV7HWkVidw2pIValtYuj4zF0ZVeL
	+0M47jYYfGWrcVLGFd3lORUkQycpeARL08gEyWH2SWPu4nB8aBwkQOzBgQQeRPTpSn9d
	erusUhjEwePtpCtyzSu4pPUyQpHQj9PqBhKAeWVDg23n2N0J059Ay3WiNPw8rRVOoABO
	aXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=jQgiIX5+3/KgT0xJcS1pHJQ00zllC5mLl3f9cllUTQ0=;
	b=Ag1K7g0DOgBBten88CJzGtgQrRiKMTUGFUKYEiWWpOf/ytvv7FSiNrQOkJK8Y6tCfy
	bOT89RJMkjzFOFobfS2LnVznQ/AJzNvmOaPVKj24J0evgm4/3nbml1500/GgtQOnzIZo
	uHoRXjVYlKHbFjXSUhUUyGkaxZoGb2JBo30Jj4QUNjBkORB5rqKdZaJYYhwLCb8Uh2sG
	gozEvHfmEWCk0r8smGKS8fHw+UdJrsD7mRHYdR/ZqMpfD5ENp9eK4FYr0AKaGTfNwiCb
	kq97K7hu9cHxtCVe3f6lp+/up5JxIkUA+IkZSbBHRjasE7MS3NiDINa0e2e5PlOTxTdr
	uwGA==
X-Gm-Message-State: APjAAAWas5hiBhSFupmAIJwcmmJ0QBNeePEOHXAOjs8KWW1Z4SOsPw1S
	OrGB6y+rC6UIbNZgO130ZdFq1i2a
X-Google-Smtp-Source: APXvYqyLpAo8tI5go0+H8mCFJ0vDb8Z7DlLsfXFrmQiDpUJaQuI9Ukn6LovsYheK72CCp3XQYfbHoA==
X-Received: by 2002:a17:902:b188:: with SMTP id
	s8mr9964678plr.327.1552751415637; 
	Sat, 16 Mar 2019 08:50:15 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:d808:e267:248a:2bbb?
	([2601:202:4180:c33:d808:e267:248a:2bbb])
	by smtp.gmail.com with ESMTPSA id
	j14sm9181861pfe.12.2019.03.16.08.50.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 08:50:15 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <154947113576.452.14618413373824638023@git.openembedded.org>
	<CALbNGRRLfW_ih43gr8n_rG5YcLQizAs4Mhi0rU_TVjoCCyw1Ag@mail.gmail.com>
	<CALbNGRR0PjTSJWT=FARJrLNn4BPPV+XkS_RL2CiqSiOnj4Tfbg@mail.gmail.com>
	<d897cca3-2471-ecfa-c99a-da0df5649d37@gmail.com>
	<CALbNGRQBHySVaqLXNNTbM5xvo5fOh-UxzogyjC6Rm1_6_WETcw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ed62bdd5-c9ad-1796-2330-960d6072317d@gmail.com>
Date: Sat, 16 Mar 2019 08:50:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRQBHySVaqLXNNTbM5xvo5fOh-UxzogyjC6Rm1_6_WETcw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] branch thud updated (ad0a553 -> 748f946)
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
X-List-Received-Date: Sat, 16 Mar 2019 15:50:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 3/16/19 5:20 AM, Andreas M=C3=BCller wrote:
> On Sat, Mar 16, 2019 at 12:11 PM akuster808 <akuster808@gmail.com> wrot=
e:
>> On 3/15/19 10:24 AM, Andreas M=C3=BCller wrote:
>>> Replied to wrong mailing
>>>
>>> On Wed, Feb 6, 2019 at 5:38 PM <git@git.openembedded.org> wrote:
>>>> This is an automated email from the git hooks/post-receive script.
>>>>
>>>> rpurdie pushed a change to branch thud
>>>> in repository openembedded-core.
>>>>
>>>>     from ad0a553  build-appliance-image: Update to thud head revisio=
n
>>>>      add 0bbe3d5  kernel: use olddefconfig as the primary target for=
 KERNEL_CONFIG_COMMAND
>>>>      add 933712e  linux-yocto/4.18: update to v4.18.22
>>>>      add 193eb75  icecc: readlink -f on the recipe-sysroot gcc/g++
>>>>      add 57673fe  icecc: Trivial simplification
>>>>      add d4ec470  icecc: Syntax error meant that we weren't waiting =
for tarball generation
>>>>      add 46db052  icecc: Don't generate recipe-sysroot symlinks at r=
ecipe-parsing time
>>>>      add 9d3587d  icecc: patchelf is needed by icecc-create-env
>>>>      add d8bf7e5  eudev: upgrade 3.2.5 -> 3.2.7
>>>>      add a316146  gsettings-desktop-schemas: upgrade 3.28.0 -> 3.28.=
1
>>>>      add 88581ac  libatomic-ops: upgrade 7.6.6 -> 7.6.8
>>>>      add 7c6e9f5  libpng: upgrade 1.6.35 -> 1.6.36
>>>>      add be1429b  common-licenses: update Libpng license text
>>>>      add 93c76fe  i2c-tools: upgrade 4.0 -> 4.1
>>>>      add b09f261  oeqa/utils/qemurunner: Print output when failed to=
 login
>>>>      add 47731b4  grub2: Fix passing null to printf formats
>>>>      add e3ef28a  gnupg: Upgrade to 2.2.12 release
>>>>      add a44c7ba  tzdata/tzcode-native: update to 2018i
>>>>      add 4a7945c  lighttpd: update to 1.4.51
>>>>      add 4f14eac  boost: update to 1.69.0
>>> In my infinite naivety I just updated thud.
>>>
>>> * Many updates here - wasn't there some policy just to update in case=

>>> of 'emergency'?
>> Nope the process does not say that. I will update recipes when they
>> bugfix updates.  I have been doing that for years. In fact, you should=

>> be seeing something on the arch list to make the process standard.
>>> * How can you update boost on a stable branch - a first class citizen=

>>> for build trouble?
>> Don't recall the thought process on a given backport especial when its=
 3
>> months back. Can't tell why I decided to update boost.
>>
>> - armin
>>
>>> Wonder which further fallout I'll get...
>>>
>>> Andreas
> Just for the record:
>
> 1. In [1] I read at policies:
>
> * No recipe upgrades unless:
>   * The old version is completely broken
>   * The new version contains a security patch or other critical bugfix
> that is too difficult to backport to the version already in the stable
> branch
For completeness:

As always, the stable branch maintainers' judgement is important when it
comes to deciding which fixes are or are not appropriate. If there is
doubt, feel free to consult with the overall project maintainer (Richard
Purdie <richard.purdie@linuxfoundation.org>).


> 2. This was applied on Feb 6th which is not 3 month back exactly.
then its worst than I thought, I can't remember what my thought process
was back to Feb 6th.
>
> [1] https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance#Point_=
release

I am glad you are bringing these things up, it helps me revisit my own
processes and help me improve.

We are planning on revising the maintenance guidelines soon so I hope to
get your input.


- armin
>
> Andreas



