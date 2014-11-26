Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id EC53E72332
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 22:28:14 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so3582901pdi.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 14:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=pqcBkuqRch4pQt6f15OEop03c8UaMFhswbHqpArvELs=;
	b=gVrDyWhY5SNRin5g0mEOJN1QP+hR7agrR65/xW998gIunAyDFgrdW+xel3Xlm79yxN
	AUIDg2mn0K5hYdjrTpoyFwBf7Y0cJZV6lDU8cEI5aaRBexHMrdj0dWsOBYyJiQAt2lpb
	EssE4tVI30MVX4MPBtawdMWs4uiBclhK7ykh751gMg4T4OGlXxjRT5tK6CgwGsFqFGTH
	rMCXp6WrvkqUXbdWAf8xWVqIua7IsmIkQFJdIdcDuOs5UIQdPAr/FH481srEU45PVKkI
	OvzzjdSHXY1DPxIXpYJogYvI6sgGBq2DpGk20R1mii9nYXQaqWGUd5+49hkvNnltMMiq
	V4eg==
X-Received: by 10.66.236.163 with SMTP id uv3mr57873485pac.136.1417040895195; 
	Wed, 26 Nov 2014 14:28:15 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:11a:ce80:cb9f:dbea?
	([2601:c:9380:601:11a:ce80:cb9f:dbea])
	by mx.google.com with ESMTPSA id ez1sm5200290pdb.86.2014.11.26.14.28.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Nov 2014 14:28:14 -0800 (PST)
Message-ID: <547653FB.7030904@gmail.com>
Date: Wed, 26 Nov 2014 14:28:11 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@linux.intel.com>
References: <cover.1417018567.git.akuster808@gmail.com>
	<1417021302.11024.5.camel@picadillo>
In-Reply-To: <1417021302.11024.5.camel@picadillo>
Cc: Javier Viguera <javier.viguera@digi.com>,
	Andrei Gherzan <andrei.gherzan@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/11] Dizzy next #2
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
X-List-Received-Date: Wed, 26 Nov 2014 22:28:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/26/2014 09:01 AM, Tom Zanussi wrote:
> Hi,
>
> Looks fine to me, but it's still missing this (or were you planning on
> adding it to your next round?):

yeah.

thanks for the reminder.

- Armin
>
>    commit 4c222d3a67bae265ff42b448ef4a643b0131e578
>    Author: He Zhe <zhe.he@windriver.com>
>    Date:   Tue Oct 21 17:47:44 2014 +0800
>
>        kernel.bbclass: Create modules directory even if there is no modules
> install
>
> Which fixes a problem introduced by:
>
>    commit 3224472c68865714716305dfbc8efaa59f73958e
>    Author: Nitin A Kamble <nitin.a.kamble@intel.com>
>    Date:   Tue Sep 30 14:40:05 2014 -0700
>
>        kernel.bbclass: enable a link for external module building
>
> Which I'm now also seeing cause problems with the kernel labs.
>
> Thanks,
>
> Tom
>
> On Wed, 2014-11-26 at 08:22 -0800, Armin Kuster wrote:
>> Please consider these changes for the next Dizzy.
>>
>> The following changes since commit 85b8abe50482deaa1af62f265e82f53a54bbcd77:
>>
>>    nss: define MP_USE_UINT_DIGIT when compile mpi_x86.s (2014-11-24 16:38:18 -0800)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>>    http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next
>>
>> Andrei Gherzan (1):
>>    xkeyboard-config: Inherit gettext
>>
>> Aníbal Limón (1):
>>    package_manager: DpkgPM fix populate_sdk
>>
>> Javier Viguera (1):
>>    shadow-securetty: add ttyAM[0-3] serial ports
>>
>> Robert Yang (1):
>>    qemu: disable the build for mips
>>
>> Saul Wold (1):
>>    babeltrace: Backport fix for unaligned integer
>>
>> Tom Zanussi (5):
>>    wic: Don't allow mkfs to fail silently in partition command
>>    wic: Update the help text to include -D (--debug)
>>    Revert "wic: set bootimg_dir when using image-name artifacts"
>>    wic: Remove special-case bootimg_dir
>>    wic: Update bootimg-partition to use bootimg_dir
>>
>> Wenzong Fan (1):
>>    python: Fix CVE-2014-7185
>>
>>   meta/lib/oe/package_manager.py                     |   2 +-
>>   .../python/python/python-2.7.3-CVE-2014-7185.patch |  75 ++++++
>>   meta/recipes-devtools/python/python_2.7.3.bb       |   1 +
>>   meta/recipes-devtools/qemu/qemu_2.1.0.bb           |   1 +
>>   meta/recipes-devtools/qemu/qemu_git.bb             |   1 +
>>   meta/recipes-extended/shadow/files/securetty       |   4 +
>>   .../xorg-lib/xkeyboard-config_2.12.bb              |   2 +-
>>   ...n-t-perform-unaligned-integer-read-writes.patch | 252 +++++++++++++++++++++
>>   meta/recipes-kernel/lttng/babeltrace_1.2.1.bb      |   1 +
>>   scripts/lib/image/engine.py                        |  42 +---
>>   scripts/lib/image/help.py                          |  23 +-
>>   scripts/lib/wic/imager/direct.py                   |   5 +-
>>   .../lib/wic/kickstart/custom_commands/partition.py |  22 +-
>>   scripts/lib/wic/plugins/imager/direct_plugin.py    |  20 +-
>>   scripts/lib/wic/plugins/source/bootimg-efi.py      |   5 +-
>>   .../lib/wic/plugins/source/bootimg-partition.py    |   9 +-
>>   scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   3 +-
>>   scripts/wic                                        |  13 +-
>>   18 files changed, 402 insertions(+), 79 deletions(-)
>>   create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch
>>   create mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-don-t-perform-unaligned-integer-read-writes.patch
>>
>> --
>> 1.9.1
>>
>
>

