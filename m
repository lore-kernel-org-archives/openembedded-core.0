Return-Path: <matt@madison.systems>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 675C06093B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 17:29:35 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id b71so31327228lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 10:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p+nB9z7lrmVph13bFGf5oUgnny0Opol1AB3cKTYUqek=;
	b=YzHA37IFoXVNlibg9yoqQ+xufjwyFCe+t9qTgH2qYgS+ThtjBW5BgLwrcg3NggXwog
	dFvFjYeUZAYyNUvrqPksBWpoLkhMqXroMi2mSknwFp7kU53Cgu/sbfRGk028KiVjZfkP
	mO1E0HmyqFwvhQHXYTijrXLW+EkaZVe3CTLHgIZItp/F/UkZ0Dza2OShq/0yJL4cfheG
	anBHJvnpiqQnEMkPNd3wSM9VRvhBGV5kJXN4Ymon66TpdlH6wG3FekrewcO0MGLXqAKe
	0m37r+7vnsA4Bpfqw56I5d1RAuwrbfrjagSEQeoP83EvKfcifUtqf1p1jTDjkBGESGC8
	l2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p+nB9z7lrmVph13bFGf5oUgnny0Opol1AB3cKTYUqek=;
	b=PxzeAUYBJpmFRKTG+p8WdTcqEcYdq/KrQ9iUsDJQhA4dCNkBhJ8GTTFsYzRnVMT+vx
	j7RjqEqV+gQ8lD+rtlK2JX5UGrdrykDsUcUc6v8Bn7NmYiY08SolOLk4Yx2aLcAxBeAJ
	tPkLd3+LO57wyyNIzX/tKKhXlAu5e4QOlGVRvE9cH6Dj6cIoefJvMIDGaE4s7CWQ7++o
	J4W2dkMCA34NF+xqVy0RxY5OZpNoCl6rgcgnddGbDGiAn14F1cw1buh+7ZdzXKHHwtxb
	nqDzyVrW+jXEQUlw50uHGHNHchVz+Hi2htDetLW/wc++Jyod8Yp2nZoCq1/U13G7oOHn
	Vr0w==
X-Gm-Message-State: AE9vXwOTgexXB1G6OO89AfZemPwgrjVMeehgNnsmL5bu2KLUcQfM45dommaI9HcYJE5nfXeX1m/ysMv5SAfUJA==
X-Received: by 10.25.39.15 with SMTP id n15mr11118141lfn.91.1474997376741;
	Tue, 27 Sep 2016 10:29:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.203.195 with HTTP; Tue, 27 Sep 2016 10:29:36 -0700 (PDT)
In-Reply-To: <c6f84107-1570-3874-c844-94e8eb8ef34b@gmail.com>
References: <cover.1474562101.git.akuster808@gmail.com>
	<1575caacd43.1101edc1757141.7838936618159559000@geekcentral.pub>
	<4f15c9$v5iu4p@fmsmga001.fm.intel.com>
	<bbddd440-bc6a-051b-3e9f-2630fb3a8cfc@gmail.com>
	<CAGgRHJpsYQ=yrCxGLmYy+mihVxTkpETOeqV8Oi2OCqXDJybk7A@mail.gmail.com>
	<c6f84107-1570-3874-c844-94e8eb8ef34b@gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Tue, 27 Sep 2016 10:29:36 -0700
Message-ID: <CAGgRHJp3QGOFrbxJLm6-kaxjDOq=66ROx6DojqfkuKuE3pyLEw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
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
X-List-Received-Date: Tue, 27 Sep 2016 17:29:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 27, 2016 at 8:42 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 09/26/2016 10:51 AM, Matt Madison wrote:
>> This patch is the one that fixed this issue for me:
>>
>> http://cgit.openembedded.org/openembedded-core/commit/meta/classes/useradd.bbclass?id=a68a797c7aec607a0720ec5421baf6be821803b8
>
> That commit has been in Krogoth for a while so I don't understand the
> circumstance in fixing this issue.

Sigh.  Copy-paste error on my part.  It was this one.

http://cgit.openembedded.org/openembedded-core/commit/meta/classes/useradd.bbclass?id=e8d4356c38e3c2aacd6dc49231c73bcb7d597308

