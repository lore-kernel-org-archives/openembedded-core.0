Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id CE4516059A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:24:29 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 6705433423
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 10:24:30 +0200 (CEST)
Message-ID: <53EC723D.5000807@pseudoterminal.org>
Date: Thu, 14 Aug 2014 10:24:29 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <53EBD780.9060005@mlbassoc.com>	<CAP9ODKpND6P-x7ZKE9SuZ6vbfFF8RxoVSL3X9UDzj-WhV9yTpw@mail.gmail.com>	<CAMKF1soYYaAQ9tY7462=zEgo9urFaaAV-qDk6qhO=8_n0xdDyA@mail.gmail.com>	<53EC6F53.4070908@pseudoterminal.org>
	<53EC71B1.3000200@pabigot.com>
In-Reply-To: <53EC71B1.3000200@pabigot.com>
Subject: Re: GCC 4.9 considered evil
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
X-List-Received-Date: Thu, 14 Aug 2014 08:24:37 -0000
Content-Type: multipart/alternative;
	boundary="------------060607070805040609090302"

--------------060607070805040609090302
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2014 10:22 AM, Peter A. Bigot wrote:
> On 08/14/2014 03:12 AM, Carlos Rafael Giani wrote:
>> On 08/14/2014 02:46 AM, Khem Raj wrote:
>>>
>>>
>>> On Wednesday, August 13, 2014, Otavio Salvador 
>>> <otavio@ossystems.com.br <mailto:otavio@ossystems.com.br>> wrote:
>>>
>>>     On Wed, Aug 13, 2014 at 6:24 PM, Gary Thomas <gary@mlbassoc.com
>>>     <javascript:;>> wrote:
>>>     > I've found that the latest GCC doesn't work very well, at
>>>     > least not on ARM (and obviously other architectures as well [1])
>>>     > When I build Google Chromium browser for my i.MX boards using
>>>     > GCC-4.9.x, no pages can be rendered - massive bloodshed and
>>>     > failures are shown on the console.  If I use the older GCC 4.8.2,
>>>     > everything else the same, all is well.
>>>     >
>>>     > Here's my configuration:
>>>     > BB_VERSION        = "1.23.1"
>>>     > BUILD_SYS         = "x86_64-linux"
>>>     > NATIVELSBSTRING   = "Ubuntu-13.10"
>>>     > TARGET_SYS        = "arm-amltd-linux-gnueabi"
>>>     > MACHINE           = "teton-p0382"
>>>     > DISTRO            = "amltd"
>>>     > DISTRO_VERSION    = "1.6+snapshot-20140812"
>>>     > TUNE_FEATURES     = "arm armv7a vfp neon callconvention-hard
>>>     cortexa9"
>>>     > TARGET_FPU        = "vfp-neon"
>>>     > meta              =
>>>     "master:86afd7eb7c679eb065706137f28f44248f3fbc5a"
>>>     > meta-amltd        =
>>>     "master:899529b4184dc9e3e291e7fcdbbf157233db056d"
>>>     > meta-teton-imx6-p0382 =
>>>     "master:9188e2f8fafd203c95dcd7a3c79cb38a1568e9b5"
>>>     > meta-fsl-arm      =
>>>     "master:b0cf5c78c5f98c5977ae556d331e7495648f154c"
>>>     > meta-fsl-arm-extra =
>>>     "master:12e560967b7136222c325d11633295fe3a0c701c"
>>>     > meta-browser      =
>>>     "master:da93c8e386133a15eff1414d9307c8f2c7a44787"
>>>     >
>>>     > Should this be filed as a bug?  I don't have much data other
>>>     than it
>>>     > simply breaks (and chrome is not the easiest thing to debug!).
>>>      Other
>>>     > applications seem OK, but I am loathe to trust it...
>>>     >
>>>     > I'm going to hold onto GCC-4.8.x for my $DISTRO at least (and
>>>     I hope
>>>     > it doesn't vanish like 4.7.x did too quickly).
>>>     >
>>>     > [1]
>>>     >
>>>     http://slashdot.org/story/14/07/27/1838219/linus-torvalds-gcc-490-seems-to-be-terminally-broken
>>>     >
>>>     > Note: I've also tried this on qemux86 (a totally different
>>>     > architecture) and chrome bombs just as badly!
>>>
>>>     I confirm that GCC 4.9 does NOT work for Chromium 35. At this
>>>     moment I
>>>     am not aware of any fix for it.
>>>
>>>
>>> Again Its a broad brush statement. Something concrete is needed if 
>>> some.action is to taken
>>>
>>>
>>>     IIRC the Chromium 37 works though.
>>>
>>>
>>> Well then its less chance.that someone will fix 35
>>>
>>>     --
>>>     Otavio Salvador                             O.S. Systems
>>>     http://www.ossystems.com.br http://code.ossystems.com.br
>>>     Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>>     --
>>>     _______________________________________________
>>>     Openembedded-core mailing list
>>>     Openembedded-core@lists.openembedded.org <javascript:;>
>>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>>
>>
>>
>> The problem is that narrowing down is very difficult, since the 
>> problems manifest themselves as seemingly random stack corruptions. I 
>> have tried to dig into it, but got nowhere. Pointers suddenly became 
>> null for no apparent reason, or were corrupted, free() calls failed, 
>> values on the stack suddenly changed without being modified by the 
>> code etc.
>>
>> I wouldn't rule out that Linus Torvald's find isn't the cause here. 
>> Look at this part of his message:
>>
>> "The x86-64 ABI specifies a 128-byte red-zone under the stack 
>> pointer, and this is ok by that limit. It looks like it's illegal 
>> (136 > 128), but the fact is, we've had four "pushq"s to update %rsp 
>> since loading the frame pointer, so it's just *barely* legal with the 
>> red-zoning."
>>
>> Perhaps gcc is pushing further outside of the red zone bounds, thus 
>> causing the problems. No idea how to check for that at the moment though.
>
> Simplest would be to apply the upstream fix to Yocto's gcc and see if 
> that helps.  You'd want commit 
> 556537c4ad0df4cbebb74197bb2bdea75cf5dd35 from 
> git://gcc.gnu.org/git/gcc.git.  (The patch went into gcc-4_9-branch 
> one day after 4.9.1 was released.)
>
> I'd add it to the current set but ATT Khem and I both have pending 
> patches that touch the same gcc files, so it'd just increase the 
> conflicts.
>
> Peter
>
>>
>>
>
>
>



