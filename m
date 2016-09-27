Return-Path: <net147@gmail.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 149C56006E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:50:09 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id u134so32412128itb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BQRzRW7MnmBePNLWPAWr5SH/lZjRyfSXywzj7nl7Ii4=;
	b=eKuYk2nwZVWg+sfzdxaAvoUIGr7mZGBbuMDjVquvnl2bifFFZFvJrXmXj+Yy41hiJl
	wxuZeBdC6psr/i6Z/liAYUadUClw7hz/Jhm2B/wDoASjnZ4y3aNQ3FOV8JinWZbhNPmv
	/ZAtFXWfJ+38Kr2Sq0WGBNEQLzwaM2ZFCtanWAGluCHC791zIR8DoPpGbsNooueVsGgg
	FVTfNOGwitlAeeCTnzF1CTR1Qwxlf4gE2CvUOW4SB9SQ8FBFZGcfkEJ6kOVKHR2dNa4D
	44IuhC8vrmHdUYPDzL8e1Xklkde1mgzyRAenCCRtFHEtccLvJfdgfqB6XiHhCWkCEA8W
	7C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BQRzRW7MnmBePNLWPAWr5SH/lZjRyfSXywzj7nl7Ii4=;
	b=muWyPImxWR2NRWTOpYm+Tn5kkrIahUR8bZa6cIgLDuxDI/JYEafG3JYUIlT8r0VIly
	PbqNlOKae37CRKf+ggoURFnaOsC+Nvz+EmiKEzcUOkfDggflk8WD+HBdqM+jieh6z8Ww
	2oi7LAonLgqnAuTI6QNHE6CFQj5TedVXoOcMrLAv0BE0GnaWDiX240Juhcvud1Jz0d63
	SryxSCsJfh2rzTrj/EA9+iKe1z/TAuNDfltm0JJXsXrMqAoCPBeX/6Z8H+spbWcwqLJ+
	ishzrZf4u+mGCYdmmQeeNdUAdDap6BrzQy/iqpBpj4UUXBDgx5sGQgOPBPuQMygWf9He
	D6Gg==
X-Gm-Message-State: AA6/9RlErmwszpYPz8dWuDdEuwFlhGjVyVxeDOPYGIC7LgteFL+yI/DIZLUgAkUhBNcWpG3K38vbOtrcZGwcjw==
X-Received: by 10.36.94.195 with SMTP id h186mr1951204itb.24.1474955410931;
	Mon, 26 Sep 2016 22:50:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.60.73 with HTTP; Mon, 26 Sep 2016 22:50:10 -0700 (PDT)
In-Reply-To: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
References: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Sep 2016 15:50:10 +1000
Message-ID: <CANwerB3Oestwc-2duHMzQHRcM2djD-3XYu-7FUObBshsNHVA2Q@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Crazy display
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
X-List-Received-Date: Tue, 27 Sep 2016 05:50:10 -0000
Content-Type: text/plain; charset=UTF-8

Hi Gary,

On 15 September 2016 at 21:30, Gary Thomas <gary@mlbassoc.com> wrote:
> I haven't seen this before, just thought I'd toss it out there.
> I was doing a build (actually three in parallel in separate
> windows on my build box) and noticed this:
>
> Currently  3 running tasks (3282 of 5081)  64%
> |###################################################        |
> 0: busybox-1.24.1-r0 do_compile (pid 29425)
> Currently  3 running tasks (3283 of 5081)  64%
> |###################################################        |
> Currently  3 running tasks (3429 of 5081)  67%
> |#####################################################        |
> 0: gstreamer1.0-libav-1.8.3-r0 do_configure (pid 10393)
> Currently  1 running tasks (3560 of 5081)  70%
> |########################################################        |
> 0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)
> Currently  3 running tasks (3601 of 5081)  70%
> |########################################################        |
> 0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)
> 1: gdk-pixbuf-2.34.0-r0 do_package_write_ipk (pid 12673)
> 2: unifdef-native-2.11-r0 do_populate_lic (pid 24548)
>
> Somehow the task tracker (that does a nice job of telling the user
> what's going on without being overwhelming BTW) got very confused!
>
> I doubt if I can every repeat this, just passing on the observation!

This seems to be related to
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10024.
I get this issue after it prints "Child process exit status 4:
lock_held" and then that message is overridden by the task status with
the progress bar duplicated down one line.

Regards,
Jonathan

