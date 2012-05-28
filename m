Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SYy4q-0004Cx-Af
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 13:25:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 May 2012 04:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="171962039"
Received: from dell-desktop (HELO [10.237.104.210]) ([10.237.104.210])
	by fmsmga002.fm.intel.com with ESMTP; 28 May 2012 04:15:14 -0700
Message-ID: <4FC35FAD.7090505@intel.com>
Date: Mon, 28 May 2012 14:21:17 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
In-Reply-To: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Mon, 28 May 2012 11:25:32 -0000
Content-Type: multipart/alternative;
	boundary="------------030603050702030108070707"

--------------030603050702030108070707
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/28/2012 01:55 PM, Burton, Ross wrote:
> Hi,
>
> First, sorry for the thread breaking, I've just joined this list and I
> didn't get this mail.
>
> Koen Kooi wrote:
>>>   dbus: Update to version 1.5.12
>> First: how was this tested?
the only testing I've done so far is to ensure it build and then check 
the version with dbus-daemon --version
>> Second: From the dbus website:
>>
>>         The current stable branch is D-Bus 1.4.x. This is the recommended
>> version for most purposes.
>>         The current development branch is D-Bus 1.5.x, which will lead to a
>> 1.6.x stable branch in future.
>>
>> Why are you deleting the stable branch based recipe and add one from
>> the development branch?
> The definition of stable and unstable in DBus isn't as hard and fast
> as you'd really like -- the 1.5.x cycle is very slow and mostly stable
> from a crashy point of view.
>
> I'd say there is a good rationale for having both 1.4.x (.20, so that
> also needs an upgrade) and 1.5.x in oe-core.  The default should be
> 1.4 for obvious reasons (it's the stable release), and 1.5 should be
> there for people who need the improvements.  In particular there has
> been a lot of work on performance, so anyone heavily using dbus (i.e.
> anything using Telepathy, which is where the improvements came from)
> should look at 1.5 because it will give a noticeable improvement on
> slower hardware.
>
> Ross
I suppose, then, I should add another recipe and support both. However, 
can someone point out how can I make one of them default.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--------------030603050702030108070707
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    On 05/28/2012 01:55 PM, Burton, Ross wrote:
    <blockquote
cite="mid:CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com"
      type="cite">
      <pre wrap="">Hi,

First, sorry for the thread breaking, I've just joined this list and I
didn't get this mail.

Koen Kooi wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap=""> dbus: Update to version 1.5.12
</pre>
        </blockquote>
        <pre wrap="">
First: how was this tested?</pre>
      </blockquote>
    </blockquote>
    the only testing I've done so far is to ensure it build and then
    check the version with <font face="Droid Sans Mono">dbus-daemon
      --version</font><br>
    <blockquote
cite="mid:CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com"
      type="cite">
      <blockquote type="cite">
        <pre wrap="">
Second: From the dbus website:

       The current stable branch is D-Bus 1.4.x. This is the recommended
version for most purposes.
       The current development branch is D-Bus 1.5.x, which will lead to a
1.6.x stable branch in future.

Why are you deleting the stable branch based recipe and add one from
the development branch?
</pre>
      </blockquote>
      <pre wrap="">
The definition of stable and unstable in DBus isn't as hard and fast
as you'd really like -- the 1.5.x cycle is very slow and mostly stable
from a crashy point of view.

I'd say there is a good rationale for having both 1.4.x (.20, so that
also needs an upgrade) and 1.5.x in oe-core.  The default should be
1.4 for obvious reasons (it's the stable release), and 1.5 should be
there for people who need the improvements.  In particular there has
been a lot of work on performance, so anyone heavily using dbus (i.e.
anything using Telepathy, which is where the improvements came from)
should look at 1.5 because it will give a noticeable improvement on
slower hardware.

Ross
</pre>
    </blockquote>
    I suppose, then, I should add another recipe and support both.
    However, can someone point out how can I make one of them default.<br>
    <blockquote
cite="mid:CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com"
      type="cite">
      <pre wrap="">
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
  </body>
</html>

--------------030603050702030108070707--
