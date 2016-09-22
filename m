Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id C15A460851
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 20:05:24 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 51so408452uac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 13:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dvBtsK+Pqr5YuZA6bLQEdRAWe8q0IulSCH0E4RU/6Yc=;
	b=ohZAaIwXTWXZl+LGV+bDsWCCxM4nAVLM8m+NH1blFkmrNVqdDx+Mbs/gplMfdYe+8C
	tJxwbkfQ7cgcKhGm65OHH68uBkm5wZP5drmRGq5vULyKb+kzRuTr6c5QBlkG9vf2/qNt
	xeoHuihzziJBPMK5iXvXmTnIc4Y33+F1l5COChLiKEjY8LEzFGh2FL13jNuc7M+otAHu
	ZfNqY7UnIIGvnuF4B0UQGzm80EEY3yTAwpVfr+PNp4M3T7VggmD37C2T8nUTJW99uVaw
	0H1sFEdPDjqfnDLmxL0gxt/42+5Bwo3NZAiJzPTEstwbRNOqshSav1Pcr5Em7MVcIfF4
	9UPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dvBtsK+Pqr5YuZA6bLQEdRAWe8q0IulSCH0E4RU/6Yc=;
	b=MH1dZmAoi5orrPz0SCSGjEJuAD/ouDZeEv2qthzH1JNBqrbx9HBW36tSQhkUXvufsC
	MBQSSryTQE225wgvUM7EF4TRiNp8KkLPDDe9tiDTZ70j8QtJC0Z+NvIImvQdTJiVZcD7
	x9p9QDCDJmf1urKVG7vRnvacauXEyt1XAoRBCKdOPqdLMGFkcn8hkXLGjpBd2DOepYf+
	SqOM0umlEzTcF9d8Y3z7HJXVnf1UJSmrRAORO7VgUfc1u/UH+5pFBHEPyLpIFlTcF9NB
	AzXeROasApLP8vZC4A6qW26Ig1xJDK/7BCGjI6f1ZnMxnHiYXqWubsOLV4ApXmJY2GZF
	w1ew==
X-Gm-Message-State: AE9vXwMmRS+ZARh7qGknG0kmJPiSwTvJFXU8cOX4h9xFcb1k1813AQAEhYghZhoNbHwKqII9V6ybFMKaRakmbA==
X-Received: by 10.159.33.247 with SMTP id 110mr1350423uac.44.1474574726368;
	Thu, 22 Sep 2016 13:05:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Thu, 22 Sep 2016 13:05:25 -0700 (PDT)
In-Reply-To: <CAJTo0LaSU6xmyKqiD2oAGSZX=vadxMe8fNNpvuVveyt99WGMnA@mail.gmail.com>
References: <1474435844-16942-1-git-send-email-schnitzeltony@googlemail.com>
	<1474435844-16942-2-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LaSU6xmyKqiD2oAGSZX=vadxMe8fNNpvuVveyt99WGMnA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 22 Sep 2016 22:05:25 +0200
Message-ID: <CALbNGRRJ-Q_YwZjj1yeGg+Zg2F6btsUGMBzSPH6tkPaBAGvEvw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] scons.bbclass: reduce build time by adding PARALLEL_MAKEINST to scons install params
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
X-List-Received-Date: Thu, 22 Sep 2016 20:05:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 11:06 AM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>
> On 21 September 2016 at 06:30, Andreas M=C3=BCller <schnitzeltony@googlem=
ail.com>
> wrote:
>>
>> During install all files are recompiled. This should be investigated
>> further
>> later
>
>
> I'd put (pretend) money on it being because PREFIX/prefix change between
> compile and install, so it needs to rebuild.  Looks like this class is do=
ing
> something wrong.
>
You are right! Need some further build tests but for mixxx I got good
results by keeping prefix same for compile/install and setting
install_root=3D properly. Before this modification starting mixxx
complained with links to build install dir and finally crashed. Now it
runs fine. See what the other recipes say...

Andreas

