Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Tv1aN-00018R-Nj
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 09:09:45 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Jan 2013 23:53:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,471,1355126400"; 
	d="scan'208,217";a="272117180"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 14 Jan 2013 23:54:09 -0800
Message-ID: <50F50CAB.7010101@intel.com>
Date: Tue, 15 Jan 2013 10:00:43 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<50F09EDA.1000807@linux.intel.com> <50F43D8A.8020502@intel.com>
	<50F44A19.9040804@linux.intel.com>
In-Reply-To: <50F44A19.9040804@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 08:09:51 -0000
Content-Type: multipart/alternative;
	boundary="------------080908010405070002070300"

--------------080908010405070002070300
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 01/14/2013 08:10 PM, Saul Wold wrote:
> On 01/14/2013 09:16 AM, Radu Moisan wrote:
>>
>> On 01/12/2013 01:23 AM, Saul Wold wrote:
>>> On 01/08/2013 04:24 AM, Radu Moisan wrote:
>>>> As Ross suggested I've done the following changes to the previous set:
>>>> * added two patches (the first two) that address multiple init
>>>> systems support,\
>>>> as in shifting from default hardcoded sysvinit to something more
>>>> generic while
>>>> the default values still remains on sysvinit
>>>> * moved automatic setting of PREFERRED_PROVIDER_udev into
>>>> default_providers.inc
>>>> * removed ahavi-systemd since all it provided was service files; now
>>>> service files
>>>> are pulled in by avahi-daemon
>>>> * also rebased on master
>>>>
>>>> The following changes since commit
>>>> 7e1f8faad0c4b6f490c26f87acc698dd6e002b15:
>>>>
>>>>    perl: Remove bashism from perl-tests.inc (2013-01-07 22:37:37 
>>>> +0000)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>    git://git.yoctoproject.org/poky-contrib rmoisan/systemd
>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd 
>>>>
>>>>
>>>> Enrico Scholz (1):
>>>>    systemd: move disable operation into prerm() script
>>>>
>>>> Holger Hans Peter Freyther (2):
>>>>    systemd: Make the main systemd files proper CONFFILES
>>>>    systemd: Introduce a create-volatile to create tmp directories
>>> White space 4 spaces vs tab
>>
>> Fixed.
>>
>>>
>>>>
>>>> Khem Raj (1):
>>>>    systemd: Fix build when base_libdir is not /lib
>>>>
>>>> Martin Donnelly (2):
>>>>    cgroups: Add INSANE_SKIP to avoid warning about .so file
>>>>    systemd: Remove sysvinit mount related services if systemd is 
>>>> enabled
>>>>
>>>> Martin Jansa (2):
>>>>    systemd: fix FILESPATH to find systemctl
>>>>    systemd: add PACKAGES_DYNAMIC
>>>>
>>>> Radu Moisan (13):
>>>>    default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
>>>>    default-providers: Automatically set PREFERRED_PROVIDER_udev
>>>>    systemd: initial integration
>>> I believe this was mentioned before, but can you avoid making white
>>> space changes, you seem to have changed tabs (which we use tabs for
>>> shell based functions and 4 spaces for python based functions)
>>>
>>> Specifically, I saw some changes in wpa-supplicant-1.0.inc, busybox,
>>> dropbear, initscripts
>>>
>> Reviewed those files and cleaned them up to comply.
>>
> I am still seeing white space changes, as mentioned before if you want 
> to cleanup white space changes, make that a separate and distinct 
> patch, so for instance in dropbear you un-indented some SRC_URIs, that 
> should be a distinct patch with white space changes only separate from 
> the addition of the dropbear*.service files.
>
> I know I might be getting a little nit-picky, but it's about 
> readability and understanding the change sets, I just stop looking 
> because it's hard to see the changes clearly.
>
> So please check you whitespace and sent a seperate whitespace fixup 
> patch.

You need to get to an understanding with Ross. He suggested to get rid 
if white space patches, and squash them so that only relevant changes 
would appear in the history.
About the spaces vs tab problem, I tried to fix that yesterday in the 
files you mentioned, and indeed I fixed it for the entire file. I 
understand it would make reviewing harder, but you can always use -w 
option with git show or git diff to ignore white spaces.

Radu

