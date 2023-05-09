Return-Path: <douglas.royds@taitcommunications.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD0BC7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 21:46:35 +0000 (UTC)
Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web10.1857.1683668775909124634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 14:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitcommunications.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitcommunications.com)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id D1CCFE0249;
	Wed, 10 May 2023 09:37:13 +1200 (NZST)
Content-Type: multipart/alternative;
 boundary="------------33wym0JKbCDxp7z31z1fC6kb"
Message-ID: <3661ef44-1856-783e-e89c-e87cf94c2487@taitcommunications.com>
Date: Wed, 10 May 2023 09:37:13 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] cve-check: add option to add additional patched
 CVEs
Content-Language: en-GB
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
 <6123792e2eee7767b4e6a377c15bdcc6ba266125.camel@linuxfoundation.org>
 <ac80d7e3b3eb739b86951ceeefe8b337b28144a8.camel@siemens.com>
 <e57e347e816ca3c355d594a95f2549af7dd86609.camel@linuxfoundation.org>
 <1a9baf9413cc3e405433806ec3e5f122e2a42793.camel@gmail.com>
 <A0C7DB9F-2B4E-4777-B233-694B7BCA3A73@arm.com> <ZFoTGY6DwttCmQ27@nuoska>
From: Douglas Royds <douglas.royds@taitcommunications.com>
In-Reply-To: <ZFoTGY6DwttCmQ27@nuoska>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 21:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181084

This is a multi-part message in MIME format.
--------------33wym0JKbCDxp7z31z1fC6kb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/05/23 9:32 pm, Mikko Rapeli wrote:
> On Tue, May 09, 2023 at 09:02:59AM +0000, Ross Burton wrote:
>> On 8 May 2023, at 09:57, Adrian Freihofer via lists.openembedded.org<adrian.freihofer=gmail.com@lists.openembedded.org>  wrote:
>> Is there any defined language that we can simply adopt?
> Since a lot of people talk about SPDX solving these issues would be nice
> to know how that is going to work. I can't parse
> https://spdx.github.io/spdx-spec/v2.3/how-to-use/#k17-linking-to-a-code-fix-for-a-security-issue
> and figure out how to mark a CVE issue which has been ignored after
> analysis.


Perhaps this?

https://spdx.github.io/spdx-spec/v2.3/how-to-use/#k16-linking-to-a-vulnerability-disclosure-document

    To communicate that a package is not vulnerable to a specific
    vulnerability it is recommended to reference a web page indicating
    why given vulnerabilities are not applicable.

    |"externalRefs" : [ { "referenceCategory" : "SECURITY",
    "referenceLocator" :
    "https://example.com/product-x/security-info.html", "referenceType"
    : "advisory" } ] |

--------------33wym0JKbCDxp7z31z1fC6kb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/05/23 9:32 pm, Mikko Rapeli wrote:
    </div>
    <blockquote type="cite" cite="mid:ZFoTGY6DwttCmQ27@nuoska">
      <pre class="moz-quote-pre" wrap="">On Tue, May 09, 2023 at 09:02:59AM +0000, Ross Burton wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 8 May 2023, at 09:57, Adrian Freihofer via lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:adrian.freihofer=gmail.com@lists.openembedded.org">&lt;adrian.freihofer=gmail.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap=""></pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Is there any defined language that we can simply adopt?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Since a lot of people talk about SPDX solving these issues would be nice
to know how that is going to work. I can't parse
<a class="moz-txt-link-freetext" href="https://spdx.github.io/spdx-spec/v2.3/how-to-use/#k17-linking-to-a-code-fix-for-a-security-issue">https://spdx.github.io/spdx-spec/v2.3/how-to-use/#k17-linking-to-a-code-fix-for-a-security-issue</a>
and figure out how to mark a CVE issue which has been ignored after
analysis.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Perhaps this?</p>
    <p><a class="moz-txt-link-freetext" href="https://spdx.github.io/spdx-spec/v2.3/how-to-use/#k16-linking-to-a-vulnerability-disclosure-document">https://spdx.github.io/spdx-spec/v2.3/how-to-use/#k16-linking-to-a-vulnerability-disclosure-document</a></p>
    <blockquote>
      <p>To communicate that a package is not vulnerable to a specific
        vulnerability it is recommended to reference a web page
        indicating why given vulnerabilities are not applicable.</p>
      <div class="codehilite">
        <pre><span></span><code class="hljs bash"><span class="hljs-string">"externalRefs"</span> : [ {
  <span class="hljs-string">"referenceCategory"</span> : <span class="hljs-string">"SECURITY"</span>,
  <span class="hljs-string">"referenceLocator"</span> : <span class="hljs-string"><a class="moz-txt-link-rfc2396E" href="https://example.com/product-x/security-info.html">"https://example.com/product-x/security-info.html"</a></span>,
  <span class="hljs-string">"referenceType"</span> : <span class="hljs-string">"advisory"</span>
} ]
</code></pre>
      </div>
    </blockquote>
    <p></p>
  </body>
</html>

--------------33wym0JKbCDxp7z31z1fC6kb--

