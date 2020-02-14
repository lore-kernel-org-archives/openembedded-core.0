Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8191B60ADA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 08:22:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m16so9824314wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 00:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=h/z8CAb6WQE0z48HLSz7n0sjnLVGQ5VZbHnC4o8XT04=;
	b=g8gA9902UGkjPiEAnEW8UjrGjS2Bj0xLQnFxEXUIRYFTM8p7pQ9esgpV2aQhkcHym9
	VAGs1l+0LlZdL8KrNFmsh8sB7x+zuSDosXHqSuf5cMq3RemF+6nCHGTgwmblVyVTzS3M
	UaibJe05LECjtD6y108Xe/UZyNpvmHEaaBZ+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=h/z8CAb6WQE0z48HLSz7n0sjnLVGQ5VZbHnC4o8XT04=;
	b=grRsj49zYIHwbEMuDadJCwLl5RdGw9fTXV39ndqBlG7gkONIg3NefNGbbhh8ALKCoC
	Eu5S7ECuWEwsRkINn+2BPH/Q4kEz/6hTeQnRTJxYT9kGD+wiw+Nz1nliEUID91S0Ycod
	b3wNH48bdmUh+fJnbhY90Klihs5Sm+p+U1sRjuMUdlVQNyU+uk+vPwwaKnlBm5eGgwum
	vLqYE3nIVHsKdAaMmmz3zawM7jcpzfd9424GW1iDzFCmNHNxN5He6va1xoG3A8gGc1v5
	+VZa81uGQzeupXCOz/n9GZd+hTRvCvIvp6ujz79uJ2et6v3XqffDW3XxkKkcwXflqZg2
	/Hyw==
X-Gm-Message-State: APjAAAV236ibObUAdEgiVl/1Je/a2Em2YOJJed9YuDmEzvnYdZO0dUbe
	+OqjpEeQqwhkrB0YjpEof0olFg==
X-Google-Smtp-Source: APXvYqxZe5lhRd+DThLyWSo+DAxpbuQlER9PcuEY1yWYZWVcvufoDehzTzQmBGVPLBC5z4sLsxdRTA==
X-Received: by 2002:adf:e683:: with SMTP id r3mr2823270wrm.38.1581668521786;
	Fri, 14 Feb 2020 00:22:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a9sm6593807wrn.3.2020.02.14.00.22.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 00:22:01 -0800 (PST)
Message-ID: <0b5d9d0d5b160a7bf0ac9b309bbcf2b687fef580.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 08:21:59 +0000
In-Reply-To: <1581356285-65315-2-git-send-email-wangmy@cn.fujitsu.com>
References: <1581356285-65315-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581356285-65315-2-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] xkeyboard-config: upgrade 2.28 -> 2.29
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
X-List-Received-Date: Fri, 14 Feb 2020 08:22:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-02-10 at 09:38 -0800, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../{xkeyboard-config_2.28.bb => xkeyboard-config_2.29.bb}    | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.28.bb =>
> xkeyboard-config_2.29.bb} (87%)

This caused a build failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/1558