and I see that that's already been pulled in to krogoth now, thanks.

-Matt

>
> http://cgit.openembedded.org/openembedded-core/commit/meta/classes/useradd.bbclass?h=krogoth&id=a68a797c7aec607a0720ec5421baf6be821803b8
>
> -armin
>
>>
>> The problem was introduced by this change to systemd's recipe:
>> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-core/systemd?h=krogoth&id=901a6dbe420eb3f76503871ca3ccfe544b9b3b57
>>
>> Regards,
>> -Matt
>>
>> On Mon, Sep 26, 2016 at 9:13 AM, akuster808 <akuster808@gmail.com> wrote:
>>>
>>>
>>> On 09/26/2016 08:02 AM, Joe Konno wrote:
>>>> I saw this as well. Opened the following bug:
>>>>   * https://bugzilla.yoctoproject.org/show_bug.cgi?id=10329
>>>
>>> thanks, guess I should have done it when first reported.
>>>
>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/classes/useradd.bbclass?id=1e244471d08c8426466d4e6591ec75478791fe5d
>>>
>>> looks promising.
>>>
>>> - armin
>>>>
>>>> On Sat, 24 Sep 2016 10:48:00 -0400
>>>> Ian Geiser <geiseri@geekcentral.pub> wrote:
>>>>
>>>>> I think the systemd change may have broken something.  It looks like it is running a useradd with no arguments other than the root. Now I see the following error in krogoth:
>>>>>
>>>>> from "tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/log.do_install"
>>>>>
>>>>> DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i586-linux', 'common']
>>>>> DEBUG: Executing shell function useradd_sysroot
>>>>> Running groupadd commands...
>>>>> NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified -r lock]
>>>>> NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified  -r systemd-journal]
>>>>> NOTE: systemd: group systemd-journal already exists, not re-creating it
>>>>> Running useradd commands...
>>>>> NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified     --system -d / -M --shell /bin/nologin systemd-timesync]
>>>>> NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified    ]
>>>>> Usage: useradd [options] LOGIN
>>>>>        useradd -D
>>>>>        useradd -D [options]
>>>>>
>>>>> Options:
>>>>>   -b, --base-dir BASE_DIR       base directory for the home directory of the
>>>>>                                 new account
>>>>>   -c, --comment COMMENT         GECOS field of the new account
>>>>>   -d, --home-dir HOME_DIR       home directory of the new account
>>>>>   -D, --defaults                print or change default useradd configuration
>>>>>   -e, --expiredate EXPIRE_DATE  expiration date of the new account
>>>>>   -f, --inactive INACTIVE       password inactivity period of the new account
>>>>>   -g, --gid GROUP               name or ID of the primary group of the new
>>>>>                                 account
>>>>>   -G, --groups GROUPS           list of supplementary groups of the new
>>>>>                                 account
>>>>>   -h, --help                    display this help message and exit
>>>>>   -k, --skel SKEL_DIR           use this alternative skeleton directory
>>>>>   -K, --key KEY=VALUE           override /etc/login.defs defaults
>>>>>   -l, --no-log-init             do not add the user to the lastlog and
>>>>>                                 faillog databases
>>>>>   -m, --create-home             create the user's home directory
>>>>>   -M, --no-create-home          do not create the user's home directory
>>>>>   -N, --no-user-group           do not create a group with the same name as
>>>>>                                 the user
>>>>>   -o, --non-unique              allow to create users with duplicate
>>>>>                                 (non-unique) UID
>>>>>   -p, --password PASSWORD       encrypted password of the new account
>>>>>   -P, --clear-password PASSWORD clear password of the new account
>>>>>   -r, --system                  create a system account
>>>>>   -R, --root CHROOT_DIR         directory to chroot into
>>>>>   -s, --shell SHELL             login shell of the new account
>>>>>   -u, --uid UID                 user ID of the new account
>>>>>   -U, --user-group              create a group with the same name as the user
>>>>>
>>>>> WARNING: /mnt/bitbake/build/detos/tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/run.useradd_sysroot.31611:1 exit 1 from 'exit 1'
>>>>> ERROR: systemd: useradd command did not succeed.
>>>>>
>>>>>
>>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

