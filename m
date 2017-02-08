Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 72A7A60721
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 05:31:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v185VnwJ009670
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Feb 2017 21:31:50 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 21:31:49 -0800
To: <openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
	<20170208033001.9309.89399@do.openembedded.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <5cdc7c7a-22fe-f5ad-3ff2-89f9e45cf6d1@windriver.com>
Date: Wed, 8 Feb 2017 13:31:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170208033001.9309.89399@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIDExIHBhY2thZ2VzIHVwZ3JhZGU=?=
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
X-List-Received-Date: Wed, 08 Feb 2017 05:31:51 -0000
Content-Type: multipart/alternative;
	boundary="------------04DF5E8B2C7DFF908B73C56E"

--------------04DF5E8B2C7DFF908B73C56E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年02月08日 11:30, Patchwork wrote:
> == Series Details ==
>
> Series: 11 packages upgrade
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/5200/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence]
>    Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)

The hurd_path.patch is cherry picked from debian which does
not has "Upstream-Status: <status>" and "Signed-off-by", so I
think we could ignore this warning.

Here is the upstream source of debian patch:
http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.168-0.2.debian.tar.xz

You may suggest to add it to SRC_URI rather than picking up manually,
but debian frequently upgrades miner version "-0.2", and which does not
sync up with upstream elfutils, that's why I manually cherry pick.

> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at 68da6c9884)

Previously, Zhengtried to upgrade bash failed (git am "bash: 4.3.30 -> 
4.4.eml" failed)
the reason is encoding issue, if invoking "git send-email", it set UTF-8 
by default
---
            Content-Type: text/plain; charset=UTF-8
            Content-Transfer-Encoding: 8bit
---
And the utf-8 encoding changed the content of 
meta/recipes-extended/bash/bash/fix-run-intl.patch,
which caused "git am" failed.

Manually send the patch as attachment could workaround the issue.
But the patchwork still report apply failure, I guess it applied [PATCH 
12/13]
before [PATCH 11/13], or could not detect attachment of [PATCH 11/13].

Hi Ross or any one concerns,

Could you apply the patch manually, to see if it is OK?
(I tested to save as the eml file and invoke git am to apply, everything 
is ok)

//Hongxu

> * Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence]
>    Suggested fix    Sign off the added patch file (meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch)
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>


--------------04DF5E8B2C7DFF908B73C56E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2017年02月08日 11:30, Patchwork wrote:<br>
    </div>
    <blockquote cite="mid:20170208033001.9309.89399@do.openembedded.org"
      type="cite">
      <pre wrap="">== Series Details ==

Series: 11 packages upgrade
Revision: 1
URL   : <a class="moz-txt-link-freetext" href="https://patchwork.openembedded.org/series/5200/">https://patchwork.openembedded.org/series/5200/</a>
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence] 
  Suggested fix    Add Upstream-Status: &lt;status&gt; to the header of meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)
</pre>
    </blockquote>
    <br>
    The hurd_path.patch is cherry picked from debian which does<br>
    not has "Upstream-Status: &lt;status&gt;" and "Signed-off-by", so I<br>
    think we could ignore this warning.<br>
    <br>
    Here is the upstream source of debian patch:<br>
<a class="moz-txt-link-freetext" href="http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.168-0.2.debian.tar.xz">http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.168-0.2.debian.tar.xz</a><br>
    <br>
    You may suggest to add it to SRC_URI rather than picking up
    manually,<br>
    but debian frequently upgrades miner version "-0.2", and which does
    not<br>
    sync up with upstream elfutils, that's why I manually cherry pick.<br>
    <br>
    <blockquote cite="mid:20170208033001.9309.89399@do.openembedded.org"
      type="cite">
      <pre wrap="">
* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 68da6c9884)
</pre>
    </blockquote>
    <br>
    Previously, <span lang="EN-US">Zheng<o:p> tried to upgrade </o:p></span>bash
    failed (git am "bash: 4.3.30 -&gt; 4.4.eml" failed)<br>
    the reason is encoding issue, if invoking "git send-email", it set
    UTF-8 by default<br>
    ---<br>
               Content-Type: text/plain; charset=UTF-8<br>
               Content-Transfer-Encoding: 8bit<br>
    ---<br>
    And the utf-8 encoding changed the content of
    meta/recipes-extended/bash/bash/fix-run-intl.patch,<br>
    which caused "git am" failed.<br>
    <br>
    Manually send the patch as attachment could workaround the issue.<br>
    But the patchwork still report apply failure, I guess it applied
    [PATCH 12/13]<br>
    before [PATCH 11/13], or could not detect attachment of [PATCH
    11/13].<br>
    <br>
    Hi Ross or any one concerns,<br>
    <br>
    Could you apply the patch manually, to see if it is OK?<br>
    (I tested to save as the eml file and invoke git am to apply,
    everything is ok)<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote cite="mid:20170208033001.9309.89399@do.openembedded.org"
      type="cite">
      <pre wrap="">
* Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
  Suggested fix    Sign off the added patch file (meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch)



If you believe any of these test results are incorrect, please reply to the
mailing list (<a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -&gt; [PATCH v2] -&gt;
[PATCH v3] -&gt; ...).

---
Test framework: <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/patchtest">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest</a>
Test suite:     <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe</a>

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------04DF5E8B2C7DFF908B73C56E--
