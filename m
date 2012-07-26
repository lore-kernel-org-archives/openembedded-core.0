Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SuOCg-0000Dx-Ci
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:34:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2012 06:22:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="186776477"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2012 06:22:38 -0700
Message-ID: <501144FE.4040201@intel.com>
Date: Thu, 26 Jul 2012 16:24:14 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<lymx2mvfe8.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lymx2mvfe8.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Thu, 26 Jul 2012 13:34:10 -0000
Content-Type: multipart/alternative;
	boundary="------------060109060201050205050500"

--------------060109060201050205050500
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

it does not crash at runtime. You can try

dbus-launch --auto-syntax

it'll start a bus and print out the information like:

DBUS_SESSION_BUS_ADDRESS='unix:abstract=/tmp/dbus-N48lpeD2TP,guid=0f3cd66fdbdc2f436a9356790002eaa1';
export DBUS_SESSION_BUS_ADDRESS;
DBUS_SESSION_BUS_PID=23640;

Radu

On 07/26/2012 04:08 PM, Enrico Scholz wrote:
> Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>
> writes:
>
>> RPROVIDES_${PN} += "dbus-x11"
> This is wrong because 'dbus' does not provide dbus-x11 when x11 is
> disabled by distro.  Packages which require dbus-launch from 'dbus-x11'
> will install fine but will fail at runtime.
>
>
> Enrico
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------060109060201050205050500
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    it does not crash at runtime. You can try <br>
    <br>
    dbus-launch --auto-syntax<br>
    <br>
    it'll start a bus and print out the information like:<br>
    <br>
    <font face="Droid Sans Mono"><small>DBUS_SESSION_BUS_ADDRESS='unix:abstract=/tmp/dbus-N48lpeD2TP,guid=0f3cd66fdbdc2f436a9356790002eaa1';<br>
        export DBUS_SESSION_BUS_ADDRESS;<br>
        DBUS_SESSION_BUS_PID=23640;<br>
      </small></font><br>
    Radu<br>
    <br>
    <div class="moz-cite-prefix">On 07/26/2012 04:08 PM, Enrico Scholz
      wrote:<br>
    </div>
    <blockquote
      cite="mid:lymx2mvfe8.fsf@ensc-virt.intern.sigma-chemnitz.de"
      type="cite">
      <pre wrap="">Koen Kooi <a class="moz-txt-link-rfc2396E" href="mailto:koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org">&lt;koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org&gt;</a>
writes:

</pre>
      <blockquote type="cite">
        <pre wrap="">RPROVIDES_${PN} += "dbus-x11"
</pre>
      </blockquote>
      <pre wrap="">
This is wrong because 'dbus' does not provide dbus-x11 when x11 is
disabled by distro.  Packages which require dbus-launch from 'dbus-x11'
will install fine but will fail at runtime.


Enrico

_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060109060201050205050500--
