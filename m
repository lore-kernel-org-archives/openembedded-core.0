Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 583A460E79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 11:59:42 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id t59so641058yho.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Dvuro+gGbyvOI+RNreWDm99yT2nPn2qraJ5Dvcpjk5Y=;
	b=1FQX4bgUyQGTW7aL72uBoMfUUSFGrpT+oe+5MEwST76pALjTt4kHIOEXQx56DMKBqo
	OLQ8QhDCh33PKLxhIhYWZBcR3BLeFwfdbE8FD2st3ZemfiUvLWNzPzhM19i6f4pp7LmE
	RbvR7u9lJ+wuE8dyyIIzMum9zHKVhMStlUsdPRoajYhz4E20uEYKIGiZdJ+4iYeU5oJ8
	iRtVVj19NeLWJsM3D0AZFEWEawJ2KaLUk5teM32TGfJNHNCkntlCa+tTY1p7CNKUe/A4
	m6NCKSpcwRyYFYzXwJBH1+7Zk6Zdw+CprrzKVRjYUB57jd5RAOaZtGTlBpcegohm1+w7
	SuyQ==
MIME-Version: 1.0
X-Received: by 10.236.101.18 with SMTP id a18mr33879634yhg.65.1395316783893;
	Thu, 20 Mar 2014 04:59:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 20 Mar 2014 04:59:43 -0700 (PDT)
In-Reply-To: <CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
Date: Thu, 20 Mar 2014 08:59:43 -0300
X-Google-Sender-Auth: dZWy7H2tzsnVq3g9P29tUUfUkOw
Message-ID: <CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Mar 2014 11:59:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 8:34 AM, Laszlo Papp <lpapp@kde.org> wrote:
> On Thu, Mar 20, 2014 at 11:22 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>
>> Op 20 mrt. 2014, om 11:45 heeft Burton, Ross <ross.burton@intel.com> het volgende geschreven:
>>
>>> On 20 March 2014 03:26, Laszlo Papp <lpapp@kde.org> wrote:
>>>> +PEER=127.0.0.1
>>>
>>> That doesn't seem like a very useful default.  We also can't use the
>>> NTP pool by default, so this should copy the behaviour of the ntpd
>>> package in meta-networking and default to no peers, and not start if
>>> none are specified.
>>
>> And the initscript is missing LSB headers.
>
> Just like the other similar scripts.

This does not mean we ought to make the problem worse so add it for
new ones. If you are in good mood, send a fix for the others too ;)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