--------------080908010405070002070300
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 01/14/2013 08:10 PM, Saul Wold
      wrote:<br>
    </div>
    <blockquote cite="mid:50F44A19.9040804@linux.intel.com" type="cite">On
      01/14/2013 09:16 AM, Radu Moisan wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 01/12/2013 01:23 AM, Saul Wold wrote:
        <br>
        <blockquote type="cite">On 01/08/2013 04:24 AM, Radu Moisan
          wrote:
          <br>
          <blockquote type="cite">As Ross suggested I've done the
            following changes to the previous set:
            <br>
            * added two patches (the first two) that address multiple
            init
            <br>
            systems support,\
            <br>
            as in shifting from default hardcoded sysvinit to something
            more
            <br>
            generic while
            <br>
            the default values still remains on sysvinit
            <br>
            * moved automatic setting of PREFERRED_PROVIDER_udev into
            <br>
            default_providers.inc
            <br>
            * removed ahavi-systemd since all it provided was service
            files; now
            <br>
            service files
            <br>
            are pulled in by avahi-daemon
            <br>
            * also rebased on master
            <br>
            <br>
            The following changes since commit
            <br>
            7e1f8faad0c4b6f490c26f87acc698dd6e002b15:
            <br>
            <br>
            &nbsp;&nbsp; perl: Remove bashism from perl-tests.inc (2013-01-07
            22:37:37 +0000)
            <br>
            <br>
            are available in the git repository at:
            <br>
            <br>
            &nbsp;&nbsp; git://git.yoctoproject.org/poky-contrib rmoisan/systemd
            <br>
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd">http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd</a>
            <br>
            <br>
            Enrico Scholz (1):
            <br>
            &nbsp;&nbsp; systemd: move disable operation into prerm() script
            <br>
            <br>
            Holger Hans Peter Freyther (2):
            <br>
            &nbsp;&nbsp; systemd: Make the main systemd files proper CONFFILES
            <br>
            &nbsp;&nbsp; systemd: Introduce a create-volatile to create tmp
            directories
            <br>
          </blockquote>
          White space 4 spaces vs tab
          <br>
        </blockquote>
        <br>
        Fixed.
        <br>
        <br>
        <blockquote type="cite">
          <br>
          <blockquote type="cite">
            <br>
            Khem Raj (1):
            <br>
            &nbsp;&nbsp; systemd: Fix build when base_libdir is not /lib
            <br>
            <br>
            Martin Donnelly (2):
            <br>
            &nbsp;&nbsp; cgroups: Add INSANE_SKIP to avoid warning about .so file
            <br>
            &nbsp;&nbsp; systemd: Remove sysvinit mount related services if
            systemd is enabled
            <br>
            <br>
            Martin Jansa (2):
            <br>
            &nbsp;&nbsp; systemd: fix FILESPATH to find systemctl
            <br>
            &nbsp;&nbsp; systemd: add PACKAGES_DYNAMIC
            <br>
            <br>
            Radu Moisan (13):
            <br>
            &nbsp;&nbsp; default-distrovars: Add DISTRO_FEATURES_INITMAN to
            DISTRO_FEATURES
            <br>
            &nbsp;&nbsp; default-providers: Automatically set
            PREFERRED_PROVIDER_udev
            <br>
            &nbsp;&nbsp; systemd: initial integration
            <br>
          </blockquote>
          I believe this was mentioned before, but can you avoid making
          white
          <br>
          space changes, you seem to have changed tabs (which we use
          tabs for
          <br>
          shell based functions and 4 spaces for python based functions)
          <br>
          <br>
          Specifically, I saw some changes in wpa-supplicant-1.0.inc,
          busybox,
          <br>
          dropbear, initscripts
          <br>
          <br>
        </blockquote>
        Reviewed those files and cleaned them up to comply.
        <br>
        <br>
      </blockquote>
      I am still seeing white space changes, as mentioned before if you
      want to cleanup white space changes, make that a separate and
      distinct patch, so for instance in dropbear you un-indented some
      SRC_URIs, that should be a distinct patch with white space changes
      only separate from the addition of the dropbear*.service files.
      <br>
      <br>
      I know I might be getting a little nit-picky, but it's about
      readability and understanding the change sets, I just stop looking
      because it's hard to see the changes clearly.
      <br>
      <br>
      So please check you whitespace and sent a seperate whitespace
      fixup patch.
      <br>
    </blockquote>
    <br>
    You need to get to an understanding with Ross. He suggested to get
    rid if white space patches, and squash them so that only relevant
    changes would appear in the history. <br>
    About the spaces vs tab problem, I tried to fix that yesterday in
    the files you mentioned, and indeed I fixed it for the entire file.
    I understand it would make reviewing harder, but you can always use
    <font face="monospace">-w</font> option with <font face="monospace">git
      show</font> or <font face="monospace">git diff</font> to ignore
    white spaces.<br>
    <br>
    Radu<br>
  </body>
</html>

--------------080908010405070002070300--
