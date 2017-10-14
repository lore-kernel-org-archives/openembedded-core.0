Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 95CE4608B7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 20:38:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9EKcWVV007936
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 14 Oct 2017 13:38:32 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Sat, 14 Oct 2017 13:38:31 -0700
To: <leonardo.sandoval.gonzalez@linux.intel.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>, Robert
	Yang <liezhi.yang@windriver.com>,
	"Fan, Wenzong" <Wenzong.Fan@windriver.com>,
	"Jia, Hongxu" <Hongxu.Jia@windriver.com>
References: <20171012183523.130193-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20171012183523.130193-2-leonardo.sandoval.gonzalez@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <c75e9163-dc11-4e3a-529a-1309cb6805cb@windriver.com>
Date: Sat, 14 Oct 2017 16:38:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171012183523.130193-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH 2/4] perl: upgrade to 5.26.1
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
X-List-Received-Date: Sat, 14 Oct 2017 20:38:33 -0000
Content-Type: multipart/alternative;
	boundary="------------DAC80ACB0E5CD924D753D998"
Content-Language: en-GB

--------------DAC80ACB0E5CD924D753D998
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Waiting for a build so I thought I'd comment on this commit.

My comments are about style and maintenance not functionality
which others have covered (the gentoo comment).

On 2017-10-12 02:35 PM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval<leonardo.sandoval.gonzalez@linux.intel.com>
>
> Highlights:
>
>      * Patches rebased to 5.26.1 and just one removed
That leaves 5 patches that are 'pending'.

Robert, Hongxu, Wenzong,
You guys added these upstream pending patches.
Are the patches you send still pending or were they rejected?

Please elect one of the three of you to follow-up with a patch
if the status has changed and otherwise ping upstream perl
to get these patches merged so we can drop them locally.

>
>      * Several configs values taken from upstream script uconfig[64].sh were introduced in
>      config.sh, avoiding pre-processor issues.
>
>      * Several libraries paths now included a './' as prefix, because @INC does not
>      include local paths.
>
>      * Manifypods is excluded from compilation due to compilation errors (see patch for
>      more info)
>
>      * New perl creates a static library (<libdir>/auto/Unicode/Normalize/Normalize.a) thus
>      there is a new staticdev package.
>
> New packages included (compared to previous version):
>
>      perl-module-math-bigint-lib
>      perl-module-test2
>      perl-module-test2-api
>      perl-module-test2-api-breakage
>      perl-module-test2-api-context
>      perl-module-test2-api-instance
>      perl-module-test2-api-stack
>      perl-module-test2-event
>      perl-module-test2-event-bail
>      perl-module-test2-event-diag
>      perl-module-test2-event-encoding
>      perl-module-test2-event-exception
>      perl-module-test2-event-generic
>      perl-module-test2-event-info
>      perl-module-test2-event-note
>      perl-module-test2-event-ok
>      perl-module-test2-event-plan
>      perl-module-test2-event-skip
>      perl-module-test2-event-subtest
>      perl-module-test2-event-tap-version
>      perl-module-test2-event-waiting
>      perl-module-test2-formatter
>      perl-module-test2-formatter-tap
>      perl-module-test2-hub
>      perl-module-test2-hub-interceptor
>      perl-module-test2-hub-interceptor-terminator
>      perl-module-test2-hub-subtest
>      perl-module-test2-ipc
>      perl-module-test2-ipc-driver
>      perl-module-test2-ipc-driver-files
>      perl-module-test2-tools-tiny
>      perl-module-test2-util
>      perl-module-test2-util-externalmeta
>      perl-module-test2-util-hashbase
>      perl-module-test2-util-trace

The list of these test2 modules could be shorted to

     perl-module-test2
     perl-module-test2-api
     ...
     perl-module-test2-util-trace

but that's probably long long bikeshedding
so at least your shed is painted.

>      perl-module-test-builder-formatter
>      perl-module-test-builder-tododiag
>      perl-module-unicode-collate-locale-de-at-ph
>      perl-module-unicode-collate-locale-fr-ca
>      perl-module-unicode-collate-locale-he
>      perl-module-unicode-collate-locale-ug-cyrl
>      perl-module-unicode-collate-locale-vo
>      perl-module-unicode-normalize-staticdev
>
> Signed-off-by: Leonardo Sandoval<leonardo.sandoval.gonzalez@linux.intel.com>


I like that your package update log has a summary of what's changed *in* 
the package,

in addition to what's changed in the recipe. It would be nice if more 
people did that.


Shame about the perl madness as reported by the gentoo devs.

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company


