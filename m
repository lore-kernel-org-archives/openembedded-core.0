Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 80D896F8A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:14:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s31AEDiU029007
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Apr 2014 03:14:13 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 1 Apr 2014 03:14:13 -0700
Message-ID: <533A9171.40705@windriver.com>
Date: Tue, 1 Apr 2014 18:14:09 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1396317576-25426-1-git-send-email-kai.kang@windriver.com>
In-Reply-To: <1396317576-25426-1-git-send-email-kai.kang@windriver.com>
X-Originating-IP: [128.224.162.231]
Subject: Re: [PATCH] Fix some bash errors
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
X-List-Received-Date: Tue, 01 Apr 2014 10:14:15 -0000
Content-Type: multipart/alternative;
	boundary="------------040205070207090404020508"

--------------040205070207090404020508
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014?04?01? 09:59, Kai Kang wrote:
> Fix some errors for bash 3.2.48 by take patches from bash 4.3.
>
> Yong Zhang (1):
>    bash-3.2.48: fix error path of getc_with_restart
>
>   .../bash-fix-error-path-of-getc_with_restart.patch | 41 ++++++++++++++++++++++
>   .../bash-3.2.48/bash-fix-getc_with_restart.patch   | 28 +++++++++++++++
>   meta/recipes-extended/bash/bash_3.2.48.bb          |  2 ++
>   3 files changed, 71 insertions(+)
>   create mode 100644 meta/recipes-extended/bash/bash-3.2.48/bash-fix-error-path-of-getc_with_restart.patch
>   create mode 100644 meta/recipes-extended/bash/bash-3.2.48/bash-fix-getc_with_restart.patch
>

Please ignore it. Thanks.

-- 
Regards,
Neil | Kai Kang


--------------040205070207090404020508
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2014&#24180;04&#26376;01&#26085; 09:59, Kai Kang wrote:<br>
    </div>
    <blockquote
      cite="mid:1396317576-25426-1-git-send-email-kai.kang@windriver.com"
      type="cite">
      <pre wrap="">Fix some errors for bash 3.2.48 by take patches from bash 4.3.

Yong Zhang (1):
  bash-3.2.48: fix error path of getc_with_restart

 .../bash-fix-error-path-of-getc_with_restart.patch | 41 ++++++++++++++++++++++
 .../bash-3.2.48/bash-fix-getc_with_restart.patch   | 28 +++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |  2 ++
 3 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/bash-fix-error-path-of-getc_with_restart.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/bash-fix-getc_with_restart.patch

</pre>
    </blockquote>
    <font size="+1"><br>
      <font size="+1">Please ignore it. Thanks.</font><br>
    </font><br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------040205070207090404020508--
