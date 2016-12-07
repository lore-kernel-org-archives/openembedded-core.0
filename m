Return-Path: <nathan@nathanrossi.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id B143F60017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 16:50:31 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id s82so14834782ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 08:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z7Ns3fYH34t/rIP5tnn/U/i6OvHPGkrhLA0UIuZ0H3s=;
	b=bEpjI5KHzry1g3TWANJ6Wss3FdHlndQdfumyiendntcGZqOHLJ/ZbPkj+Oep8a9vir
	fWBlr7ifL85C/b6CaWdXyFZmdIbJ9p6q4Ew2B9OqjpYjzXwj7rKkTB4j9jWqgO8q0E5c
	HnNaKd/r1ae9wXFSzyQiJBx0Jk1fvIHh5XB8LkgHXSdlQ1vMrXkm1Hc+8i3d3K+++AD8
	GTaqwOLAIFzZPV+3JIc6/v7q2FqGXK08tDyKL3pCNqV3N09U6i69NPNcerE/mc00iSk9
	nv5qstQRBHQgmdoT1hIiRpheOd9waQB6pf1NyIsZMhOGCmJWmdBpKgcjki6Yc99QPYn7
	ongA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z7Ns3fYH34t/rIP5tnn/U/i6OvHPGkrhLA0UIuZ0H3s=;
	b=MzbMg/nCoaoXN/BVZB/grz6Qej8jW1NtgvN1YbLp3VKgt703/3XZP8WSUJTaXvaCyT
	xIqGLe5pazmxoufhVlLcQ2YwtF2KzzXnvD66gQuoAgDYvpBAQrB59Fm7JHf8RddPs/Zq
	OMh8gJ0AeQM5E7FngiwGO6EIYtHxQs2Ee4EfppdF4Gy+XWrqtNPjktDgzs7nDFrbg7T6
	3wFbG4w5We5vhH8VFuYLcZc5fIfKvCiHq0KHzKkkxqZBZxOZc4z87sSTWwyC5dWTude1
	dHcOqLdhqhab6OMVaSG5Lqbpwjl85IMSE4aM9g4/74ZKas+PrexNibq0vtPLjgxIyL8s
	aiOQ==
X-Gm-Message-State: AKaTC02xSJt+wq9HEhT73ZYoMgp/PDVSOWC8E0fivw8cOgRwbcMtMjQPJpAN/gwGYM2OAZE2nLr9qtpI/nxh4w==
X-Received: by 10.107.46.227 with SMTP id u96mr61475559iou.58.1481129432519;
	Wed, 07 Dec 2016 08:50:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.48.194 with HTTP; Wed, 7 Dec 2016 08:50:31 -0800 (PST)
In-Reply-To: <b54c6e1b-dfb8-2753-74ff-ce42b65db95b@windriver.com>
References: <cover.1481014270.git.liezhi.yang@windriver.com>
	<b54c6e1b-dfb8-2753-74ff-ce42b65db95b@windriver.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 8 Dec 2016 02:50:31 +1000
Message-ID: <CA+aJhH0pKWhGDjbqe5jdLjesS+6T5e0zMNOrzvR6aA7oyKNhqA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/6] runqemu: fix for slirp, network device and hostfwd
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
X-List-Received-Date: Wed, 07 Dec 2016 16:50:33 -0000
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 19:01, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 12/06/2016 04:55 PM, Robert Yang wrote:
>>
>> * V2
>>   - Add QB_NETWORK_DEVICE to set network device for both slirp and tap,
>>     the idea is from Randy and Nathan.
>
>
> Add Randy and Nathan in the loop, I had added them in git send-email,
> but there were not in the CC list, look strange.

Hi Robert

I tested the cpio.gz and network device parts of this series with the
meta-xilinx qemu machines, they work well. Will implement the
QB_NETWORK_DEVICE use in meta-xilinx once this series gets applied.

Thanks,
Nathan

>
> // Robert
>
>
>>   - Use different mac sections for slirp and tap to fix conflicts when
>>     running both of them on the same host.
>>
>> * V1
>>   - Initial version
>>
>> The following changes since commit
>> 11063a01d4511b2688ea7ba2d7359e4e07328c66:
>>
>>   ruby: upgrade to 2.3.1 (2016-11-30 15:47:17 +0000)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu
>>
>> Robert Yang (6):
>>   scripts/runqemu: fix checking for <file>.cpio.gz
>>   qemuboot.bbclass: use IMGDEPLOYDIR
>>   runqemu-export-rootfs: fix inconsistent var names
>>   runqemu: support mutiple qemus running when nfs
>>   runqemu: fixes for slirp, network device and hostfwd
>>   qemuboot.bbclass: add blank lines in comments
>>
>>  meta/classes/qemuboot.bbclass              |  34 ++++++--
>>  meta/conf/machine/include/qemuboot-x86.inc |   1 -
>>  meta/conf/machine/qemuarm64.conf           |   1 -
>>  scripts/runqemu                            | 133
>> ++++++++++++++++++++++-------
>>  scripts/runqemu-export-rootfs              |  21 ++---
>>  5 files changed, 140 insertions(+), 50 deletions(-)
>>
>