--------------DAC80ACB0E5CD924D753D998
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Waiting for a build so I thought I'd
      comment on this commit.<br>
      <br>
      My comments are about style and maintenance not functionality <br>
      which others have covered (the gentoo comment).<br>
      <br>
      On 2017-10-12 02:35 PM, <a class="moz-txt-link-abbreviated" href="mailto:leonardo.sandoval.gonzalez@linux.intel.com">leonardo.sandoval.gonzalez@linux.intel.com</a>
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:20171012183523.130193-2-leonardo.sandoval.gonzalez@linux.intel.com">
      <pre wrap="">From: Leonardo Sandoval <a class="moz-txt-link-rfc2396E" href="mailto:leonardo.sandoval.gonzalez@linux.intel.com" moz-do-not-send="true">&lt;leonardo.sandoval.gonzalez@linux.intel.com&gt;</a>

Highlights:

    * Patches rebased to 5.26.1 and just one removed</pre>
    </blockquote>
    That leaves 5 patches that are 'pending'. <br>
    <br>
    Robert, Hongxu, Wenzong,<br>
    You guys added these upstream pending patches.<br>
    Are the patches you send still pending or were they rejected?<br>
    <br>
    Please elect one of the three of you to follow-up with a patch<br>
    if the status has changed and otherwise ping upstream perl<br>
    to get these patches merged so we can drop them locally.<br>
    <br>
    <blockquote type="cite"
cite="mid:20171012183523.130193-2-leonardo.sandoval.gonzalez@linux.intel.com">
      <pre wrap="">

    * Several configs values taken from upstream script uconfig[64].sh were introduced in
    config.sh, avoiding pre-processor issues.

    * Several libraries paths now included a './' as prefix, because @INC does not
    include local paths.

    * Manifypods is excluded from compilation due to compilation errors (see patch for
    more info)

    * New perl creates a static library (&lt;libdir&gt;/auto/Unicode/Normalize/Normalize.a) thus
    there is a new staticdev package.

New packages included (compared to previous version):

    perl-module-math-bigint-lib
    perl-module-test2
    perl-module-test2-api
    perl-module-test2-api-breakage
    perl-module-test2-api-context
    perl-module-test2-api-instance
    perl-module-test2-api-stack
    perl-module-test2-event
    perl-module-test2-event-bail
    perl-module-test2-event-diag
    perl-module-test2-event-encoding
    perl-module-test2-event-exception
    perl-module-test2-event-generic
    perl-module-test2-event-info
    perl-module-test2-event-note
    perl-module-test2-event-ok
    perl-module-test2-event-plan
    perl-module-test2-event-skip
    perl-module-test2-event-subtest
    perl-module-test2-event-tap-version
    perl-module-test2-event-waiting
    perl-module-test2-formatter
    perl-module-test2-formatter-tap
    perl-module-test2-hub
    perl-module-test2-hub-interceptor
    perl-module-test2-hub-interceptor-terminator
    perl-module-test2-hub-subtest
    perl-module-test2-ipc
    perl-module-test2-ipc-driver
    perl-module-test2-ipc-driver-files
    perl-module-test2-tools-tiny
    perl-module-test2-util
    perl-module-test2-util-externalmeta
    perl-module-test2-util-hashbase
    perl-module-test2-util-trace</pre>
    </blockquote>
    <br>
    The list of these test2 modules could be shorted to <br>
    <br>
    <pre wrap="">    perl-module-test2
    perl-module-test2-api
    ...
    perl-module-test2-util-trace

but that's probably long long bikeshedding
so at least your shed is painted.

</pre>
    <blockquote type="cite"
cite="mid:20171012183523.130193-2-leonardo.sandoval.gonzalez@linux.intel.com">
      <pre wrap="">
    perl-module-test-builder-formatter
    perl-module-test-builder-tododiag
    perl-module-unicode-collate-locale-de-at-ph
    perl-module-unicode-collate-locale-fr-ca
    perl-module-unicode-collate-locale-he
    perl-module-unicode-collate-locale-ug-cyrl
    perl-module-unicode-collate-locale-vo
    perl-module-unicode-normalize-staticdev

Signed-off-by: Leonardo Sandoval <a class="moz-txt-link-rfc2396E" href="mailto:leonardo.sandoval.gonzalez@linux.intel.com" moz-do-not-send="true">&lt;leonardo.sandoval.gonzalez@linux.intel.com&gt;</a></pre>
    </blockquote>
    <p><br>
    </p>
    <p>I like that your package update log has a summary of what's
      changed *in* the package,</p>
    <p>in addition to what's changed in the recipe. It would be nice if
      more people did that.</p>
    <p><br>
    </p>
    <p>Shame about the perl madness as reported by the gentoo devs.</p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company
</pre>
  </body>
</html>

--------------DAC80ACB0E5CD924D753D998--
