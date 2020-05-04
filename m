Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.15866.1588626732076969620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 14:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=T6oUy24e;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [100.115.92.199] (unknown [199.58.187.144])
	by linux.microsoft.com (Postfix) with ESMTPSA id 39E1C20B717B;
	Mon,  4 May 2020 14:12:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 39E1C20B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1588626731;
	bh=igfFlAbaWjSCFYHG9SXosKe9EGZz6k/71Q2tQlxO7fY=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=T6oUy24e7tdxm4TDRFTHfqId6TMWjO/kWqKaG/FTxFTo7P/kDrGpo9GqYiQV5Py5S
	 hoAWU0QnTu6H/slEf0yh9G6Zm1rA94A6I6MuhKOEzZYiyJ804NF7HFPLrEhPY44E0g
	 Y4pz0rsReQ1aTpy2NGlHtqpR5XUFTI31JvgnPAMg=
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXSDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciBuZXdsaWI6IFVwZ3JhZGUgdG8gbGF0ZXN0IHllYXJseSByZWxlYXNlIDMuMy4w?=
To: openembedded-core@lists.openembedded.org,
 Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
References: <20200504205751.40338-1-alejandro@enedino.org>
 <20200504210236.2273.59294@do>
From: "Alejandro Hernandez" <alhe@linux.microsoft.com>
Message-ID: <f242e19e-c275-f0b0-b7f1-63f7c056c611@linux.microsoft.com>
Date: Mon, 4 May 2020 14:12:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504210236.2273.59294@do>
Content-Type: multipart/alternative;
 boundary="------------A30057C35975A938C575B991"
Content-Language: en-US

--------------A30057C35975A938C575B991
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

My bad, this meant to be a patch for Dunfell since its been merged on 
master already, please disregard this failure


Alejandro

On 5/4/20 2:02 PM, Patchwork wrote:
> == Series Details ==
>
> Series: newlib: Upgrade to latest yearly release 3.3.0
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/23943/
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
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at 26eb22191f)
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
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
>
> 

--------------A30057C35975A938C575B991
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>My bad, this meant to be a patch for Dunfell since its been
      merged on master already, please disregard this failure</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <div class="moz-cite-prefix">On 5/4/20 2:02 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200504210236.2273.59294@do">
      <pre class="moz-quote-pre" wrap="">== Series Details ==

Series: newlib: Upgrade to latest yearly release 3.3.0
Revision: 1
URL   : <a class="moz-txt-link-freetext" href="https://patchwork.openembedded.org/series/23943/">https://patchwork.openembedded.org/series/23943/</a>
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 26eb22191f)



If you believe any of these test results are incorrect, please reply to the
mailing list (<a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -&gt; [PATCH v2] -&gt;
[PATCH v3] -&gt; ...).

---
Guidelines:     <a class="moz-txt-link-freetext" href="https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines">https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a>
Test framework: <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/patchtest">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest</a>
Test suite:     <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe">http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe</a>

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A30057C35975A938C575B991--
