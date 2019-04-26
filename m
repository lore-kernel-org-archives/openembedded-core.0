Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 16B707D922
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 14:45:37 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id i68so2542551lfi.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+24/euBcwihdKCLOddz68F5wZvIR0cGVSbD5bDloMcA=;
	b=eFH1NZkBHCyfDhXN0GrS6ikaAmmV9qSUfoCCiyWb6sjU782OvuZnTRQhRrjUAjwLzJ
	q7i+1jpHM7BwMfK/Jh53HRDmBWwAWH2ic8lAQJlg5T+NwdlTWqD0Q0C9wPDHQVbgiT8/
	bcMO32/dKJ07gaCbLoolN+xRE9BKbiHiEqtie5uPRyCDCkWYd4Uhq+9ZKM6Uk0n3X2Yq
	5WvCJr00FueRToQARcaWe/DTHiVu72YTQVLSDBV6xaVDAdlQ3WXMAjR28DUD56U5FDkS
	2oOvq+kZx2kLKf6HDcnBoEX7g4x6/scQwkvXjmCjcq1dlm6JH/CU/Cc25fSqehF4oJsr
	3IKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+24/euBcwihdKCLOddz68F5wZvIR0cGVSbD5bDloMcA=;
	b=SttSxHQ486wGwCt5Yupe/jniuJpW2VTNkgnwXPcfg5wJyfMjZugNKmTTGtRhk6vT+8
	0oNkqMIEDeug+EuJhtNSY5w6EgwtsuWXjDJC5K6KNCwYR4aMh1MH3AhrhiK0pifP+7Wp
	NLkhPG1wCn45AdMCZiDw6uPvFbKTno+Rz8iRAzdEgiZlwXL8Pg3wmz8qkNilrxo2KYl7
	B5PTVcbqlYDApQb+ysr/iY2ChqLEmiTAPgKQcOfxntkkclTlA2C3NC+2zdltPMyGHBr7
	sV2WHXQKb4zp+GgGjmUJMmms6lrV93zV0tNjshIhbeZW+4+c6lQsLnkbjiIK8LJalaua
	rNkw==
X-Gm-Message-State: APjAAAVT2P+OIN612blq4hoGZK2wBjudpym+tZ15F29CFnF4yG/QZogY
	xSaYLAZd/gZnpRKerogTRRzOsXOX9o0=
X-Google-Smtp-Source: APXvYqyesqnX7ouP3EtyJFi5BQ7YctWNaDjzky0q/4ksC3XxcJlfVq18er43dLH6SpjXvnZzaeVw5Q==
X-Received: by 2002:a19:761a:: with SMTP id c26mr24473076lff.8.1556289938291; 
	Fri, 26 Apr 2019 07:45:38 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	q6sm6681947lfj.36.2019.04.26.07.45.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Apr 2019 07:45:37 -0700 (PDT)
To: Alex Kiernan <alex.kiernan@gmail.com>,
	Andrej Valek <andrej.valek@siemens.com>
References: <20190418101906.15246-1-andrej.valek@siemens.com>
	<CAO5Uq5QnNM5idDM5BafGQT7xSH5UXUdZb3KhhT2v8nQOVajXhg@mail.gmail.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <5ba501db-0e29-80b5-93f7-9ebafc10416c@norrbonn.se>
Date: Fri, 26 Apr 2019 16:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5QnNM5idDM5BafGQT7xSH5UXUdZb3KhhT2v8nQOVajXhg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: upgrade to 242
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
X-List-Received-Date: Fri, 26 Apr 2019 14:45:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex,

On 26/04/2019 16:14, Alex Kiernan wrote:
> On Thu, Apr 18, 2019 at 11:22 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>>
>> PATCH REBASED:
>> ==============
>> 0001-do-not-disable-buffer-in-writing-files.patch
>> 0002-don-t-use-glibc-specific-qsort_r.patch
>> 0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
>> 0004-add-fallback-parse_printf_format-implementation.patch
>> 0005-rules-watch-metadata-changes-in-ide-devices.patch
>> 0005-src-basic-missing.h-check-for-missing-strndupa.patch
>> 0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
>> 0009-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>> 0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
>> 0021-avoid-redefinition-of-prctl_mm_map-structure.patch
>> 0024-test-json.c-define-M_PIl.patch
>>
>> PATCH DROPPED:
>> ==============
>> 0001-meson-declare-version.h-as-dep-for-various-targets-t.patch
>> 0001-meson-declare-version.h-as-dependency-for-systemd.patch
>> 0013-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
>>
>> PATCH ADDED:
>> 0025-fs-utilh-add-missing-sys-stat-include.patch
>>
>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> ---
> 
> This change in 242 means I'm no longer getting network up after
> flashing a new image (I'm flashing the entire eMMC from an image):
> 
> * During package installation (with `ninja install`), we would create
> symlinks for systemd-networkd.service, systemd-networkd.socket,
> systemd-resolved.service, remote-cryptsetup.target, remote-fs.target,
> systemd-networkd-wait-online.service, and systemd-timesyncd.service
> in /etc, as if `systemctl enable` was called for those units, to make
> the system usable immediately after installation. Now this is not
> done anymore, and instead calling `systemctl preset-all` is
> recommended after the first installation of systemd.
> 
> I don't know if Jonas is still working on this series:
> 
> https://patchwork.openembedded.org/series/15497/

I haven't given up on it, but I had to put it aside for a bit due to 
more pressing matters.

> 
> as that looks like it has the kind of machinery we need (though I
> don't think this problem is specific to read only rootfs now) - I'm
> looking at the series in case he's not.

If you have a writable root, systemd will automatically do the 
preset-all for you; the catch is, systemd only does this if 
/etc/machine-id does not exist.  OE forces an empty /etc/machine-id onto 
all root images so this doesn't work; as such, you'll need to do the 
preset-all magic manually for ALL filesystems irregardless of whether 
they are read-only or not.

A better solution is drop the /etc/machine-id and let systemd create 
that automatically; then it will also do the automatic preset-all at 
first-boot.  The problem here is that the OE build farm detects images 
that stall at boot when /etc/machine-id isn't present; I wasn't able to 
find the cause of this but that's where you should be looking if you 
want to pursue this patch series.  Aside from that little glitch, I 
think the rest of it is fine.

And getting this working is also a big step towards making "stateless" 
systems (using the systemd terminology) work where /etc may be a tmpfs 
and gets populated at boot.

/Jonas

> 
> The quick-hack fix is to revert 01d2041e41f4 ("meson: stop creating
> enablement symlinks in /etc during installation"), but clearly that's
> not sustainable.
> 
> --
> Alex Kiernan
> 

