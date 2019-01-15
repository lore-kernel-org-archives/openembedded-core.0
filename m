Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1547C083
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 13:57:48 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id r62so2183985oie.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 05:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+Dt+2EWE7yOvAvDdTC1vgivFExNBcoYXPBFCQW3ltEE=;
	b=mgYYQ4i6jTW/VUtNUTcyFOr7PXS95Wo59zcJ+OWvm/0aesqi3YgQGrDr+nMhg+97lK
	ZIurhT6vU5lRGIZzH7bT5b9fnQztlqWgmnamVp0JENjFfCLqtCzKlBCfMWA/CCVHmQoZ
	W5Mfx/BhB7PlAItdK+dx61L/5RW6731QHhIghIhF46Ujgg1+mQrwT+l0amYkz8+ZH+t4
	VfzKPA8snprBRQfdOL8GbF1nnzDppeDHlgr8mBdNQReJg8dpVkQYzDHY/kQ2X1AradtT
	oPAS80+PtsF47WdV4ATWLIiFrXonmRgoy/fmG+eO4PD2htAMCQ9ljc5sVFNYcl4NiDjm
	y89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+Dt+2EWE7yOvAvDdTC1vgivFExNBcoYXPBFCQW3ltEE=;
	b=S72qO48e5QhmxIyFeoQXs5vjZ5QP9+Tk2bz3N9mk4ZbpFXqa6bn7lPMf4oJ0zLmpUE
	tb2O6Zzl3mjpvClWbkp52OaEKzf3T3f0eIF/6NKgRMeea8laoEM+3F28m0tRSlVoL9Ys
	1bMooHEvBVIOFACV7Epp3LDUo33A+KnF0dE0nSq3bDa7RKUZzzrf2LXTeYoP6G4Ki/jr
	tYqkNiJdagYUbZInXtqddSPUcQiWda6QN2EgDlTc4B9Kiumcu1OQAP1GQJDCkJ44SAxc
	QFIalZXwYDhY8PnA/zg/3rwM1tomYPjmeAllOf1aUqqCkHd4Q1UnvwGz1OVQM8rtiL64
	u56g==
X-Gm-Message-State: AJcUukflBgl148vXRejy5mQRectnZ2Dqecs/Fi5QqOhRvUy7zJpniSDJ
	lsQCii71c9RTZaFs1hK7r914hQnC1zslE2XIznUDqg==
X-Google-Smtp-Source: ALg8bN42dCKt82vE7KCmJvmseAgZ7OJSN2xv0UN2+yAtOFlNUNKPBb8jqMO/Ftv4oby36CXiTNl0uW4AHyx3K94T8Rw=
X-Received: by 2002:aca:4b4f:: with SMTP id y76mr2083324oia.88.1547559468991; 
	Tue, 15 Jan 2019 05:37:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<b592c36a7bc200f1058adc383f9ee3338a569a98.1547477793.git.alex.kanavin@gmail.com>
	<CA+chaQds3QnkrhAs727A9R7GHjCP8rn6Hrw=a946G3Byeg6iww@mail.gmail.com>
In-Reply-To: <CA+chaQds3QnkrhAs727A9R7GHjCP8rn6Hrw=a946G3Byeg6iww@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Jan 2019 14:37:38 +0100
Message-ID: <CANNYZj-guOnuAzTymsgGDq+Wjx9mKS1=e0vdeEDfDjam98STJA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/23] runqemu: add support for virgl GL acceleration
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
X-List-Received-Date: Tue, 15 Jan 2019 13:57:48 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, I have fixed this now.

Alex

On Tue, 15 Jan 2019 at 07:15, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> You're duplicating nographic elif
>
> On Mon, Jan 14, 2019 at 4:06 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>
>> Also, do not hardcode -vga option to qemu, set it according to command line parameters.
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  meta/conf/machine/include/qemuboot-x86.inc |  2 +-
>>  scripts/runqemu                            | 11 +++++++++++
>>  2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
>> index 5fdbe4df50e..574b7bbfc7d 100644
>> --- a/meta/conf/machine/include/qemuboot-x86.inc
>> +++ b/meta/conf/machine/include/qemuboot-x86.inc
>> @@ -11,7 +11,7 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
>>  QB_AUDIO_DRV = "alsa"
>>  QB_AUDIO_OPT = "-soundhw ac97,es1370"
>>  QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
>> -QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
>> +QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
>>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>>  QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index c4a0ca811d9..fa88dc4583c 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -74,6 +74,8 @@ of the following environment variables (in any order):
>>    MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
>>    Simplified QEMU command-line options can be passed with:
>>      nographic - disable video console
>> +    gl - enable virgl-based GL acceleration
>> +    gl-es - enable virgl-based GL acceleration, using OpenGL ES
>>      serial - enable a serial console on /dev/ttyS0
>>      serialstdio - enable a serial console on the console (regardless of graphics mode)
>>      slirp - enable user networking, no root privileges is required
>> @@ -427,12 +429,21 @@ class BaseConfig(object):
>>                  sys.argv.remove(quiet)
>>
>>          unknown_arg = ""
>> +        if 'gl' not in sys.argv[1:] and 'gl-es' not in sys.argv[1:]:
>> +            self.qemu_opt_script += ' -vga vmware'
>>          for arg in sys.argv[1:]:
>>              if arg in self.fstypes + self.vmtypes:
>>                  self.check_arg_fstype(arg)
>>              elif arg == 'nographic':
>>                  self.qemu_opt_script += ' -nographic'
>>                  self.kernel_cmdline_script += ' console=ttyS0'
>> +            elif arg == 'gl':
>> +                self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
>> +            elif arg == 'gl-es':
>> +                self.qemu_opt_script += ' -vga virtio -display gtk,gl=es'
>> +            elif arg == 'nographic':
>> +                self.qemu_opt_script += ' -nographic'
>> +                self.kernel_cmdline_script += ' console=ttyS0'
>>              elif arg == 'serial':
>>                  self.kernel_cmdline_script += ' console=ttyS0'
>>                  self.serialconsole = True
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

