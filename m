Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3FF7734D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:27:34 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id 5so45667798igt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:cc:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=kdnR9ZTb+8ki7aOnVUb9ZA0PPpMMuoRV/QHelQ2b298=;
	b=iFNfCwSQkyIKHLQNeHkSW45k+IzK8iNd9yjQyKNKddgE4P+CEW5+4gtAONYs+smrcY
	5tifA8RgcrJhNGlhq3TN5+CVydtvI++g9ROn+HEkJE39YJ/BBP9lO+lSsxN1IXB29Utw
	rGLgEKFQCmVFiTWaeJhiAX/J2RPn4Mq9ariBrzBzVwK06FiFTm7DKNMU08lecpiHb9wP
	qp8eO3v24+pWpVe7w3qqj/B9sy2eimquCJ1MlhIFJDH73xw4dBJ8mzLenmGDETT9KBCV
	YGPUC61t2ardVByxy8RZT5T3Dsz206ATNqILUKUz2hpIfHRBpDZLoq3ZQCr+xaJz0+sn
	p5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=kdnR9ZTb+8ki7aOnVUb9ZA0PPpMMuoRV/QHelQ2b298=;
	b=LD4ekkfWXqLaMYtAaVMgZPg4+TD8+uTlvLorM1rJF1v1zCVjXAXpfVaPtmeYGxUwVA
	ZOuFhXEi/8z6RaH1Y0goQWPte8m1Jm/dEi836o9Fp+7SDP3WvtK+Y7U6ianEjEqrqLjh
	PKUcIKkGpjcoDLkxGnZpy9YVaM0IH93ksKR9+0IFk+hB7LM+tE62vGFB431+ROcCuy+Q
	yxNb4btnOkEx7vgZ9pUbAt88TxSl2v9aYbuxKDGmYdNOtEHrhBzTLR3euCr3wK/Lnf9P
	vP+PT0WcZ/PMrslHvyYuQrazGJtacIPH1KaWR6qx9DHQZYN7y40NrQ8PJhEANPxZamdz
	j0tg==
X-Gm-Message-State: AG10YOQw5WmNqYdEQ5/7jLYxd8QSlf58csl16zm2IGVU6L8xfh2b4FC2q7l2MBb/gt5fbg==
X-Received: by 10.50.171.200 with SMTP id aw8mr174396igc.77.1454531255002;
	Wed, 03 Feb 2016 12:27:35 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	98sm3527480iot.27.2016.02.03.12.27.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 12:27:34 -0800 (PST)
References: <56B25500.7030402@gmail.com>
	<34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56B262B5.8050607@gmail.com>
Date: Wed, 3 Feb 2016 15:27:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Wed, 03 Feb 2016 20:27:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/16 14:56, Khem Raj wrote:
>> On Feb 3, 2016, at 11:29 AM, Trevor Woerner <twoerner@gmail.com> wrote:
>>
>> My chromium build is now failing due to:
>>
>>     commit 86ade2cc2553c942d9526c5323a11ae151653505
>>         binutils: Upgrade to 2.26
>>
>> | FAILED: x86_64-oe-linux-gcc  -m64 -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2 --sysroot=/z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relro -Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC -B/z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.2612.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bin -Wl,--disable-new-dtags -m64 -Wl,-O1 -Wl,--as-needed -Wl,--gc-sections -o chrome_sandbox -Wl,--start-group obj/sandbox/linux/suid/chrome_sandbox.process_util_linux.o obj/sandbox/linux/suid/chrome_sandbox.sandbox.o -Wl,--end-group
>> | /z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.2612.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bin/ld: error: /z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64/usr/lib/../lib/crti.o: unsupported reloc 42 against global symbol __gmon_start__
>> | ../sysdeps/x86_64/crti.S:66: error: unsupported reloc 42
>>
>> Any suggestions on how to approach this?
> do a clean build. Its mixing objects

Unfortunately this *is* with completely clean builds; I'm deleting 
everything except conf/ before each try. I just finished testing with 
ld-is-gold and it fails too in exactly the same way.

I'll make stuff available for you to test after I try a build with 
50.0.2636.0

