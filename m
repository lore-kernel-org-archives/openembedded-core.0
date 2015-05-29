Return-Path: <joaohf@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id EF177728CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 14:16:37 +0000 (UTC)
Received: by qgf2 with SMTP id 2so29656282qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=L0dy4WX8Pfk0t2JlRQoQ1i7zqFm/fQ/Yd4JqtiNzcys=;
	b=Yh89VOwRcJDBt9YxrDJSz4hJUwKmsjgP52KYBAC7V1jHqbAvPZg+Mzh8JLpky6dD1h
	TpNl+/7haE28/UffIBthUZFW6uBTo4CC4aJfHF5Bo5xZAnbvqWSVx13Bx15xcTJxeROR
	/mqS2v1yfERfJ393xJeVK5gAm7W+WuyhS//Mgk4XzOKaSGt4FXo0zlfuNYdjuuN3AUrV
	ymOtgM0uvjcrX7SE1fR+z6avlb74DGonESApYn7dMMOyeEk2miFCOq5/v6n/iGZFwAmi
	qMbdyW+xT7z5Kk0fjSlfIK+yGyMV3YWtVy+K+JO6jl2hkf0RYxu1Q/vGn+6OB7FhUZ+F
	6JVw==
X-Received: by 10.140.192.10 with SMTP id n10mr10409687qha.1.1432908998686;
	Fri, 29 May 2015 07:16:38 -0700 (PDT)
Received: from [192.168.0.16] ([187.106.4.47])
	by mx.google.com with ESMTPSA id q7sm2745491qkh.35.2015.05.29.07.16.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 May 2015 07:16:37 -0700 (PDT)
Message-ID: <556874C3.2050304@gmail.com>
Date: Fri, 29 May 2015 11:16:35 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20150312143521.GD2338@jama>	<5501D4CA.2090209@r-finger.com>	<08f401d08df0$aba9be00$02fd3a00$@lge.com>	<CALbNGRReufGQXfR3eYqQKN6CRwhcEk5-EaeTfctenBdWeoYm_w@mail.gmail.com>	<CAJTo0La7EummgKK7-dp7oubo4XV_-yjn0WMbAysDJN4Btmah2A@mail.gmail.com>	<CALbNGRQzOdn8mGX-8E+7f9RLttmnESqjBw86v2pV4KOJhxpEmQ@mail.gmail.com>
	<0ba801d09359$ec479130$c4d6b390$@lge.com>
In-Reply-To: <0ba801d09359$ec479130$c4d6b390$@lge.com>
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
X-List-Received-Date: Fri, 29 May 2015 14:16:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Changhyeok,

Did you get this error when using meta-gir? In my case I am setting my 
recipe to inherit the g-ir class.

| checking for python script directory... (cached) 
${prefix}/lib/python2.7/site-packages
| checking for python extension module directory... (cached) 
${exec_prefix}/lib/python2.7/site-packages
| checking for python module thread... yes
| checking whether to enable threading in pygobject... yes
| 
/srv/yocto/build/fido/tmp/work/i586-poky-linux/python-pygobject/3.0.4-r0/pygobject-3.0.4/configure: 
line 15892: ./libtool: No such file or directory
| checking for i586-poky-linux-pkg-config... 
/srv/yocto/build/fido/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
| checking pkg-config is at least version 0.16... yes
| checking for GLIB - version >= 2.24.0... cross compiling; assumed OK...
| yes (version 2.42.1)
| checking for ffi... checking for FFI... yes
| checking for GIO... yes
| checking for GI... no
| configure: error: Package requirements (glib-2.0 >= 2.24.0
|     gobject-introspection-1.0 >= 1.29.0
| ) were not met:
|
| No package 'gobject-introspection-1.0' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables GI_CFLAGS
| and GI_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| Configure failed. The contents of all config.log files follows to aid 
debugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at 
/srv/yocto/build/fido/tmp/work/i586-poky-linux/python-pygobject/3.0.4-r0/temp/log.do_configure.13915)
ERROR: Task 233 
(/home/joaohf/opensource/meta/meta-gir/meta-gir/recipes-gir/python-pygobject/python-pygobject_3.0.4.bb, 
do_configure) failed with exit code '1'
WARNING: QA Issue: libgirepository: configure was passed unrecognised 
options: --disable-schemas-install [unknown-configure-option]
WARNING: QA Issue: g-ir-tools-native: configure was passed unrecognised 
options: --disable-schemas-install [unknown-configure-option]
NOTE: Tasks Summary: Attempted 2578 tasks of which 2524 didn't need to 
be rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
/home/joaohf/opensource/meta/meta-gir/meta-gir/recipes-gir/python-pygobject/python-pygobject_3.0.4.bb, 
do_configure


I am working to build mypaint (http://mypaint.intilinux.com/) which is 
hugely based on GI. Now I get lost.

Thanks.

On 20/05/2015 21:06, Changhyeok Bae wrote:
> I forked meta-gir to https://github.com/locust2001/meta-gir and start working from next week.
>
> -----Original Message-----
> From: Andreas Müller [mailto:schnitzeltony@googlemail.com]
> Sent: Monday, May 18, 2015 8:46 PM
> To: Burton, Ross
> Cc: Changhyeok Bae; OE-core
> Subject: Re: [OE-core] meta-gir issues and maintenance
>
> On Mon, May 18, 2015 at 1:00 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 18 May 2015 at 09:00, Andreas Müller <schnitzeltony@googlemail.com>
>> wrote:
>>> I would appreciate to have the gintrospection more central - this
>>> would give us a chance to get the gtk stuff out of stone age..
>>
>> Well, oe-core already has GTK+ 3, so we're "just" missing the bindings
>> to Python and JavaScript.
> Sorry - I meant gnome not gtk.
>> Changhyeok, you're welcome to fork meta-gir to your own repository and
>> work on it independently.  If you can update it so that it works with
>> oe-core master then you're the new maintainer. :)
>>
> Andreas
>
> This email has been protected by YAC (Yet Another Cleaner) http://www.yac.mx


