Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SFAo7-0003IU-Io
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 22:58:27 +0200
Received: by dadz8 with SMTP id z8so117387dad.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2012 13:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=4r6YSoEqcVoJOwKoseP45ni4ppMnpo816tGwzFHjV5Y=;
	b=NUvRXlUn7aWqlIg8zwks3h047OvIgerJukvof3eIsEMdBbEd3X5ku53G7NEcuTnmLS
	2iuVMPw0yBRBWW+Ukr/LKaXlP1gTEsC1ok0czUjL0Fsbb1NSCm2ZzSYMCq+hOF7nBYFY
	jAONy8NHQ5xjCkNnSUhu/SSSe4pV8A5woA70hHr0h06uvYFf6nzO3CG6mKGuP05NJygo
	eF94p3JyYJnI9nGEGIjVfo+YmhGQNyGsreEMsAXJZBWm7IA1Gv73KLtMVfBzI8a+vYqg
	6P0Lpj7au9mXI8jC496AFAuRaJNQziuJu0rVFYCqE7hdlP0KRssFTe2eedN1sTLq1Lt3
	NtRA==
Received: by 10.68.221.40 with SMTP id qb8mr31280625pbc.154.1333486156895;
	Tue, 03 Apr 2012 13:49:16 -0700 (PDT)
Received: from [10.11.5.230] (50-1-53-18.dedicated.static.sonic.net.
	[50.1.53.18])
	by mx.google.com with ESMTPS id i1sm17000507pbj.70.2012.04.03.13.49.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Apr 2012 13:49:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1333337337.647.3.camel@ted>
Date: Tue, 3 Apr 2012 13:49:18 -0700
Message-Id: <949066CF-9C65-4057-9432-B4904A8B3AFD@dominion.thruhere.net>
References: <cover.1333295122.git.dexuan.cui@intel.com>
	<1333337337.647.3.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnAff2Jjv0AO7Gi90PVJ9sR/BlsLTSno+GF6LYyH1vMKJp60+5yQCxOVSebdp4nSMjtpJJc
Subject: Re: [PATCH 0/5] dexuan: more build appliance patches: [Apr 1, 2012]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 20:58:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 apr. 2012, om 20:28 heeft Richard Purdie het volgende geschreven:

> On Mon, 2012-04-02 at 00:10 +0800, Dexuan Cui wrote:
>> BTW:
>> I added a "Upstream-Status: inappropriat" into every patches to =
genext2fs.
>>=20
>> With the patches, I only spent about 10~15 minutes to create a 4.5GB
>> .rootfs.ext3 file by genext2fs.
>>=20
>>=20
>> The following changes since commit =
8691a588267472eb5a32b978a0eb9ddfd0c91733:
>>=20
>>  cross-canadian.bbclass: fix rpath for sdk executables (2012-03-31 =
18:00:59 +0100)
>>=20
>> are available in the git repository at:
>>  git://git.yoctoproject.org/poky-contrib dcui/master
>>  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Ddcui/master=

>>=20
>> Dexuan Cui (5):
>>  genext2fs: support large files and  filesystems without using large
>>    amounts of memory
>>  self-hosted-image: improve do_populate_poky_src
>>  self-hosted-image: renew the poky src's SRCREV that's installed into
>>    the target
>>  builder: uncomment the settings for BB_NUMBER_THREADS and
>>    PARALLEL_MAKE
>>  self-hosted-image: fix indentation: 8 spaces --> Tab
>=20
> I've merged these to master, thanks. Whilst I'm reluctant to do so at
> this point in the release process for such major changes, I think in
> this case it does make sense since the genext2fs changes seem to fix a
> number of problematic issues.

I'm getting:

| genext2fs: set_file_size: ftruncate: Invalid argument

Trying to see why that happens and find out how to fix it.=


