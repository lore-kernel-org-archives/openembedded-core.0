Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrIzd-0000Tm-1l
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 02:56:21 +0100
Received: by mail-gg0-f175.google.com with SMTP id y1so2697572ggc.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 17:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=VkPLtGkw76yHVvLCLxMrJBriDi8X7hOoPnDfdEWeyWI=;
	b=t/P4AGsXUuvOHPwP3pSV8p5d5/Do2O1nq4xPuHDgNvDH4Aud7pJQp7ZFZRs8Eg+vdy
	Zo7zE/ABdvvs4BXrEYTXiOHhPmgKA11dFo5szmJLaHQ3zfcj3QbFcGpHnuQe7l3LXm+6
	ZeFm/dY7OYEyOPL3x4VgKWOsXL3bp3QjaWz4LiYgfa+BFescZMl3vIIvgZuAdvnDkIQ3
	/XiArckGO+1fcvvIIvuqzb+J+xe+1hsnFBxnO8UkM+a9MpxZtHQB7GD/7fb5Vn1DN7b2
	eLv3yvO0P31YmV2eC3APt5zSgzT+EiQdDPQXqzqQfuB6KnQInODSWS3YdjlsO7Q65Die
	74SQ==
X-Received: by 10.236.74.198 with SMTP id x46mr58336396yhd.72.1357350066866;
	Fri, 04 Jan 2013 17:41:06 -0800 (PST)
Received: from [192.168.1.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id a43sm56357473yhl.0.2013.01.04.17.41.05
	(version=SSLv3 cipher=OTHER); Fri, 04 Jan 2013 17:41:05 -0800 (PST)
Message-ID: <50E784AF.2060400@gmail.com>
Date: Fri, 04 Jan 2013 17:41:03 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1357343832.git.raj.khem@gmail.com>
	<a199c2dc372f0c5a524685e30d8417f05b3713f9.1357343832.git.raj.khem@gmail.com>
	<449d181c104843ef74cbc1f81a5a58f18051fc14.1357343832.git.raj.khem@gmail.com>
	<CAP9ODKqBnkx0U7FQjs1HB6VqWVsBOv+YOufouLebWT9=dJ=kpQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqBnkx0U7FQjs1HB6VqWVsBOv+YOufouLebWT9=dJ=kpQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] eglibc_2.17: Fix Tibetian locale generation error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jan 2013 01:56:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2013 04:33 PM, Otavio Salvador wrote:
> On Fri, Jan 4, 2013 at 10:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> This is fallout of BZ #13950 fix to glibc
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Fix doesn't seem as an accurate name here; I'd prefer:
>
> Workaround Tibetian locale generation error
>
> as it better describes what it does; the patch file should be renamed
> and updated as well.
>
> What do you think?
>

I can change that thanks.

> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>