To further elaborate, the Chromium developers know about problems with 
GCC 4.9. Here is an example: 
https://code.google.com/p/chromium/issues/detail?id=385729

Note that while a build of Chromium 37 works, I've had internal compiler 
errors happen. I actually had to re-run the run.do_compile script about 
30 times until the build finished (the ICE's happen only sometimes, so 
repeated attempts at compiling eventually yields a result.)

Thanks for the link. I'll try it out when I have the time. Aside from 
that, I recommend to keep the GCC 4.8 recipes for the time being. At 
least they should not be removed as quickly as the 4.7 ones.

--------------060607070805040609090302
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 08/14/2014 10:22 AM, Peter A. Bigot
      wrote:<br>
    </div>
    <blockquote cite="mid:53EC71B1.3000200@pabigot.com" type="cite">
      <meta content="text/html; charset=ISO-8859-1"
        http-equiv="Content-Type">
      <div class="moz-cite-prefix">On 08/14/2014 03:12 AM, Carlos Rafael
        Giani wrote:<br>
      </div>
      <blockquote cite="mid:53EC6F53.4070908@pseudoterminal.org"
        type="cite">
        <meta content="text/html; charset=ISO-8859-1"
          http-equiv="Content-Type">
        <div class="moz-cite-prefix">On 08/14/2014 02:46 AM, Khem Raj
          wrote:<br>
        </div>
        <blockquote
