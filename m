Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8915E7C136
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 17:12:13 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id u18so12767502oie.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 09:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qnVYOEl91OoiX4Ry/jrwXI1qY0c7RHNE7gDU8Hqah58=;
	b=P0bbAfvOq1STTWmieDyskehhaSCV8WvOh1KJwlRG7/Jkst/mDCeJXmzLpXzE2CjebD
	VnGJn9DJWMtwD2X1Y3svEVnIPzNeG9jRMxD9pg4bX0Nj+TmsgOgiYGVabgz3760L/j9v
	mWGo0h/gNJ3ErzIRhLc82073wKO0UZl/zWnd5Wx5/fsLJ+7x7wqyONzi91vLY1NXgG86
	9v/CBc/tOC1V60wDRPgoqd3fF3AgqM1ETVQWPHgbHQDM8LPOiO0+G0KTvYN14YCw4b4r
	BPJyAQR5xxWIrXIxRHYizEKKWuneIY1nGVhFOcI4UeioTcxgenT17vGSM6p0vXeN9Nyg
	BqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qnVYOEl91OoiX4Ry/jrwXI1qY0c7RHNE7gDU8Hqah58=;
	b=dJ+Dkhk+CoNBAWoivE8Ln35+xSGDeJyM17gWz1AbPCzn2V79qCQZhKT/KfUqMxksEX
	CI1aMzLT5V4hDmq0CBKIJlqti1TUYaY8oKiCWfCuc5rTRH6aivIdpHFl6CIB8s8g4Gj1
	/U0GPQIUMH28WHaTGm+/roJ6uCZkurXIn3+HhObTvRHb8Fv7rfsBTg4Q+/rcXBwJ+xhb
	rJMNgi17Ya0gcR675AJhYxE3nSHinF/2xs9arMhub23VjQowXMNba4HoepANxxU84Mtm
	mRwAUwPNMmbK4HbERve3FAT+OPNjeRsazn1/AhpPpvk56s1pvorHcOV4utVqWn3/fJuH
	O3vA==
X-Gm-Message-State: AJcUukc/bJ4wRSE/f3YUgGOeXvsrkOvLz+JjyJj+mKh4JiBol1R3COlO
	B3bNJUWK7krk1cvvE2FqjkrY9gRbMcOHKFvWhcU=
X-Google-Smtp-Source: ALg8bN75zFpaQcNA3v7Uv7h/58rNzse7YUIq237Mv7CXPyyBmu7Fc8OSlszWhen//avGsuZADrfgP+vsBrWAdrFQrnI=
X-Received: by 2002:aca:d78b:: with SMTP id o133mr9184146oig.232.1547226734516;
	Fri, 11 Jan 2019 09:12:14 -0800 (PST)
MIME-Version: 1.0
References: <20190111104349.33960-1-alex.kanavin@gmail.com>
	<92392218-ceb5-7166-7bb1-64127b46df41@windriver.com>
	<CAJTo0LbSNEeLoax++2BX2tyYUUffsKaWm2AsiLoMN9OAW08DtA@mail.gmail.com>
In-Reply-To: <CAJTo0LbSNEeLoax++2BX2tyYUUffsKaWm2AsiLoMN9OAW08DtA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Jan 2019 18:12:02 +0100
Message-ID: <CANNYZj85ySius=533OE1gJ3kfm5aByDeS7WLUxy9Rzsb_xq-og@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: produce sane amount of logging when creating a rootfs
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
X-List-Received-Date: Fri, 11 Jan 2019 17:12:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Jan 2019 at 16:53, Burton, Ross <ross.burton@intel.com> wrote:
>> I'm slightly worried that this will break on-target RPM users.  Since info is
>> commonly enabled during on-target installations to track which packages have
>> been installed and what their progress is.
>>
>> Has it been test that this does not break dnf on the target?
>
>
> Easy fix: make this specific to class-native.
>
> That's probably sensible even if it doesn't break dnf, because then target RPM behaves as usual.

I'm not too worried as dnf interacts with rpm via rpm's python API;
what rpm prints out should be of no consequence.
The extra lines are probably useful for the target as well, since
postinsts can fail in various ways there too.
If this passes the dnf/rpm tests on the AB, I'd leave it like it is.

Alex

