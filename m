Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8B673034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 07:07:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1M77DfL013928
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Feb 2017 23:07:13 -0800 (PST)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Feb 2017 23:07:13 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1487648281.git.dengke.du@windriver.com>
	<1c00a35e3fe8eea61912ec53b61409257152e7d7.1487648281.git.dengke.du@windriver.com>
	<CAJTo0Lb4Vjg-1X7O8cQ05YxVeK407i0KM2Ah7m8hXcFwJJhGvg@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <3d05988a-d60c-6142-6bb7-a1db43f3609e@windriver.com>
Date: Wed, 22 Feb 2017 15:07:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb4Vjg-1X7O8cQ05YxVeK407i0KM2Ah7m8hXcFwJJhGvg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 1/1] ltp: upgrade to 20170116
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
X-List-Received-Date: Wed, 22 Feb 2017 07:07:13 -0000
Content-Type: multipart/alternative;
	boundary="------------8B040C9151BB222A2D5FB047"

--------------8B040C9151BB222A2D5FB047
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

This is because the ltp source code adds a new function 
"SAFE_FILE_PRINTF" in the version 20170116 of ltp,

in function "SAFE_FILE_PRINTF", the third arguments need a format 
string, but in fchmodat01.c, at the line

of 130:

SAFE_FILE_PRINTF(cleanup, testfile, testfile)

it passed the same as the second arguments, it should pass the format 
string of the second argument.

I will fix it as soon as.


On 2017年02月22日 00:28, Burton, Ross wrote:
> Fails with security flags enabled:
>
> | In file included from ../../../../include/old/test.h:47:0,
> |                  from fchmodat01.c:44:
> | fchmodat01.c: In function 'setup':
> | ../../../../include/old/old_safe_file_ops.h:55:27: error: format not 
> a string literal and no format arguments [-Werror=format-security]
> |                    (path), (fmt), ## __VA_ARGS__)
> |                            ^
> | fchmodat01.c:130:2: note: in expansion of macro 'SAFE_FILE_PRINTF'
> |   SAFE_FILE_PRINTF(cleanup, testfile, testfile);
> |   ^~~~~~~~~~~~~~~~
> | ../../../../include/old/old_safe_file_ops.h:55:27: error: format not 
> a string literal and no format arguments [-Werror=format-security]
> |                    (path), (fmt), ## __VA_ARGS__)
> |                            ^
> | fchmodat01.c:131:2: note: in expansion of macro 'SAFE_FILE_PRINTF'
> |   SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
> |   ^~~~~~~~~~~~~~~~
>
> Ross


--------------8B040C9151BB222A2D5FB047
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>This is because the ltp source code adds a new function
      "SAFE_FILE_PRINTF" in the version 20170116 of ltp,</p>
    <p>in function "SAFE_FILE_PRINTF", the third arguments need a format
      string, but in fchmodat01.c, at the line</p>
    <p>of 130:</p>
    <p>    <span class="pl-c1">SAFE_FILE_PRINTF</span>(cleanup,
      testfile, testfile)</p>
    <p>it passed the same as the second arguments, it should pass the
      format string of the second argument.</p>
    <p>I will fix it as soon as.</p>
    <br>
    <div class="moz-cite-prefix">On 2017年02月22日 00:28, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lb4Vjg-1X7O8cQ05YxVeK407i0KM2Ah7m8hXcFwJJhGvg@mail.gmail.com"
      type="cite">Fails with security flags enabled:
      <div><br>
      </div>
      <div>
        <div>| In file included from
          ../../../../include/old/test.h:47:0,</div>
        <div>|                  from fchmodat01.c:44:</div>
        <div>| fchmodat01.c: In function 'setup':</div>
        <div>| ../../../../include/old/old_safe_file_ops.h:55:27: error:
          format not a string literal and no format arguments
          [-Werror=format-security]</div>
        <div>|                    (path), (fmt), ## __VA_ARGS__)</div>
        <div>|                            ^</div>
        <div>| fchmodat01.c:130:2: note: in expansion of macro
          'SAFE_FILE_PRINTF'</div>
        <div>|   SAFE_FILE_PRINTF(cleanup, testfile, testfile);</div>
        <div>|   ^~~~~~~~~~~~~~~~</div>
        <div>| ../../../../include/old/old_safe_file_ops.h:55:27: error:
          format not a string literal and no format arguments
          [-Werror=format-security]</div>
        <div>|                    (path), (fmt), ## __VA_ARGS__)</div>
        <div>|                            ^</div>
        <div>| fchmodat01.c:131:2: note: in expansion of macro
          'SAFE_FILE_PRINTF'</div>
        <div>|   SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);</div>
        <div>|   ^~~~~~~~~~~~~~~~</div>
      </div>
      <div><br>
      </div>
      <div>Ross</div>
    </blockquote>
    <br>
  </body>
</html>

--------------8B040C9151BB222A2D5FB047--
