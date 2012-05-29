Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SZN6k-00056c-SA
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 16:09:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 May 2012 06:58:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="105407930"
Received: from dell-desktop (HELO [10.237.104.210]) ([10.237.104.210])
	by AZSMGA002.ch.intel.com with ESMTP; 29 May 2012 06:58:51 -0700
Message-ID: <4FC4D788.70507@intel.com>
Date: Tue, 29 May 2012 17:04:56 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>	<4FC35FAD.7090505@intel.com>
	<4FC35FBA.2060200@gherzan.ro>	<4FC37C81.6080200@intel.com>	<CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com>	<CAJTo0LZ5WuTMA=yuLm65PX-sp2Rx_L8UAg4JL1j5JcHvLC=o9A@mail.gmail.com>	<1338212677.20169.75.camel@ted>
	<CAK18fxFNrZPCZK2Ny6vr2qz6oHDFvtAA4Jw9SjjAb0djcxN7SQ@mail.gmail.com>
	<4FC4BCC8.7090503@balister.org>
In-Reply-To: <4FC4BCC8.7090503@balister.org>
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
X-List-Received-Date: Tue, 29 May 2012 14:09:11 -0000
Content-Type: multipart/alternative;
	boundary="------------020608050507050503080007"

--------------020608050507050503080007
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 05/29/2012 03:10 PM, Philip Balister wrote:
> On 05/28/2012 09:58 AM, Andrei Gherzan wrote:
>> On Mon, May 28, 2012 at 4:44 PM, Richard Purdie<
>> richard.purdie@linuxfoundation.org>  wrote:
>>
>>> On Mon, 2012-05-28 at 14:30 +0100, Burton, Ross wrote:
>>>> On 28 May 2012 14:26, Andrei Gherzan<andrei@gherzan.ro>  wrote:
>>>>> There is an internal test suite for dbus. You can enable building those
>>>>> tests in configure:
>>>>> "--enable-tests"
>>>> Is there a good reason why these shouldn't be always ran when building
>>> dbus?
>>>
>>> Well, we're cross compiling so it depends how they're written and
>>> whether they can run in a cross environment. We've also taken steps to
>>> reduce our build time so if these need something like perl or python,
>>> adding those into the dependency chain is problematic.
>>>
>>>
>> The fact that these tests are not compiled by default it's good. As a
>> normal user of dbus i don't need those. But while doing an update a compile
>> with tests i think it's necessary.
> Can you build the tests and package them separately? Then they could be
> installed as part of a test image.
>
> Philip
>
That would certainly be an option, but I really don't know where to 
start from :)
Meanwhile, I tried to further debug my scenario with 
--enable-modular-tests and I tried to manually resolve the missing *.h 
files (by copying them from dbus-glib to dbus include folder) just to 
see where is goes. I found out, somehow expected, that further undefined 
reference errors were thrown (to functions from dbus-glib). Thus now I'm 
looking to point somehow dbus tests to link against dbus-glib. Does 
anyone have a clue where should I look?

Radu

--------------020608050507050503080007
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
    On 05/29/2012 03:10 PM, Philip Balister wrote:
    <blockquote cite="mid:4FC4BCC8.7090503@balister.org" type="cite">
      <pre wrap="">On 05/28/2012 09:58 AM, Andrei Gherzan wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On Mon, May 28, 2012 at 4:44 PM, Richard Purdie &lt;
<a class="moz-txt-link-abbreviated" href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:

</pre>
        <blockquote type="cite">
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
Is there a good reason why these shouldn't be always ran when building
</pre>
          </blockquote>
          <pre wrap="">dbus?

Well, we're cross compiling so it depends how they're written and
whether they can run in a cross environment. We've also taken steps to
reduce our build time so if these need something like perl or python,
adding those into the dependency chain is problematic.


</pre>
        </blockquote>
        <pre wrap="">The fact that these tests are not compiled by default it's good. As a
normal user of dbus i don't need those. But while doing an update a compile
with tests i think it's necessary.
</pre>
      </blockquote>
      <pre wrap="">
Can you build the tests and package them separately? Then they could be
installed as part of a test image.

Philip

</pre>
    </blockquote>
    That would certainly be an option, but I really don't know where to
    start from :)<br>
    Meanwhile, I tried to further debug my scenario with
    --enable-modular-tests and I tried to manually resolve the missing
    *.h files (by copying them from dbus-glib to dbus include folder)
    just to see where is goes. I found out, somehow expected, that
    further <small><font face="DejaVu Sans Mono">undefined reference</font></small>
    errors were thrown (to functions from dbus-glib). Thus now I'm
    looking to point somehow dbus tests to link against dbus-glib. Does
    anyone have a clue where should I look?<br>
    <br>
    Radu<br>
  </body>
</html>

--------------020608050507050503080007--
