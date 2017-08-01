Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8B43D783D5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 14:02:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x64so3218089wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ekc8vaYoWMyOlB2CsFTlkyMdk2uyWfgqSD9Wk9l5qws=;
	b=PBmJ2izyMHux/DEVma/w3SdkQeSAa1Kwo+Gx3MObY2UpqldRnaKVozBvObyz3b+tQK
	xAfMQkmLjV8XiWLMbxzEGTQtQAVw27Pa2k3gJdTAqkdyY0rnk3ICEEKv5C+GReKvmjb+
	vOzUNauhCNR8zybZmI2uWi9FqDRgNBLiWBCA9puh/0IGcn3aLw3xIN//8L9BElYhDCGO
	FXAzflcDahHyke4/gWVNVSSj4ARQX/LpBx9W+YJv6Zqx8ISimVJlcSQ7xiGZMkIX0Tlp
	cApK8xbFumapGKeVu00qJTXz6qKwp0JYpNta0u96wnojvdSSsLzMSyOmgppl+vMln39g
	qjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ekc8vaYoWMyOlB2CsFTlkyMdk2uyWfgqSD9Wk9l5qws=;
	b=j96mvWX7kThbplafkx98S3+3K5naRJyz9PNZ7HdaybfMsP+vmXvnP2HY2Kc0hIfPa0
	tE59VpY8vYTMaiLdnHR2uqEiGhjaGTTmOYyofpUoYPvoFkT2r4fGpa7IBuWcJ8eMG6yU
	/qbZZDddBMGV5VDVniidzQKJ/SItw7In5/TcKY8jvdVr17XlPpnJVLoq0o/5Q5tsaOvS
	bAQrweWtw/L3oFIEIgazRccYVshXXMGdN+FKdPHRbBJb1s9hwhm1I4CPMGEtlQmCnoML
	GCAQf94DF7o+mHSffslzvopLwAs/wN8galQmCzRJUO5225oQtV6XyF3n2rY863uzgeiv
	288g==
X-Gm-Message-State: AIVw113GNWyUrJV1TUXG5e2uYnWlQAtz56UJiZ47nYsUjBhPpLa9iv4m
	//15hXcad2TtTUQL595oJ9hjG17GJQ==
X-Received: by 10.80.159.227 with SMTP id c90mr11610638edf.11.1501596179654;
	Tue, 01 Aug 2017 07:02:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 1 Aug 2017 07:02:29 -0700 (PDT)
In-Reply-To: <CAJTo0LYQdCtUHo6Af_UkcBOQnuevUwcMS+445oBm=DPGwPRBmg@mail.gmail.com>
References: <20170728180734.1920-1-otavio@ossystems.com.br>
	<CAJTo0LbhyV1g4w4PG_hxMEioTTJdthaDvmgQhU-r2V-w3RHLeA@mail.gmail.com>
	<CAP9ODKqb2hLkkLpbnTSRnGHPRcczZqn_g=Uythiey8Tz+Y_Gcw@mail.gmail.com>
	<adac39d9-b395-9f8d-5af0-8882e2136140@gmail.com>
	<CAP9ODKrs_qij8v+q9ViZtW_rT0c9W02YcqQ+gAV1Y8DmWaz4sg@mail.gmail.com>
	<CAJTo0LYQdCtUHo6Af_UkcBOQnuevUwcMS+445oBm=DPGwPRBmg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Aug 2017 07:02:29 -0700
Message-ID: <CAMKF1sqMqK1YR_aL-O3Vv4-Bw07HCWnbXMnMOwsAOGP_991j+A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-dep: Add 0.2.0 release
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
X-List-Received-Date: Tue, 01 Aug 2017 14:03:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 1, 2017 at 6:50 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Verifying this here.
>
> Building for qemuarm puts the binary in /usr/bin/dep.  Building for
> intel-corei7-64 puts the binary in /usr/lib/x86_64-poky-linux/go/bin/dep.
>

may be configure logs can tell why is it making this distinction.
Since we are not building
for multiarch, using /usr/bin/dep might be ok

> Ross
>
> On 31 July 2017 at 20:52, Otavio Salvador <otavio.salvador@ossystems.com.br>
> wrote:
>>
>> On Mon, Jul 31, 2017 at 4:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> >
>> > On 7/31/17 12:12 PM, Otavio Salvador wrote:
>> >> Hello Ross,
>> >> Hello Khem,
>> >>
>> >> On Sat, Jul 29, 2017 at 3:28 PM, Burton, Ross <ross.burton@intel.com>
>> >> wrote:
>> >>> Failed in the no-x11 builder at least so far:
>> >>>
>> >>> ERROR: go-dep-0.2.0-r0 do_package: QA Issue: go-dep: Files/directories
>> >>> were
>> >>> installed but not shipped in any package:
>> >>>   /usr/lib/x86_64-poky-linux/go/bin/dep
>> >>> Please set FILES such that these items are packaged. Alternatively if
>> >>> they
>> >>> are unneeded, avoid installing them or delete them within do_install.
>> >>>
>> >>>
>> >>> https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/builds/537
>> >>
>> >> I did reproduce this; I could only reproduce it if I built it with a
>> >> machine which matches the architecture of host, in my case x86-64.
>> >> When building for other arch (e.g: ARM) it works as expected.
>> >>
>> >> The problem seems to be a generic problem and I am not experienced
>> >> enough on the Golang toolchain to look at this. Khem could you take a
>> >> look and see if you find the root cause?
>> >
>> > Delete this file, its building it on x86_64 because it can. We only need
>> > cross version.
>>
>> I am not sure I follow you here.
>>
>> Using qemux86-64 as target it does NOT install on ${bindir} and
>> surprisingly the installation path does also not match GOBIN_FINAL
>> value.
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>
>

