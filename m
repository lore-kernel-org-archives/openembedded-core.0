Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 83D21601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 13:11:41 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id t59so3395946yho.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 06:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=eDZpMyZnrjT3Nu7oYTGhVi42z/5AwdEuuzDFGo8xZF4=;
	b=egqrkJvDqeHdriNgvNOolOUeHPDTUXHRhOXxHks3A2DOIYuNnUd772mmN63eA/3VTl
	TkRvJHw7d+0fXi8AQu81kzJpI9jKyihM7xlqqBAAttjYc/eeZaxUXMWHBTHbzTNuPc3I
	DmU1TrIoA73ITzVC23Z2X3bpr+AF+WOKvcEsXVNRuMjIf9YOVlklHE2q+E4H/dMO8j2h
	W2Ncqms8P6RpctpzfsEis8rbdXWxk+CD5czamySssLNwyhgK6nKko3Vfesljvjr88Pnc
	p6mL6FxUixLj5p86/NCwISu7O1pvkSxP/D5eG+LsEAUUFk7uXRG7ett8oIhevCUtmqZd
	X+hg==
MIME-Version: 1.0
X-Received: by 10.236.222.10 with SMTP id s10mr41381782yhp.102.1413983501539; 
	Wed, 22 Oct 2014 06:11:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Wed, 22 Oct 2014 06:11:41 -0700 (PDT)
In-Reply-To: <1413966997-3361-1-git-send-email-jackie.huang@windriver.com>
References: <1413966997-3361-1-git-send-email-jackie.huang@windriver.com>
Date: Wed, 22 Oct 2014 11:11:41 -0200
X-Google-Sender-Auth: 5cTw0JNchfV7ygJcpSQaYm2fyxQ
Message-ID: <CAP9ODKpSoNU5CgCYngdJ3=FJf-T11CX+F=0365k1zK53zw1F9g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: jackie.huang@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: resolve linux-firmware and microcode-ctl file conflicts
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
X-List-Received-Date: Wed, 22 Oct 2014 13:11:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 22, 2014 at 6:36 AM,  <jackie.huang@windriver.com> wrote:
> From: Yue Tao <yue.tao@windriver.com>
>
> Use alternatives mechanism to prevent linux-firmware and microcode-ctl bin
> files from causing conflicts.
>
> The error is :
>
> error: file /lib/firmware/amd-ucode/microcode_amd.bin from install of
> linux-firmware conflicts with file from package microcode-ctl-firmware
>
> error: file /lib/firmware/amd-ucode/microcode_amd_fam15h.bin from
> install of linux-firmware conflicts with file from package microcode-ctl-firmware
>
> Signed-off-by: Yue Tao <yue.tao@windriver.com>

* The firmware should be split in a specific package, if possible (in
a separated patch)
* microcode-ctl-firmware does not exist here
* microcode-ctl-firmware seems useless if you can rely on
linux-firmware to provide the file.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

