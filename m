Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SZHrh-0003r5-TV
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 10:33:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 May 2012 01:22:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; 
	d="scan'208,217";a="149607054"
Received: from dell-desktop (HELO [10.237.104.210]) ([10.237.104.210])
	by orsmga002.jf.intel.com with ESMTP; 29 May 2012 01:22:59 -0700
Message-ID: <4FC488CF.2030803@intel.com>
Date: Tue, 29 May 2012 11:29:03 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
	<4FC35FAD.7090505@intel.com> <4FC35FBA.2060200@gherzan.ro>
	<4FC37C81.6080200@intel.com>
	<CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com>
	<CAJTo0LZ5WuTMA=yuLm65PX-sp2Rx_L8UAg4JL1j5JcHvLC=o9A@mail.gmail.com>
	<1338212677.20169.75.camel@ted>
In-Reply-To: <1338212677.20169.75.camel@ted>
Subject: dbus test suite
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
X-List-Received-Date: Tue, 29 May 2012 08:33:18 -0000
Content-Type: multipart/alternative;
	boundary="------------080502050103010208030403"

--------------080502050103010208030403
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 05/28/2012 04:44 PM, Richard Purdie wrote:
> On Mon, 2012-05-28 at 14:30 +0100, Burton, Ross wrote:
>> On 28 May 2012 14:26, Andrei Gherzan<andrei@gherzan.ro>  wrote:
>>> There is an internal test suite for dbus. You can enable building those
>>> tests in configure:
>>> "--enable-tests"
>> Is there a good reason why these shouldn't be always ran when building dbus?
> Well, we're cross compiling so it depends how they're written and
> whether they can run in a cross environment. We've also taken steps to
> reduce our build time so if these need something like perl or python,
> adding those into the dependency chain is problematic.
>
> I'm open to ideas here but so far they've not been useful so are likely
> disabled.
>
> Cheers,
>
> Richard
>
How do I add something in the dependency chain? With --enable-test dbus 
fails at do_configure complaining about

| configure: Full test coverage was requested with --enable-tests=yes
| configure: This has many dependencies (GLib, dbus-glib, Python)
| checking for i586-poky-linux-pkg-config... no
| checking for pkg-config... 
/home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for GLIB... yes
| checking for DBUS_GLIB... yes
| configure: Full test coverage (--enable-tests=yes) requires Python, 
dbus-python, pygobject
| checking for a Python interpreter with version >= 2.6... python
| checking for python... 
/home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/python
| checking for python version... 2.7
| checking for python platform... linux2
| checking for python script directory... ${libdir}/python2.7/site-packages
| checking for python extension module directory... 
${libdir}/python2.7/site-packages
| checking for Python modules for full test coverage... Traceback (most 
recent call last):
|   File "<string>", line 1, in <module>
| ImportError: No module named dbus
| no
| configure: error: cannot import dbus, gobject, dbus.mainloop.glib 
Python modules
| ERROR: oe_runconf failed
NOTE: package dbus-1.4.20-r3.0: task do_configure: Failed
ERROR: Task 6 
(/home/radu/Documents/Development/yocto/poky/meta/recipes-core/dbus/dbus_1.4.20.bb, 
do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1119 tasks of which 1118 didn't need to 
be rerun and 1 failed.

Summary: 1 task failed:
   
/home/radu/Documents/Development/yocto/poky/meta/recipes-core/dbus/dbus_1.4.20.bb, 
do_configure
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


Radu

--------------080502050103010208030403
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    On 05/28/2012 04:44 PM, Richard Purdie wrote:
    <blockquote cite="mid:1338212677.20169.75.camel@ted" type="cite">
      <pre wrap="">On Mon, 2012-05-28 at 14:30 +0100, Burton, Ross wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On 28 May 2012 14:26, Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei@gherzan.ro">&lt;andrei@gherzan.ro&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">There is an internal test suite for dbus. You can enable building those
tests in configure:
"--enable-tests"
</pre>
        </blockquote>
        <pre wrap="">
Is there a good reason why these shouldn't be always ran when building dbus?
</pre>
      </blockquote>
      <pre wrap="">
Well, we're cross compiling so it depends how they're written and
whether they can run in a cross environment. We've also taken steps to
reduce our build time so if these need something like perl or python,
adding those into the dependency chain is problematic.

I'm open to ideas here but so far they've not been useful so are likely
disabled.

Cheers,

Richard

</pre>
    </blockquote>
    How do I add something in the dependency chain? With --enable-test
    dbus fails at do_configure complaining about<br>
    <br>
    <small><font face="Droid Sans Mono">| configure: Full test coverage
        was requested with --enable-tests=yes<br>
        | configure: This has many dependencies (GLib, dbus-glib,
        Python)<br>
        | checking for i586-poky-linux-pkg-config... no<br>
        | checking for pkg-config...
/home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/pkg-config<br>
        | checking pkg-config is at least version 0.9.0... yes<br>
        | checking for GLIB... yes<br>
        | checking for DBUS_GLIB... yes<br>
        | configure: Full test coverage (--enable-tests=yes) requires
        Python, dbus-python, pygobject<br>
        | checking for a Python interpreter with version &gt;= 2.6...
        python<br>
        | checking for python...
/home/radu/Documents/Development/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/python<br>
        | checking for python version... 2.7<br>
        | checking for python platform... linux2<br>
        | checking for python script directory...
        ${libdir}/python2.7/site-packages<br>
        | checking for python extension module directory...
        ${libdir}/python2.7/site-packages<br>
        | checking for Python modules for full test coverage...
        Traceback (most recent call last):<br>
        |&nbsp;&nbsp; File "&lt;string&gt;", line 1, in &lt;module&gt;<br>
        | ImportError: No module named dbus<br>
        | no<br>
        | configure: error: cannot import dbus, gobject,
        dbus.mainloop.glib Python modules<br>
        | ERROR: oe_runconf failed<br>
        NOTE: package dbus-1.4.20-r3.0: task do_configure: Failed<br>
        ERROR: Task 6
        (/home/radu/Documents/Development/yocto/poky/meta/recipes-core/dbus/dbus_1.4.20.bb,
        do_configure) failed with exit code '1'<br>
        NOTE: Tasks Summary: Attempted 1119 tasks of which 1118 didn't
        need to be rerun and 1 failed.<br>
        <br>
        Summary: 1 task failed:<br>
        &nbsp;
        /home/radu/Documents/Development/yocto/poky/meta/recipes-core/dbus/dbus_1.4.20.bb,
        do_configure<br>
        Summary: There was 1 ERROR message shown, returning a non-zero
        exit code.</font></small><br>
    <br>
    <br>
    Radu<br>
  </body>
</html>

--------------080502050103010208030403--
