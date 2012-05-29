Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SZGsN-0004ij-0H
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 09:29:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 May 2012 00:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; 
	d="scan'208,217";a="145657184"
Received: from dell-desktop (HELO [10.237.104.210]) ([10.237.104.210])
	by orsmga001.jf.intel.com with ESMTP; 29 May 2012 00:19:18 -0700
Message-ID: <4FC479E2.3010601@intel.com>
Date: Tue, 29 May 2012 10:25:22 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
CC: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
References: <50D17BD22A23EE4A887974F6B588203864FDA4F6@ALA-MBB.corp.ad.wrs.com>
In-Reply-To: <50D17BD22A23EE4A887974F6B588203864FDA4F6@ALA-MBB.corp.ad.wrs.com>
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
X-List-Received-Date: Tue, 29 May 2012 07:29:55 -0000
Content-Type: multipart/alternative;
	boundary="------------060403010806010500050804"

--------------060403010806010500050804
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

this is what I was looking for. I'll try it soon as my "hard-codded" 
version finshes buiding. thanks.

Radu

On 05/29/2012 10:01 AM, Sarbu, Florin-Ionut (Florin) wrote:
> EXTRA_OECONF+="--enable-tests" may be what you are looking for.
>
> -----Original Message-----
> *From: *Radu Moisan [radu.moisan@intel.com <mailto:radu.moisan@intel.com>]
> *Sent: *Monday, May 28, 2012 11:24 PM Pacific Standard Time
> *To: *openembedded-core@lists.openembedded.org
> *Subject: *Re: [OE-core] [PATCH 0/3] Package Updates
>
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

--------------060403010806010500050804
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    this is what I was looking for. I'll try it soon as my "hard-codded"
    version finshes buiding. thanks.<br>
    <br>
    Radu<br>
    <br>
    On 05/29/2012 10:01 AM, Sarbu, Florin-Ionut (Florin) wrote:
    <blockquote
cite="mid:50D17BD22A23EE4A887974F6B588203864FDA4F6@ALA-MBB.corp.ad.wrs.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      EXTRA_OECONF+="--enable-tests" may be what you are looking for.<br>
      <br>
      -----Original Message-----<br>
      <b>From:&nbsp;</b>Radu Moisan [<a moz-do-not-send="true"
        href="mailto:radu.moisan@intel.com">radu.moisan@intel.com</a>]<br>
      <b>Sent:&nbsp;</b>Monday, May 28, 2012 11:24 PM Pacific Standard Time<br>
      <b>To:&nbsp;</b><a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a><br>
      <b>Subject:&nbsp;</b>Re: [OE-core] [PATCH 0/3] Package Updates<br>
      <br>
      <br>
      <br>
      On 05/28/2012 04:26 PM, Andrei Gherzan wrote:
      <blockquote
cite="mid:CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com"
        type="cite">
        <div class="gmail_quote">On Mon, May 28, 2012 at 4:24 PM, Radu
          Moisan <span dir="ltr">
            &lt;<a moz-do-not-send="true"
              href="mailto:radu.moisan@intel.com" target="_blank">radu.moisan@intel.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div class="im">On 05/28/2012 02:21 PM, Andrei Gherzan
              wrote:<br>
              <blockquote class="gmail_quote" style="margin:0 0 0
                .8ex;border-left:1px #ccc solid;padding-left:1ex">
                Dbus comes with a test suite. Running those should be a
                must.<br>
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
  </body>
</html>

--------------060403010806010500050804--
