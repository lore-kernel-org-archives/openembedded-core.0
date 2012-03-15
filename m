Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1S889o-0000ER-4g
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 11:43:44 +0100
Received: from [192.168.0.26] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 97D9E2809C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 10:05:19 +0000 (GMT)
Message-ID: <4F61C5DF.8090705@communistcode.co.uk>
Date: Thu, 15 Mar 2012 10:35:11 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120217 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F4B890D.90809@communistcode.co.uk>
In-Reply-To: <4F4B890D.90809@communistcode.co.uk>
Subject: Re: cpufrequtils do_install issue
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
X-List-Received-Date: Thu, 15 Mar 2012 10:43:44 -0000
Content-Type: multipart/alternative;
	boundary="------------070405020805090801060708"

--------------070405020805090801060708
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/12 13:45, Jack Mitchell wrote:
> I am having issues compiling the systemd-image for beaglebone under 
> Angstrom. I receive the following error message which seems to state 
> that 'install' is missing, is anyone else having trouble or could 
> provide some insight to this?
>
>     ERROR: Function failed: do_install (see
>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/temp/log.do_install.16223
>     for further information)
>     + cd
>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/git
>     + do_install
>     + oe_runmake -e install
>     DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
>     + '[' xmake = x ']'
>     + bbnote make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
>     'LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc'
>     STRIPCMD=echo -e install
>     DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
>     + echo 'NOTE: make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
>     LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc STRIPCMD=echo
>     -e install
>     DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image'
>     NOTE: make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
>     LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc STRIPCMD=echo
>     -e install
>     DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
>     + make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
>     'LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc'
>     STRIPCMD=echo -e install
>     DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image
>     /usr/bin/install -c -d
>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/lib
>     /usr/bin/install -c -d
>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/bin
>     /usr/bin/install -c -m 644 -D man/cpufreq-set.1
>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/share/man/man1/cpufreq-set.1
>     /usr/bin/install -c -d
>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/share/locale
>     make: /usr/bin/install: Command not found
>     make: *** [install-lib] Error 127
>     make: *** Waiting for unfinished jobs....
>     make: /usr/bin/install: Command not found
>     make: *** [install-gmo] Error 127
>     make: /usr/bin/install: Command not found
>     make: *** [install-tools] Error 127
>     Translating de make: /usr/bin/install: Command not found
>     make: *** [install-man] Error 127
>     ...... done.
>     54 translated messages.
>     Translating fr ...... done.
>     45 translated messages, 7 fuzzy translations, 2 untranslated messages.
>     Translating it ...... done.
>     54 translated messages.
>     Translating cs ...... done.
>     45 translated messages, 7 fuzzy translations, 2 untranslated messages.
>     Translating pt ...... done.
>     54 translated messages.
>     Translating ca ...... done.
>     54 translated messages.
>     + die 'oe_runmake failed'
>     + bbfatal 'oe_runmake failed'
>     + echo 'ERROR: oe_runmake failed'
>     ERROR: oe_runmake failed
>     + exit 1
>
>
> Regards,
> Jack.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Ok, I fixed this finally! In archlinux `install` is not located in 
/usr/bin/install but in /bin/install so a quick symlink and that was 
fixed. However, should bitbake be going into my system to use install 
like this, and should it be hard-coded in cpufrequtils?

Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


--------------070405020805090801060708
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 27/02/12 13:45, Jack Mitchell wrote:
    <blockquote cite="mid:4F4B890D.90809@communistcode.co.uk"
      type="cite">
      <meta http-equiv="content-type" content="text/html;
        charset=ISO-8859-1">
      <tt>I am having issues compiling the systemd-image for beaglebone
        under Angstrom. I receive the following error message which
        seems to state that 'install' is missing, is anyone else having
        trouble or could provide some insight to this?<br>
        <br>
      </tt>
      <blockquote><tt>ERROR: Function failed: do_install (see
          /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/temp/log.do_install.16223

          for further information)</tt><br>
        <tt>+ cd
