Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SpXgk-0005Uv-GS
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 06:41:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2012 21:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="165261220"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2012 21:29:55 -0700
Message-ID: <4FFFA443.9090004@linux.intel.com>
Date: Thu, 12 Jul 2012 21:29:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
References: <cover.1341935782.git.nitin.a.kamble@intel.com>
	<4FFF5969.8060709@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C0316FABD@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0316FABD@ORSMSX106.amr.corp.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/19] automake update related commits on master
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
X-List-Received-Date: Fri, 13 Jul 2012 04:41:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2012 09:05 PM, Kamble, Nitin A wrote:
>
>
>> -----Original Message-----
>> From: Saul Wold [mailto:sgw@linux.intel.com]
>> Sent: Friday, July 13, 2012 4:41 AM
>> To: Patches and discussions about the oe-core layer
>> Cc: Kamble, Nitin A
>> Subject: Re: [OE-core] [PATCH 00/19] automake update related commits on
>> master
>>
>> On 07/10/2012 08:58 AM, nitin.a.kamble@intel.com wrote:
>>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>>
>>> These are same commits which I made for M1 branch, now rebased to the
>> current master.
>>>
>>
>> Nitin,
>>
>> What builds did you do and did you include commercial in the
>> LICENSE_FLAGS_WHITELIST?
>>
>> Also did you do a non-gplv3 build by setting INCOMPATIBLE_LICENSE?
>
> Saul,
>     I did not test these settings yet. Thanks for reporting these. I will try with these settings. If you can open bugs for these, it will be easier for me to track these.
> Is master a good branch to test automake commits, or is there any other branch which can work better.
>
I will open 2 general bugs against these 2 build targets.

Your changes are not in master yet, but if you start with the current 
master and then rebase before you push your updates, that should get 
most of the issues.

Sau!