ERROR: xkeyboard-config-2.29-r0 do_compile: oe_runmake failed
ERROR: xkeyboard-config-2.29-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/temp/run.do_compile.17426' failed with exit code 1:
Making all in compat
make[1]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/compat'
make[1]: Nothing to be done for 'all'.
make[1]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/compat'
Making all in geometry
make[1]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/geometry'
Making all in digital_vndr
make[2]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/geometry/digital_vndr'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/geometry/digital_vndr'
Making all in sgi_vndr
make[2]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/geometry/sgi_vndr'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/geometry/sgi_vndr'
make[2]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/geometry'
make[2]: Nothing to be done for 'all-am'.
make[2]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/geometry'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/geometry'
Making all in keycodes
make[1]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/keycodes'
Making all in digital_vndr
make[2]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/keycodes/digital_vndr'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/keycodes/digital_vndr'
Making all in sgi_vndr
make[2]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/keycodes/sgi_vndr'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/keycodes/sgi_vndr'
make[2]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/keycodes'
make[2]: Nothing to be done for 'all-am'.
make[2]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/keycodes'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/keycodes'
Making all in po
make[1]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/po'
make[1]: Nothing to be done for 'all'.
make[1]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/po'
Making all in rules
make[1]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/rules'
Making all in compat
make[2]: Entering directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/rules/compat'
../../../xkeyboard-config-2.29/rules/compat/map-variants.py --want=mls --number=2 base.ml2_s.part ../../../xkeyboard-config-2.29/rules/compat/layoutsMapping.lst ../../../xkeyboard-config-2.29/rules/compat/variantsMapping.lst
../../../xkeyboard-config-2.29/rules/compat/map-variants.py --want=mls --number=3 base.ml3_s.part ../../../xkeyboard-config-2.29/rules/compat/layoutsMapping.lst ../../../xkeyboard-config-2.29/rules/compat/variantsMapping.lst
../../../xkeyboard-config-2.29/rules/compat/map-variants.py --want=mls --number=4 base.ml4_s.part ../../../xkeyboard-config-2.29/rules/compat/layoutsMapping.lst ../../../xkeyboard-config-2.29/rules/compat/variantsMapping.lst
../../../xkeyboard-config-2.29/rules/compat/map-variants.py --want=mlvs --number=2 base.ml2v2_s.part ../../../xkeyboard-config-2.29/rules/compat/variantsMapping.lst
../../../xkeyboard-config-2.29/rules/compat/map-variants.py --want=mlvs --number=3 base.ml3v3_s.part ../../../xkeyboard-config-2.29/rules/compat/variantsMapping.lst
../../../xkeyboard-config-2.29/rules/compat/map-variants.py --want=mlvs --number=4 base.ml4v4_s.part ../../../xkeyboard-config-2.29/rules/compat/variantsMapping.lst
../../../xkeyboard-config-2.29/rules/compat/map-variants.py --want=mls base.ml_s.part ../../../xkeyboard-config-2.29/rules/compat/layoutsMapping.lst ../../../xkeyboard-config-2.29/rules/compat/variantsMapping.lst
../../../xkeyboard-config-2.29/rules/compat/map-variants.py --want=mls --number=1 base.ml1_s.part ../../../xkeyboard-config-2.29/rules/compat/layoutsMapping.lst ../../../xkeyboard-config-2.29/rules/compat/variantsMapping.lst
../../../xkeyboard-config-2.29/rules/compat/map-variants.py --want=mlvs base.mlv_s.part ../../../xkeyboard-config-2.29/rules/compat/variantsMapping.lst
../../../xkeyboard-config-2.29/rules/compat/map-variants.py --want=mlvs --number=1 base.ml1v1_s.part ../../../xkeyboard-config-2.29/rules/compat/variantsMapping.lst
Traceback (most recent call last):
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 133, in <module>
    map_variant(fd, ns.files, ns.want, ns.number)
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 107, in map_variant
    mappings = read_file(f)
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 38, in read_file
    l2 = Layout(groups[1])
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 15, in __init__
    self.layout = match[1]
TypeError: '_sre.SRE_Match' object is not subscriptable
Traceback (most recent call last):
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 133, in <module>
    map_variant(fd, ns.files, ns.want, ns.number)
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 107, in map_variant
    mappings = read_file(f)
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 38, in read_file
    l2 = Layout(groups[1])
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 15, in __init__
    self.layout = match[1]
TypeError: '_sre.SRE_Match' object is not subscriptable
Traceback (most recent call last):
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 133, in <module>
    map_variant(fd, ns.files, ns.want, ns.number)
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 107, in map_variant
    mappings = read_file(f)
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 38, in read_file
    l2 = Layout(groups[1])
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 15, in __init__
    self.layout = match[1]
TypeError: '_sre.SRE_Match' object is not subscriptable
Makefile:490: recipe for target 'base.ml4_s.part' failed
make[2]: *** [base.ml4_s.part] Error 1
make[2]: *** Waiting for unfinished jobs....
Makefile:481: recipe for target 'base.ml1_s.part' failed
make[2]: *** [base.ml1_s.part] Error 1
Traceback (most recent call last):
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 133, in <module>
    map_variant(fd, ns.files, ns.want, ns.number)
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 107, in map_variant
    mappings = read_file(f)
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 38, in read_file
    l2 = Layout(groups[1])
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 15, in __init__
    self.layout = match[1]
TypeError: '_sre.SRE_Match' object is not subscriptable
Makefile:505: recipe for target 'base.ml_s.part' failed
make[2]: *** [base.ml_s.part] Error 1
Makefile:487: recipe for target 'base.ml3_s.part' failed
make[2]: *** [base.ml3_s.part] Error 1
Traceback (most recent call last):
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 133, in <module>
    map_variant(fd, ns.files, ns.want, ns.number)
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 107, in map_variant
    mappings = read_file(f)
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 38, in read_file
    l2 = Layout(groups[1])
  File "../../../xkeyboard-config-2.29/rules/compat/map-variants.py", line 15, in __init__
    self.layout = match[1]
TypeError: '_sre.SRE_Match' object is not subscriptable
Makefile:484: recipe for target 'base.ml2_s.part' failed
make[2]: *** [base.ml2_s.part] Error 1
make[2]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/rules/compat'
Makefile:552: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory '/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.29-r0/build/rules'
Makefile:456: recipe for target 'all-recursive' failed
make: *** [all-recursive] Error 1
WARNING: exit code 1 from a shell command.


