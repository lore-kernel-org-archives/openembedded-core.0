Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4F44E77FC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:50:35 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id b205so17847023itg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=l2HN7QWSHIt7t5cp5KVkArIyrRUtxgaiTKeTnhZkyLE=;
	b=xWVl78OO4lj9g5y/4ork/rUwKfGnf9HKs5T6l50EamhkgssUNV7453Pq62X2CJSMdW
	QsrH3Itazags+bYrnDgfNjhbvgOXCEMY13UEfe/dPjr2v294OrhsR7j2xpjJ0hVzSnl6
	4rItw1CiZ4J1zD+BSNvKRpuqpWO1QGuUpeJSJn6tPayvmZCEtdTiSjmR2m3IIguHEW3O
	tcB51p51dgAznvZM3zA+VgwVQEGTTuGSHMJIozGNE3DYWYhC+bF2utXcBJMMNiDcMe82
	dPnHu/RW4Leu7IfMHLAgZaOJhNZRRV64y6cvDszvnvhR1NJpK3Wt3Ljtvy2ab0bU1TcM
	ViAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=l2HN7QWSHIt7t5cp5KVkArIyrRUtxgaiTKeTnhZkyLE=;
	b=owZwFvkOScie8vufBZUSbs7ZZRUP/Mfow8jyslx5/dJmMJSTZzLhJo3mYDeVEtSadX
	5c9fIuS+kEz2AzEDEZPU4au8tQRgeEO3UMx5uwE/hqav1zaAAb1/CFPW0pIxTt01nky9
	AfjWb60d6J2LollfnWVErq6hwRigE22hH78QKyuGtxpb9vSJdLtIg9tcCY3s+npOO1G8
	ZCoZWdezNJDSQ4k7F0Squa9abNrcCq/giGWzMgK93voTRPBrtG2G0fdd3iATLnmG5qSt
	x/RPdgYCXvHsNmPDfwHG/UOKMlYpk42tBSiktJys7reclphII4Fq2Hw90nYXk4uTNsKo
	9tbg==
X-Gm-Message-State: AKS2vOyuPBk1/BegYa7ovr7ERrG3VetZDp7Dz7tkDdqsbcN92CwePpvA
	OiNfppmGZ861BufM
X-Received: by 10.36.253.138 with SMTP id m132mr3245462ith.100.1498578637192; 
	Tue, 27 Jun 2017 08:50:37 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB9F.dip0.t-ipconnect.de. [93.232.251.159])
	by smtp.gmail.com with ESMTPSA id w80sm1528972ita.4.2017.06.27.08.50.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 08:50:35 -0700 (PDT)
Message-ID: <1498578633.7464.49.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Jun 2017 17:50:33 +0200
In-Reply-To: <CANwerB2qV6jEgUjzx6SGuWEYXFzPNo56PmmTJqHk5KnjA+O-AQ@mail.gmail.com>
References: <20170601121552.27868-1-net147@gmail.com>
	<1498554326.7464.33.camel@intel.com>
	<1498558903.7464.37.camel@intel.com>
	<CANwerB3jfo=r=xcHdn8+yU1=r9JmK0_3MCnQWdf8uDh=Tn1AGA@mail.gmail.com>
	<1498559907.7464.42.camel@intel.com>
	<CANwerB2qV6jEgUjzx6SGuWEYXFzPNo56PmmTJqHk5KnjA+O-AQ@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Tue, 27 Jun 2017 15:50:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-27 at 21:11 +1000, Jonathan Liu wrote:
> Hi Patrick,
> 
> On 27 June 2017 at 20:38, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > On Tue, 2017-06-27 at 20:24 +1000, Jonathan Liu wrote:
> >> Hi Patrick,
> >>
> >> The original problem was that bitbake would print out the error:
> >> "libsdl-native is set to be ASSUME_PROVIDED but sdl-config can't be
> >> found in PATH. Please either install it, or configure qemu not to
> >> require sdl.", if "libsdl-native" was in ASSUME_PROVIDED even if the
> >> host has sdl-config in its PATH.
> >>
> >> This occurred really early for a clean build and bitbake would bail
> >> out. The sanity check is in meta/classes/sanity.bbclass.
> >
> > I've not hit that problem, probably because the sanity check was not run
> > again when I changed ASSUME_PROVIDED. I can reproduce it in a clean
> > build directory without conf/sanity_info.
> >
> > I think extending HOSTTOOLS merely to satisfy sanity.bbclass is the
> > wrong solution to the problem. It makes sdl-config available to all
> > recipes, which is unnecessary and potentially introduces back host
> > contamination.
> >
> > It is unnecessary because the qemu recipe has special code that enables
> > the use of the host SDL when told to do so via ASSUME_PROVIDED.
> >
> > Can you come up with a better solution, probably by patching
> > sanity.bbclass?
> 
> I can't think of any at this stage.

Here's what qemu.inc does:

do_configure_prepend_class-native() {
        # Append build host pkg-config paths for native target since the host may provide sdl
        BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
        if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
                export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
        fi

insanity.bbclass could use the host pkg-config to ensure that sdl.pc is
installed.

> Feel free to post a patch if you come up with something better.

Sorry, I don't have time for that. I've filed
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11725 so that we don't
forget about it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




