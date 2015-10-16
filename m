Return-Path: <psidhu@gateworks.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3893C7717F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:52:06 +0000 (UTC)
Received: by wijq8 with SMTP id q8so17388998wij.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+F8r3w3xDHVigzeheREEjaw50Tg+zL4Tgm++pW13vwE=;
	b=kOQDVsppn1Xs3xbf9ebHHAZmk7Zq3D0M390IEM+0Bd3CFnDXrHa64aEfJ1ZRFrHq1h
	OhqaW69tTSgSjnvuxDMq/cwTVYh96xrGbP7SSlTBtkS6vlX3YhPknXOOdOuYyZ6kB8mg
	Y1RRnKk4mmm02uStugQTdHtOAJ+6jyDueVjGzsHksJ1/SnZm/WBzro5ovhi3tAn9xTmT
	ugYegH8PEi++iKxEfiQywyQ8JhBzk0AeTOc/iA/3wr8bqe5JnoGrvazV1CmUWB05NsU3
	eKk5mEQLxQzODI7Cd1BHDLL3J69YOee6CB5YP6sh7k34MANAL+kREKJS+vXPlpC2K4/A
	3Ayg==
X-Gm-Message-State: ALoCoQkaPe3oTNPTK/6A1NWV6SAhQnT9YemVsXL/evSDp+JXdFwJBM6IuWolgwc8ferWQOF1dFc7
X-Received: by 10.194.216.100 with SMTP id op4mr17777647wjc.60.1445010725643; 
	Fri, 16 Oct 2015 08:52:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.112.167 with HTTP; Fri, 16 Oct 2015 08:51:36 -0700 (PDT)
In-Reply-To: <CAD1M062g+pg7ar1wkTmsGOijvPYCBJsYgETRuXFzcpSijPrcVQ@mail.gmail.com>
References: <1444957041-5419-1-git-send-email-psidhu@gateworks.com>
	<CABcZAN=9huQJ2oT=1uK+2F3ME=+KBEHOkWv1qdhrYPHyf_P_Ww@mail.gmail.com>
	<CAD1M062g+pg7ar1wkTmsGOijvPYCBJsYgETRuXFzcpSijPrcVQ@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Fri, 16 Oct 2015 08:51:36 -0700
Message-ID: <CAD1M061JExb-cdHPgnSRSracKG6+AeJu8Y-1fdR4zEhw-+8ktg@mail.gmail.com>
To: Christopher Larson <chris_larson@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iw: fix build path
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
X-List-Received-Date: Fri, 16 Oct 2015 15:52:08 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 16, 2015 at 8:34 AM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
> On Thu, Oct 15, 2015 at 7:18 PM, Christopher Larson
> <chris_larson@mentor.com> wrote:
>> On Thu, Oct 15, 2015 at 5:57 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
>>>
>>> The source get's checked out into ${PN}-${PV}, not 'build'. Currently,
>>> building
>>> iw is broken because none of the source files are found.
>>
>>
>> First, this message doesn't make sense. You're implying that bitbake thinks
>> B is S, which it does not. Bitbake already knows the correct source tree
>> path. The S = you add here is redundant, ${PN}-${PV} is the default value
>> for S.
>>
>> If iw was failing to build with a separate build directory from source,
>> you'd just need to remove B. That said, it's not, as far as I can tell. I
>> build iw every day as is and it works just fine building with a separate
>> build directory from source, so I suspect you have something wrong going on
>> in your environment.
>
> I agree with you about setting S, I put it in there to be explicit
> (I've seen other package do this for clarity sake). Here are the
> errors I'm seeing (even in a clean build):
>
> DEBUG: Executing shell function do_install
> NOTE: make -j 4 -f
> /usr/src/psidhu/gw-yocto-master/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/iw/4.1-r0/iw-4.1/Makefile
> PREFIX=/usr SBINDIR=/usr/sbin MANDIR=/usr/share/man
> DESTDIR=/usr/src/psidhu/gw-yocto-master/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/iw/4.1-r0/image
> install
>  GEN  version.c
>  CC   version.o
>  CC   iw
> arm-poky-linux-gnueabi-gcc: error: iw.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: genl.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: event.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: info.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: phy.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: interface.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: ibss.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: station.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: survey.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: util.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: ocb.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: mesh.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: mpath.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: mpp.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: scan.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: reg.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: reason.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: status.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: connect.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: link.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: offch.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: ps.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: cqm.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: bitrate.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: wowlan.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: coalesce.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: roc.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: p2p.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: vendor.o: No such file or directory
> arm-poky-linux-gnueabi-gcc: error: sections.o: No such file or directory
> make: *** [iw] Error 1
> ERROR: oe_runmake failed
> ERROR: Function failed: do_install (log file is located at
> /usr/src/psidhu/gw-yocto-master/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/iw/4.1-r0/temp/log.do_install.24334)


Oh wow, I see my entire problem. My build did in fact get dirtied up
(had some legacy meta-layer my repo sync was pulling in). Anyways, I
agree, this isn't a problem at all so this entire post can be
disregarded.

- Pushpal

