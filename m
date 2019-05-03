Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6E90E6A441
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 12:54:41 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id j20so4361693lfh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=YSLvjfkRVZNzizJs/M7QgKLDPfN9Aimvseo3xfQCmvo=;
	b=oiFHwedo7s7y+h0T0wapuMI20OimN5QCpG128SGYubLD+UXV9/KnF/zIYojTQ8xNy/
	wVAbUmVh5VNT5IoN2GsE9cgdxvemHawTitdbBjbifDpBX4udFOC1PtXCky/LHTyLywPe
	Z3sFtNulYcVmig1LsIIJdV4zvR3YwvsuE9JmT6MiKpmMqQ9HlfjkeCo3uK10FPtNhMyo
	slSllFg2jKxUNGsg3PkW+QN9HxgLFvYSgMfN7u1ROutTBAiAuAUYgO8R0B2J6Rtae4/2
	ddyvdV8kBsH/bfq25DJfy/UmG+r1A5YfYCmEH0XFQInlJ3hH1DD8BhJnR6usPOQZ7gwM
	58/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YSLvjfkRVZNzizJs/M7QgKLDPfN9Aimvseo3xfQCmvo=;
	b=nP0LegBzAWHawjvPG11OzpiD0oN3eI5H2KFajFhppiuWIGXV3BqK3K1kEozENISgnz
	uCTHeG11Itt8T4t34Q9A1kaHxTcBAcp/Y0ST3m5LYxzQ2Y5Tc9kmoI4lOFUAG/zLfUlf
	EltLg03n7IlfIo0jtyJlJEBm89S14CmdKsJNHzhjvu8nGyS5ftB+iFro2Zv2z+ipxUla
	Jeybfj7fAW7HBebZHnj4zfs/N1q0XbhwS4RFPctiLMTtYZ7go1jUSSFsRhQueUdQ9Gfn
	n0mjn5SepX+3gHR8U1E48iLHfs0Ysjo7wnDHRx6CAwGjcHH/ICOOzVSkoylVfn7AbP1o
	1yXA==
X-Gm-Message-State: APjAAAXbERpOT4QrAkVum2WbFac2+MMju5cpFlts36im3JSGj6izR6uE
	+D7QmehdtPi86OZKkrYjX2u+M905arA=
X-Google-Smtp-Source: APXvYqwCaJDdD01yFos1pb6muW0B8KEwxU8+W5xuko9WKdrMj37IboS7oJnwzjWU5cHAfWunP0e/nA==
X-Received: by 2002:ac2:4205:: with SMTP id y5mr4937281lfh.15.1556888081309;
	Fri, 03 May 2019 05:54:41 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	123sm464966lfb.81.2019.05.03.05.54.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 05:54:40 -0700 (PDT)
To: Alex Kiernan <alex.kiernan@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
	<CAO5Uq5RVB77ZMRvAwneGQ5KYSyPL_m-vhSf3YuQz4oN0VYqW3w@mail.gmail.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <34d317a2-7fc4-fddd-f0c4-0d8f6b25e9df@norrbonn.se>
Date: Fri, 3 May 2019 14:54:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5RVB77ZMRvAwneGQ5KYSyPL_m-vhSf3YuQz4oN0VYqW3w@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] systemd stateless configuration
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
X-List-Received-Date: Fri, 03 May 2019 12:54:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex,

