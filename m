Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id AC0C96017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 11:38:21 +0000 (UTC)
Received: by igoe12 with SMTP id e12so11839367igo.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=p+PsIdCzSBRqJous1CAYKeYKCyh95skr1CjeS1EfUi0=;
	b=yUguko+ZqqBoBx8o9sDC37cPkb9xJ1eI51RfAGqUtyCzyR6DmBycrntRLgJuDTY4s+
	QrUl+OWX3OWfpZU5WcKnYmuwJJ0n0MPvz4vCBzx4q9VZbCZVtMyuB8BvrnlnRTQ2lyBw
	m1YXmB3Xxs+hbeg5T4GAc7YoTupX5IU7lbyZuHIvV82nBjVrr9Ah8R2oqLYrc2quq9vB
	FfNN0ieEDLs741ytdFgQ76K5F502YHwPnslhXXM2wOftP9v72svXW+ATv9E3I5LkbrBw
	2x//9Fm2vPP8amlTGCVa5EpmMBkSh+ab/vftxGk2qBexKCjAKyEEsQ9AWIWKjv5aT8wL
	rICw==
MIME-Version: 1.0
X-Received: by 10.50.50.229 with SMTP id f5mr69574637igo.35.1436441901601;
	Thu, 09 Jul 2015 04:38:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.36.218.7 with HTTP; Thu, 9 Jul 2015 04:38:21 -0700 (PDT)
In-Reply-To: <56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
Date: Thu, 9 Jul 2015 08:38:21 -0300
X-Google-Sender-Auth: tTE2zPqZelwaYxqx1xLWY90bp_c
Message-ID: <CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Thu, 09 Jul 2015 11:38:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 9, 2015 at 8:33 AM,  <alexander.kanavin@linux.intel.com> wrote:
>> Add parted-1.8.6 which is not GPLv3.
>
> I have to say, I still can't support having this in oe-core. Providing
> alternatives to GPLv3 software is fine, but not when the 'alternative' is
> a very old, unsupported version of the same software, which inevitably
> brings issues in functionality and maintenance.

Parted 1.8 is very old and not supported at all. The number of fixes
after it is such huge which makes Parted mostly useless in new storage
and disk formats. I see NO benefit in having it and a serious
maintenance burden.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

