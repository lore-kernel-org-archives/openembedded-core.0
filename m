Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 289EC71E14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 16:43:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Dec 2016 08:42:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; 
	d="scan'208,217";a="1098613439"
Received: from jgperezc.zpn.intel.com (HELO [10.219.5.150]) ([10.219.5.150])
	by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2016 08:42:33 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1479227073-13133-1-git-send-email-jose.perez.carranza@linux.intel.com>
	<CAJTo0LZ1cj5Nm+iSO5aaHRMgf1Syhx6wQ3R2OaBe99A-SKX5Yg@mail.gmail.com>
	<CAJTo0LYbCY=ETjx3wdo1nwsDDJCgEZU7F0JfiuP_zZf+tS3F-A@mail.gmail.com>
From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Message-ID: <add9f53a-8c35-91a1-9758-62bd7e12766d@linux.intel.com>
Date: Tue, 13 Dec 2016 10:53:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYbCY=ETjx3wdo1nwsDDJCgEZU7F0JfiuP_zZf+tS3F-A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oe-tests: Migrate tests from /oe/test to /oeqa/selftest/oe-tests
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
X-List-Received-Date: Tue, 13 Dec 2016 16:43:37 -0000
Content-Type: multipart/alternative;
	boundary="------------3D0F63277BD71E46D2FD5E2F"

--------------3D0F63277BD71E46D2FD5E2F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/13/2016 10:32 AM, Burton, Ross wrote:
>
> On 13 December 2016 at 16:17, Burton, Ross <ross.burton@intel.com 
> <mailto:ross.burton@intel.com>> wrote:
>
>     It took over a minute to load a few tests.  Do you have any idea
>     why the discovery is so slow?
>
>
at my host is very fast the load (1 second)

jgperezc@jgperezc:~/poky-oetest/build$ oe-selftest  -r oelib-tests.elf 
oelib-tests.license oelib-tests.path oelib-tests.types oelib-tests.utils
2016-12-13 10:48:28,333 - selftest - INFO - Running bitbake -e to get BBPATH
2016-12-13 10:48:29,125 - selftest - INFO - Checking that everything is 
in order before running the tests
2016-12-13 10:48:29,833 - selftest - INFO - Running bitbake -p
2016-12-13 10:48:52,181 - selftest - INFO - test runner init'ed like 
unittest
2016-12-13 10:48:52,995 - selftest - INFO - Loading tests from: 
oeqa.selftest.oelib-tests.elf
2016-12-13 10:48:52,998 - selftest - INFO - Loading tests from: 
oeqa.selftest.oelib-tests.license
2016-12-13 10:48:53,000 - selftest - INFO - Loading tests from: 
oeqa.selftest.oelib-tests.path
2016-12-13 10:48:53,001 - selftest - INFO - Loading tests from: 
oeqa.selftest.oelib-tests.types
2016-12-13 10:48:53,003 - selftest - INFO - Loading tests from: 
oeqa.selftest.oelib-tests.utils
2016-12-13 10:48:53,005 - selftest - INFO - Adding: "include 
selftest.inc" in local.conf
2016-12-13 10:48:53,005 - selftest - INFO - Adding: "include 
bblayers.inc" in bblayers.conf

> Oh, it's because oeselftest does bitbake calls isn't it.
>
> Good news: you don't need to use oeSelfTest at all, the discovery 
> works fine with standard unittest.TestCase objects.
>
> Patch incoming. :)
>
Ok, just wondering if oe-selftest -l will also list those test cases ??
> Ross
>

-- 
Saludos
José


--------------3D0F63277BD71E46D2FD5E2F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 12/13/2016 10:32 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYbCY=ETjx3wdo1nwsDDJCgEZU7F0JfiuP_zZf+tS3F-A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 13 December 2016 at 16:17, Burton,
            Ross <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:ross.burton@intel.com" target="_blank">ross.burton@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class="gmail_extra">It took over a minute to load a
                few tests.  Do you have any idea why the discovery is so
                slow?</div>
            </blockquote>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    at my host is very fast the load (1 second) <br>
    <br>
    jgperezc@jgperezc:~/poky-oetest/build$ oe-selftest  -r
    oelib-tests.elf oelib-tests.license oelib-tests.path
    oelib-tests.types oelib-tests.utils<br>
    2016-12-13 10:48:28,333 - selftest - INFO - Running bitbake -e to
    get BBPATH<br>
    2016-12-13 10:48:29,125 - selftest - INFO - Checking that everything
    is in order before running the tests<br>
    2016-12-13 10:48:29,833 - selftest - INFO - Running bitbake -p<br>
    2016-12-13 10:48:52,181 - selftest - INFO - test runner init'ed like
    unittest<br>
    2016-12-13 10:48:52,995 - selftest - INFO - Loading tests from:
    oeqa.selftest.oelib-tests.elf<br>
    2016-12-13 10:48:52,998 - selftest - INFO - Loading tests from:
    oeqa.selftest.oelib-tests.license<br>
    2016-12-13 10:48:53,000 - selftest - INFO - Loading tests from:
    oeqa.selftest.oelib-tests.path<br>
    2016-12-13 10:48:53,001 - selftest - INFO - Loading tests from:
    oeqa.selftest.oelib-tests.types<br>
    2016-12-13 10:48:53,003 - selftest - INFO - Loading tests from:
    oeqa.selftest.oelib-tests.utils<br>
    2016-12-13 10:48:53,005 - selftest - INFO - Adding: "include
    selftest.inc" in local.conf<br>
    2016-12-13 10:48:53,005 - selftest - INFO - Adding: "include
    bblayers.inc" in bblayers.conf<br>
    <br>
    <blockquote
cite="mid:CAJTo0LYbCY=ETjx3wdo1nwsDDJCgEZU7F0JfiuP_zZf+tS3F-A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Oh, it's because oeselftest does bitbake calls isn't
              it.</div>
            <div><br>
            </div>
            <div>Good news: you don't need to use oeSelfTest at all, the
              discovery works fine with standard unittest.TestCase
              objects.</div>
            <div><br>
            </div>
            <div>Patch incoming. :)</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Ok, just wondering if oe-selftest -l will also list those test cases
    ?? <br>
    <blockquote
cite="mid:CAJTo0LYbCY=ETjx3wdo1nwsDDJCgEZU7F0JfiuP_zZf+tS3F-A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Ross</div>
            <div> </div>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Saludos 
José </pre>
  </body>
</html>

--------------3D0F63277BD71E46D2FD5E2F--
