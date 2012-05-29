Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SZKWC-0008Lw-Sj
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 13:23:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 May 2012 04:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; 
	d="scan'208,217";a="149689524"
Received: from dell-desktop (HELO [10.237.104.210]) ([10.237.104.210])
	by orsmga002.jf.intel.com with ESMTP; 29 May 2012 04:12:34 -0700
Message-ID: <4FC4B08F.40207@intel.com>
Date: Tue, 29 May 2012 14:18:39 +0300
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
	<1338212677.20169.75.camel@ted> <4FC488CF.2030803@intel.com>
	<4FC49590.6030601@intel.com>
	<CAK18fxFZ_rYXEeeaLwH1Npx=f6dUJw2LHiKxkBg=OKm6=yAhEQ@mail.gmail.com>
	<4FC499C4.8000904@intel.com> <4FC499E9.6090108@windriver.com>
In-Reply-To: <4FC499E9.6090108@windriver.com>
Subject: Re: dbus test suite
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
X-List-Received-Date: Tue, 29 May 2012 11:23:17 -0000
Content-Type: multipart/alternative;
	boundary="------------030101010007000301040308"

--------------030101010007000301040308
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 05/29/2012 12:42 PM, Florin Sarbu wrote:
> that would be dbus-glib you need at this point as Andrei pointed out, 
> not python-dbus
dbus-glib and python-dbus are building fine (with --disable-tests), 
however dbus is still crushing in do_configure (same way as before). The 
question is, where do I add these libraries as dependencies for dbus, 
because I assume they have to be somehow inserted into the dependency 
chain. This happens when I use --enable-tests (the whole test suite).

When I use --enable-embedded-tests or --enable-modular-tests or 
--enable-installed-tests (all of wich are subsets of the whole test 
suite) I get no complaints about missing dependency, instead it crashes 
at do_compile because of missing dbus/dbus-glib-lowlevel.h

Radu

--------------030101010007000301040308
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
    On 05/29/2012 12:42 PM, Florin Sarbu wrote:
    <blockquote cite="mid:4FC499E9.6090108@windriver.com" type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      that would be dbus-glib you need at this point as Andrei pointed
      out, not python-dbus<br>
    </blockquote>
    dbus-glib and python-dbus are building fine (with <small><font
        face="DejaVu Sans Mono">--disable-tests</font></small>), however
    dbus is still crushing in do_configure (same way as before). The
    question is, where do I add these libraries as dependencies for
    dbus, because I assume they have to be somehow inserted into the
    dependency chain. This happens when I use <small><font face="DejaVu
        Sans Mono">--enable-tests</font></small> (the whole test suite).<br>
    <br>
    When I use <small><font face="DejaVu Sans Mono">--enable-embedded-tests</font></small>
    or <small><font face="Droid Sans Mono">--enable-modular-tests</font></small>
    or <small><font face="DejaVu Sans Mono">--enable-installed-tests</font></small>
    (all of wich are subsets of the whole test suite) I get no
    complaints about missing dependency, instead it crashes at
    do_compile because of missing <small><font face="Droid Sans Mono">dbus/dbus-glib-lowlevel.h</font></small><br>
    <br>
    Radu<br>
  </body>
</html>

--------------030101010007000301040308--
