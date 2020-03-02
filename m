Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9F42B6194B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 21:08:28 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j16so1660375wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2020 13:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=npZvM8r3+ogteasMMyKCHGrJhnJH/66gU2IevG+Bycg=;
	b=d2V6W4VLCGg2dVrbqDpEsqdWtwh1etX15rcHR/IJ4eEqLVKetzBqa9d9E4m/C2/ESe
	RqntlTWPzWtPpgBCnxcnk7gaTEsDRso9oNerjlb0rPNubcZPRDwBGQTRdOglibb0lwXd
	Wfcgo6fYjgMdECH7CLiWKR7ZAD7fs56BBiV3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=npZvM8r3+ogteasMMyKCHGrJhnJH/66gU2IevG+Bycg=;
	b=R6utrSbzhilTlg0E+2O2awrZ/VFOkJuvXVtZtcBX16fpRFRLvl6J6Nhnoo/LgWbdjp
	GEt8KGgu4T3DDxwudpDQF4EWmDkjn1Z6KLBcNClfeZ6fgH0234caZ6jQv4pvqzbFQSnq
	58V7qcUkkZ1E6vJRWnbtDgTtST5CsBdL1ZJPQth1KzrZD4vo8Hp/F9QvGglNPHrAUDym
	g30gB189lsU+FDhCzHMJf2ejY2OrV3DV2zZ7hdpyXPl5LM4wOuStXVrc9jgV/ij8SKif
	98IW4FM8aRtzAc/UW33t4wtlzfhAIaZSI+iBXk/sHsNxjzXxZg2y+9gQJN4AOHDEBD4b
	19Ag==
X-Gm-Message-State: ANhLgQ02caiSQJznYS7RENAcB8vKptk3pAwMDk2XDU2nMcn+h7so5oaM
	iiZV7k2c0Yu+QuN9sQ4hcsLWyg==
X-Google-Smtp-Source: ADFU+vsdbu37JPt3gQfaifxkYmsh2oSWh1r0xu/ezW1SoTQllJeDk9vwkdSw4at8vGm30uZ/FZv5sw==
X-Received: by 2002:a5d:42c6:: with SMTP id t6mr1474310wrr.394.1583183309298; 
	Mon, 02 Mar 2020 13:08:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id i7sm299750wma.32.2020.03.02.13.08.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Mar 2020 13:08:28 -0800 (PST)
Message-ID: <62e5739220e0f491acd489c2abcc35213d91d138.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 02 Mar 2020 21:08:27 +0000
In-Reply-To: <c1e072be-0b1b-a2c0-1801-0f1464f028c6@gmail.com>
References: <20200301014301.805156-1-raj.khem@gmail.com>
	<20200301014301.805156-2-raj.khem@gmail.com>
	<6ebd8c098cac7dab116f9043e7b64fe9b3376601.camel@linuxfoundation.org>
	<CAMKF1spJ_aBK=JdZvr0yFLEHBgYeQcZhUFHBaHDcHt=J05O8=g@mail.gmail.com>
	<7737c4f098af15087a434de3b1a09d8d651ebaa8.camel@linuxfoundation.org>
	<CAMKF1sqVqVDgUac2+G6VX4GmvD7+ecF9HzO731s=OsrWESk+dg@mail.gmail.com>
	<6ac648b5b9d02cb857e9d784d7bf95e071567ca1.camel@linuxfoundation.org>
	<b98ca563ed2c5dd64b276ed6a283de33c8434e35.camel@linuxfoundation.org>
	<c1e072be-0b1b-a2c0-1801-0f1464f028c6@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] dbus-test: Fix QA host-contamination errors
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
X-List-Received-Date: Mon, 02 Mar 2020 21:08:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-02 at 10:49 -0800, Khem Raj wrote:
> On 3/1/20 9:05 AM, Richard Purdie wrote:
> > On Sun, 2020-03-01 at 08:20 +0000, Richard Purdie wrote:
> > > On Sun, 2020-03-01 at 00:17 -0800, Khem Raj wrote:
> > > I understand the need for the fixes, I'm just very concerned we
> > > have
> > > what amounts to undetected non-determinism in the build :(
> > > 
> > > I'm more concerned about fixing that (and ensuring we can
> > > detect/fix
> > > all cases) than I am about the individual errors.
> > 
> > I did a bit more thinking/checking on this.
> > 
> > An interesting command to experiment with is:
> > 
> > $ touch /tmp/test; ls -la /tmp/test; ./tmp/sysroots-
> > components/x86_64/pseudo-native/usr/bin/pseudo sh -c "ls -la
> > /tmp/test*; cp /tmp/test /tmp/test2; ls -la /tmp/test*; rm
> > /tmp/test*"
> > 
> > which for me shows:
> > 
> > -rw-rw-r-- 1 richard richard 0 Mar  1 17:03 /tmp/test
> > Warning: PSEUDO_PREFIX unset, defaulting to XXX./tmp/sysroots-
> > components/x86_64/pseudo-native/usr.
> > -rw-rw-r-- 1 1000 1000 0 Mar  1 17:03 /tmp/test
> > -rw-rw-r-- 1 1000 1000 0 Mar  1 17:03 /tmp/test
> > -rw-rw-r-- 1    0    0 0 Mar  1 17:03 /tmp/test2
> > 
> > Can you see if that is different on your two machines?
> 
> above cmd output is exactly same as yours.
> 
> -rw-r--r-- 1 build build 0 Mar  2 18:49 /tmp/test
> Warning: PSEUDO_PREFIX unset, defaulting to 
> /mnt/b/yoe/build/./tmp/sysroots-components/x86_64/pseudo-native/usr.
> -rw-r--r-- 1 1000 1000 0 Mar  2 18:49 /tmp/test
> -rw-r--r-- 1 1000 1000 0 Mar  2 18:49 /tmp/test
> -rw-r--r-- 1    0    0 0 Mar  2 18:49 /tmp/test2

Hmm, this means the test is flawed as we need to find out how
/tmp/test2 becomes owned by 1000.1000.

Any ideas how we can simplify this down to reproduce that?

I did wonder if its coreutils-native was somehow creeping into DEPENDS
and had a different config between your two hosts which was causing
different behaviour but I'd need to check into whether that happens.

Any other ideas why the behaviour difference or how to reproduce it?

Cheers,

Richard





