Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 52A4060079
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 04:02:22 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id my20so8165190pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 21:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=OhXNcXMXaEEcHWbbY341o5+X9dh8twBTib2DL9inN4U=;
	b=SwaVrQ7GY8rni6tCAcwsKbGD3xXK01W9NMMgpOFu40SuuJzM71j0kg7WEU/GgmsXym
	5yNvzZN3q4HDS+951MxXKGCzKMDg6kBVrEtKqBIujfDYGA3RQT1jtgkhF57ZhdlqyXta
	jSFtzFt/qWVfBwJGP4ZZx48GtJZv2YiwghhAJt7I6jXXj5gPSqzjQsk4gzYMPTIcMqZz
	qcv2+bz/APZgLd0wB1IqYeHsIVpilf20tBrwHtjoBkqtcjN+fB/8O6ILIpYmHljMn+h4
	UsBhvs5yPgexRjDUQRcZagkI/1XDEpcp7us1RmSO1xqKT4eCIbtO3XiaO5lYFiuu0EmL
	5wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=OhXNcXMXaEEcHWbbY341o5+X9dh8twBTib2DL9inN4U=;
	b=QtsVnUeMYswz/7pupU1/7SmEye1vvxw9RC7PgYvINbXJg7kTH9otF4Q0I/rmkQEAv3
	Q40r69MVn+RURRPF6EhUrVHKzd1jTDSaxWFcVVM9gbaZ8U6NCLXLUWu4Q1XPwH4435Eh
	+69YbB8mpRtoRCZ5DwYp7IbNiXGRzkw6wmd8KwBIkrkJFvdfmXm1L5XprypWIZjjIL8X
	7XWD7dudaz+lJogRWZyBD7D3swQpIq5gEUc9cRKXU8x5AMzV6+hmv23netiWv+dP1wvj
	StmExIVshYdSWSP36RywzRcenPoWBhkvtsQkISVWXo5vgQBcP02uLNlABvMSUu/nR+I3
	hpTQ==
X-Gm-Message-State: AE9vXwMY1s34MmyB4d3h+44dPqHW0T+oa2osOkVq1c6hu/D9kHc6ZwKPPRjtPyFMLjQBOQ==
X-Received: by 10.66.232.164 with SMTP id tp4mr34899540pac.29.1474862543595;
	Sun, 25 Sep 2016 21:02:23 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:3531:5371:1e7a:4d8c?
	([2601:202:4001:9ea0:3531:5371:1e7a:4d8c])
	by smtp.googlemail.com with ESMTPSA id
	x8sm26504096pfi.93.2016.09.25.21.02.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Sep 2016 21:02:23 -0700 (PDT)
To: Ian Geiser <geiseri@geekcentral.pub>
References: <cover.1474562101.git.akuster808@gmail.com>
	<1575caacd43.1101edc1757141.7838936618159559000@geekcentral.pub>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f6a55f12-f817-1833-4e5b-f04193b439de@gmail.com>
Date: Sun, 25 Sep 2016 21:02:21 -0700
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
X-List-Received-Date: Mon, 26 Sep 2016 04:02:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 09/24/2016 07:48 AM, Ian Geiser wrote:
> I think the systemd change may have broken something.  It looks like it is running a useradd with no arguments other than the root. Now I see the following error in krogoth:
> 

I appears to be caused by
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=krogoth&id=66a4366e8fb4077a375e71c2169f3307254a36aa.

Master did not show this issue.

- armin

> from "tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/log.do_install"
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
>        useradd -D
>        useradd -D [options]
> 
> Options:
>   -b, --base-dir BASE_DIR       base directory for the home directory of the
>                                 new account
>   -c, --comment COMMENT         GECOS field of the new account
>   -d, --home-dir HOME_DIR       home directory of the new account
>   -D, --defaults                print or change default useradd configuration
>   -e, --expiredate EXPIRE_DATE  expiration date of the new account
>   -f, --inactive INACTIVE       password inactivity period of the new account
>   -g, --gid GROUP               name or ID of the primary group of the new
>                                 account
>   -G, --groups GROUPS           list of supplementary groups of the new
>                                 account
>   -h, --help                    display this help message and exit
>   -k, --skel SKEL_DIR           use this alternative skeleton directory
>   -K, --key KEY=VALUE           override /etc/login.defs defaults
>   -l, --no-log-init             do not add the user to the lastlog and
>                                 faillog databases
>   -m, --create-home             create the user's home directory
>   -M, --no-create-home          do not create the user's home directory
>   -N, --no-user-group           do not create a group with the same name as
>                                 the user
>   -o, --non-unique              allow to create users with duplicate
>                                 (non-unique) UID
>   -p, --password PASSWORD       encrypted password of the new account
>   -P, --clear-password PASSWORD clear password of the new account
>   -r, --system                  create a system account
>   -R, --root CHROOT_DIR         directory to chroot into
>   -s, --shell SHELL             login shell of the new account
>   -u, --uid UID                 user ID of the new account
>   -U, --user-group              create a group with the same name as the user
> 
> WARNING: /mnt/bitbake/build/detos/tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/run.useradd_sysroot.31611:1 exit 1 from 'exit 1'
> ERROR: systemd: useradd command did not succeed.
> 
> 

