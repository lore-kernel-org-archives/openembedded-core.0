Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UFDqi-0007ag-Fo
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 02:18:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2C11B9a021891
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Mar 2013 18:01:11 -0700 (PDT)
Received: from [128.224.162.206] (128.224.162.206) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 11 Mar 2013 18:01:11 -0700
Message-ID: <513E7E55.9050809@windriver.com>
Date: Tue, 12 Mar 2013 09:01:09 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1362979546.git.hongxu.jia@windriver.com>
	<582c0b810b5ca744b7c83f3df2cc80a42571e85c.1362979546.git.hongxu.jia@windriver.com>
	<50A4BAC6-D1E6-4F33-A961-450D7D4CCF5E@gmail.com>
In-Reply-To: <50A4BAC6-D1E6-4F33-A961-450D7D4CCF5E@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qemu-native:fix do_compile failed on SLED 11.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 01:18:01 -0000
Content-Type: multipart/alternative;
	boundary="------------090509000405060102060005"

--------------090509000405060102060005
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2013 01:15 AM, Khem Raj wrote:
> On Mar 11, 2013, at 4:07 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
>> ++// include this one last due to some versions of it being buggy:
>> ++// http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html
>> ++#include <sys/capability.h>
> upstream will probably complain about C++ style comments.
>
Alright, I will use C style comments instead.

Thanks,
Hongxu

--------------090509000405060102060005
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/12/2013 01:15 AM, Khem Raj wrote:<br>
    </div>
    <blockquote
      cite="mid:50A4BAC6-D1E6-4F33-A961-450D7D4CCF5E@gmail.com"
      type="cite">
      <pre wrap="">
On Mar 11, 2013, at 4:07 AM, Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="">++// include this one last due to some versions of it being buggy:
++// <a class="moz-txt-link-freetext" href="http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html">http://www.linuxtv.org/pipermail/vdr/2009-August/021194.html</a>
++#include &lt;sys/capability.h&gt;
</pre>
      </blockquote>
      <pre wrap="">
upstream will probably complain about C++ style comments. 

</pre>
    </blockquote>
    Alright, I will use <span style="color: rgb(0, 0, 0); font-family:
      Arial, 'Liberation Sans', 'DejaVu Sans', sans-serif; font-size:
      14px; font-style: normal; font-variant: normal; font-weight:
      normal; letter-spacing: normal; line-height: 18px; orphans: 2;
      text-align: left; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 2; word-spacing: 0px;
      -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); display: inline !important;
      float: none;">C style comments instead.<br>
      <br>
      Thanks,<br>
      Hongxu</span>
  </body>
</html>

--------------090509000405060102060005--
