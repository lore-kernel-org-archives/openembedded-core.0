Return-Path: <joaohf@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id A1DD7734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 01:52:53 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so16622699qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 18:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ao8Qi5masX6iLvv3+h9vgAlj0pZtdO/e3cgP4iBKx9U=;
	b=SXv93MXbfAuGPJBSQmm2nYa2onc61FL8aLqJdzRDRINlGsNWRM6G1Rg+ZwHZHHk6uB
	cVDPDuf0xMltVv6VHvKwEdIfIWt9ewbHKbICmEtthNuw6WgPkMwyMtHmjKew7ZDT/mx5
	UmjKcfOalsDVMdIcfQPE8W1PFhr0mmuziJDtVbnsHeu8E3xoXmzC7BYMZMmxbpBYpwGI
	6KhRSWz8taee1OkFPzJm/HaBbrJWkwK2ewp3/2i1P9w/n/idz0URMfMctBx3qV0+hZvk
	us2Ti/l59xwWheyJORDMgJBMOaRQOgtTz2uezlpXlfQn72ADMkFoNAEVzvALekVPSyDE
	W0Pw==
X-Received: by 10.140.101.140 with SMTP id u12mr39189234qge.48.1433382774187; 
	Wed, 03 Jun 2015 18:52:54 -0700 (PDT)
Received: from [192.168.0.16] ([187.106.4.47])
	by mx.google.com with ESMTPSA id 33sm1531735qkq.41.2015.06.03.18.52.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jun 2015 18:52:53 -0700 (PDT)
Message-ID: <556FAF71.6000102@gmail.com>
Date: Wed, 03 Jun 2015 22:52:49 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Changhyeok Bae <changhyeok.bae@lge.com>
References: <20150312143521.GD2338@jama>	<5501D4CA.2090209@r-finger.com>	<08f401d08df0$aba9be00$02fd3a00$@lge.com>	<CALbNGRReufGQXfR3eYqQKN6CRwhcEk5-EaeTfctenBdWeoYm_w@mail.gmail.com>	<CAJTo0La7EummgKK7-dp7oubo4XV_-yjn0WMbAysDJN4Btmah2A@mail.gmail.com>	<CALbNGRQzOdn8mGX-8E+7f9RLttmnESqjBw86v2pV4KOJhxpEmQ@mail.gmail.com>	<0ba801d09359$ec479130$c4d6b390$@lge.com>
	<556874C3.2050304@gmail.com>
	<02e101d09cf9$458099b0$d081cd10$@lge.com>
In-Reply-To: <02e101d09cf9$458099b0$d081cd10$@lge.com>
Cc: =?UTF-8?B?7J2066qF6rWs?= <myonggu.lee@lge.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: meta-gir issues and maintenance
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
X-List-Received-Date: Thu, 04 Jun 2015 01:52:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi,

Using https://github.com/meta-gir/meta-gir and dizzy I got:

