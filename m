Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id BD7DE79F5B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 22:48:39 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v13so35036663wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 14:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=eaK2Fr9SPp+CQ/p+g6ezWgF/HQCBTcVqoKQMaYwHFc8=;
	b=WPZyIcDXmDaKZrK7B36+dmeTIPTzOBIpZWVsjlJAGprf9eO9mrkcRxwHZPHZlV751j
	6DTg/kfp+PsMsfYXv61eovgOJ4aisXbMlp97LGvBSfFwT0q9E0ZE1ebAXY6c4S9BoXTs
	aIx+mZHyw01aCVMzjxbg2qp4ve1TgobbGJ5mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eaK2Fr9SPp+CQ/p+g6ezWgF/HQCBTcVqoKQMaYwHFc8=;
	b=UeNc3VpWs3b+f8APyJSush3aeuTyJAgmW472g3/+P+gWXSKXH40Tm+FC4ikO/zzjkt
	OD7icNIaPjY798UqciM4DRA/YoVgAONqWmZ5BLwuJVs4XR+C/vz2DZsANBSznBRaJhUg
	lRE8/6zr6Go779PR21s9Uoh+myfEl2tziBOoP4mKUavN5jC5Z+DFDYLyqTfkSABzYoUb
	Izq8vIP5ju1x9uCk0qWzqwhprRceS3ysbBnM63TehtQc99zK/+qKPXhc6rWeTaQj9VTx
	uGKs9HmGdf8pfiKgWYW/E/mEvte2GpefQ+CpkK+jRLb0iIxWu5KqCub6n+jyzBizsbXW
	tmJw==
X-Gm-Message-State: AJcUukfxNOLLuqwU0n3OEqaLOrrBHhmYchttM3dS0Qjm8tnPHrLEvguj
	hR4gLf35aD9yX17vPb66QA6S7g==
X-Google-Smtp-Source: ALg8bN7RfPMyJzX9HemfmYbYlgvxTF9oBwIjsOFNbHjgBLwFiMrtJdM9+eW6JuerpOV3mkGWA9Ozng==
X-Received: by 2002:a5d:548d:: with SMTP id h13mr40317781wrv.80.1546555720208; 
	Thu, 03 Jan 2019 14:48:40 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b18sm43499081wrw.83.2019.01.03.14.48.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Jan 2019 14:48:39 -0800 (PST)
Message-ID: <cad1ae6acc0a7fe426dbeddcbd28c1fddbe49ee4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Robert Yang <liezhi.yang@windriver.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Jan 2019 22:48:38 +0000
In-Reply-To: <571e7e22-3c77-7902-076f-57278acbc218@windriver.com>
References: <87b2f230208d75707eb2effd514a16dc3d936254.camel@linuxfoundation.org>
	<571e7e22-3c77-7902-076f-57278acbc218@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: oe-selftest serial timeout
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
X-List-Received-Date: Thu, 03 Jan 2019 22:48:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-03 at 16:03 +0800, Robert Yang wrote:
> Hi RP,
> 
> On 1/3/19 5:13 AM, Richard Purdie wrote:
> > Hi Robert,
> > 
> > The test we added debug to failed, logs/links below. Looks like the
> > 5s
> > timeout for non-kvm is too short as was commented elsewhere. Not
> > sure
> 
> I've sent a patch to set default timeout to 60s:
> 
> oeqa/utils/qemurunner: set timeout to 60s for run_serial

Thanks, that should help a lot!

Its queued in -next.

> > why the kvm setting isn't being passed in here but it should be set
> > for
> > these builds, we may need to make sure its inherited as well?
> 
> And another 2 patches to make sure oeqa/selftest/runqemu use kvm when
> QEMU_USE_KVM is set:
> 
> oeqa: Fix for QEMU_USE_KVM
> oeqa/selftest/runqemu: enable kvm when QEMU_USE_KVM is set

I've replied on this one, I think we need to tweak the patch a little
more and solve a few issues once and for all whilst we're changing that
code!

Cheers,

Richard


