Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7311E7886C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 15:48:01 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id y75so14281011oie.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 07:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Ez1ydL0+OYakgxsOeF77k4oNrlbAwhJea3hP12pUqDA=;
	b=FyvpMtDN/Ao3rhQtg+PHMiSKWM0l6UMg+OYoXlcQistuhtRV6LBnuSd7wCShnzBBw8
	kideSZiNISpsf269McXmCRYklGTbZHAq6XMaOfC4Dbe146+7lvlxxfX26J9Wtlhis1S6
	D5OSbfOT43J6caQ3hpofZHXul9qgg7VG3CtWz/4ki55R/H1u3qSCKSEUr/XtXsueMv9a
	GqR2ttvo1upj4hi5UtDuHXGWpphCb50nRLeswKXsGzc2oEtCS9V8Yvttr8dvNkMx0wqz
	TsXRCpqkg5Kil6TvLrBnmzDGZwIhTPGELomgFmV6UVYrCfwqma+EXG5IQxXUUagkHslN
	TBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Ez1ydL0+OYakgxsOeF77k4oNrlbAwhJea3hP12pUqDA=;
	b=mZ96wV8etmHsiBiiw947dRZmg3UL6N+xfogFjqBhBkOfRcPvWWZcYod9V/m/vZTZoU
	YGIM7PYVDyHPcQ/y4scQY1z81cSBM9TEQfyWxIV6AyfGVkTHait0rE39paMbIaG5Rri7
	J0GzntFrmHPqGjUsoVgVMs5eeFZzPlceo6F0/HQ9ARZmnCS0GNNxBOxUdk1zA2NC9R6/
	OnBFORDZF81Ju8sVrU5tlDSYvGgP10ufO3jtjNMlG0a8rqiGabFiRZZIij33egOvK0Qx
	2sjHg2UjSQ3sdq6W6h2Vy9pgbdPf2m7b7qx1M+VneBcV4VTrTy66ZiyWXtAVA8v77jX4
	4n8A==
X-Gm-Message-State: AKGB3mJ8hPCsccXT2cwGRQAGcreSx6yMCGbmGlOWdJk6n8iM79+JCcdJ
	e4DxN3ncEdxBT4YRC19LMTXD2xQF
X-Google-Smtp-Source: ACJfBotJcAfO2n1B2YKhBMhODuFlPGNQqcc1coWnIF+woq3ezjKSXlTg5UnZRwzJgx/eVK5/qwUf/w==
X-Received: by 10.202.1.81 with SMTP id 78mr3513281oib.175.1513093681781;
	Tue, 12 Dec 2017 07:48:01 -0800 (PST)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53]) by smtp.gmail.com with ESMTPSA id
	h88sm7683384oig.11.2017.12.12.07.48.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 07:48:00 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id o64so14283834oia.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 07:48:00 -0800 (PST)
X-Received: by 10.202.224.8 with SMTP id x8mr3223897oig.68.1513093679587; Tue,
	12 Dec 2017 07:47:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 12 Dec 2017 07:47:58 -0800 (PST)
In-Reply-To: <370cbd8d94d10bbb85e12e08b742f060@agner.ch>
References: <20171212132755.30556-1-stefan@agner.ch>
	<CAJTo0LaPCqFQ9asGmRUpEZ4G146GT42j0xQvMVpsW3xOeddN4Q@mail.gmail.com>
	<abb98b6343d1fe28ec45a0243cc5ec1d@agner.ch>
	<CAJTo0LYBEhgD6vc07pVk_QMCkHjLXGFP9RazatMM_nOL-8RjVw@mail.gmail.com>
	<370cbd8d94d10bbb85e12e08b742f060@agner.ch>
Date: Tue, 12 Dec 2017 13:47:58 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrZ+5JKO-KkF88LcL8aE+DY5svJ5to8_XfDyeA7hxY-ig@mail.gmail.com>
Message-ID: <CAP9ODKrZ+5JKO-KkF88LcL8aE+DY5svJ5to8_XfDyeA7hxY-ig@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] waf.bbclass: explicitly pass bindir and libdir
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
X-List-Received-Date: Tue, 12 Dec 2017 15:48:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 12, 2017 at 12:38 PM, Stefan Agner <stefan@agner.ch> wrote:
> On 2017-12-12 15:13, Burton, Ross wrote:
>
>> On 12 December 2017 at 14:03, Stefan Agner <stefan@agner.ch> wrote:
>>
>>> On 2017-12-12 15:00, Burton, Ross wrote:
>>>
>>>> On 12 December 2017 at 13:27, Stefan Agner <stefan@agner.ch> wrote:
>>>>
>>>>> On some build hosts distros (e.g. Fedora 26) waf tries to be
>>>>> smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
>>>>> This obviously is not what we want for 32-bit targets and usually
>>>>> fails in the do_package phase:
>>>>> WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue: gstreamer1.0-plugins-imx: Files/directories were installed but not shipped in any package:
>>>>> /usr/lib64/libgstimxcommon.so.0
>>>>>
>>>>> Waf knows prefix, bindir and libdir as default options. Explicitly
>>>>> pass those three.
>>>>
>>>> Obviously not.
>>>>
>>>> ERROR: eglinfo-x11-1.0.0-r0 do_configure: Function failed: do_configure (log file is located at /data/poky-tmp/master/build/work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.do_configure.17278)
>>>> ERROR: Logfile of failure stored in: /data/poky-tmp/master/build/work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.do_configure.17278
>>>> Log data follows:
>>>> | DEBUG: Executing shell function do_configure
>>>> | waf [commands] [options]
>>>> |
>>>> | Main commands (example: ./waf build -j4)
>>>> |   build    : executes the build
>>>> |   clean    : cleans the project
>>>> |   configure: configures the project
>>>> |   dist     : makes a tarball for redistributing the sources
>>>> |   distcheck: checks if the project compiles (tarball from 'dist')
>>>> |   distclean: removes the build directory
>>>> |   install  : installs the targets on the system
>>>> |   list     : lists the targets to execute
>>>> |   step     : executes tasks in a step-by-step fashion, for debugging
>>>> |   uninstall: removes the targets installed
>>>> |   update   : updates the plugins from the *waflib/extras* directory
>>>> |
>>>> | waf: error: no such option: --bindir
>>>>
>>> Hm, eglinfo seems to come with a old waf version, 1.7.8 to be specific.
>>>
>>> It seems bindir/libdir got added in 1.8 series:
>>> https://github.com/waf-project/waf/blob/waf-1.8/waflib/Options.py
>>>
>>> Make version specific variables?
>>
>> That neatly shows where the "clever code" that was breaking libdir earlier is:
>>
>> https://github.com/waf-project/waf/commit/823b4cd2dc03d06a81e0ab003606067da03d8745#diff-b44b0c8f383b2fd1b19f2ba039d30237
>>
>
> Yeah that seems to be it.
>
> That go added in the 1.8.6 dev cycle afaik.
>
> I am thinking about adding some kind of version autodetection
>
> WAFMINOR=$(${S}/waf --version | sed -e '1{s/waf [0-9]\.//;s/\.[0-9]*
> (.*//};q')
>
> if [ $WAFMINOR -gt "7" ] ...
>
> Maybe there is a nicer way of doing this?

What about we provide a package waf version and replace the binaries
prior building? So we know what version we'd be using. Kinda
autoreconf run in autotools class.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

