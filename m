Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4139960796
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 15:42:08 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id r9so208736paz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Zw/E9M7ui2kj5riyxyggEa6BuPg7go9qESiFIuLgm4w=;
	b=qjBx1aWkbuSI2WOyJ0TfDSpGnxSpLcWSbSjdmZgLCXNujC2Pf/+MQk3Tpyr8QfWxSY
	MAFyVNdBZBXCHXzDDPElGkaHmqzgNrF09zembZiBbpB/w43KakpBQ+H4TQNKlwEAIK5B
	vRVzeS5PUztwGFqMMb3J0w1fgiWIed869RHc5jt4/9s6NOQQAnCBLDnHHbSdCCYhtTaR
	zpoVUifMUsG3EQCk13x6gpmo6FAe/Q2aZxNjXEefS5CfUlDuqjGUpiHFkeMrz3z41Jln
	3XQzZaFBnhWVqsao1i55/OdbAUxLZh2bT02NSWttEyAj2BxbeSf67YnqbyTBC1/LRS25
	Jsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Zw/E9M7ui2kj5riyxyggEa6BuPg7go9qESiFIuLgm4w=;
	b=FtSqtaW/2gC1piuVURZLGwLNgetyG2XQ0ujJkf5fE5ZDJUUGD66igh2foItFh6eo2P
	IUpQ5hoWnJkhJYIBdebZyCj+cAAN+/Y+WHbG9/KukhGoEU/aY++E/3SHS0Ewflh+Nt5a
	GluyeXkSGiLAzWbudEgR6LNrn1rmR4FTUuWSCEmx+rQX7en9WVteA2PYtB96gIJNDwAd
	CJ0U0wYl6mVD88aWX/wF6Rjia6hiklfWB0Ff/rhh/T3Q43TF1f6qO8xSaGXezdj7CDbe
	KY/cq+LKqEkuCZWVf0RxtyNDb0TI0ZHt169teYubmAcPJQHQ8rvey55kn4RLS9w9IaHs
	cb+g==
X-Gm-Message-State: AE9vXwP0WZJVmC9YLzivtaeZ2Mi1bFh4h7UH0i1vZ0cOz40M99Xq1GOYAIjlv48hx5i9Bg==
X-Received: by 10.66.145.73 with SMTP id ss9mr49764813pab.82.1474990930133;
	Tue, 27 Sep 2016 08:42:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:840b:652c:6ab2:3074?
	([2601:202:4001:9ea0:840b:652c:6ab2:3074])
	by smtp.googlemail.com with ESMTPSA id
	f124sm5912730pfg.7.2016.09.27.08.42.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Sep 2016 08:42:09 -0700 (PDT)
To: Matt Madison <matt@madison.systems>
References: <cover.1474562101.git.akuster808@gmail.com>
	<1575caacd43.1101edc1757141.7838936618159559000@geekcentral.pub>
	<4f15c9$v5iu4p@fmsmga001.fm.intel.com>
	<bbddd440-bc6a-051b-3e9f-2630fb3a8cfc@gmail.com>
	<CAGgRHJpsYQ=yrCxGLmYy+mihVxTkpETOeqV8Oi2OCqXDJybk7A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c6f84107-1570-3874-c844-94e8eb8ef34b@gmail.com>
Date: Tue, 27 Sep 2016 08:42:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAGgRHJpsYQ=yrCxGLmYy+mihVxTkpETOeqV8Oi2OCqXDJybk7A@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 27 Sep 2016 15:42:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 09/26/2016 10:51 AM, Matt Madison wrote:
> This patch is the one that fixed this issue for me:
> 
> http://cgit.openembedded.org/openembedded-core/commit/meta/classes/useradd.bbclass?id=a68a797c7aec607a0720ec5421baf6be821803b8

That commit has been in Krogoth for a while so I don't understand the
circumstance in fixing this issue.

http://cgit.openembedded.org/openembedded-core/commit/meta/classes/useradd.bbclass?h=krogoth&id=a68a797c7aec607a0720ec5421baf6be821803b8

-armin

> 
> The problem was introduced by this change to systemd's recipe:
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-core/systemd?h=krogoth&id=901a6dbe420eb3f76503871ca3ccfe544b9b3b57
> 
> Regards,
> -Matt
> 
> On Mon, Sep 26, 2016 at 9:13 AM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 09/26/2016 08:02 AM, Joe Konno wrote:
>>> I saw this as well. Opened the following bug:
>>>   * https://bugzilla.yoctoproject.org/show_bug.cgi?id=10329
>>
>> thanks, guess I should have done it when first reported.
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/classes/useradd.bbclass?id=1e244471d08c8426466d4e6591ec75478791fe5d
>>
>> looks promising.
>>
>> - armin
>>>
>>> On Sat, 24 Sep 2016 10:48:00 -0400
>>> Ian Geiser <geiseri@geekcentral.pub> wrote:
>>>
>>>> I think the systemd change may have broken something.  It looks like it is running a useradd with no arguments other than the root. Now I see the following error in krogoth:
>>>>
>>>> from "tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/log.do_install"
>>>>
>>>> DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i586-linux', 'common']
>>>> DEBUG: Executing shell function useradd_sysroot
>>>> Running groupadd commands...
>>>> NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified -r lock]
>>>> NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified  -r systemd-journal]
>>>> NOTE: systemd: group systemd-journal already exists, not re-creating it
>>>> Running useradd commands...
>>>> NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified     --system -d / -M --shell /bin/nologin systemd-timesync]
>>>> NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified    ]
>>>> Usage: useradd [options] LOGIN
>>>>        useradd -D
>>>>        useradd -D [options]
>>>>
>>>> Options:
>>>>   -b, --base-dir BASE_DIR       base directory for the home directory of the
>>>>                                 new account
>>>>   -c, --comment COMMENT         GECOS field of the new account
>>>>   -d, --home-dir HOME_DIR       home directory of the new account
>>>>   -D, --defaults                print or change default useradd configuration
>>>>   -e, --expiredate EXPIRE_DATE  expiration date of the new account
>>>>   -f, --inactive INACTIVE       password inactivity period of the new account
>>>>   -g, --gid GROUP               name or ID of the primary group of the new
>>>>                                 account
>>>>   -G, --groups GROUPS           list of supplementary groups of the new
>>>>                                 account
>>>>   -h, --help                    display this help message and exit
>>>>   -k, --skel SKEL_DIR           use this alternative skeleton directory
>>>>   -K, --key KEY=VALUE           override /etc/login.defs defaults
>>>>   -l, --no-log-init             do not add the user to the lastlog and
>>>>                                 faillog databases
>>>>   -m, --create-home             create the user's home directory
>>>>   -M, --no-create-home          do not create the user's home directory
>>>>   -N, --no-user-group           do not create a group with the same name as
>>>>                                 the user
>>>>   -o, --non-unique              allow to create users with duplicate
>>>>                                 (non-unique) UID
>>>>   -p, --password PASSWORD       encrypted password of the new account
>>>>   -P, --clear-password PASSWORD clear password of the new account
>>>>   -r, --system                  create a system account
>>>>   -R, --root CHROOT_DIR         directory to chroot into
>>>>   -s, --shell SHELL             login shell of the new account
>>>>   -u, --uid UID                 user ID of the new account
>>>>   -U, --user-group              create a group with the same name as the user
>>>>
>>>> WARNING: /mnt/bitbake/build/detos/tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/run.useradd_sysroot.31611:1 exit 1 from 'exit 1'
>>>> ERROR: systemd: useradd command did not succeed.
>>>>
>>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

