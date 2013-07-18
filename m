Return-Path: <net147@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8012D6B1EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:26:19 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bi5so3267558pad.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=EXNNmcRUxkm7FdmhqX9I72EPma9AjxFryOwFGp+3O10=;
	b=WeXzKZCVD6KdHTox6fVc+iXHs2jZWUOhGkG9BHq25vqpz4QH5HbAQPephyaY5E9ZPN
	dLwLF8LGCwKg2DXdT87qK3OCFSIcLRXzYI4MIkwMq7e3u9axK6kUN0/ZtK8TxkPHb4rU
	A2v4gcOL+EnqUGJbOLBalbN5RP/nTrIQ8XeMvP4aiq3GqHkJf3FbzTYDGqw+UB+Y0bIq
	+5q/V+/wFe4Q945D9Fn9b95pMjXU6LTUFl259efC3Nx1NbiziFXRsBfXrFbzuCuvFrOT
	lzo6PCUzYs61GSV5jDcRQzX5yu1XBcW699TJiQGRamgxjZTM5Gllp1FwYDm7QMigpeeC
	YtZQ==
X-Received: by 10.68.171.162 with SMTP id av2mr12290537pbc.104.1374157580397; 
	Thu, 18 Jul 2013 07:26:20 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id 7sm9580777paf.22.2013.07.18.07.26.18
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Jul 2013 07:26:19 -0700 (PDT)
Message-ID: <51E7F9E3.4010802@gmail.com>
Date: Fri, 19 Jul 2013 00:21:23 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1374157097-20939-1-git-send-email-net147@gmail.com>
	<CAJTo0LbD2VUanu5cEKc+qaQ4VMiDopE8AKTu0g4s9vH0C4uzTw@mail.gmail.com>
In-Reply-To: <CAJTo0LbD2VUanu5cEKc+qaQ4VMiDopE8AKTu0g4s9vH0C4uzTw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: update git recipe to 9.1.5 release
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
X-List-Received-Date: Thu, 18 Jul 2013 14:26:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/07/2013 12:12 AM, Burton, Ross wrote:
> On 18 July 2013 15:18, Jonathan Liu <net147@gmail.com> wrote:
>> -SRCREV = "5a925cc5504575c22dbb7d29842d7fc5babcb5c7"
>> +SRCREV = "42146f777b9aa89c3d2c01f2a5cde05749534508"
> Oh, hang on, I knew something was bothering me.
>
> $ git describe 42146f777b9aa89c3d2c01f2a5cde05749534508
> mesa-9.1.5
> $ git describe 5a925cc5504575c22dbb7d29842d7fc5babcb5c7
> snb-magic-16820-g5a925cc
>
> You've switched from a (random) commit on master from June 5th to
> 9.1.5, so that's not actually an upgrade.
>
> Ross
Please disregard the patch then.

Regards,
Jonathan

