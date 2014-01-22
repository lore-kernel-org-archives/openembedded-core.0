Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7046E717
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 15:15:17 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id hr13so435322lab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 07:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=n/r/2nAdEj+WazdgqKdfzqmc5vo4hzGOsHaOE7LsXf4=;
	b=fd2KT1xhnvK/JxqkkrbIXz0z5NpmmPVljCTMxW3syhQy1lt4upJbjrO6h9SXXKguKN
	OK7pua+7CB7JWX7OlcessWSZbyrYbcn9okTSlSz6hinOKlq1TvT7fM+oMg21lHTCzuyj
	dvLT4EGge5lGYfwBkrIvenbLtpeEejqWLwEuD3uE+vpKuwFzDG1SGCy/EPQ7lw3TfBA+
	MGJ+9iRSQt3icmB8d9hoFpDbGv00HzQ4Hm5Z1DS5G6riy8zKteARfMv+6wP1Me4T+24m
	eulMC59f3iG1x6TKPR/e24d1eXdh1Vk5n2cA1TS+SwLXoJLlKbrsmO3OG1bJ3BDkWPfZ
	PDTw==
X-Received: by 10.112.198.65 with SMTP id ja1mr5614lbc.75.1390403717675;
	Wed, 22 Jan 2014 07:15:17 -0800 (PST)
Received: from [172.16.141.123] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id c15sm7873749lbq.11.2014.01.22.07.15.15
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 07:15:16 -0800 (PST)
Message-ID: <52DFE07C.9040500@gmail.com>
Date: Wed, 22 Jan 2014 16:15:08 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1390395885-5078-1-git-send-email-david.nystrom@enea.com>
	<CAP9ODKrKYdn-cTfX=yiz5GKhLBBrVk4Dk8vsiCjibXKpZhrw2w@mail.gmail.com>
In-Reply-To: <CAP9ODKrKYdn-cTfX=yiz5GKhLBBrVk4Dk8vsiCjibXKpZhrw2w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] postinst-intercept: New recipe to include postinstall intercepts in nativesdk
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
X-List-Received-Date: Wed, 22 Jan 2014 15:15:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On ons 22 jan 2014 15:53:18, Otavio Salvador wrote:
> On Wed, Jan 22, 2014 at 11:04 AM, David Nyström
> <david.c.nystrom@gmail.com> wrote:
>> Adding ability to use postinstalls intercepts in the nativesdk env, and
>> making sure the correlate between repo + SDK.
>>
>> Signed-off-by: David Nyström <david.nystrom@enea.com>
>
> Can you extend the commit log a little bit to explain the reasoning behind this?
>

v2 sent to list.
rootfs-sandbox is a template intended to figure out whats necessary to 
make this work properly.
At a later stage we have discussed adapting the Tizen MIC2 to OE based 
distros to do this in a cleaner way.

Br,
David

