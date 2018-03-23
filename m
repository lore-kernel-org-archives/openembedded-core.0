Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9BF788A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 16:31:14 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id r18so15831261ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ycxi0E0ASutF9NLwIxioWmhhyQdSPuiKVfereMMrfLk=;
	b=KzfA9e3fEbADofF3qVxs4toJ1GexvTXx3r2wbsYoiLsCMnRIM3yHU9r0wtPScpzV4V
	+6bWBFyQHhlcqDkQgGLvJB1WC38Z+7cD6dqrOBAv1VyfYSkPS0JbyqHLH7LhjoJXrO9n
	Ss8loYdM3S45ZkNXBjqiSYezVfyf0GDOUi4xnooTYPDY/Q5H9h7ZsUpGeW3s3ahRJfBe
	hJ3TWkdagwvFWaXvjKlfh1zbghv/Q4xIABYzEIsK40G68ddHk1QOR29t4ZGZJKwSfWO0
	hZl6wgTFM9TtapUO+fcfEgqMwATxcuXBSce+lh2Sj/ogU1kElLWRvWN1/XQNG2BoN5Ir
	fA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ycxi0E0ASutF9NLwIxioWmhhyQdSPuiKVfereMMrfLk=;
	b=X31b1uVk/yehALVGsXAyH/VVD9dAkG1d3ia9zmffNLkIoFEiWcQarwaYleWP1kNrcm
	tgOniVOfwgOwlsZjNDnfd0H+KR8mXNsF1ONqYidelG7LGfQtcPLtNogc+iXhbY/abBsR
	MS2lZhgBvre0VZOCzQXZh2/N/a3Pr3hDB4tUgMlCD6zf8AKdcZQ29Aj1PtzP2knT8Vf7
	xTZLUVxYMgZKFfgtoGyoTo01+uTQYeVELgWGwxDiA3wQU6fBGoR/9yLqW/dx+EyWdiLV
	TJc04H4zQvJXSt9pE5aIBKecKASF+OZ3Xm53EHlBR8VwyNS9mZINsxpaifYN/WBGmrE7
	nCFg==
X-Gm-Message-State: AElRT7EqWka+nQhgvxVVXXl0cPMWoI9qvFpASvdmFslXv5CfqfKb0Gvx
	tU7w7nyB4KdHhRp376H93QpeoNOTqroGWYUwwIVXSQ==
X-Google-Smtp-Source: AIpwx4+Oljb4Tg7ZWvTPtqwWa3TTb9gX+ixX1fnkRZOjAxwhAA9i35t95HnfuogdS/ufyoXf1D9tRP3gNlfB/NFNCyc=
X-Received: by 10.107.201.135 with SMTP id z129mr7679207iof.20.1521822676314; 
	Fri, 23 Mar 2018 09:31:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Fri, 23 Mar 2018 09:30:55 -0700 (PDT)
In-Reply-To: <20180323112820.12bc94a4@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Mar 2018 16:30:55 +0000
Message-ID: <CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Fri, 23 Mar 2018 16:31:15 -0000
Content-Type: text/plain; charset="UTF-8"

On 23 March 2018 at 16:28, Seebs <seebs@seebs.net> wrote:
> On Fri, 23 Mar 2018 17:10:35 +0100
> Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
>
>> I think, 'mv' is the culprit.  It calls 'renameat2()' directly over
>> 'syscall()':
>>
>> | $ ltrace mv foo bar
>> | ...
>> | syscall(316, 0xffffff9c, 0x7fff1564a341,
>> 0xffffff9c)                                            = 0
>>
>>
>> Perhaps, 'pseudo' does not catch this?
>
> Yeah.
>
> And so far as I know, it's not actually *possible* to in the general
> case. I really don't think it's safe to try to catch syscall().
>
> I was afraid someone would do this. (It also breaks most Go programs,
> for similar reasons; no libc calls.)
>
> I have no idea why they're doing that; it seems distinctly unsafe.

Because in GNU's infinite wisdom they're using renameat2() to do
atomic renames in the mv command, and as renameat2 isn't in the
headers for F27 it just does a syscall directly. This is in upstream
coreutils so once they make a release, everyone gets it.

This is really ruining my day.

Ross

