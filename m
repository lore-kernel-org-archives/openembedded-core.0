Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8BA61013
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 16:05:54 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id mf11so1355947lab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2013 09:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=kq5j98EXFmK/H5vgDBvyPrixefKd5StWTITNNYsoxe8=;
	b=Y8KE9bUPh1TV9lqooehtElxnn6A/G4qnrooXvsW/MANS7zgj2VEUmKm7yIgOxbCBeb
	s1PGhVPUdgR/ufSqAe90Hk+zySeaQ0pBPY/XseLIK2HNwMCj85RE+VmDlcU8xXODuzb1
	9eG9WSIpERL+QbXiogoAcsOzRIDEU44fDz8/ZjGpgTG0zvrD44VjZkBPVMqtDGWhqGz4
	jWlNojxxl3eQbql6YlIs0B4oN6A9qK0Y1NIenFFuxHPWvbezFvR5f3UrHZA77xYykwxZ
	VosigOmDdrPK1DFbRtiHjef4c1EBFexguRRZggjAmPdurXku2v4TzahyQpaRBA+kxkDc
	NIXg==
X-Gm-Message-State: ALoCoQluQLuiEhTEmaKEcUCZlIS2TswsF4S3gyfr0Zwhwi6UUZ7qSMqG0Z7xx4lzQOlO8X3RFSbF
MIME-Version: 1.0
X-Received: by 10.152.29.201 with SMTP id m9mr1817376lah.6.1375891554664; Wed,
	07 Aug 2013 09:05:54 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Wed, 7 Aug 2013 09:05:54 -0700 (PDT)
In-Reply-To: <CAKzfze9g76FX6i5OYosKr6w+rLhwZc+JOEDYLzwWLL3HdfGSdw@mail.gmail.com>
References: <1375885075-13410-1-git-send-email-mranostay@gmail.com>
	<CAJTo0LYAgx=FdSGNMDL3u+yjuPBjmcy1U2zd+Ew5GC7225SKeQ@mail.gmail.com>
	<CAKzfze9g76FX6i5OYosKr6w+rLhwZc+JOEDYLzwWLL3HdfGSdw@mail.gmail.com>
Date: Wed, 7 Aug 2013 19:05:54 +0300
Message-ID: <CAGNsrLCSHC7P1S1PWLOBW10YQ5wgQjvMPHUkFe36PDROftjzDw@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Matt Ranostay <mranostay@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] acpica: Add ACPICA package
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
X-List-Received-Date: Wed, 07 Aug 2013 16:05:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On 7 August 2013 18:53, Matt Ranostay <mranostay@gmail.com> wrote:
>
>
> On Wed, Aug 7, 2013 at 7:34 AM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>>
>> Hi,
>>
>> On 7 August 2013 15:17, Matt Ranostay <mranostay@gmail.com> wrote:
>> > Added ACPICA package which enables viewing/editing/compiling
>> > of ACPI tables.

2 weeks ago, I've added acpica to our meta layer:
https://git.linaro.org/gitweb?p=3Dopenembedded/meta-linaro.git;a=3Dblob;f=
=3Dmeta-linaro/recipes-extra/acpica/acpica_20130626.bb;h=3D65eadac0d8cb289f=
afc3fd9093771414850b9973;hb=3Dac4d009827b1552e3422aede2c06b5a610221144

Feel free to cherry pick if you found anything useful.

>> Is this really general-purpose enough to be suitable for oe-core, or
>> would it be more suited to meta-oe or some other layer?
>>
> Probably correct to be in meta-oe or another layer since only x86 and som=
e
> ARM platforms use ACPI as of now.
>
>>
>> > +PR =3D "r0"
>>
>> Remove this line, r0 is the default.
>>
>> +LIC_FILES_CHKSUM =3D
>>
>> "file://${S}/source/include/aclocal.h;endline=3D42;md5=3D07fbd4e514c75e1=
40a19e3ab508f763d"
>>
>> ${S} is default, so in general people do file://sources/...
>>
>> > +SRC_URI =3D
>> > "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz"
>>
>> Fetching that here with wget produces:
>>
>> ERROR: The certificate of =91acpica.org=92 is not trusted.
>>
>
> Seems StartCom Ltd. isn't a trusted  CA or just not in the keystore by
> default.
>
>>
>> Someone should tell them...
>>
>> > +inherit autotools
>>
>> The recipe doesn't use autotools, so you should drop this inherit.
>>
>> > +do_install() {
>> > +    oe_runmake INSTALLFLAGS=3D"-m 555"
>> > +}
>>
>> That's just running 'make INSTALLFLAGS=3D"-m 555"'.  You'll need to tell
>> it to run the right target for install, and to pass ${D} somehow so
>> the makefile doesn't try and write to /usr directly.
>>
> Gah good catch. Will fix up and resubmit.

Cheers,
Fathi

