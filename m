Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF9272F83
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 19:00:22 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id f54so2993894uaa.0
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 11:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QgYKlT+dC5bVnS6C4ewlaQSOYeulIrgPRd1O02/s81M=;
	b=dpeB2MoxxFzXHzYp9k+QOK/2DRoHWcYsO6VSZFn73/0mMOWevmUKgHJZb4ND3AsLU5
	j6xUH1+JLhO1Gt01tqSVPZ/UD3kWOm+uz9vjqCyD9r4OHJ1AHR4HsLqzI8t6JHX43oi5
	IG6DoeBAIUKiMDP0dEVCvknPxsRMycTnN2x2wYTWfcO4OOJC2DzJ/706zc2vQVKCUZW7
	Zwpx7XlyEIScVqbvo6vmCScZ0nHeCkxVUHtMiVQE0NzW6fckkfVQCbdQcQ0l5yBKRqg7
	3mB3LXMNpubr1J7HswM8Ir8yIu2WvmdS1urhGyDj21i1xfvvg7RUfn6pvzuZeujwVtoh
	ncRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QgYKlT+dC5bVnS6C4ewlaQSOYeulIrgPRd1O02/s81M=;
	b=L26JoIy+mJaVMEOCE1n7/TF7XFKfuxsyou6t7nxPJ52xVLAbEj0Dgd/VAX1yUYEMDC
	JDAF/Vn6JhcpMf0igIAksq2JOzTw3Vdj4YM+ahr6m/CWJCZAZhInGA5A9FEZxIi6qRUx
	j9a/5sKYPM5ZekdK4p8v1CSoiDHQDvqPUV1l/iO2oObn2yKY8gj6pFxl9jBSGxTDPMps
	M1tTnY6burf+xD9QH+sgy2gNhWp3Nw9qpyEpuwOetBdP+JfWAiZ3jpDe97eq/8qOoPkc
	uqKvrjgwRj+qTPR25LEIRFo1QPZB+3mutNaAhbMLwZoAYbJ8+fMdgF28EZ82CUcGg7Jp
	uWfQ==
X-Gm-Message-State: AMke39n1V9Wh3/g9S+7aPLV5/tOQKJO8ToIxMgXZTaH7v1ohbmppVTZMUtnivTIeV7gxl3JiVjGxGsryJdJ3QA==
X-Received: by 10.31.168.145 with SMTP id r139mr1801937vke.148.1488308424093; 
	Tue, 28 Feb 2017 11:00:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Tue, 28 Feb 2017 10:59:53 -0800 (PST)
In-Reply-To: <44423ebc-3760-3da5-2cc0-45a95f62ac7c@mender.io>
References: <502e675a-bdaa-3acd-5343-5cb2f40f2a7a@mender.io>
	<CAHiDW_HwmNybt8AuLWBtMSW=8R1SO3GBChRmwtCkWkmq3bFB0g@mail.gmail.com>
	<44423ebc-3760-3da5-2cc0-45a95f62ac7c@mender.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Feb 2017 11:59:53 -0700
Message-ID: <CAMKF1soHSjdEKaOomKaXfVWqF-xY1h+Cxeuhv5ivNMZV-z02_g@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: Recipe specific sysroots: New failure to compile Go
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
X-List-Received-Date: Tue, 28 Feb 2017 19:00:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 24, 2017 at 3:34 AM, Kristian Amlie
<kristian.amlie@mender.io> wrote:
> On 24/01/17 11:17, Jussi Kukkonen wrote:
>> On 24 January 2017 at 11:36, Kristian Amlie <kristian.amlie@mender.io
>> <mailto:kristian.amlie@mender.io>> wrote:
>> [snip]
>>
>>     /home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/recipe-sysroot-native/usr/lib/go-bootstrap-native-1.4.3/pkg/tool/linux_amd64/6l:
>>     readsym out of sync
>>     | WARNING: exit code 2 from a shell command.
>>     | ERROR: Function failed: do_compile (log file is located at
>>     /home/jenkins/workspace/yoctobuild/build-qemu/tmp/work/x86_64-linux/go-native/1.7.4-r0/temp/log.do_compile.10566)
>>     ERROR: Task
>>     (virtual:native:/home/jenkins/workspace/yoctobuild/oe-meta-go/recipes-devtools/go/go_1.7.4.bb:do_compile)
>>     failed with exit code '1'
>>     -----------------------------------------------
>>
>>     Note in particular the "readsym out of sync", which appears to be the
>>     heart of the problem.
>>
>>     Using git bisect I have verified that it is the commit
>>     9107d6ca144ac1f6169830dee25dae2dad775333, the introduction of recipe
>>     specific sysroots, that breaks the build. However, I cannot see an
>>     obvious link between the two, the error looks very internal to Go. Any
>>     clue what's going on?
>>
>>
>> This could be a symptom of a missing dependency in the go (or
>> go-bootstrap) recipe: the recipe specific sysroot only contains the
>> specified build dependencies unlike the previous system where the
>> sysroot typically contained loads of other things as well.
>
> Probably. I've been looking at the dependencies for gcc-cross, which
> should be similar, but no luck so far.
>
did you get to bottom of this issue ?

> --
> Kristian
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

