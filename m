Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id E376B601D3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 23:47:58 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n204so106676636qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 16:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mrtpxLjic9RT0ROjlqj4OsI4DBUpdDYLBVZ9nn29g5M=;
	b=FylY3G7lA0cAokmdS25lCt0TFhEfvOrpO4vXQNf3qk/jXM9mO47vmHBk8dnIjtqqn9
	Pp3RrQHMEbIrNGbjCb/tawE2Hr3NO5gvzHwCG+shLTMi7xgp3hUJzVrsmb7nGUiCKjIN
	8mv3+YVAB1rn/+eRI0IF0g4R6iozJYX1vTPzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mrtpxLjic9RT0ROjlqj4OsI4DBUpdDYLBVZ9nn29g5M=;
	b=FHda3NHrs3OTbC3R+EWeXjn2ZfwMVMV5zmDUQ5X0JbBFAoXKO2/yrYcjUTzNds7kxn
	jn5zLHz7kXBfWK8QSL4gHkEbKcoSU0SIg2BKQeP0aN8Np8bxOZRc29cE1LvlLUm4aWu2
	z4hAUBNnSmhnYtUSXEHYDK/wFguQY5ju7Vv+TQN8SS1RBFNNog1AJqytn075yR+ackX+
	nNJhG/Hc5ijCNLkrcafaEX7sZivjl6jocDvu7HBrg1iPEO045ABL1NJVebyYnDaqm9uB
	hypV3y1MLIrp4bViAR+8ZjL643USXCDlAQtgBvUxmH2GeqF6Ak8f2Uo6BfIe2z4NGb2f
	kASA==
X-Gm-Message-State: ABUngvdzj7zIYbiw2eEULXckzUpCEZzW20dU0cDg/v52awls505shprj8bGvFQhHWsjaY1+ZDonqrf6JLFlBBBHH
X-Received: by 10.55.138.193 with SMTP id m184mr17330568qkd.70.1478303279403; 
	Fri, 04 Nov 2016 16:47:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.104.102 with HTTP; Fri, 4 Nov 2016 16:47:38 -0700 (PDT)
In-Reply-To: <CAJTo0LZAGq8szm0vL0wyyR_rFVe1LBoMWYcoZh+VBMBcw5kW-Q@mail.gmail.com>
References: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
	<CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
	<CAP71Wjyy-qQH+nE34FTKUhqgRqGZocpfQ4CrkmTPh+OOMGK6jg@mail.gmail.com>
	<CAJTo0LZAGq8szm0vL0wyyR_rFVe1LBoMWYcoZh+VBMBcw5kW-Q@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Sat, 5 Nov 2016 00:47:38 +0100
Message-ID: <CAP71Wjzd7iZZ9=Mro6RMNZb1x5rYZ2+RamPyubYvJ=zueR2fVQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Fri, 04 Nov 2016 23:47:59 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 5, 2016 at 12:24 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 4 November 2016 at 21:25, Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
>>
>> So in order to get the build error you are seeing, that means that
>> SYS_getrandom is define to NR_getrandom (in syscall.h), but that
>> NR_getrandom is not set to the right syscall ID. That makes it quite
>> inconsistent.. could we be mixing HOST and sysroot content here?
>
>
> No, I checked the files in /usr on the host, as this is a native build it
> should be linking against the host libc.
>
> $ grep -r getrandom
> x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
> x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
> x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
>
> Yes, looks like Debian headers are a bit broken.

hmm. not for me...

root@nikaia:/usr/include# grep getrandom
/usr/include/x86_64-linux-gnu/bits/syscall.h

root@nikaia:/usr/include# dpkg -S /usr/include/x86_64-linux-gnu/bits/syscall.h
libc6-dev:amd64: /usr/include/x86_64-linux-gnu/bits/syscall.h

root@nikaia:/usr/include# dpkg -l | grep libc6-dev
ii  libc6-dev:amd64                2.19-18+deb8u6           amd64
  GNU C Library: Development Libraries and Header Files

this is from a fresh jessie debootstrap

