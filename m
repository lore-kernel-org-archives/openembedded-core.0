Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SZGSR-00023G-Lw
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 09:03:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 May 2012 23:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; 
	d="scan'208,217";a="145648295"
Received: from dell-desktop (HELO [10.237.104.210]) ([10.237.104.210])
	by orsmga001.jf.intel.com with ESMTP; 28 May 2012 23:52:49 -0700
Message-ID: <4FC473AD.6060100@intel.com>
Date: Tue, 29 May 2012 09:58:53 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
	<4FC35FAD.7090505@intel.com> <4FC35FBA.2060200@gherzan.ro>
	<4FC37C81.6080200@intel.com>
	<CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com>
	<4FC46C84.5090408@intel.com>
In-Reply-To: <4FC46C84.5090408@intel.com>
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
X-List-Received-Date: Tue, 29 May 2012 07:03:08 -0000
Content-Type: multipart/alternative;
	boundary="------------070407070409020401080305"

--------------070407070409020401080305
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 05/29/2012 09:28 AM, Radu Moisan wrote:
>
>
> On 05/28/2012 04:26 PM, Andrei Gherzan wrote:
>> On Mon, May 28, 2012 at 4:24 PM, Radu Moisan <radu.moisan@intel.com 
>> <mailto:radu.moisan@intel.com>> wrote:
>>
>>     On 05/28/2012 02:21 PM, Andrei Gherzan wrote:
>>
>>         Dbus comes with a test suite. Running those should be a must.
>>
>>     I could not find how to run the test suite. I've tried
>>     dbus-daemon, dbus-monitor, and the rest, but non of them have
>>     options for some runtime checks. Other than that I imagine the
>>     test suite you mention must come in a separate package. Do we
>>     have a recipe for that to? Which image should I build to have
>>     that package included and be able to test?
>>
>>
>> There is an internal test suite for dbus. You can enable building 
>> those tests in configure:
>> "--enable-tests"
>>
>> @g
>>
> So, isn't there a way of specifying build options in some file that 
> bitbake will use afterwards to do the build? For instance where from 
> ./configure is executed (from within bitbake I assume). I tried to 
> take a look over configure file of dbus but could not figure out a way 
> of hardcoding the --enable-tests option (not that hardcoding would be 
> a best choice, but for testing purposes I considered it a choice). Any 
> info on this is much appreciated.
>
> Thanks,
> Radu
Found it in oe_runconf(). Will try to build them, see what comes out of 
it :)
Any comments still apreciated.

Radu

--------------070407070409020401080305
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
    On 05/29/2012 09:28 AM, Radu Moisan wrote:
    <blockquote cite="mid:4FC46C84.5090408@intel.com" type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <br>
      <br>
      On 05/28/2012 04:26 PM, Andrei Gherzan wrote:
      <blockquote
cite="mid:CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com"
        type="cite">
        <div class="gmail_quote">On Mon, May 28, 2012 at 4:24 PM, Radu
          Moisan <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:radu.moisan@intel.com" target="_blank">radu.moisan@intel.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div class="im">On 05/28/2012 02:21 PM, Andrei Gherzan
              wrote:<br>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex"> Dbus
                comes with a test suite. Running those should be a must.<br>
              </blockquote>
            </div>
            I could not find how to run the test suite. I've tried
            dbus-daemon, dbus-monitor, and the rest, but non of them
            have options for some runtime checks. Other than that I
            imagine the test suite you mention must come in a separate
            package. Do we have a recipe for that to? Which image should
            I build to have that package included and be able to test?<span
              class="HOEnZb"><font color="#888888"><br>
                <br>
              </font></span></blockquote>
          <div><br>
          </div>
          <div>There is an internal test suite for dbus. You can enable
            building those tests in configure:</div>
          <div>"--enable-tests"</div>
          <div><br>
          </div>
          <div>@g</div>
        </div>
        <br>
      </blockquote>
      So, isn't there a way of specifying build options in some file
      that bitbake will use afterwards to do the build? For instance
      where from ./configure is executed (from within bitbake I assume).
      I tried to take a look over configure file of dbus but could not
      figure out a way of hardcoding the --enable-tests option (not that
      hardcoding would be a best choice, but for testing purposes I
      considered it a choice). Any info on this is much appreciated.<br>
      <br>
      Thanks,<br>
      Radu<br>
    </blockquote>
    Found it in oe_runconf(). Will try to build them, see what comes out
    of it :)<br>
    Any comments still apreciated.<br>
    <br>
    Radu<br>
  </body>
</html>

--------------070407070409020401080305--
