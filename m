Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 97524783BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 10:45:01 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id v127so6059970itd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 03:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YFvl2+ynXw/6UOpW/6s4mzR6GKQVfX0sZ8F8coF+vrM=;
	b=RpknatNOQ1BcZDfWDd4CDhm4LJhGzwM0mD+lGAsFtbUEpnG4Kd7vXYQbniYw0pBb6S
	VSFMtqjREMKLsJPtld2L4Vq53HXk5CAOre5Do7CgJikGEhORu+cbxnOaS6crFMmDYyBL
	kMG44l3qHqeKN9wMy5UNKAasVZo/eRphcmZsBDFOmoEowTDKJPr1U9wezmDW1B/JEeI6
	blPhfgWBzCUTQTkZQvLcMChVLIQJW9ciXeFh7SLTqzZmV35O3DwPISuopmTe9oeP3wTE
	68YZv6mtByFvg91NOrOImzOmenX9m0YgClws4M+mQk5DdMniT7UPZALhVnfjPOJMfTKd
	nfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YFvl2+ynXw/6UOpW/6s4mzR6GKQVfX0sZ8F8coF+vrM=;
	b=m5VMEJSD4h1myeMknrbUhIk0HlQG/wtqyaD88C04MvY4ZY/M5jpPSb4gZiHL+91dy6
	c4xbUCqUXSZgxzsPk7o5xaPw0JVcRglJ+gOZVx4WXXGofVZ4WFx26FTbyfb5XWzjoKKO
	kG3zvF6YlG5d1nHNogxvgFImsn0IA8HokRrd9bcuWToBZRhtOwVaqP0LojyTGq6GYLNY
	MA7QmJrOHCAi7MP/nhJx9vz8pR7pRgQj3QJsnE7OcWHVExWQzAp8utsKGS0TAfewU7yf
	Dqqv7cbVcRKAFyCG/5pSxiFFIlWUOpFxHG+VI5RUoyVyOBXukRIPg4OzlnemDvCSV23c
	lvzw==
X-Gm-Message-State: AIVw113u6dzttSS+FnRipG9G8hjSuKxso/ffphl8jQF4OMIBho26uK67
	ddwHrMCsaAnesqAxH54r4fefXX/iJcZN
X-Received: by 10.36.26.13 with SMTP id 13mr1177086iti.87.1501584302690; Tue,
	01 Aug 2017 03:45:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 1 Aug 2017 03:44:42 -0700 (PDT)
In-Reply-To: <20170801002347.23800-1-raj.khem@gmail.com>
References: <20170801002347.23800-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Aug 2017 11:44:42 +0100
Message-ID: <CAJTo0LbrPuF8c+BnhCjaVU=uyyjqZnPp7o48dgUx1B+rWR8TCA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] mesa, llvm: Use native version of llvm-config
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
X-List-Received-Date: Tue, 01 Aug 2017 10:45:01 -0000
Content-Type: multipart/alternative; boundary="001a11441b5cf66ad80555aed604"

--001a11441b5cf66ad80555aed604
Content-Type: text/plain; charset="UTF-8"

ERROR: llvm-5.0-r0 do_compile: Function failed: do_compile (log file is
located at
/data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/temp/log.do_compile.4542)
ERROR: Logfile of failure stored in:
/data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/temp/log.do_compile.4542
Log data follows:
| DEBUG: Executing shell function do_compile
| ninja: error:
'/data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/recipe-sysroot-native/usr/bin/llvm-tblgen',
needed by 'include/llvm/IR/Attributes.gen.tmp', missing and no known rule
to make it
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/temp/log.do_compile.4542)
ERROR: Task (/home/ross/Yocto/poky/meta/recipes-devtools/llvm/llvm_git.bb:do_compile)
failed with exit code '1'

Ross

--001a11441b5cf66ad80555aed604
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ERROR: llvm-5.0-r0 do_compile: Function failed: do_co=
mpile (log file is located at /data/poky-tmp/master/build/work/corei7-64-po=
ky-linux/llvm/5.0-r0/temp/log.do_compile.4542)</div><div>ERROR: Logfile of =
failure stored in: /data/poky-tmp/master/build/work/corei7-64-poky-linux/ll=
vm/5.0-r0/temp/log.do_compile.4542</div><div>Log data follows:</div><div>| =
DEBUG: Executing shell function do_compile</div><div>| ninja: error: &#39;/=
data/poky-tmp/master/build/work/corei7-64-poky-linux/llvm/5.0-r0/recipe-sys=
root-native/usr/bin/llvm-tblgen&#39;, needed by &#39;include/llvm/IR/Attrib=
utes.gen.tmp&#39;, missing and no known rule to make it</div><div>| WARNING=
: exit code 1 from a shell command.</div><div>| ERROR: Function failed: do_=
compile (log file is located at /data/poky-tmp/master/build/work/corei7-64-=
poky-linux/llvm/5.0-r0/temp/log.do_compile.4542)</div><div>ERROR: Task (/ho=
me/ross/Yocto/poky/meta/recipes-devtools/llvm/llvm_git.bb:do_compile) faile=
d with exit code &#39;1&#39;</div><div><br></div><div>Ross</div></div>

--001a11441b5cf66ad80555aed604--