/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/git</tt><br>
        <tt>+ do_install</tt><br>
        <tt>+ oe_runmake -e install
DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image</tt><br>
        <tt>+ '[' xmake = x ']'</tt><br>
        <tt>+ bbnote make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
          'LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc'
          STRIPCMD=echo -e install
DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image</tt><br>
        <tt>+ echo 'NOTE: make -j12 V=1
          CROSS=arm-angstrom-linux-gnueabi-
          LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc
          STRIPCMD=echo -e install
DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image'</tt><br>
        <tt>NOTE: make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
          LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc
          STRIPCMD=echo -e install
DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image</tt><br>
        <tt>+ make -j12 V=1 CROSS=arm-angstrom-linux-gnueabi-
          'LIBTOOL=arm-angstrom-linux-gnueabi-libtool --tag cc'
          STRIPCMD=echo -e install
DESTDIR=/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image</tt><br>
        <tt>/usr/bin/install -c -d
/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/lib</tt><br>
        <tt>/usr/bin/install -c -d
/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/bin</tt><br>
        <tt>/usr/bin/install -c -m 644 -D man/cpufreq-set.1
/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/share/man/man1/cpufreq-set.1</tt><br>
        <tt>/usr/bin/install -c -d
/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/cpufrequtils-008-r3/image/usr/share/locale</tt><br>
        <tt>make: /usr/bin/install: Command not found</tt><br>
        <tt>make: *** [install-lib] Error 127</tt><br>
        <tt>make: *** Waiting for unfinished jobs....</tt><br>
        <tt>make: /usr/bin/install: Command not found</tt><br>
        <tt>make: *** [install-gmo] Error 127</tt><br>
        <tt>make: /usr/bin/install: Command not found</tt><br>
        <tt>make: *** [install-tools] Error 127</tt><br>
        <tt>Translating de make: /usr/bin/install: Command not found</tt><br>
        <tt>make: *** [install-man] Error 127</tt><br>
        <tt>...... done.</tt><br>
        <tt>54 translated messages.</tt><br>
        <tt>Translating fr ...... done.</tt><br>
        <tt>45 translated messages, 7 fuzzy translations, 2 untranslated
          messages.</tt><br>
        <tt>Translating it ...... done.</tt><br>
        <tt>54 translated messages.</tt><br>
        <tt>Translating cs ...... done.</tt><br>
        <tt>45 translated messages, 7 fuzzy translations, 2 untranslated
          messages.</tt><br>
        <tt>Translating pt ...... done.</tt><br>
        <tt>54 translated messages.</tt><br>
        <tt>Translating ca ...... done.</tt><br>
        <tt>54 translated messages.</tt><br>
        <tt>+ die 'oe_runmake failed'</tt><br>
        <tt>+ bbfatal 'oe_runmake failed'</tt><br>
        <tt>+ echo 'ERROR: oe_runmake failed'</tt><br>
        <tt>ERROR: oe_runmake failed</tt><br>
        <tt>+ exit 1</tt><br>
      </blockquote>
      <tt><br>
        Regards,<br>
        Jack.<br>
      </tt> <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <tt><br>
      Ok, I fixed this finally! In archlinux `install` is not located in
      /usr/bin/install but in /bin/install so a quick symlink and that
      was fixed. However, should bitbake be going into my system to use
      install like this, and should it be hard-coded in cpufrequtils?<br>
      <br>
      Jack.<br>
    </tt><br>
    <pre class="moz-signature" cols="72">-- 

  Jack Mitchell (<a class="moz-txt-link-abbreviated" href="mailto:jack@embed.me.uk">jack@embed.me.uk</a>)             
  Embedded Systems Engineer
  <a class="moz-txt-link-freetext" href="http://www.embed.me.uk">http://www.embed.me.uk</a>

--
</pre>
  </body>
</html>

--------------070405020805090801060708--