> Thanks,
> Nitin
>
>>
>> Please see the autobuilder:
>>
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-non-
>> gpl3/builds/155/steps/shell_23/logs/stdio
>>
>> Sau!
>>
>>
>>> Thanks,
>>> Nitin
>>>
>>> The following changes since commit
>> 029e3cea52f86438a1d6868020b8888b5c93d623:
>>>
>>>     bitbake: fetch2/wget: Use FETCHCMD_wget to provide the commandline
>>> and options (2012-07-10 14:25:38 +0100)
>>>
>>> are available in the git repository at:
>>>     git://git.pokylinux.org/poky-contrib nitin/automake_update_on_master
>>>
>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/automake_u
>>> pdate_on_master
>>>
>>> Nitin A Kamble (19):
>>>     automake: upgrade from 1.11.3 to 1.12.1
>>>     jpeg: fix configure with automake 1.12.1
>>>     gnutls: Fix build with automake 1.12.1
>>>     pcmanfm: fix build with automake 1.12.x
>>>     avahi: fix build with automake 1.12.1
>>>     dates: fix build with automake 1.12.x
>>>     librsvg: fix build with automake 1.12.x
>>>     evolution-data-server: fix build with automake 1.12.x
>>>     tar: fix build with automake 1.12.x
>>>     libgcrypt: fix build with automake 1.12.x
>>>     telepathy-glib: fix build with automake 1.12.x
>>>     xf86-video-vmware: fix build with automake 1.12.x
>>>     libfm: fix build with automake 1.12.x
>>>     pango: fix dependencies to avoid build issue
>>>     libunistring: fix build with automake 1.12
>>>     telepathy-python: fix build with automake 1.12
>>>     libidn: fix build with automake 1.12
>>>     webgit-gtk: fix build with automake 1.12.1
>>>     gpgme: fix build with automake 1.12.x
>>>
>>>    meta/recipes-connectivity/avahi/avahi.inc          |    3 +-
>>>    .../avahi/files/fix_for_automake_1.12.x.patch      |   34 ++++++++
>>>    .../telepathy/telepathy-glib_0.19.2.bb             |    6 --
>>>    .../telepathy-python_fix_for_automake_1.12.patch   |   26 ++++++
>>>    .../telepathy/telepathy-python_0.15.19.bb          |    5 +-
>>>    .../jpeg/jpeg-8d/fix_for_automake_1.12.1.patch     |   44 ++++++++++
>>>    meta/recipes-core/jpeg/jpeg_8d.bb                  |    5 +-
>>>    .../automake/automake/path_prog_fixes.patch        |   40 ++--------
>>>    .../{automake_1.11.3.bb => automake_1.12.1.bb}     |    5 +-
>>>    ..._MKDIR_P_warning_error_with_automake_1.12.patch |   25 ++++++
>>>    meta/recipes-extended/libidn/libidn_1.25.bb        |    5 +-
>>>    meta/recipes-extended/tar/tar.inc                  |    2 -
>>>    meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    8 +--
>>>    meta/recipes-graphics/pango/pango.inc              |    2 +-
>>>    .../xorg-driver/xf86-video-vmware_12.0.2.bb        |    5 -
>>>    .../avoid_automake_errors.patch                    |   83
>> ++++++++++++++++++++
>>>    .../fix_for_automake-1.12.x.patch                  |   28 +++++++
>>>    meta/recipes-sato/eds/evolution-data-server_git.bb |    4 +-
>>>    .../files/pcmanfm_fix_for_automake_1.12.patch      |   35 ++++++++
>>>    meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb        |    5 +-
>>>    meta/recipes-sato/pimlico/dates_git.bb             |    6 +-
>>>    .../webgit-gtk_fix_build_with_automake_1.12.patch  |   62
>> +++++++++++++++
>>>    meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    1 +
>>>    ..._MKDIR_P_warning_error_with_automake_1.12.patch |   51
>> ++++++++++++
>>>    .../gnutls/gnutls_fix_for_automake_1.12.1.patch    |   43 ++++++++++
>>>    meta/recipes-support/gnutls/gnutls_2.12.20.bb      |    4 +-
>>>    meta/recipes-support/gpgme/gpgme_1.3.2.bb          |    6 +-
>>>    meta/recipes-support/libfm/libfm_0.1.17.bb         |    5 -
>>>    meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 -
>>>    .../libunistring_fix_for_automake_1.12.patch       |   81
>> +++++++++++++++++++
>>>    .../libunistring/libunistring_0.9.3.bb             |    5 +-
>>>    31 files changed, 549 insertions(+), 88 deletions(-)
>>>    create mode 100644 meta/recipes-
>> connectivity/avahi/files/fix_for_automake_1.12.x.patch
>>>    create mode 100644 meta/recipes-connectivity/telepathy/telepathy-
>> python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
>>>    create mode 100644 meta/recipes-core/jpeg/jpeg-
>> 8d/fix_for_automake_1.12.1.patch
>>>    rename meta/recipes-devtools/automake/{automake_1.11.3.bb =>
>> automake_1.12.1.bb} (93%)
>>>    create mode 100644 meta/recipes-
>> extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_a
>> utomake_1.12.patch
>>>    create mode 100644 meta/recipes-sato/eds/evolution-data-
>> server/avoid_automake_errors.patch
>>>    create mode 100644 meta/recipes-sato/eds/evolution-data-
>> server/fix_for_automake-1.12.x.patch
>>>    create mode 100644 meta/recipes-
>> sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
>>>    create mode 100644 meta/recipes-sato/webkit/files/webgit-
>> gtk_fix_build_with_automake_1.12.patch
>>>    create mode 100644 meta/recipes-
>> support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_au
>> tomake_1.12.patch
>>>    create mode 100644 meta/recipes-
>> support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch
>>>    create mode 100644
>>> meta/recipes-support/libunistring/libunistring/libunistring_fix_for_au
>>> tomake_1.12.patch
>>>
>
>
>



