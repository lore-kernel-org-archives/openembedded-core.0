Return-Path: <Lei.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6377E6D50C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 04:45:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2D4jeIB022511
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Mar 2019 21:45:40 -0700 (PDT)
Received: from [128.224.162.139] (128.224.162.139) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 12 Mar 2019 21:45:39 -0700
To: =?UTF-8?B?U3RldmVuIEh1bmcgKOa0quS6jueOiSk=?= <Steven.Hung@mediatek.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <645555c96f7d4fdc84e1292df014d0da@mtkmbs06n1.mediatek.inc>
From: lei yang <lei.yang@windriver.com>
Message-ID: <7f97ae08-7310-a688-a094-5bcf9e591c91@windriver.com>
Date: Wed, 13 Mar 2019 12:58:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <645555c96f7d4fdc84e1292df014d0da@mtkmbs06n1.mediatek.inc>
X-Originating-IP: [128.224.162.139]
Subject: Re: [PATCH] class/sanity: fix broken function check_not_nfs()
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
X-List-Received-Date: Wed, 13 Mar 2019 04:45:40 -0000
Content-Type: multipart/alternative;
	boundary="------------223A89ED62E4F2D4CE8C9165"

--------------223A89ED62E4F2D4CE8C9165
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年03月13日 11:46, Steven Hung (洪于玉) wrote:
> A previous commit 2f44b9b replace oe.utils.getstatusoutput() to subprocess.check_output(). check_output() don't remove a trailling newline. Fix check_not_nfs() by comparing "6969\n".
>
> Signed-off-by: Steven Hung (洪于玉) <Steven.Hung@mediatek.com>
> ---
>   meta/classes/sanity.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass index 374dacf4d0..2d96e1e161 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -346,7 +346,7 @@ def get_filesystem_id(path):
>   # Check that the path isn't located on nfs.
>   def check_not_nfs(path, name):
>       # The nfs' filesystem id is 6969
> -    if get_filesystem_id(path) == "6969":
> +    if get_filesystem_id(path) == "6969\n":

if get_filesystem_id(path).strip() == "6969":

will be a lot better here when doing string comparison.

Lei



>           return "The %s: %s can't be located on nfs.\n" % (name, path)
>       return ""
>   
> --
> 2.18.0
>
>

-- 

Test Better, Test Faster, Test Smarter
Test Early, Test Automatically, Test Often


--------------223A89ED62E4F2D4CE8C9165
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2019年03月13日 11:46, Steven Hung (洪于玉)
      wrote:<br>
    </div>
    <blockquote
      cite="mid:645555c96f7d4fdc84e1292df014d0da@mtkmbs06n1.mediatek.inc"
      type="cite">
      <pre wrap="">A previous commit 2f44b9b replace oe.utils.getstatusoutput() to subprocess.check_output(). check_output() don't remove a trailling newline. Fix check_not_nfs() by comparing "6969\n".

Signed-off-by: Steven Hung (洪于玉) <a class="moz-txt-link-rfc2396E" href="mailto:Steven.Hung@mediatek.com">&lt;Steven.Hung@mediatek.com&gt;</a>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass index 374dacf4d0..2d96e1e161 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -346,7 +346,7 @@ def get_filesystem_id(path):
 # Check that the path isn't located on nfs.
 def check_not_nfs(path, name):
     # The nfs' filesystem id is 6969
-    if get_filesystem_id(path) == "6969":
+    if get_filesystem_id(path) == "6969\n":</pre>
    </blockquote>
    <br>
    <pre wrap="">if get_filesystem_id(path).strip() == "6969":

will be a lot better here when doing string comparison. 

Lei

</pre>
    <br>
    <br>
    <blockquote
      cite="mid:645555c96f7d4fdc84e1292df014d0da@mtkmbs06n1.mediatek.inc"
      type="cite">
      <pre wrap="">
         return "The %s: %s can't be located on nfs.\n" % (name, path)
     return ""
 
--
2.18.0
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 

Test Better, Test Faster, Test Smarter
Test Early, Test Automatically, Test Often</pre>
  </body>
</html>

--------------223A89ED62E4F2D4CE8C9165--
