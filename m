Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.12028.1613853633094715225
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 12:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D0612HWZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id m6so4177144pfk.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 12:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dGyBka0TVNYDfQufMRuEVHlcwMu8z+1mvHhl2z2FvqY=;
        b=D0612HWZo1J4x5B7h+ryuhksqHSA8J0g/2IpM7H7UZYHwzUcclQPj4MZEP3klewl6g
         muiEHoNV28zE/mSUA9MHdC7KfGbrIDoma/A66abX8o18wZpbK68eEUHZwj+Mu2o9Jnqu
         QeV/GmxagxGa6vEe077N+odYZhbBcDswz8Jr+q7nsw9qe9J2em7u4+SxZtOaCTMRPMLh
         CSShNpBFIzkX85vsVP0cJSRY8XQO/a6g2/gczPPXsuZLmCRs4RV6oUI7hbxc6mdMQM9o
         Do+w9NzQ6mQ1NGTdz5ygZY1SlSWpYZmldzKJhEW6dqE54YCxqPH9wzffFO80Y7feP1SJ
         Ko6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dGyBka0TVNYDfQufMRuEVHlcwMu8z+1mvHhl2z2FvqY=;
        b=TZgGwbn5P2hFpQ5SYronM8P4pSSzRHt6aLvNeT/B/UqGJp55xm2XTEtLdM7UZ5XjL/
         95WkgSVcGdpjasKRPFXHkDEpFM0s9XFgG0aroIf9AUjzyR/4El8Aue4tZkC5hF6IviCj
         gKOAoKhKa7/2NuoL4EOzIth+ZwvqtqeQrioIQrWGfMa8gPljgRu4IktGAnxn8ZBvJN1C
         DP6bpH+qqCItDl832J/kY4ONFTa2xe5oCBz6JmBHYrMRldBWLGfARGdCg1utwcYYlrLd
         T73vRK0xQq1Rv/snB+CoVvUUKns0XZrRGrOi26yLfqHNrnq+ZZP72laia/j7uWkisbbz
         n0GA==
X-Gm-Message-State: AOAM533SaqwTTwhy7R+N3lK7QIROm2fmDW/5I4ESqYTyEOLEAb/ZsPnB
	hIbhVNWBJdnyyALFb7YhSofDxA67nnQE/A==
X-Google-Smtp-Source: ABdhPJzamYGO0jwOexj/2MIXSFQFNqDEAz2iGorjwZjQaWjPYxdoiQAjbzonKAHtBjrClf+U7wEmLg==
X-Received: by 2002:aa7:96a4:0:b029:1ed:94a3:2cf5 with SMTP id g4-20020aa796a40000b02901ed94a32cf5mr222355pfk.68.1613853632356;
        Sat, 20 Feb 2021 12:40:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::7bdf? ([2601:646:9200:a0f0::7bdf])
        by smtp.gmail.com with ESMTPSA id l74sm2822042pga.86.2021.02.20.12.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Feb 2021 12:40:32 -0800 (PST)
Subject: Re: [OE-core] [PATCH 1/4] runqemu: Disable vga with nographic
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210220190924.3153040-1-raj.khem@gmail.com>
 <CANNYZj-MB3mzzzu91dzaHvP+MdQhN0RK09QaQtJDh7JWMTx4kQ@mail.gmail.com>
 <5c76ef42-79f9-b929-b1a4-e8e5360e301c@gmail.com>
 <CANNYZj9wLUDQapAB6JbVHLb=eYwCbhkyPYHtWzPAxaz98i_iwA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8e14f8ab-03d7-b928-554b-f5af207710d8@gmail.com>
Date: Sat, 20 Feb 2021 12:40:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj9wLUDQapAB6JbVHLb=eYwCbhkyPYHtWzPAxaz98i_iwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2/20/21 12:11 PM, Alexander Kanavin wrote:
> What I am saying is that -nographic (where the output goes on the host) 
> and -vga none (what hardware gets emulated in the guest) are 
> independent, orthogonal options, and you should not bundle them 
> together. It is a valid use case to have -nographic with emulated 
> graphical hardware still enabled.

I think I understood what you mean, I was suggesting to not translate 
runqemu option 'nographic' one to one to qemu option -nographic but 
still address the usecase you are bringing up with another option on the 
line like sdl, gtk options we have

> 
> Alex
> 
> On Sat, 20 Feb 2021 at 21:03, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
> 
>     On 2/20/21 11:20 AM, Alexander Kanavin wrote:
>      > I don't think this is right. You might want to use -nographic,
>     but still
>      > keep an emulated graphical device inside the guest for testing the
>      > userspace applications without seeing their output. It's better
>     to set
>      > -vga none via a dedicated runqemu option.
> 
>     using -display none is better way to control this kind of behaviour
>     where you still want graphic card to be emulated but not display the
>     output. perhaps such an option would be better suited and nographic
>     runqemu option can be used for qemu being a simple cmdline app.
> 
>      >
>      > Alex
>      >
>      > On Sat, 20 Feb 2021 at 20:09, Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>
>      > <mailto:raj.khem@gmail.com <mailto:raj.khem@gmail.com>>> wrote:
>      >
>      >     When using nographic, explicitly disable vga since some qemu
>     firmware (
>      >     OpenFirmware ) defaults to std vga, and when vga is enabled
>     then it
>      >     disables output to serial and redirects that to vga which is
>     by design,
>      >     hwoever we expect the console output to go to serial when using
>      >     nographic, therefore its important to disable vga with nographic
>      >     especially on qemu based ppc platforms
>      >
>      >     Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com> <mailto:raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>>
>      >     ---
>      >       scripts/runqemu | 2 +-
>      >       1 file changed, 1 insertion(+), 1 deletion(-)
>      >
>      >     diff --git a/scripts/runqemu b/scripts/runqemu
>      >     index dd92a64553..2e31338d8e 100755
>      >     --- a/scripts/runqemu
>      >     +++ b/scripts/runqemu
>      >     @@ -462,7 +462,7 @@ class BaseConfig(object):
>      >                           raise RunQemuError('Option nographic
>     makes no
>      >     sense alongside the sdl option.' % (arg))
>      >                       if ('gtk' in sys.argv):
>      >                           raise RunQemuError('Option nographic
>     makes no
>      >     sense alongside the gtk option.' % (arg))
>      >     -                self.qemu_opt_script += ' -nographic'
>      >     +                self.qemu_opt_script += ' -nographic -vga none'
>      >                       self.kernel_cmdline_script += ' console=ttyS0'
>      >                   elif arg == 'sdl':
>      >                       if 'gl' in sys.argv[1:]:
>      >     --
>      >     2.30.1
>      >
>      >
>      >     
>      >
> 