On 03/05/2019 10:37, Alex Kiernan wrote:
> On Thu, May 2, 2019 at 10:10 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>>
>>
>> This patch set is largely Jonas Bonn's to move towards a "stateless"
>> configuration:
>>
>>    These patches make some modifications to systemd with the long-term goal
>>    of being able to run OE in systemd's "stateless" configuration.
>>    "Stateless" boils down to building an image with empty /etc and /var
>>    directories so that volatile (tmpfs) filesystems can be mounted there;
>>    this requires that the system subsequently be able to populate these
>>    directories dynamically, which systemd mostly takes care of if things are
>>    done right.
>>
>>    In these patches:
>>    i)   Don't include machine-id in writable images so that systemd can run
>>         its first-boot machinery
>>    ii)  Move systemd configuration files out of /etc
>>    iii) Allow systemd to dynamically enable services and populate
>>         /etc/systemd/system via the presets mechanism
>>
>>    There's a long way to go to get to a working "stateless" configuration.
>>    Getting to a "volatile" system (just empty /var) should be easier and I'll
>>    post patches moving things in that direction shortly.
>>
>> However as a result of the systemd 242 upgrade, which includes 01d2041e41f4
>> ("meson: stop creating enablement symlinks in /etc during installation"),
>> services such as systemd-networkd are no longer enabled in images.
>>
>> This patch set fixes this problem in addition to satisfying the goal of
>> moving towards "stateless" configurations.
>>
>> The issue with respect to image testing during CI was caused by
>> systemd-time-wait-sync.service being enabled due to the lack of a default
>> preset policy:
>>
>> https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
>>
>> Changes in v6:
>> - switch configuration to simple overrides in /usr/lib/systemd/*.conf.d
>> - make systemd RRECOMMENDS rather than RDEPENDS on systemd-conf
>> - don't exit in postinst as when that executes we're actually a
>>    concatenation of all fragments
>> - validate SYSTEMD_AUTO_ENABLE is `enable` or `disable`
>> - rewrite systemctl-native in Python
>> - moved systemctl preset-all to IMAGE_PREPROCESS so it runs after ROOTFS,
>>    run for all images, not just read-only
>>
>> Changes in v5:
>> - rebased for systemd 242
>> - install default preset distribution policy of "enable nothing"
>>
>> Alex Kiernan (3):
>>    systemd-conf: simplify creation of machine-specific configuration
>>    systemctl-native: Rewrite in Python supporting preset-all and mask
>>    image: call systemctl preset-all for images
>>
>> Jonas Bonn (3):
>>    systemd: don't build firstboot by default
>>    systemd: do not create machine-id
>>    systemd: create preset files instead of installing in image
>>
>>   meta/classes/image.bbclass                    |   9 +-
>>   meta/classes/rootfs-postcommands.bbclass      |   6 +
>>   meta/classes/systemd.bbclass                  |  41 +-
>>   .../systemd/systemd-conf/journald.conf        |   3 +
>>   .../systemd/systemd-conf/logind.conf          |   2 +
>>   .../systemd/systemd-conf/system.conf          |   2 +
>>   .../systemd/systemd-conf/system.conf-qemuall  |   3 +
>>   meta/recipes-core/systemd/systemd-conf_242.bb |  61 +--
>>   .../systemd/systemd-systemctl/systemctl       | 476 ++++++++++--------
>>   .../systemd/systemd/99-default.preset         |   1 +
>>   meta/recipes-core/systemd/systemd_242.bb      |  26 +-
>>   11 files changed, 360 insertions(+), 270 deletions(-)
>>   create mode 100644 meta/recipes-core/systemd/systemd-conf/journald.conf
>>   create mode 100644 meta/recipes-core/systemd/systemd-conf/logind.conf
>>   create mode 100644 meta/recipes-core/systemd/systemd-conf/system.conf
>>   create mode 100644 meta/recipes-core/systemd/systemd-conf/system.conf-qemuall
>>   create mode 100644 meta/recipes-core/systemd/systemd/99-default.preset
>>
> 
> Sigh...
> 
> this still has issues - if you boot with `ro` on the kernel command
> line and without an initramfs, then / is read-only when systemd starts
> and it basically refuses to do anything:
> 
> [    7.222134] systemd[1]: No hostname configured.
> [    7.227266] systemd[1]: Set hostname to <localhost>.
> [    7.232622] systemd[1]: System cannot boot: Missing /etc/machine-id
> and /etc is mounted read-only.
> [    7.241750] systemd[1]: Booting up is supported only when:
> [    7.247362] systemd[1]: 1) /etc/machine-id exists and is populated.
> [    7.253752] systemd[1]: 2) /etc/machine-id exists and is empty.
> [    7.259757] systemd[1]: 3) /etc/machine-id is missing and /etc is writable.
> 
> Note this has nothing to do with read-only-rootfs, this is just a
> regular boot... that said a bunch of things that were broken now work,
> so it's progress!
> 
> I'm leaning towards having systemctl-native touch /etc/machine-id when
> it runs, unless you explicitly ask for stateless in DISTRO_FEATURES...
> patches to follow.

The paradigm that systemd follows is that /etc is _always_ writable. 
The read-only rootfs that OE produces with a read-only /etc is 
pathological from systemd's point of view (as is your 'ro' kernel 
parameter example).  The way to handle this is to:

i) mount a tmpfs over /etc
ii) move the contents of /etc to /usr/share/factory/etc at buildtime and 
have tmpfiles.d snippets that take care of populating /etc at runtime

I have a set of patches that does this, but it's all pretty fragile at 
this point in time.  It scans /etc at buildtime, moves files and links 
to factory/{var,etc}, sets up tmpfiles.d snippets for files and 
directories.  Doing this, however, somewhat requires for things that 
_can_ be set up at runtime to be so; what remains in /etc should only be 
stuff that doesn't set itself up at runtime _yet_.  For this reason, I'm 
inclined to say that you _don't_ want to leave the /etc/systemd/system 
nor /etc/machine-id files in the image.

/Jonas


> 
> --
> Alex Kiernan
> 

