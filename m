Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED82260684
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 15:07:40 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id oz2so7518736pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 08:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=BuOsZa1XDc7BEY9N+jN4EgX++xUKj4xjCiXdcz4n07g=;
	b=YWc/BjXfc8ELRqGeuLUhXY4Hr8KL1Yz4SMJCprsRi6OG/fBj2s2aZg3Qnj/SWT4P+I
	cnJHrZFgo8FiZn6mScpeZxZKuCIF9I2ig5sdxMfY988E+iUtlj7z5BD41OwUKD2+AYTD
	eNRDpl30OI9E01mubCyVSl2jL85EJTjK3QseqwTrCPpo70INN/FnSYtB5ndk13kGEs6W
	PmXcxy2Krdz4BRVi43cqaNgsi1p8p+Y4InSnqI3vLuJdj9GOvmlv4tY2K4IprtOUEFiP
	BYyI9cXIL6XzWa5qbyVotqkUTBKZys02LTd9OpLgp1Ed5LlUghu/NzbfbPANqIfOCG0e
	awQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=BuOsZa1XDc7BEY9N+jN4EgX++xUKj4xjCiXdcz4n07g=;
	b=OkkysXbHzwbBf0C3WZWcdnDUdiUOkj8uDPVRwGY3lyFx4eHhVd3nQ0mGDDrIpMbsIH
	F4CWpGKkaSk/qSfsBOK2hU7PLN04r/U689h+tGk7Wim0BH3XSSNQfEb4KG6UQ5SvEkU7
	k0Tpy4tz75MF6CAeNdLbo9Aq9VHwRZgsQFKMA4bmV3aV3x00yf8Jn0u7QbCieWMZghwA
	kJXhl+lRfM0coCwbenX2jp/DCjQmXRG3dXDEqmlOu285uohtyIkxMcssobQ3X1ZQgux9
	KOjrT3aMjqzcPkgOVuBBZ1F9kq6vyodLfqX7h3wo0sp+DWo406TLZVUB93CpeKgEbgP3
	9zlw==
X-Gm-Message-State: AE9vXwNiU67g2SNuH5OYXlK+cWQoXC3E/dWBjtuc8fSgQWxtLS47/f6+vdGJ7j0kv+olZA==
X-Received: by 10.66.12.234 with SMTP id b10mr30286629pac.91.1474816062064;
	Sun, 25 Sep 2016 08:07:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:c88d:7203:3d56:a160?
	([2601:202:4001:9ea0:c88d:7203:3d56:a160])
	by smtp.gmail.com with ESMTPSA id
	tn5sm24607373pac.6.2016.09.25.08.07.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Sep 2016 08:07:41 -0700 (PDT)
To: Ian Geiser <geiseri@geekcentral.pub>
References: <cover.1474562101.git.akuster808@gmail.com>
	<1575caacd43.1101edc1757141.7838936618159559000@geekcentral.pub>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ac2c1ee5-d4b2-87cb-afa9-f50c1dd4ef08@gmail.com>
Date: Sun, 25 Sep 2016 08:07:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1575caacd43.1101edc1757141.7838936618159559000@geekcentral.pub>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/60] krogoth-next staged
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
X-List-Received-Date: Sun, 25 Sep 2016 15:07:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ian,


On 09/24/2016 07:48 AM, Ian Geiser wrote:
> I think the systemd change may have broken something.  It looks like it is running a useradd with no arguments other than the root. Now I see the following error in krogoth:
>
> from "tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/log.do_install"
I have been able to reproduce this. I am going to check master to see if 
the same issue exists there.

thanks for reporting this.

- armin

>
> DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i586-linux', 'common']
> DEBUG: Executing shell function useradd_sysroot
> Running groupadd commands...
> NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified -r lock]
> NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified  -r systemd-journal]
> NOTE: systemd: group systemd-journal already exists, not re-creating it
> Running useradd commands...
> NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified     --system -d / -M --shell /bin/nologin systemd-timesync]
> NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified    ]
> Usage: useradd [options] LOGIN
>         useradd -D
>         useradd -D [options]
>
> Options:
>    -b, --base-dir BASE_DIR       base directory for the home directory of the
>                                  new account
>    -c, --comment COMMENT         GECOS field of the new account
>    -d, --home-dir HOME_DIR       home directory of the new account
>    -D, --defaults                print or change default useradd configuration
>    -e, --expiredate EXPIRE_DATE  expiration date of the new account
>    -f, --inactive INACTIVE       password inactivity period of the new account
>    -g, --gid GROUP               name or ID of the primary group of the new
>                                  account
>    -G, --groups GROUPS           list of supplementary groups of the new
>                                  account
>    -h, --help                    display this help message and exit
>    -k, --skel SKEL_DIR           use this alternative skeleton directory
>    -K, --key KEY=VALUE           override /etc/login.defs defaults
>    -l, --no-log-init             do not add the user to the lastlog and
>                                  faillog databases
>    -m, --create-home             create the user's home directory
>    -M, --no-create-home          do not create the user's home directory
>    -N, --no-user-group           do not create a group with the same name as
>                                  the user
>    -o, --non-unique              allow to create users with duplicate
>                                  (non-unique) UID
>    -p, --password PASSWORD       encrypted password of the new account
>    -P, --clear-password PASSWORD clear password of the new account
>    -r, --system                  create a system account
>    -R, --root CHROOT_DIR         directory to chroot into
>    -s, --shell SHELL             login shell of the new account
>    -u, --uid UID                 user ID of the new account
>    -U, --user-group              create a group with the same name as the user
>
> WARNING: /mnt/bitbake/build/detos/tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/run.useradd_sysroot.31611:1 exit 1 from 'exit 1'
> ERROR: systemd: useradd command did not succeed.
>
>


