Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA1A6E7D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:54:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2D9s7RT000997
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Mar 2014 02:54:07 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 13 Mar 2014 02:54:06 -0700
Message-ID: <5321803B.90400@windriver.com>
Date: Thu, 13 Mar 2014 17:54:03 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1394093112.git.Chong.Lu@windriver.com>
	<9477177f82743adfab34256b7bc002a37dd61787.1394093112.git.Chong.Lu@windriver.com>
	<CAJTo0LZ_OjXVhoNv6wk085=5vY=i64_8T6s=Tef5h7qgFC5Sfw@mail.gmail.com>
In-Reply-To: <CAJTo0LZ_OjXVhoNv6wk085=5vY=i64_8T6s=Tef5h7qgFC5Sfw@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Thu, 13 Mar 2014 09:54:09 -0000
Content-Type: multipart/alternative;
	boundary="------------030109020109070200010702"

--------------030109020109070200010702
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/06/2014 06:04 PM, Burton, Ross wrote:
> On 6 March 2014 08:06, Chong Lu <Chong.Lu@windriver.com> wrote:
>> +PACKAGES += "dbus-ptest"
>> +ALLOW_EMPTY_${PN}-ptest = "1"
>> +RDEPENDS_${PN}-ptest = "${@base_contains('IMAGE_FEATURES', 'ptest-pkgs', 'dbus-test-ptest', 'dbus-test', d)}"
Hi Ross,

Do you have any suggestion about this issue?
If we don't check IMAGE_FEATURES, I have no way to resolve this problem 
that only build but not install ptest. I'm very confused.

Best Regards
Chong

> Nice idea, but wouldn't a more correct solution be to have dbus-ptest
> added to PACKAGES conditionally (instead of always generating
> dbus-ptest and conditionally adding the dependency)?
>
> Ross
> Clearly I wasn't thinking clearly last week.  You can't check
> IMAGE_FEATURES in a non-image recipe so this isn't a good solution.
>
> Ross
>
>


--------------030109020109070200010702
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 03/06/2014 06:04 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZ_OjXVhoNv6wk085=5vY=i64_8T6s=Tef5h7qgFC5Sfw@mail.gmail.com"
      type="cite">
      <pre wrap="">On 6 March 2014 08:06, Chong Lu <a class="moz-txt-link-rfc2396E" href="mailto:Chong.Lu@windriver.com">&lt;Chong.Lu@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">+PACKAGES += "dbus-ptest"
+ALLOW_EMPTY_${PN}-ptest = "1"
+RDEPENDS_${PN}-ptest = "${@base_contains('IMAGE_FEATURES', 'ptest-pkgs', 'dbus-test-ptest', 'dbus-test', d)}"
</pre>
      </blockquote>
    </blockquote>
    Hi Ross,<br>
    <br>
    Do you have any suggestion about this issue?<br>
    If we don't check IMAGE_FEATURES, I have no way to resolve this
    problem that only build but not install ptest. I'm very confused.
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <br>
    <br>
    Best Regards<br>
    Chong<br>
    <br>
    <blockquote
cite="mid:CAJTo0LZ_OjXVhoNv6wk085=5vY=i64_8T6s=Tef5h7qgFC5Sfw@mail.gmail.com"
      type="cite">
      <pre wrap="">
Nice idea, but wouldn't a more correct solution be to have dbus-ptest
added to PACKAGES conditionally (instead of always generating
dbus-ptest and conditionally adding the dependency)?

Ross</pre>
    </blockquote>
    <blockquote
cite="mid:CAJTo0LZ_OjXVhoNv6wk085=5vY=i64_8T6s=Tef5h7qgFC5Sfw@mail.gmail.com"
      type="cite">
      <pre wrap="">Clearly I wasn't thinking clearly last week.  You can't check
IMAGE_FEATURES in a non-image recipe so this isn't a good solution.

Ross


</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030109020109070200010702--
