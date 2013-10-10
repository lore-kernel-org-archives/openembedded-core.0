Return-Path: <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Received: from mailhost.eurogiciel.fr (mailhost.eurogiciel.fr [86.64.47.76])
	by mail.openembedded.org (Postfix) with ESMTP id 0F10A6CEF4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 15:47:45 +0000 (UTC)
Received: from (unknown [172.16.88.4]) by mailhost.eurogiciel.fr with smtp
	id 171b_8fb2_236bc828_31c4_11e3_85e1_a4badbe01a3a;
	Thu, 10 Oct 2013 17:53:44 +0200
Received: from [10.19.3.33] ([172.16.100.253]) by 31l-syracuse.eurogiciel.fr
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 10 Oct 2013 17:45:00 +0200
Message-ID: <5256CB7B.60500@eurogiciel.fr>
Date: Thu, 10 Oct 2013 17:44:59 +0200
From: Ewan LE BIDEAU-CANEVET <ewan.lebideau-canevet@eurogiciel.fr>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1381407802-16852-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
	<CAJTo0LaW6XJThFnBGydYNDBMZ-_ONt=BRgbnosNapadyDyoqFg@mail.gmail.com>
In-Reply-To: <CAJTo0LaW6XJThFnBGydYNDBMZ-_ONt=BRgbnosNapadyDyoqFg@mail.gmail.com>
X-OriginalArrivalTime: 10 Oct 2013 15:45:00.0867 (UTC)
	FILETIME=[AE033130:01CEC5CF]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] wayland : Bump to 1.2.0 version
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
X-List-Received-Date: Thu, 10 Oct 2013 15:47:46 -0000
Content-Type: multipart/alternative;
	boundary="------------030509010703090505070008"

--------------030509010703090505070008
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2013 16:16, Burton, Ross wrote:
> On 10 October 2013 13:23, Ewan LE BIDEAU-CANEVET
> <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr> wrote:
>> -SRC_URI_append_class-native = " file://just-scanner.patch"
> That patch -  as it says - serves a useful purpose.  What is the
> rationale for deleting it?  If there's a good reason, please say what
> it is.
>
>> -# Wayland installs a M4 macro for other projects to use. This M4 macro includes
>> -# a path to a Makefile fragment to get the rules to generate stubs from protocol
>> -# description files.  The paths to the sysroot end up incorrect, so fix them.
>> -do_configure_append_class-native() {
>> -  sed -e 's,@prefix@,${STAGING_DIR_NATIVE},g' \
>> -      -e 's,@exec_prefix@,${STAGING_DIR_NATIVE},g' \
>> -      -e 's,@bindir@,${STAGING_BINDIR_NATIVE},g' \
>> -      -e 's,@datarootdir@,${STAGING_DATADIR_NATIVE},g' \
>> -  ${S}/wayland-scanner.m4.in > ${B}/wayland-scanner.m4
>> -}
> Wayland is still installing this m4 file, so why delete this fix?
>  From a glance at Wayland 1.2 it looks like it isn't required anymore
> as pkgconfig is used to determine the paths, but you need to state
> this in the commit message.
This file

wayland-scanner.m4*.**in**  *

doesn't exist anymore. In fact there is only "wayland-scanner.m4"
Run sed command on a missing  file wayland-scanner.m4.in  is now 
useless, correct ?
Furthermore, in wayland-scanner.m4 has no reference to strings

@prefix@
@exec_prefix@
@bindir@
@datarootdir@

So if we let this instruction wayland-scanner.m4 will  be cleared. So 
this leads to build faillure.

> Also, there's a 1.2.1 release now.
You're right :). I have started this work few weeks ago.
I noticed that there is a 1.3.0 version, and I have started to take a 
look on it. I'll probably post my work in 1 or 2 weeks.


As I saw , we need to do the same change (Remove : 
do_configure_append_class-native function => last existing 
wayland-scanner.m4.in was in 1.1.0 version.)

Apologies for removing your just-scanner.patch file, my mistake.


Ewan

--------------030509010703090505070008
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 10/10/2013 16:16, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaW6XJThFnBGydYNDBMZ-_ONt=BRgbnosNapadyDyoqFg@mail.gmail.com"
      type="cite">
      <pre wrap="">On 10 October 2013 13:23, Ewan LE BIDEAU-CANEVET
<a class="moz-txt-link-rfc2396E" href="mailto:Ewan.LEBIDEAU-CANEVET@eurogiciel.fr">&lt;Ewan.LEBIDEAU-CANEVET@eurogiciel.fr&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">-SRC_URI_append_class-native = <a class="moz-txt-link-rfc2396E" href="file://just-scanner.patch">" file://just-scanner.patch"</a>
</pre>
      </blockquote>
      <pre wrap="">
That patch -  as it says - serves a useful purpose.  What is the
rationale for deleting it?  If there's a good reason, please say what
it is.

</pre>
      <blockquote type="cite">
        <pre wrap="">-# Wayland installs a M4 macro for other projects to use. This M4 macro includes
-# a path to a Makefile fragment to get the rules to generate stubs from protocol
-# description files.  The paths to the sysroot end up incorrect, so fix them.
-do_configure_append_class-native() {
-  sed -e 's,@prefix@,${STAGING_DIR_NATIVE},g' \
-      -e 's,@exec_prefix@,${STAGING_DIR_NATIVE},g' \
-      -e 's,@bindir@,${STAGING_BINDIR_NATIVE},g' \
-      -e 's,@datarootdir@,${STAGING_DATADIR_NATIVE},g' \
-  ${S}/wayland-scanner.m4.in &gt; ${B}/wayland-scanner.m4
-}
</pre>
      </blockquote>
      <pre wrap="">
Wayland is still installing this m4 file, so why delete this fix?
From a glance at Wayland 1.2 it looks like it isn't required anymore
as pkgconfig is used to determine the paths, but you need to state
this in the commit message.
</pre>
    </blockquote>
    This file <br>
    <pre wrap="">wayland-scanner.m4<b>.</b><b>in</b><b> </b></pre>
    doesn't exist anymore. In fact there is only "wayland-scanner.m4" <br>
    Run sed command on a missing  file wayland-scanner.m4.in  is now
    useless, correct ?<br>
    Furthermore, in wayland-scanner.m4 has no reference to strings <br>
    <pre wrap="">@prefix@ 
@exec_prefix@ 
@bindir@ 
@datarootdir@ 

</pre>
    So if we let this instruction wayland-scanner.m4 will  be cleared.
    So this leads to build faillure.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaW6XJThFnBGydYNDBMZ-_ONt=BRgbnosNapadyDyoqFg@mail.gmail.com"
      type="cite">
      <pre wrap="">
Also, there's a 1.2.1 release now.
</pre>
    </blockquote>
    You're right :). I have started this work few weeks ago.<br>
    I noticed that there is a 1.3.0 version, and I have started to take
    a look on it. I'll probably post my work in 1 or 2 weeks.<br>
    <br>
    <br>
    As I saw , we need to do the same change (Remove : 
    do_configure_append_class-native function =&gt; last existing
    wayland-scanner.m4.in was in 1.1.0 version.)<br>
    <br>
    Apologies for removing your just-scanner.patch file, my mistake.<br>
    <br>
    <br>
    Ewan<br>
  </body>
</html>

--------------030509010703090505070008--
