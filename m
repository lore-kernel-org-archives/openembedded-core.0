Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web12.6791.1590070481183029388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 07:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q3pCuXZo;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id o5so7567638iow.8
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2EpNLc3Y/kzbsMpaivpviKPPTNve7bGGdqRAqaIZAvQ=;
        b=Q3pCuXZovAZcTQ9rZjL6Bh87cmICDInJDDVHwutDFm1hpl+MMpzAJTYDLMPydn+uzQ
         Rw2qK23N3ClnkyMo7NHy1n3qp5ZiZWsEnWgiis0IgSI0fnPHFwaEMzO6+W7p0tKFWTW8
         4HDPUQaSvDRIQOKE5cjL4jwUOEWM45RRrHvl/MeTDGeYHoiHFFCToxYTtskvjX+bY9Lu
         snuV+uBwaECZG8k6f8s0aZcenNPM0xy50ZqPaT/mGFjrPyVx8tCdUPJmXxo3foUxOjKs
         oMvUJ6EEsgiLZKPiy6lEh/b45zPJJCqFNRk531sffxybfnf3kh0QD916ca0OfbBU55l+
         eYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2EpNLc3Y/kzbsMpaivpviKPPTNve7bGGdqRAqaIZAvQ=;
        b=j0j/U/zYqGL4ZXRO7l2Tv6fWJbrdFk8El6Z1FUD4F9JjruSwqnOq9F5B4qazdebrDn
         +uxtd6kmPfmCRLaQAz4saD98xdL53u7z8qxR5uGVrf/AfMJC25gq3QOEnFboqoOuWnx3
         YC2Q5bu0COG8KboZz7QvddHJFivuxOt/KM+II/jjjNLhyzsYsxdfb0SIGOWhKiPy5cbV
         MMrynKRK/Vmal5y4kjRAkaaJ6lju/KiUfxz4LoaLnoJyqJ/nzVJt5ux7yOiXP8JU2F+0
         MDa/+2d9ZagpieFieXRfS1NKFNGsu5qwQnxSPiSZY60JRWiHVhEGWoXkTCjESmCFjyDa
         LTcQ==
X-Gm-Message-State: AOAM532glV9uc0ajByta7KhnqEtzljYFr1oakB1jHivDhHW1RblX3jph
	BHh2L5wqh6QLK/bsW+3QArqhb1ydz9ocQflNchg=
X-Google-Smtp-Source: ABdhPJzwNCTioLjVbOPn8bXcaz6kh4UOzAaiYWpo0SisBao3XWm0iWdOA0oMN0bxCZCKt1U2LUJg02tD4POy2jmJgrQ=
X-Received: by 2002:a5d:8b54:: with SMTP id c20mr7766976iot.77.1590070480401;
 Thu, 21 May 2020 07:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191219221748.27079-1-alex.kiernan@gmail.com>
 <20191219221748.27079-2-alex.kiernan@gmail.com> <902865ec-101f-0e0b-e17c-03c2fa555921@intel.com>
In-Reply-To: <902865ec-101f-0e0b-e17c-03c2fa555921@intel.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Thu, 21 May 2020 15:14:29 +0100
Message-ID: <CAO5Uq5QVcdoqFBFMX8YC0XzVyFkaXFRuNitqPCznE4vzMBamEg@mail.gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 2/2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ross

On Thu, Jan 2, 2020 at 11:20 PM Ross Burton <ross.burton@intel.com> wrote:
>
> On 19/12/2019 22:17, Alex Kiernan wrote:
> > Enable rootfs_check_host_user_contaminated by default
>
> Useful check!
>
> WARNING: Paths in the rootfs are owned by the same user or group as the
> user running bitbake. See the logfile for the specific paths.
>
> /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/fonts/.uuid
>
> /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/fonts/ttf/.uuid
>
> (patch incoming)
>

Did you manage to get a patch for this out? I've had a couple of goes
at reproducing it and failed, but I suspect I'm not including the
right things. It would be good to get this check enabled early in the
release cycle, if we can?


-- 
Alex Kiernan
