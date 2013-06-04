Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id D7B616065C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 12:06:41 +0000 (UTC)
Message-ID: <51ADD851.50700@communistcode.co.uk>
Date: Tue, 04 Jun 2013 13:06:41 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130604115851.GD3279@jama>
In-Reply-To: <20130604115851.GD3279@jama>
Subject: Re: State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Jun 2013 12:06:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/13 12:58, Martin Jansa wrote:
> On Mon, Jun 03, 2013 at 05:10:08PM +0200, Martin Jansa wrote:
>> On Mon, May 20, 2013 at 03:06:35PM +0200, Martin Jansa wrote:
>>> Couple of issues from last email were fixed, so here is updated status:
>>>
>>> qemuarm Summary: 14 tasks failed:
>>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130520_090009.log
>>> qemux86 Summary: 19 tasks failed:
>>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130519_170509.log
>>> qemux86-64 Summary: 20 tasks failed:
>>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130520_005747.log
>>
>> Hi,
>>
>> updated status, still building with gcc-4.8
>> shr-version issue already fixed
>> llvm2.9 also fixed
>> so if we don't count these 3 failures it's a bit better than last status
>>
>> qemuarm Summary: 15 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130601_225651.log
>>
>> qemux86 Summary: 18 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130603_011743.log/
>>
>> qemux86-64: Summary: 21 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130602_103752.log
>>
>> common (13):
>>    meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb, do_compile
>>    meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_compile
>>    virtual:native:meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_compile
>>    meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
>>    meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_compile
>>    meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb, do_compile
>>    meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb, do_compile
>>    meta-openembedded/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb, do_compile
>>    meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb, do_configure
>>    meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb, do_compile
>>    meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_compile
>>    meta-smartphone/meta-shr/recipes-shr/shr/shr-version.bb, do_configure
>>    meta-smartphone/meta-shr/recipes-shr/shr/shr-version.bb, do_populate_lic
>>
>> qemuarm (2):
>>    meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, do_compile
>>    openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.1.bb, do_compile
>>
>> qemux86* common (3):
>>    openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.6.bb, do_compile
>>    meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>>    openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>>
>> qemux86 (2):
>>    meta-browser/recipes-browser/chromium/chromium_29.0.1518.2.bb, do_compile
>>    meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb, do_compile
>>
>> qemux86-64 (5):
>>    meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>>    meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb, do_configure
>>    meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb, do_compile
>>    meta-browser/recipes-browser/chromium/chromium_29.0.1518.2.bb, do_compile
>>    meta-openembedded/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb, do_configure
>
> I forgot to mention that many packages now detect /run directory and
> install unshipped files, causing many new QA warnings, this isn't complete list,
> because some packages were reused from sstate-cache:
>
> usbmuxd-git: usbmuxd: Files/directories were installed but not shipped
>    /usr/lib64
>    /usr/lib64/libusbmuxd.so
>    /usr/lib64/libusbmuxd.so.1.0.8
>    /usr/lib64/libusbmuxd.so.2
>    /usr/lib64/pkgconfig
>    /usr/lib64/.debug
>    /usr/lib64/pkgconfig/libusbmuxd.pc
>    /usr/lib64/.debug/libusbmuxd.so.1.0.8
> openldap-2.4.23: openldap: Files/directories were installed but not shipped
>    /run
> networkmanager-0.9.8.0: networkmanager: Files/directories were installed but not shipped
>    /run
>    /run/NetworkManager
> cherokee-1.2.98: cherokee: Files/directories were installed but not shipped
>    /run
> nostromo-1.9.5: nostromo: Files/directories were installed but not shipped
>    /run
>    /run/nostromo
> gdm-2.32.2: gdm: Files/directories were installed but not shipped
>    /run
>    /run/gdm
>    /run/gdm/greeter
> collectd-5.2.2: collectd: Files/directories were installed but not shipped
>    /run
>
>

What is the best way to go about fixing these?


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--

