Return-Path: <paul.betafive@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 23F8D6AC82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 10:00:02 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q107so3437747qgd.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 02:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=7Tgznzs3CKCp+yvkxhoqt8iSr1J+3GUVUxKsEHD/CgQ=;
	b=al7/Xh8oa3wMderM2kMiKbnZb/ZhEAcuZYRNlYlIogYXVIW3lK7k9ZH9tLpWGa2oYt
	RsPG1SmA++8CVOelsH64l0ikksoSzYaUl1No2FWSUB+ihRQS1bGjcPwG/6i0Atc8eOHt
	lnm91sLM9ke3CzH9zRwLXjS1ovNVXiOUejSJTIt5VpNrUgZFSFbC/mvP0OCh4BIwmoze
	pPLMcmUDZYs4l8v40oDUQcULkKvopEVv/4qeFzgS5Kf1Oa08cku4Y8ECikJQolhUM/RZ
	/aqmv7snzcXferzmJ8MHFcKJgWSja2MzstyvCZF5gT59G2G/+TAyt/RWKKpQzz4Kd7jo
	x2sw==
X-Received: by 10.229.7.138 with SMTP id d10mr5284153qcd.18.1416564003224;
	Fri, 21 Nov 2014 02:00:03 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Fri, 21 Nov 2014 01:59:23 -0800 (PST)
In-Reply-To: <9961c270f19bef3da7ca624737d7526bebbc7f0d.1416559751.git.Qi.Chen@windriver.com>
References: <cover.1416559751.git.Qi.Chen@windriver.com>
	<9961c270f19bef3da7ca624737d7526bebbc7f0d.1416559751.git.Qi.Chen@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 21 Nov 2014 09:59:23 +0000
X-Google-Sender-Auth: KLPSYFk5HFbgOlCQMG_OskhCOp8
Message-ID: <CANyK_8c8Wo3iaKtKe0tFMcQsA-+gz2M96eMbcyBw==FVo80nzw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg-utils: fix double slash problem in update-alternatives
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
X-List-Received-Date: Fri, 21 Nov 2014 10:00:10 -0000
Content-Type: text/plain; charset=UTF-8

On 21 November 2014 08:50, Chen Qi <Qi.Chen@windriver.com> wrote:
> When using update-alternatives, we would get output like the following:
> update-alternatives: Linking //usr/bin/sh to /usr/bin/bash
>
> What we really want is:
> update-alternatives: Linking /usr/bin/sh to /usr/bin/bash
>
> This patch fixes the above problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

opkg-utils is part of Yocto Project. Could you submit this as a change
to opkg-utils itself and then send a SRCREV update for oe-core?
Submission guidelines are under "Submitting patches for review" in
the CONTRIBUTING file in opkg-utils
(http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/tree/CONTRIBUTING).

The patch looks pretty straightforward so I should be able to give it
a quick test and merge it to opkg-utils early next week.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

