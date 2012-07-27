Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Sudzl-0005y7-6t
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 08:25:53 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2012 23:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="127470603"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2012 23:14:20 -0700
Message-ID: <5012321D.8020802@intel.com>
Date: Fri, 27 Jul 2012 09:15:57 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<lyipdavezy.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LZKHiL75khHuircKy7Xv0aVW29DJjGaCSxXh+K1p6F1oQ@mail.gmail.com>
	<501230CF.6090000@intel.com>
In-Reply-To: <501230CF.6090000@intel.com>
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Fri, 27 Jul 2012 06:25:53 -0000
Content-Type: multipart/alternative;
	boundary="------------050804000205090904060306"

--------------050804000205090904060306
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 07/27/2012 09:10 AM, Radu Moisan wrote:
>
> On 07/27/2012 12:12 AM, Burton, Ross wrote:
>> On 26 July 2012 14:17, Enrico Scholz<enrico.scholz@sigma-chemnitz.de>  wrote:
>>> Radu Moisan<radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>>> writes:
>>>
>>>> Followed suggestions from Bugz 2261:
>>>>
>>>> 1) remove the --with-x/--without-x configure arguments.
>>> why? They are valid ./configure options and common when evaluating the
>>> x11 distro-feature.  Selecting them explicitly makes the build more
>>> predictable and detects configuration errors earlier.
>>>
>>> Sense of '--without-x' was disabling of x11 dependency, but not turning
>>> off the x11-autolaunch feature.
>> That's my fault, and I can't remember my reasoning.  Probably best to
>> bring it back so the recipe is explicit.
>>
>> Radu, bring back this fragment, but correct the options
>>
>> EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11',
>> '--enable-x11-autolaunch', '--disable-x11-autolaunch', d)}"
>>
>> Ross
>>
> I've looked into the configure script and found that autolaunch 
> feature is depending on x11, in other words using --with-x/--without-x 
> implies --enable-x11-autolaunch/--disable-x11-autolaunch, so I guess 
> the initial EXTRA_OECONF_X line will do pretty much the same thing.
>
> EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11', 
> '--with-x', '--without-x', d)}"
>
and the same applies for EXTRA_OECONF_X_virtclass-native disabling X 
will disable autolaunch feature, so I'll keep the initial line as well.

Radu

--------------050804000205090904060306
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 07/27/2012 09:10 AM, Radu Moisan
      wrote:<br>
    </div>
    <blockquote cite="mid:501230CF.6090000@intel.com" type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <br>
      <div class="moz-cite-prefix">On 07/27/2012 12:12 AM, Burton, Ross
        wrote:<br>
      </div>
      <blockquote
cite="mid:CAJTo0LZKHiL75khHuircKy7Xv0aVW29DJjGaCSxXh+K1p6F1oQ@mail.gmail.com"
        type="cite">
        <pre wrap="">On 26 July 2012 14:17, Enrico Scholz <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:enrico.scholz@sigma-chemnitz.de">&lt;enrico.scholz@sigma-chemnitz.de&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Radu Moisan <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org">&lt;radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org&gt;</a>
writes:

</pre>
          <blockquote type="cite">
            <pre wrap="">Followed suggestions from Bugz 2261:

1) remove the --with-x/--without-x configure arguments.
</pre>
          </blockquote>
          <pre wrap="">why? They are valid ./configure options and common when evaluating the
x11 distro-feature.  Selecting them explicitly makes the build more
predictable and detects configuration errors earlier.

Sense of '--without-x' was disabling of x11 dependency, but not turning
off the x11-autolaunch feature.
</pre>
        </blockquote>
        <pre wrap="">That's my fault, and I can't remember my reasoning.  Probably best to
bring it back so the recipe is explicit.

Radu, bring back this fragment, but correct the options

EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11',
'--enable-x11-autolaunch', '--disable-x11-autolaunch', d)}"

Ross

</pre>
      </blockquote>
      I've looked into the configure script and found that autolaunch
      feature is depending on x11, in other words using <small><font
          face="Droid Sans Mono">--with-x</font></small>/<small><font
          face="Droid Sans Mono">--without-x</font></small> implies <font
        face="Droid Sans Mono"><small>--enable-x11-autolaunch</small></font>/<small><font
          face="Droid Sans Mono">--disable-x11-autolaunch</font></small>,
      so I guess the initial <small><font face="Droid Sans Mono">EXTRA_OECONF_X</font></small>
      line will do pretty much the same thing.<br>
      <br>
      <small><font face="Droid Sans Mono">EXTRA_OECONF_X =
          "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x',
          '--without-x', d)}"</font></small><br>
      <br>
    </blockquote>
    and the same applies for <small><font face="Droid Sans Mono">EXTRA_OECONF_X_virtclass-native</font></small>
    disabling X will disable autolaunch feature, so I'll keep the
    initial line as well.<br>
    <br>
    Radu<br>
  </body>
</html>

--------------050804000205090904060306--