cite="mid:CAMKF1soYYaAQ9tY7462=zEgo9urFaaAV-qDk6qhO=8_n0xdDyA@mail.gmail.com"
          type="cite"><br>
          <br>
          On Wednesday, August 13, 2014, Otavio Salvador &lt;<a
            moz-do-not-send="true" href="mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;


          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"> On Wed,
            Aug 13, 2014 at 6:24 PM, Gary Thomas &lt;<a
              moz-do-not-send="true" href="javascript:;"
              onclick="_e(event, 'cvml', 'gary@mlbassoc.com')">gary@mlbassoc.com</a>&gt;
            wrote:<br>
            &gt; I've found that the latest GCC doesn't work very well,
            at<br>
            &gt; least not on ARM (and obviously other architectures as
            well [1])<br>
            &gt; When I build Google Chromium browser for my i.MX boards
            using<br>
            &gt; GCC-4.9.x, no pages can be rendered - massive bloodshed
            and<br>
            &gt; failures are shown on the console. &nbsp;If I use the older
            GCC 4.8.2,<br>
            &gt; everything else the same, all is well.<br>
            &gt;<br>
            &gt; Here's my configuration:<br>
            &gt; BB_VERSION &nbsp; &nbsp; &nbsp; &nbsp;= "1.23.1"<br>
            &gt; BUILD_SYS &nbsp; &nbsp; &nbsp; &nbsp; = "x86_64-linux"<br>
            &gt; NATIVELSBSTRING &nbsp; = "Ubuntu-13.10"<br>
            &gt; TARGET_SYS &nbsp; &nbsp; &nbsp; &nbsp;= "arm-amltd-linux-gnueabi"<br>
            &gt; MACHINE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; = "teton-p0382"<br>
            &gt; DISTRO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;= "amltd"<br>
            &gt; DISTRO_VERSION &nbsp; &nbsp;= "1.6+snapshot-20140812"<br>
            &gt; TUNE_FEATURES &nbsp; &nbsp; = "arm armv7a vfp neon
            callconvention-hard cortexa9"<br>
            &gt; TARGET_FPU &nbsp; &nbsp; &nbsp; &nbsp;= "vfp-neon"<br>
            &gt; meta &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
            "master:86afd7eb7c679eb065706137f28f44248f3fbc5a"<br>
            &gt; meta-amltd &nbsp; &nbsp; &nbsp; &nbsp;=
            "master:899529b4184dc9e3e291e7fcdbbf157233db056d"<br>
            &gt; meta-teton-imx6-p0382 =
            "master:9188e2f8fafd203c95dcd7a3c79cb38a1568e9b5"<br>
            &gt; meta-fsl-arm &nbsp; &nbsp; &nbsp;=
            "master:b0cf5c78c5f98c5977ae556d331e7495648f154c"<br>
            &gt; meta-fsl-arm-extra =
            "master:12e560967b7136222c325d11633295fe3a0c701c"<br>
            &gt; meta-browser &nbsp; &nbsp; &nbsp;=
            "master:da93c8e386133a15eff1414d9307c8f2c7a44787"<br>
            &gt;<br>
            &gt; Should this be filed as a bug? &nbsp;I don't have much data
            other than it<br>
            &gt; simply breaks (and chrome is not the easiest thing to
            debug!). &nbsp;Other<br>
            &gt; applications seem OK, but I am loathe to trust it...<br>
            &gt;<br>
            &gt; I'm going to hold onto GCC-4.8.x for my $DISTRO at
            least (and I hope<br>
            &gt; it doesn't vanish like 4.7.x did too quickly).<br>
            &gt;<br>
            &gt; [1]<br>
            &gt; <a moz-do-not-send="true"
href="http://slashdot.org/story/14/07/27/1838219/linus-torvalds-gcc-490-seems-to-be-terminally-broken"
              target="_blank">http://slashdot.org/story/14/07/27/1838219/linus-torvalds-gcc-490-seems-to-be-terminally-broken</a><br>
            &gt;<br>
            &gt; Note: I've also tried this on qemux86 (a totally
            different<br>
            &gt; architecture) and chrome bombs just as badly!<br>
            <br>
            I confirm that GCC 4.9 does NOT work for Chromium 35. At
            this moment I<br>
            am not aware of any fix for it.</blockquote>
          <div><br>
          </div>
          <div>Again Its a broad brush statement. Something concrete is
            needed if some.action is to taken</div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"> <br>
            IIRC the Chromium 37 works though.<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>Well then its less chance.that someone will fix 35&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"> --<br>
            Otavio Salvador &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; O.S. Systems<br>
            <a moz-do-not-send="true" href="http://www.ossystems.com.br"
              target="_blank">http://www.ossystems.com.br</a> &nbsp; &nbsp; &nbsp; &nbsp;<a
              moz-do-not-send="true" href="http://code.ossystems.com.br"
              target="_blank">http://code.ossystems.com.br</a><br>
            Mobile: +55 (53) 9981-7854 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Mobile: +1 (347)
            903-9750<br>
            --<br>
            _______________________________________________<br>
            Openembedded-core mailing list<br>
            <a moz-do-not-send="true" href="javascript:;"
              onclick="_e(event, 'cvml',
              'Openembedded-core@lists.openembedded.org')">Openembedded-core@lists.openembedded.org</a><br>
            <a moz-do-not-send="true"
              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
              target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
          <br>
          <fieldset class="mimeAttachmentHeader"></fieldset>
          <br>
        </blockquote>
        <br>
        <br>
        The problem is that narrowing down is very difficult, since the
        problems manifest themselves as seemingly random stack
        corruptions. I have tried to dig into it, but got nowhere.
        Pointers suddenly became null for no apparent reason, or were
        corrupted, free() calls failed, values on the stack suddenly
        changed without being modified by the code etc.<br>
        <br>
        I wouldn't rule out that Linus Torvald's find isn't the cause
        here. Look at this part of his message:<br>
        <br>
        <meta http-equiv="content-type" content="text/html;
          charset=ISO-8859-1">
        "The x86-64 ABI specifies a 128-byte red-zone under the stack
        pointer, and this is ok by that limit. It looks like it's
        illegal (136 &gt; 128), but the fact is, we've had four "pushq"s
        to update %rsp since loading the frame pointer, so it's just
        *barely* legal with the red-zoning."<br>
        <br>
        Perhaps gcc is pushing further outside of the red zone bounds,
        thus causing the problems. No idea how to check for that at the
        moment though.<br>
      </blockquote>
      <br>
      Simplest would be to apply the upstream fix to Yocto's gcc and see
      if that helps.&nbsp; You'd want commit
      556537c4ad0df4cbebb74197bb2bdea75cf5dd35 from
      git://gcc.gnu.org/git/gcc.git.&nbsp; (The patch went into
      gcc-4_9-branch one day after 4.9.1 was released.)<br>
      <br>
      I'd add it to the current set but ATT Khem and I both have pending
      patches that touch the same gcc files, so it'd just increase the
      conflicts.<br>
      <br>
      Peter<br>
      <br>
      <blockquote cite="mid:53EC6F53.4070908@pseudoterminal.org"
        type="cite"> <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <br>
      </blockquote>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <br>
    <br>
    To further elaborate, the Chromium developers know about problems
    with GCC 4.9. Here is an example:
    <a class="moz-txt-link-freetext" href="https://code.google.com/p/chromium/issues/detail?id=385729">https://code.google.com/p/chromium/issues/detail?id=385729</a><br>
    <br>
    Note that while a build of Chromium 37 works, I've had internal
    compiler errors happen. I actually had to re-run the run.do_compile
    script about 30 times until the build finished (the ICE's happen
    only sometimes, so repeated attempts at compiling eventually yields
    a result.)<br>
    <br>
    Thanks for the link. I'll try it out when I have the time. Aside
    from that, I recommend to keep the GCC 4.8 recipes for the time
    being. At least they should not be removed as quickly as the 4.7
    ones.<br>
  </body>
</html>

--------------060607070805040609090302--
