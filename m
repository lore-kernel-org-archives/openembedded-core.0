Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9865E6D189
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 04:13:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2P4D4qm020723
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Mar 2014 21:13:04 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 24 Mar 2014 21:13:03 -0700
Message-ID: <53310247.3080001@windriver.com>
Date: Tue, 25 Mar 2014 12:12:55 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1395646642.git.hongxu.jia@windriver.com>
	<9c06686dc4ccc2576bd8a171ed685ab00eecf84c.1395646642.git.hongxu.jia@windriver.com>
	<532FE586.2050708@windriver.com>
	<CAJTo0LY2rkPew8354+pYJKjXSrsBa50kZeEwxDrXSnQWgi8gRw@mail.gmail.com>
In-Reply-To: <CAJTo0LY2rkPew8354+pYJKjXSrsBa50kZeEwxDrXSnQWgi8gRw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libsoup-2.4: upgrade to 2.45.92
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
X-List-Received-Date: Tue, 25 Mar 2014 04:13:05 -0000
Content-Type: multipart/alternative;
	boundary="------------040501060800090208000505"

--------------040501060800090208000505
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/24/2014 05:06 PM, Burton, Ross wrote:
> On 24 March 2014 07:57, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> There was an error about mips-gcc optimization while compiling
>> libsoup-2.4 2.45.3 with DEBUG_OPTIMIZATION enabled.
>>
>> The test code of libsoup-2.4 2.45.3 triggered gcc assert which located
>> in gcc/dwarf2out.c:20810:
>> ...
>> 20806       gcc_assert (prev
>> 20807                   && (CALL_P (prev)
>> 20808                       || (NONJUMP_INSN_P (prev)
>> 20809                           && GET_CODE (PATTERN (prev)) == SEQUENCE
>> 20810                           && CALL_P (XVECEXP (PATTERN (prev), 0,
>> 0)))));
>> ...
> So you've a bug in gcc and a well defined way of replicating it,
> presumably you've reported this to gcc as that's the proper fix here?

Yes, file a bug in gcc:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6034

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=60643

//Hongxu

> Ross


--------------040501060800090208000505
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/24/2014 05:06 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LY2rkPew8354+pYJKjXSrsBa50kZeEwxDrXSnQWgi8gRw@mail.gmail.com"
      type="cite">
      <pre wrap="">On 24 March 2014 07:57, Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">There was an error about mips-gcc optimization while compiling
libsoup-2.4 2.45.3 with DEBUG_OPTIMIZATION enabled.

The test code of libsoup-2.4 2.45.3 triggered gcc assert which located
in gcc/dwarf2out.c:20810:
...
20806       gcc_assert (prev
20807                   &amp;&amp; (CALL_P (prev)
20808                       || (NONJUMP_INSN_P (prev)
20809                           &amp;&amp; GET_CODE (PATTERN (prev)) == SEQUENCE
20810                           &amp;&amp; CALL_P (XVECEXP (PATTERN (prev), 0,
0)))));
...
</pre>
      </blockquote>
      <pre wrap="">
So you've a bug in gcc and a well defined way of replicating it,
presumably you've reported this to gcc as that's the proper fix here?
</pre>
    </blockquote>
    <br>
    Yes, file a bug in gcc:<br>
    <br>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <a href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=6034">https://bugzilla.yoctoproject.org/show_bug.cgi?id=6034</a><br>
    <br>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <a href="http://gcc.gnu.org/bugzilla/show_bug.cgi?id=60643">http://gcc.gnu.org/bugzilla/show_bug.cgi?id=60643</a><br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LY2rkPew8354+pYJKjXSrsBa50kZeEwxDrXSnQWgi8gRw@mail.gmail.com"
      type="cite">
      <pre wrap="">
Ross
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------040501060800090208000505--
