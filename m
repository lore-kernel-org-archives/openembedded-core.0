Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id C41D360223
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 17:18:32 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h131so25835888iof.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GttJW6nbOdJRfCjAt/887bIoZP5JiprpoTZ6WecP2rE=;
	b=IX2n3r71c7Tnot5Pkj1IjfOKW7Q3SpYON0pJ2aTTlN0DEbvu3FuSAsxeCV8ZMvFO4C
	QXyfXhxBqAVuG0OK3RmitvF5Og0a/trwKFGp2FNzxG7dycmA5Fl9X3ts2fHCzgqUe/os
	ObB7AmHdTcaZujfYuEiMx4XroOS0dvy3/LCeNyuOKj99V+STcaG8e0Ws7ePxYPoIVYCj
	VAA7UfnjrJ++AfBZqFWNcgrRu3Jqycn7SfCQKmNArK6PnIuhtCFaeiXZBDBADvVowaeH
	pDvhZ8zN6K1OBC+mpKSbdR9OICpW+XGe9YM/HyHAo0/bkmbLZnsXZJ3FTPOiQa9Bh/hq
	vAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GttJW6nbOdJRfCjAt/887bIoZP5JiprpoTZ6WecP2rE=;
	b=TdbiH5ljEGPaaImrJpx1LWBfKMph7AKF0lN9Kc93qbOe8QeGb42+y3hxoyjxS0Wb+l
	HgAI9HQnPxYPTKWj1q6aknkXa1bdjGX2JZevAI127QRhJOVJp5lDKfMSTvqg7FGI2T/s
	tjk+owWqM71vs7MV8xJBXNN4I+ceFyjYWKQa9tkIzP6Ul8RGBVftrQowuxJ12GfjWthW
	WqtUJR/2ECIN6Awgfcj0fibJcH+VHxLHx9w+jSP192tQZw/8rjVYHovaysNuKRmAmJSj
	8CQ2WiSdngus5GSgQNMMsNvK4i/ZvSJqZi+xYDRaN8pdP7yofsfsMOcxBmfZVOHrEwD9
	4mBA==
X-Gm-Message-State: ANhLgQ1zBzQ/Sp7Jgcw+6/pxqnAeah37wqlEtV/+YTlNUy+QnZxxdN6I
	NKxU1XIuVKAWRBOTddAp5iaz5/dopzsS5qZes5D/GSLk
X-Google-Smtp-Source: ADFU+vvwNCPU3Txw19vJdpkpbV0xJz62kTajyEC+0jBIG6olT0joHA/NCkc9rxndxtNnkOrTzYdT0zcB0KYvetBhlDU=
X-Received: by 2002:a02:a78c:: with SMTP id e12mr5505529jaj.42.1584551913486; 
	Wed, 18 Mar 2020 10:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-2-alex.kiernan@gmail.com>
	<CAP9ODKoAXWCgREiSr2xRkGNNvEEwtz6Mzhqx0gK+0mQu6a+kFw@mail.gmail.com>
In-Reply-To: <CAP9ODKoAXWCgREiSr2xRkGNNvEEwtz6Mzhqx0gK+0mQu6a+kFw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 18 Mar 2020 17:18:22 +0000
Message-ID: <CAO5Uq5Q9_KUQ7ccoZHj8yHp+naDcJTWiHWdu684Rvj+_=FmHzg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 01/11] systemd: Package udev rules explicitly
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
X-List-Received-Date: Wed, 18 Mar 2020 17:18:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 18, 2020 at 3:02 AM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> On Tue, Mar 17, 2020 at 12:29 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > udev is packaged before systemd so any wildcard inclusions in FILES will
> > override later specifics. List all udev rules explicitly so that the
> > systemd specific rules, packaged alongside systemd, appear in the
> > correct package.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>
> I believe udev ought to be on PACKAGE_BEFORE_PN so it is still handled
> with the wildcard and allow for easier maintenance in future.
>

It's done with an =+ at the moment, replacing it with
PACKAGE_BEFORE_PN would certainly make it clearer (and avoid holes
where dev/dbg stuff could leak through). But I don't think that helps
with the greedy wildcard problem - we have:

FILES_udev += "...
               ${rootlibexecdir}/udev/rules.d/*.rules \

and

FILES_${PN} = " ...
                ${nonarch_base_libdir}/udev/rules.d/70-uaccess.rules \
                ${nonarch_base_libdir}/udev/rules.d/71-seat.rules \
                ${nonarch_base_libdir}/udev/rules.d/73-seat-late.rules \
                ${nonarch_base_libdir}/udev/rules.d/99-systemd.rules \

Where the FILES_udev consumes all the rules before ${PN} gets a look
in, unless there's some magic I'm overlooking?

The inconsistent path usage wants fixing too... I'd not noticed that before!

--
Alex Kiernan

