Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 91C346060E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 16:13:15 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 6so9330670pfl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=7/DFo0ej38EsADE7QT9xPxcctqAPLaV/+KSnlJGZr1I=;
	b=yeBBwP6DAaBv/qEJ2KMUO4Pa8G3dgU3/YoRGEsDMg0DVKSWM7to1AQCBdUbs3TOIHq
	wy/W10txaa+Z/psK9/3GBT1PTG5mKQWz278cqGewQJHeQkvBU8z3YQGeaQGXgGtsehIo
	qXsWUOKdM8wzYjzSyjQoDzCLCDkxw21lj+ujUefnTjAHE31m5OI438Z/IGVuJN1DMgA6
	nZPevaHvm4TQUKg+n+1Zz7guNs8zt1StAdJUEd4AU3WBzyWmukzgzpaK0KwcKbnl2DNF
	myGlP3jbasBEuPnflHgs2d5Z2k4+edcqbVEV/0x980KXdN78kWG3cV2vXuTaG7vocf1j
	IJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=7/DFo0ej38EsADE7QT9xPxcctqAPLaV/+KSnlJGZr1I=;
	b=DwHhgJosDFRWi9LFvDi5sretod/S40VQZrQbK9Bzsl58mR5N67LYeWibmm6T05Pz0h
	ndJxp7LVu9Rbe77irhMoRvLePxUg0TMXUixWe7E8Wid78tA1wsEN+zTPAvTkgMb3p/3L
	h4av3PHZDpZyelCXnqjkAxwubV6VlhRmLY1lwXWjhgHyBhgwWLeGpfRFfDEAK23O1byu
	IuALTpVpRYTHm07HXkLKS+3UJN7TS3elANUGddm9vUDWMWHaloi7LEnyZ/konqUKDVcJ
	9uPR+qKfOsBnK0MxLid+iBBdjWnnpXkdFBu8nkybY8NGMsXICiCZHZ1ct2zmoZJLWXiS
	wZ9g==
X-Gm-Message-State: AE9vXwO3coPHdqzRK9HU+xHCwREov61OrdZ+xARKbI2rpgum3DwXBPYH9geQG6Im7ODrvg==
X-Received: by 10.98.6.5 with SMTP id 5mr39744494pfg.88.1474906396894;
	Mon, 26 Sep 2016 09:13:16 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:e4cd:f08d:c07f:4c93?
	([2601:202:4001:9ea0:e4cd:f08d:c07f:4c93])
	by smtp.googlemail.com with ESMTPSA id
	69sm32171586pfu.83.2016.09.26.09.13.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 09:13:16 -0700 (PDT)
To: Joe Konno <joe.konno@linux.intel.com>, Ian Geiser <geiseri@geekcentral.pub>
References: <cover.1474562101.git.akuster808@gmail.com>
	<1575caacd43.1101edc1757141.7838936618159559000@geekcentral.pub>
	<4f15c9$v5iu4p@fmsmga001.fm.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <bbddd440-bc6a-051b-3e9f-2630fb3a8cfc@gmail.com>
Date: Mon, 26 Sep 2016 09:13:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <4f15c9$v5iu4p@fmsmga001.fm.intel.com>
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
X-List-Received-Date: Mon, 26 Sep 2016 16:13:16 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 09/26/2016 08:02 AM, Joe Konno wrote:
> I saw this as well. Opened the following bug:
>   * https://bugzilla.yoctoproject.org/show_bug.cgi?id=10329

thanks, guess I should have done it when first reported.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/classes/useradd.bbclass?id=1e244471d08c8426466d4e6591ec75478791fe5d

looks promising.

- armin
> 
> On Sat, 24 Sep 2016 10:48:00 -0400
> Ian Geiser <geiseri@geekcentral.pub> wrote:
> 
>> I think the systemd change may have broken something.  It looks like it is running a useradd with no arguments other than the root. Now I see the following error in krogoth:
>>
>> from "tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/log.do_install"
>>
>> DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i586-linux', 'common']
>> DEBUG: Executing shell function useradd_sysroot
>> Running groupadd commands...
>> NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified -r lock]
>> NOTE: systemd: Performing groupadd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified  -r systemd-journal]
>> NOTE: systemd: group systemd-journal already exists, not re-creating it
>> Running useradd commands...
>> NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified     --system -d / -M --shell /bin/nologin systemd-timesync]
>> NOTE: systemd: Performing useradd with [--root /mnt/bitbake/build/detos/tmp-glibc/sysroots/unified    ]
>> Usage: useradd [options] LOGIN
>>        useradd -D
>>        useradd -D [options]
>>
>> Options:
>>   -b, --base-dir BASE_DIR       base directory for the home directory of the
>>                                 new account
>>   -c, --comment COMMENT         GECOS field of the new account
>>   -d, --home-dir HOME_DIR       home directory of the new account
>>   -D, --defaults                print or change default useradd configuration
>>   -e, --expiredate EXPIRE_DATE  expiration date of the new account
>>   -f, --inactive INACTIVE       password inactivity period of the new account
>>   -g, --gid GROUP               name or ID of the primary group of the new
>>                                 account
>>   -G, --groups GROUPS           list of supplementary groups of the new
>>                                 account
>>   -h, --help                    display this help message and exit
>>   -k, --skel SKEL_DIR           use this alternative skeleton directory
>>   -K, --key KEY=VALUE           override /etc/login.defs defaults
>>   -l, --no-log-init             do not add the user to the lastlog and
>>                                 faillog databases
>>   -m, --create-home             create the user's home directory
>>   -M, --no-create-home          do not create the user's home directory
>>   -N, --no-user-group           do not create a group with the same name as
>>                                 the user
>>   -o, --non-unique              allow to create users with duplicate
>>                                 (non-unique) UID
>>   -p, --password PASSWORD       encrypted password of the new account
>>   -P, --clear-password PASSWORD clear password of the new account
>>   -r, --system                  create a system account
>>   -R, --root CHROOT_DIR         directory to chroot into
>>   -s, --shell SHELL             login shell of the new account
>>   -u, --uid UID                 user ID of the new account
>>   -U, --user-group              create a group with the same name as the user
>>
>> WARNING: /mnt/bitbake/build/detos/tmp-glibc/work/i586-oe-linux/systemd/1_229+gitAUTOINC+714c62b463-r0/temp/run.useradd_sysroot.31611:1 exit 1 from 'exit 1'
>> ERROR: systemd: useradd command did not succeed.
>>
>>
> 