| checking for i586-poky-linux-pkg-config... (cached) 
/srv/yocto/build/dizzy/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
| checking pkg-config is at least version 0.16... yes
| checking for glib-compile-schemas... 
/srv/yocto/build/dizzy/tmp/sysroots/x86_64-linux/usr/bin/glib-compile-schemas
| checking for gobject-introspection... configure: error: You need to 
have gobject-introspection >= 1.39.0 installed to build gtk+
| Configure failed. The contents of all config.log files follows to aid 
debugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at 
/srv/yocto/build/dizzy/tmp/work/i586-poky-linux/gtk+3/3.12.2-r0/temp/log.do_configure.24043)
ERROR: Task 129 
(/home/joaohf/opensource/poky/meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb, 
do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2542 tasks of which 2464 didn't need to 
be rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
/home/joaohf/opensource/poky/meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb, 
do_configure
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
joaohf@couve:/srv/yocto/build/dizzy$

My bblayers.conf was:

BBLAYERS ?= " \
   /home/joaohf/opensource/poky/meta \
   /home/joaohf/opensource/poky/meta-yocto \
   /home/joaohf/opensource/poky/meta-yocto-bsp \
   /home/joaohf/opensource/meta/meta-gir/meta-gir-core \
   /home/joaohf/opensource/meta/meta-gir/meta-gir \
   /home/joaohf/opensource/meta/meta-openembedded/meta-oe \
   "

Thanks.


On 02/06/2015 02:59, Changhyeok Bae wrote:
> Hi, I changed forked repo to https://github.com/meta-gir/meta-gir and changed some components matched with dizzy.
>
> Please test again with latest version.
>
> Thanks
> Changhyeok
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Joao Henrique Ferreira de Freitas
> Sent: Friday, May 29, 2015 11:17 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] meta-gir issues and maintenance
>
>
> Hi Changhyeok,
>
> Did you get this error when using meta-gir? In my case I am setting my recipe to inherit the g-ir class.
>
> | checking for python script directory... (cached)
> ${prefix}/lib/python2.7/site-packages
> | checking for python extension module directory... (cached)
> ${exec_prefix}/lib/python2.7/site-packages
> | checking for python module thread... yes checking whether to enable
> | threading in pygobject... yes
> |
> /srv/yocto/build/fido/tmp/work/i586-poky-linux/python-pygobject/3.0.4-r0/pygobject-3.0.4/configure:
> line 15892: ./libtool: No such file or directory
> | checking for i586-poky-linux-pkg-config...
> /srv/yocto/build/fido/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
> | checking pkg-config is at least version 0.16... yes checking for GLIB
> | - version >= 2.24.0... cross compiling; assumed OK...
> | yes (version 2.42.1)
> | checking for ffi... checking for FFI... yes checking for GIO... yes
> | checking for GI... no
> | configure: error: Package requirements (glib-2.0 >= 2.24.0
> |     gobject-introspection-1.0 >= 1.29.0
> | ) were not met:
> |
> | No package 'gobject-introspection-1.0' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables GI_CFLAGS and
> | GI_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> | Configure failed. The contents of all config.log files follows to aid
> debugging
> | ERROR: oe_runconf failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /srv/yocto/build/fido/tmp/work/i586-poky-linux/python-pygobject/3.0.4-r0/temp/log.do_configure.13915)
> ERROR: Task 233
> (/home/joaohf/opensource/meta/meta-gir/meta-gir/recipes-gir/python-pygobject/python-pygobject_3.0.4.bb,
> do_configure) failed with exit code '1'
> WARNING: QA Issue: libgirepository: configure was passed unrecognised
> options: --disable-schemas-install [unknown-configure-option]
> WARNING: QA Issue: g-ir-tools-native: configure was passed unrecognised
> options: --disable-schemas-install [unknown-configure-option]
> NOTE: Tasks Summary: Attempted 2578 tasks of which 2524 didn't need to be rerun and 1 failed.
> Waiting for 0 running tasks to finish:
>
> Summary: 1 task failed:
> /home/joaohf/opensource/meta/meta-gir/meta-gir/recipes-gir/python-pygobject/python-pygobject_3.0.4.bb,
> do_configure
>
>
> I am working to build mypaint (http://mypaint.intilinux.com/) which is
> hugely based on GI. Now I get lost.
>
> Thanks.
>
> On 20/05/2015 21:06, Changhyeok Bae wrote:
>> I forked meta-gir to https://github.com/locust2001/meta-gir and start working from next week.
>>
>> -----Original Message-----
>> From: Andreas Müller [mailto:schnitzeltony@googlemail.com]
>> Sent: Monday, May 18, 2015 8:46 PM
>> To: Burton, Ross
>> Cc: Changhyeok Bae; OE-core
>> Subject: Re: [OE-core] meta-gir issues and maintenance
>>
>> On Mon, May 18, 2015 at 1:00 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 18 May 2015 at 09:00, Andreas Müller <schnitzeltony@googlemail.com>
>>> wrote:
>>>> I would appreciate to have the gintrospection more central - this
>>>> would give us a chance to get the gtk stuff out of stone age..
>>> Well, oe-core already has GTK+ 3, so we're "just" missing the bindings
>>> to Python and JavaScript.
>> Sorry - I meant gnome not gtk.
>>> Changhyeok, you're welcome to fork meta-gir to your own repository and
>>> work on it independently.  If you can update it so that it works with
>>> oe-core master then you're the new maintainer. :)
>>>
>> Andreas
>>
>> This email has been protected by YAC (Yet Another Cleaner) http://www.yac.mx


