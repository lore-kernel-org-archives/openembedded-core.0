Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07985771E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 08:53:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7B8raHq011001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 11 Aug 2016 01:53:36 -0700
Received: from [128.224.162.180] (128.224.162.180) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 11 Aug 2016 01:53:35 -0700
References: <bfe3a375-f09b-7617-c209-0df28b24325a@case.edu>
To: "Burton, Ross" <ross.burton@intel.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
X-Forwarded-Message-Id: <bfe3a375-f09b-7617-c209-0df28b24325a@case.edu>
Message-ID: <57AC3D0E.9010502@windriver.com>
Date: Thu, 11 Aug 2016 16:53:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <bfe3a375-f09b-7617-c209-0df28b24325a@case.edu>
Cc: "openembedded-core@lists.openembedded.org >> Patches and discussions
	about the oe-core layer" <openembedded-core@lists.openembedded.org>
Subject: Re: bash: remove the format string "%q" in the unicode3.sub
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
X-List-Received-Date: Thu, 11 Aug 2016 08:53:38 -0000
Content-Type: multipart/alternative;
	boundary="------------060209050001000800070504"

--------------060209050001000800070504
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi ross

After querying for the current maintainer of bash Chet Ramey, he said 
the devel
branch of bash have fixed it. So I will import those patchs later for 
the bash tests
suite.

We can check the patchs at:

http://git.savannah.gnu.org/cgit/bash.git/commit/tests/intl.right?h=devel&id=85ec0778f9d778e1820fb8c0e3e996f2d1103b45
http://git.savannah.gnu.org/cgit/bash.git/diff/tests/intl.right?h=devel&id=74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3

//dengke


-------- Forwarded Message --------
Subject: 	Re: bash: remove the format string "%q" in the unicode3.sub
Date: 	Tue, 9 Aug 2016 10:39:13 -0400
From: 	Chet Ramey <chet.ramey@case.edu>
Reply-To: 	chet.ramey@case.edu
To: 	dengke.du@windriver.com <dengke.du@windriver.com>, bug-bash@gnu.org
CC: 	chet.ramey@case.edu



On 8/9/16 3:18 AM, dengke.du@windriver.com wrote:
> Hi all
>
> When I run the tests for the bash, the sub-test unicode3.sub of intl.tests
> failed.
>
> The sub-test unicode3.sub contain the following:
>
>     payload=$'\065\247\100\063\231\053\306\123\070\237\242\352\263'
>     "$payload"
>     printf %q "$payload"
>
> In this situation, the format string "%q" in command printf means that when the
> character in the payload is not in {alpha & digit & punctuation & ISO
> 646(7-bit)}, it
> would print the string with ANSI-C style quoted string: $'...' , we can
> check the source code

This has already been changed in the devel branch (back in May, 2015), and
the test case and tets output was changed at the same time.

-- 
``The lyf so short, the craft so long to lerne.'' - Chaucer
		 ``Ars longa, vita brevis'' - Hippocrates
Chet Ramey, UTech, CWRU    chet@case.edu    http://cnswww.cns.cwru.edu/~chet/




--------------060209050001000800070504
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi ross<br>
    <br>
    After querying for the current maintainer of bash Chet Ramey, he
    said the devel <br>
    branch of bash have fixed it. So I will import those patchs later
    for the bash tests<br>
    suite.<br>
    <br>
    We can check the patchs at:<br>
    <br>
        
<a class="moz-txt-link-freetext" href="http://git.savannah.gnu.org/cgit/bash.git/commit/tests/intl.right?h=devel&amp;id=85ec0778f9d778e1820fb8c0e3e996f2d1103b45">http://git.savannah.gnu.org/cgit/bash.git/commit/tests/intl.right?h=devel&amp;id=85ec0778f9d778e1820fb8c0e3e996f2d1103b45</a><br>
        
<a class="moz-txt-link-freetext" href="http://git.savannah.gnu.org/cgit/bash.git/diff/tests/intl.right?h=devel&amp;id=74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3">http://git.savannah.gnu.org/cgit/bash.git/diff/tests/intl.right?h=devel&amp;id=74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3</a><br>
    <br>
    //dengke<br>
    <div class="moz-forward-container"><br>
      <br>
      -------- Forwarded Message --------
      <table class="moz-email-headers-table" border="0" cellpadding="0"
        cellspacing="0">
        <tbody>
          <tr>
            <th align="RIGHT" nowrap="nowrap" valign="BASELINE">Subject:
            </th>
            <td>Re: bash: remove the format string "%q" in the
              unicode3.sub</td>
          </tr>
          <tr>
            <th align="RIGHT" nowrap="nowrap" valign="BASELINE">Date: </th>
            <td>Tue, 9 Aug 2016 10:39:13 -0400</td>
          </tr>
          <tr>
            <th align="RIGHT" nowrap="nowrap" valign="BASELINE">From: </th>
            <td>Chet Ramey <a class="moz-txt-link-rfc2396E" href="mailto:chet.ramey@case.edu">&lt;chet.ramey@case.edu&gt;</a></td>
          </tr>
          <tr>
            <th align="RIGHT" nowrap="nowrap" valign="BASELINE">Reply-To:
            </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:chet.ramey@case.edu">chet.ramey@case.edu</a></td>
          </tr>
          <tr>
            <th align="RIGHT" nowrap="nowrap" valign="BASELINE">To: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:dengke.du@windriver.com">dengke.du@windriver.com</a> <a class="moz-txt-link-rfc2396E" href="mailto:dengke.du@windriver.com">&lt;dengke.du@windriver.com&gt;</a>,
              <a class="moz-txt-link-abbreviated" href="mailto:bug-bash@gnu.org">bug-bash@gnu.org</a></td>
          </tr>
          <tr>
            <th align="RIGHT" nowrap="nowrap" valign="BASELINE">CC: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:chet.ramey@case.edu">chet.ramey@case.edu</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      <pre>On 8/9/16 3:18 AM, <a class="moz-txt-link-abbreviated" href="mailto:dengke.du@windriver.com">dengke.du@windriver.com</a> wrote:
&gt; Hi all
&gt; 
&gt; When I run the tests for the bash, the sub-test unicode3.sub of intl.tests
&gt; failed.
&gt; 
&gt; The sub-test unicode3.sub contain the following:
&gt; 
&gt;     payload=$'\065\247\100\063\231\053\306\123\070\237\242\352\263'
&gt;     "$payload"
&gt;     printf %q "$payload"
&gt; 
&gt; In this situation, the format string "%q" in command printf means that when the
&gt; character in the payload is not in {alpha &amp; digit &amp; punctuation &amp; ISO
&gt; 646(7-bit)}, it
&gt; would print the string with ANSI-C style quoted string: $'...' , we can
&gt; check the source code

This has already been changed in the devel branch (back in May, 2015), and
the test case and tets output was changed at the same time.

-- 
``The lyf so short, the craft so long to lerne.'' - Chaucer
		 ``Ars longa, vita brevis'' - Hippocrates
Chet Ramey, UTech, CWRU    <a class="moz-txt-link-abbreviated" href="mailto:chet@case.edu">chet@case.edu</a>    <a class="moz-txt-link-freetext" href="http://cnswww.cns.cwru.edu/~chet/">http://cnswww.cns.cwru.edu/~chet/</a>
</pre>
      <br>
    </div>
    <br>
  </body>
</html>

--------------060209050001000800070504--
