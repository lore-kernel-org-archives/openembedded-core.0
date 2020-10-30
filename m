Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.12885.1604061526504315218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 05:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YbqbrQEH;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: vvavrychuk@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id w25so6509835edx.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 05:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5DIHrdSBTLTkYtCd+sHXRYqPh9pehaVU6oyac/E1hac=;
        b=YbqbrQEHCw37XYvgh7P0jA6M/6vglWU5bQ4+zrMSGjLci0TkbhpgWZRbYkz0pgTNEM
         L4TgR8u9dmy982QYU75N1WG/8duX7iu0tAzpzL+zXR+phh0C8H7j614sgh1w4qFr9Ajm
         DH8190xb8fvAdxAgd9q7/KqQxdlvF+ng1bvF3c2p6V2x1luRQBv7hgQ43SBBEGSFUBh2
         XCimTJAmechIqBWp8ij8M/QjO3kjplmLLK+mZ1lsKi2er5cDIhPWuFFyggyDC7cqqUXx
         JeL3qmJ14+6jK9qwMcy78p57hI57iD8WIJcYLyZ99xBGHZgPYG3/Uq84fBEbL/UhRghT
         Yx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5DIHrdSBTLTkYtCd+sHXRYqPh9pehaVU6oyac/E1hac=;
        b=Q7VtjiwgN+aFAqYxoJS6KKNrbgwWuawM1OpPA2EzEP1WIwygTYAwxE/4GRxINEXHGu
         gclqrHZsQ2Sn1mZ0iggs97xydSgU9cpdOkEHAa5OgbSSfUFbw9IRjULTd5f4a8fmVYch
         1s7wG9O/MOY/rBcsFCa0nJ+L94iN3KymrH0wZTrUFKW0+OIl+4swnwWOBKlMc8w6UCAH
         O4612J7KurPfo71Wjllwv3/BUVljVtci91oSmYMHmLUZjq4PbnwAyjCEIDx4rSR1dysp
         6vCMszHGnLhkeR1rzDTQAwf4dWnpWk8r3aInM3H6bJC2ACrbgHOFFLFXQUSvxJUTcw63
         7ErQ==
X-Gm-Message-State: AOAM533e21bRyxU0Y7nRBpR5nU2WGDHXjcUsXyw6JU4o60EWmg+r/FJk
	2jZgnD+zXj/xePuhi+3ezoUDOj16yqPfSm7JvPY=
X-Google-Smtp-Source: ABdhPJwPK9e/yuaj6Tf4xJhJnbrSFPF6u44HTCf9Ie1/PW5DIFNoSwR6/Ap8rh+YD+G0zunrkdz76U19nn4bC6c25b8=
X-Received: by 2002:a05:6402:104d:: with SMTP id e13mr2043845edu.322.1604061524977;
 Fri, 30 Oct 2020 05:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200830201522.23701-1-vvavrychuk@gmail.com> <CANNYZj-fw2YVGczSP+c7gjor6eKhYsjDgM1w-1AYD6MpDHQscA@mail.gmail.com>
In-Reply-To: <CANNYZj-fw2YVGczSP+c7gjor6eKhYsjDgM1w-1AYD6MpDHQscA@mail.gmail.com>
From: "Vasyl Vavrychuk" <vvavrychuk@gmail.com>
Date: Fri, 30 Oct 2020 14:38:33 +0200
Message-ID: <CAGj4m+5pTiiiqmncAU500S6AnGmBuxdFyE3t0btJzcj7wibhpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: Change virtio-vga to virtio-gpu.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Alexander,

I am trying to run oe-selftest.

I have one question. Is there a way to run oe-selftest incrementally?

Because for now, if I run oe-selftest second time I get

  oe-selftest - ERROR - Build directory ... already exists, aborting

Then, I should remove build-st, and only after that oe-selftest can
run second time. But it take a lot of time.

Could you please help me?

Thanks,
Vasyl

On Sun, Aug 30, 2020 at 11:44 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Do the virgl selftests still pass with this change? Please run
>
> oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk_sdl
>
> and
>
> oe-selftest -r runtime_test.TestImage.test_testimage_virgl_headless
>
> Alex
>
>
> On Sun, 30 Aug 2020 at 22:15, Vasyl Vavrychuk <vvavrychuk@gmail.com> wrote:
>>
>> virtio-vga is available in QEMU only for hppa, i386, and ppc
>> architectures. On the other hand, virtio-gpu is available for all
>> architectures.
>>
>> Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
>> ---
>>  scripts/runqemu | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 7fb5f7db57..5d6b35ffe4 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -461,19 +461,19 @@ class BaseConfig(object):
>>              elif arg == 'sdl':
>>                  if 'gl' in sys.argv[1:]:
>>                      self.set_dri_path()
>> -                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=on,show-cursor=on'
>> +                    self.qemu_opt_script += ' -device virtio-gpu -display sdl,gl=on,show-cursor=on'
>>                  elif 'gl-es' in sys.argv[1:]:
>>                      self.set_dri_path()
>> -                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=es,show-cursor=on'
>> +                    self.qemu_opt_script += ' -device virtio-gpu -display sdl,gl=es,show-cursor=on'
>>                  else:
>>                      self.qemu_opt_script += ' -display sdl,show-cursor=on'
>>              elif arg == 'gtk':
>>                  if 'gl' in sys.argv[1:]:
>>                      self.set_dri_path()
>> -                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=on,show-cursor=on'
>> +                    self.qemu_opt_script += ' -device virtio-gpu -display gtk,gl=on,show-cursor=on'
>>                  elif 'gl-es' in sys.argv[1:]:
>>                      self.set_dri_path()
>> -                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=es,show-cursor=on'
>> +                    self.qemu_opt_script += ' -device virtio-gpu -display gtk,gl=es,show-cursor=on'
>>                  else:
>>                      self.qemu_opt_script += ' -display gtk,show-cursor=on'
>>              elif arg == 'gl' or arg == 'gl-es':
>> @@ -482,7 +482,7 @@ class BaseConfig(object):
>>                      raise RunQemuError('Option %s also needs gtk or sdl option.' % (arg))
>>              elif arg == 'egl-headless':
>>                  self.set_dri_path()
>> -                self.qemu_opt_script += ' -vga virtio -display egl-headless,show-cursor=on'
>> +                self.qemu_opt_script += ' -device virtio-gpu -display egl-headless,show-cursor=on'
>>              elif arg == 'serial':
>>                  self.kernel_cmdline_script += ' console=ttyS0'
>>                  self.serialconsole = True
>> --
>> 2.23.0
>>
>> 
