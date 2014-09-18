Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5C24760030
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:23:12 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lj1so1094036pab.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 02:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=NmVKKj9+vRpz4aVQTpZDG2k97RQac+cyD0qWmmrVTd4=;
	b=CLmY+QtLFfjk4jdcn3FvieB/kZrW+EIJh69ci/byNbNZ8o8q0EOJxzyjgS8jjsp6dJ
	R1S3zEwxr7oHaCc6CsJTVCIMA3U3ihBYH/lN2oovIcK1XxWSxyFQKS0FFQj6L6g7Rlwl
	BuZAfwIro1FQBQtRHk07uQ4hkh/wL5aVQg09VMCu4H++5ct0Tu5qraEBN6IvIEIp3FCn
	667V3emlVtnIVbpsbeXTSP+ZdimGLqEiaGDp7xx14Yy5qsHKg5Ji0I8/dAQ1OzjhnSWv
	sdbh1Jcsp63FmWW9DbO3RgkV8Ly6oOBheSkhTCVUmRpUS93DI8bC8ralAfRsZIrG2egu
	Mjvg==
X-Gm-Message-State: ALoCoQnYMXEXgdEmmSaZ59go16TaqU44K60eCRvkXnLvUxMN7vZHQAHOsWycZreJl2b2JdBdbA+F
MIME-Version: 1.0
X-Received: by 10.70.98.176 with SMTP id ej16mr2824261pdb.165.1411032193061;
	Thu, 18 Sep 2014 02:23:13 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.65.69 with HTTP; Thu, 18 Sep 2014 02:23:13 -0700 (PDT)
In-Reply-To: <201409181116.07918.marex@denx.de>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<201408112026.32235.marex@denx.de>
	<CAOMwXhNBq9F45HSQj0QuXoxRe_50_9x_F42=yWe22H2_BcPV1Q@mail.gmail.com>
	<201409181116.07918.marex@denx.de>
Date: Thu, 18 Sep 2014 10:23:13 +0100
X-Google-Sender-Auth: Yq1w41ZxNU5A9KYOfNTmNYwqJxw
Message-ID: <CAOMwXhN5=zy_wkKypAMjaPxTY1ezCZ302L8hqokNZQaUBbcfNQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Marek Vasut <marex@denx.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Thu, 18 Sep 2014 09:23:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 18, 2014 at 10:16 AM, Marek Vasut <marex@denx.de> wrote:
> On Thursday, September 18, 2014 at 11:11:45 AM, Laszlo Papp wrote:
>> Come on, Yocto maintainers, please...
>>
>> Mark sent this change relatively long ago, and it is still in "new"
>> state, sadly. The current SDK shipped _breaks_ any third-party
>> software that uses standard python with regards to the libraries and
>> all that.
>>
>> This is is slightly frustrating. We also face the same issue. :(
>
> Thanks for the reminder, new version which should fix the issues with the
> previous one is on the ML now. You're all on CC.

I do not think this is an explicit Qt issue, and hence fixing on that
layer sounds like a weird approach. It seems to be a generic python
issue and so, I think it should be addressed in its core. I opened a
new report for this:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6735

