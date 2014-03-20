Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id EB5AE6F8EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 18:53:32 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so3381105ykb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 11:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=9qhsIi+zF1Ge17zkEzvmr4sLLCKaQGF2oXaiAIoN+jI=;
	b=IC8pCWzeGaxGkNt8DS9TFGOVD5/XnqMwX9KUC5dhhMZEdfwQJsM0AfhPAlTiTSpZzN
	zvmdG2KZVjS9tCJERqUo8hCSDRJJ0A3qHCKp1bai/0a3hBu4qdWs2NsDMjUerQljaXZl
	T9fIb+8+r/4SbVadw2B5JxFi2QM06bhrd62Ge5FvjGDhEVnR/DQbiVKhsLEMaOdzNsNG
	8i3qOv3rUrlel0fIzIYTbDw2cwKbNl0/mYZ6fIJwqLMMryJi4r76+04n8PiJUINhPfmd
	DP/s/LVksulEL5SomhzxhQQX95tgdJSrb8Hnx95Wrdi1HRLKdJtDKKI+UO0aTUPFLQ6+
	4fvQ==
MIME-Version: 1.0
X-Received: by 10.236.60.68 with SMTP id t44mr36482137yhc.47.1395341613514;
	Thu, 20 Mar 2014 11:53:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 20 Mar 2014 11:53:33 -0700 (PDT)
In-Reply-To: <CAOMwXhNx8XFYQhKytm88YtCfqPxAgOcB4VnNgwDfqkng2aN1uA@mail.gmail.com>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
	<CAOMwXhNx8XFYQhKytm88YtCfqPxAgOcB4VnNgwDfqkng2aN1uA@mail.gmail.com>
Date: Thu, 20 Mar 2014 15:53:33 -0300
X-Google-Sender-Auth: mS3TTnZSPOjsnsGcVQyO09PW3j0
Message-ID: <CAP9ODKoLyxzih9z=D-+vjJwaJ+UKHm1sOYAdv=XPirx5fd2ENg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laszlo Papp <lpapp@kde.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 18:53:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 3:49 PM, Laszlo Papp <lpapp@kde.org> wrote:
> On Thu, Mar 20, 2014 at 1:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 20 March 2014 12:44, Laszlo Papp <lpapp@kde.org> wrote:
>>> You are free to NACK without an explanation why it is important, but
>>> do not expect it to weigh much that way, at least in my eyes, based on
>>> that you are not even a maintainer as far as I know.
>>
>> One good reason: systemd reads the LSB headers.
>
> This init script is for SysV, not systemd.

Laszlo, we made several valid points. The outcome is we don't want to
have more init scripts lacking LSB headers. The desire to have this
patch is yours so if you want to have our ack, address those remarks.

As I said, it is your call to handle it or not.

I am not the maintainer of OE-Core, so I don't have a final word on
this (Richard does) but I made clear my point and my NACK for current
status of the patch.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

