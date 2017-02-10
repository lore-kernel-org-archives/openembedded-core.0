Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id B1AB5774B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 18:32:41 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id u25so6185587qki.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 10:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=QuqRpAh7nSbae6DSJRc3/t4zrj5aDd2+MSWJTWnh8p8=;
	b=YdhmWiGHKOMwDpboCjCUuBM3ktH8dku8LwZJl96PKo8+tf6CsMhB1+tmR++5rGEail
	7eb8DL3qtRLheRtzChgFMSLS74GZNNO+N14PwmXOhoV+ykpARPKcBcPLszxzu+jnwG6O
	h3ssQFpyESAOpNlg+rmPu44GPqnZvuo4Tm46AcvvPSbvczXioGqZnWb7F0wiBqT++9xP
	TogeENTp41Okk61gLFlXBb6QUTRrRKqLdEFpjqQC7IY8M/RmtTksCdVjB37qqgkBjOcc
	asUkBRtrxY2ZjIOxbBp35uVzoyqwCDbHu1JrU7lEY2vx4BT9LGaNI5Z312/NAqsQ34LF
	5puQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=QuqRpAh7nSbae6DSJRc3/t4zrj5aDd2+MSWJTWnh8p8=;
	b=UsJRKV3rIR5Hf0HM27IwSGww0Qy5SjxqlWEY91wkH+0ICz7BX4bJSRcIZkcxASqsj/
	KIWwJFVxWKMT3aYXJTXxI+c5Z9Z+dgsnJP7rh5c3lxEPxvsWI6RJhUs4KYveu6ZyDft5
	IjpdbuaQrI8tnsDzf550TXVSB7GW0LJy3mK2IP74iacCw8crBz2jmvZYeWh5g7S8+Mjh
	jc3vuaENf1yV0+JC/oRkEuAg9lRKwIlDTXEBFTjG32XhRbsGglGJ2kFtL8Bwz0EdaxlG
	E/wQivtYgz2c5FI7ZJWj0nI/zjcMW5KeazL7Q41AsIRW1ag8fEzUlRpZEaDbTO1ROF3b
	IYuQ==
X-Gm-Message-State: AMke39nd4FoYlr2JiPLOVAFvD7Zlk74ksU6NxHiIcP4nYdfR1iFIcGb0aZLCJKFcwaZ37E8iHwd/CnIL/Oi7IA==
X-Received: by 10.55.44.195 with SMTP id s186mr9553554qkh.151.1486751561438;
	Fri, 10 Feb 2017 10:32:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.39.252 with HTTP; Fri, 10 Feb 2017 10:32:40 -0800 (PST)
In-Reply-To: <20170130195613.GG15833@denix.org>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
	<CA+chaQd519TOCHMNPzFnnWgZFi6=aWNC231-8=ihqf_Mfr-9Hw@mail.gmail.com>
	<49e5214c-5a23-05c0-c35d-636997dc7310@gmail.com>
	<CA+chaQe0PXA=4gA==O06bZP6c6oz2JXVAhCiqELZzs7KthQkRQ@mail.gmail.com>
	<CAMKF1sr8=kWBQCMZmou_hvkKNWmZQb0eQRFeb3GTR0L+v8oMfQ@mail.gmail.com>
	<20170130195613.GG15833@denix.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 10 Feb 2017 13:32:40 -0500
Message-ID: <CAHUNapQQyURQr_ievuvxEw9u96dXg9dBPw+2vGr3sdTyudiNZA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] flex: upgrade to 2.6.2
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
X-List-Received-Date: Fri, 10 Feb 2017 18:32:41 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 30, 2017 at 2:56 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Jan 26, 2017 at 06:21:48PM -0800, Khem Raj wrote:
>> On Thu, Jan 26, 2017 at 6:19 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > I did try 2.6.3 but it was even worse as reported,
>>
>> thats just sad.

Has anyone made a decision on this? I wasn't able to compile libsepol
from meta-security due to flex-2.6.2. I also tried upgrading to 2.6.3
but that caused binutils to fail. Reverting to 2.6.0 seems to fix the
issues I'm seeing.

