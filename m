Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web09.26800.1611849346236240785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 07:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZieVBt/y;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id r199so1536207oor.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 07:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=IkUwQi7xqmv4G0NHmQgY/5w+9AxLJTwkRvPTp8QDwpo=;
        b=ZieVBt/yNcK19ktzTlo8hOovifsKUNV9LLLF+1wmMg25zF/iPha1SwLaOHrr7rPEG5
         Yd4SZg31fVCgrl8mwyq1FlNVO4VN7a1CrlDf2lNqLiGt2Fpyg+gFRWC3wSFzY8e/4elu
         9ooZdT+zv0Wht8mIh5mqAZwGntSnR7iGwiyw449cVinDdBFnK1SdoW4Qhp9Gua5TvQ8b
         E7+SwCeG1zQ0oq6LUICoDTAc7ghEacHSrWr1qQVg8rywcTmh34FpB4Qc20Ok89F1Fai9
         2+1zH9swXejzgSsssnQUqH2V4yqEKYJpxcwhPh2qqdmfhq9lX6q5MfaFyyyN3yaGYzaj
         io0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=IkUwQi7xqmv4G0NHmQgY/5w+9AxLJTwkRvPTp8QDwpo=;
        b=nCoeId10bQ25XuFAqrvay4z6elpttqESsFFnOVjfaCsDhdtk8KEZ7+7sERJzmX32Ps
         /YPeSod8cDsnULXC87HTQhepGCQV5BO70Inqqguezw+rFTv4+uZRBAYLC6Igergc5Ms/
         WZbxWcvjVeKVDwDfYRKrTOyaqB4CHqjmPok4kvDyubp2Sv5gAg6yzzvWtzmxdTi4ha7I
         rCWPJv60H37YffFaVKq/JH6M+RbWN2TE54Dl3XXaC8GFEy9Em6OPgypW8rfwFWHEG7U1
         K5QAAwCa5Qr4xfz5QWmD6ZnfTtYCn982QOgNHnW6yJfN/eKPTcmk0vL4Wstdwfq+TMSH
         wJ2w==
X-Gm-Message-State: AOAM533iMwLd3Xo9+vNwA0AbXCme/zirLKhFOVDmUt0ZyXEi9Gh/hKDt
	ttGsGit2TnNPfJ7DG5zgvng/BYDonkE=
X-Google-Smtp-Source: ABdhPJw5IDqTjL9oWIVa8sFZ3ZZZK7H7sMNseHJyF3uw2vEZkrAUle/ZcqEe6ikMnlUJrt62nhy0Aw==
X-Received: by 2002:a4a:a5cc:: with SMTP id k12mr144046oom.33.1611849345301;
        Thu, 28 Jan 2021 07:55:45 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id n5sm1202310oif.27.2021.01.28.07.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 07:55:44 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake: Don't treat mc recipe (Midnight Commander) as a multiconfig target
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210128155534.7104-1-tomasz.dziendzielski@gmail.com>
Message-ID: <224352e6-e15e-cace-6f8d-7a5bda5757b3@gmail.com>
Date: Thu, 28 Jan 2021 09:55:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128155534.7104-1-tomasz.dziendzielski@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------DC31B596048E0FC90E9E5F6C"
Content-Language: en-US

--------------DC31B596048E0FC90E9E5F6C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/28/21 9:55 AM, Tomasz Dziendzielski wrote:
> When we run `devtool build mc` recipe's task dependencies are expanded
> to "mc:do_populate_sysroot" where "mc" name is treated as multiconfig
> and "do_package_sysroot" as multiconfigname.

Hmm, this might be problematic, since "bitbake -e mc:foo" needs to keep 
working to dump the base environment for the "foo" multiconfig, and I 
think this patch will break that (although I didn't test it to verify)


>
> | ERROR: Multiconfig dependency mc:do_populate_sysroot depends on
> | nonexistent multiconfig configuration named do_populate_sysroot
>
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>   bitbake/lib/bb/cache.py    | 4 ++--
>   bitbake/lib/bb/cooker.py   | 6 +++---
>   bitbake/lib/bb/runqueue.py | 6 +++---
>   bitbake/lib/bb/siggen.py   | 2 +-
>   4 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/bitbake/lib/bb/cache.py b/bitbake/lib/bb/cache.py
> index 36270d0093..5497da384f 100644
> --- a/bitbake/lib/bb/cache.py
> +++ b/bitbake/lib/bb/cache.py
> @@ -238,7 +238,7 @@ def virtualfn2realfn(virtualfn):
>       Convert a virtual file name to a real one + the associated subclass keyword
>       """
>       mc = ""
> -    if virtualfn.startswith('mc:'):
> +    if virtualfn.startswith('mc:') and virtualfn.count(':') == 2:
>           elems = virtualfn.split(':')
>           mc = elems[1]
>           virtualfn = ":".join(elems[2:])
> @@ -268,7 +268,7 @@ def variant2virtual(realfn, variant):
>       """
>       if variant == "":
>           return realfn
> -    if variant.startswith("mc:"):
> +    if variant.startswith("mc:") and variant.count(':') == 2:
>           elems = variant.split(":")
>           if elems[2]:
>               return "mc:" + elems[1] + ":virtual:" + ":".join(elems[2:]) + ":" + realfn
> diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
> index 83cfee7fb4..3d8dbd6065 100644
> --- a/bitbake/lib/bb/cooker.py
> +++ b/bitbake/lib/bb/cooker.py
> @@ -533,7 +533,7 @@ class BBCooker:
>               self.reset()
>   
>           def mc_base(p):
> -            if p.startswith('mc:'):
> +            if p.startswith('mc:') and p.count(':') == 2:
>                   s = p.split(':')
>                   if len(s) == 2:
>                       return s[1]
> @@ -614,7 +614,7 @@ class BBCooker:
>           # Replace string such as "mc:*:bash"
>           # into "mc:A:bash mc:B:bash bash"
>           for k in targetlist:
> -            if k.startswith("mc:"):
> +            if k.startswith("mc:") and k.count(':') == 2:
>                   if wildcard:
>                       bb.fatal('multiconfig conflict')
>                   if k.split(":")[1] == "*":
> @@ -648,7 +648,7 @@ class BBCooker:
>           for k in fulltargetlist:
>               origk = k
>               mc = ""
> -            if k.startswith("mc:"):
> +            if k.startswith("mc:") and k.count(':') == 2:
>                   mc = k.split(":")[1]
>                   k = ":".join(k.split(":")[2:])
>               ktask = task
> diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
> index 28bdadb45e..d1fcb7cea4 100644
> --- a/bitbake/lib/bb/runqueue.py
> +++ b/bitbake/lib/bb/runqueue.py
> @@ -38,7 +38,7 @@ def taskname_from_tid(tid):
>       return tid.rsplit(":", 1)[1]
>   
>   def mc_from_tid(tid):
> -    if tid.startswith('mc:'):
> +    if tid.startswith('mc:') and tid.count(':') == 2:
>           return tid.split(':')[1]
>       return ""
>   
> @@ -47,13 +47,13 @@ def split_tid(tid):
>       return (mc, fn, taskname)
>   
>   def split_mc(n):
> -    if n.startswith("mc:"):
> +    if n.startswith("mc:") and n.count(':') == 2:
>           _, mc, n = n.split(":", 2)
>           return (mc, n)
>       return ('', n)
>   
>   def split_tid_mcfn(tid):
> -    if tid.startswith('mc:'):
> +    if tid.startswith('mc:') and tid.count(':') == 2:
>           elems = tid.split(':')
>           mc = elems[1]
>           fn = ":".join(elems[2:-1])
> diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
> index 0ac3952466..6859a7207b 100644
> --- a/bitbake/lib/bb/siggen.py
> +++ b/bitbake/lib/bb/siggen.py
> @@ -748,7 +748,7 @@ def clean_basepath(basepath):
>       if basepath[0] == '/':
>           return cleaned
>   
> -    if basepath.startswith("mc:"):
> +    if basepath.startswith("mc:") and basepath.count(':') == 2:
>           mc, mc_name, basepath = basepath.split(":", 2)
>           mc_suffix = ':mc:' + mc_name
>       else:
>
> 
>

--------------DC31B596048E0FC90E9E5F6C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/28/21 9:55 AM, Tomasz
      Dziendzielski wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210128155534.7104-1-tomasz.dziendzielski@gmail.com">
      <pre class="moz-quote-pre" wrap="">When we run `devtool build mc` recipe's task dependencies are expanded
to "mc:do_populate_sysroot" where "mc" name is treated as multiconfig
and "do_package_sysroot" as multiconfigname.</pre>
    </blockquote>
    <p>Hmm, this might be problematic, since "bitbake -e mc:foo" needs
      to keep working to dump the base environment for the "foo"
      multiconfig, and I think this patch will break that (although I
      didn't test it to verify)<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20210128155534.7104-1-tomasz.dziendzielski@gmail.com">
      <pre class="moz-quote-pre" wrap="">

| ERROR: Multiconfig dependency mc:do_populate_sysroot depends on
| nonexistent multiconfig configuration named do_populate_sysroot

Signed-off-by: Tomasz Dziendzielski <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.dziendzielski@gmail.com">&lt;tomasz.dziendzielski@gmail.com&gt;</a>
---
 bitbake/lib/bb/cache.py    | 4 ++--
 bitbake/lib/bb/cooker.py   | 6 +++---
 bitbake/lib/bb/runqueue.py | 6 +++---
 bitbake/lib/bb/siggen.py   | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/bitbake/lib/bb/cache.py b/bitbake/lib/bb/cache.py
index 36270d0093..5497da384f 100644
--- a/bitbake/lib/bb/cache.py
+++ b/bitbake/lib/bb/cache.py
@@ -238,7 +238,7 @@ def virtualfn2realfn(virtualfn):
     Convert a virtual file name to a real one + the associated subclass keyword
     """
     mc = ""
-    if virtualfn.startswith('mc:'):
+    if virtualfn.startswith('mc:') and virtualfn.count(':') == 2:
         elems = virtualfn.split(':')
         mc = elems[1]
         virtualfn = ":".join(elems[2:])
@@ -268,7 +268,7 @@ def variant2virtual(realfn, variant):
     """
     if variant == "":
         return realfn
-    if variant.startswith("mc:"):
+    if variant.startswith("mc:") and variant.count(':') == 2:
         elems = variant.split(":")
         if elems[2]:
             return "mc:" + elems[1] + ":virtual:" + ":".join(elems[2:]) + ":<a class="moz-txt-link-rfc2396E" href="mailto:+realfndiff--gita/bitbake/lib/bb/cooker.pyb/bitbake/lib/bb/cooker.pyindex83cfee7fb4..3d8dbd6065100644---a/bitbake/lib/bb/cooker.py+++b/bitbake/lib/bb/cooker.py@@-533,7+533,7@@classBBCooker:self.reset()defmc_base(p):-ifp.startswith('mc:'):+ifp.startswith('mc:')andp.count(':')==2:s=p.split(':')iflen(s)==2:returns[1]@@-614,7+614,7@@classBBCooker:#Replacestringsuchas">" + realfn
diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index 83cfee7fb4..3d8dbd6065 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -533,7 +533,7 @@ class BBCooker:
             self.reset()
 
         def mc_base(p):
-            if p.startswith('mc:'):
+            if p.startswith('mc:') and p.count(':') == 2:
                 s = p.split(':')
                 if len(s) == 2:
                     return s[1]
@@ -614,7 +614,7 @@ class BBCooker:
         # Replace string such as "</a>mc:*:bash"
         # into "mc:A:bash mc:B:bash bash"
         for k in targetlist:
-            if k.startswith("mc:"):
+            if k.startswith("mc:") and k.count(':') == 2:
                 if wildcard:
                     bb.fatal('multiconfig conflict')
                 if k.split(":")[1] == "*":
@@ -648,7 +648,7 @@ class BBCooker:
         for k in fulltargetlist:
             origk = k
             mc = ""
-            if k.startswith("mc:"):
+            if k.startswith("mc:") and k.count(':') == 2:
                 mc = k.split(":")[1]
                 k = ":".join(k.split(":")[2:])
             ktask = task
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 28bdadb45e..d1fcb7cea4 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -38,7 +38,7 @@ def taskname_from_tid(tid):
     return tid.rsplit(":", 1)[1]
 
 def mc_from_tid(tid):
-    if tid.startswith('mc:'):
+    if tid.startswith('mc:') and tid.count(':') == 2:
         return tid.split(':')[1]
     return ""
 
@@ -47,13 +47,13 @@ def split_tid(tid):
     return (mc, fn, taskname)
 
 def split_mc(n):
-    if n.startswith("mc:"):
+    if n.startswith("mc:") and n.count(':') == 2:
         _, mc, n = n.split(":", 2)
         return (mc, n)
     return ('', n)
 
 def split_tid_mcfn(tid):
-    if tid.startswith('mc:'):
+    if tid.startswith('mc:') and tid.count(':') == 2:
         elems = tid.split(':')
         mc = elems[1]
         fn = ":".join(elems[2:-1])
diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index 0ac3952466..6859a7207b 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -748,7 +748,7 @@ def clean_basepath(basepath):
     if basepath[0] == '/':
         return cleaned
 
-    if basepath.startswith("mc:"):
+    if basepath.startswith("mc:") and basepath.count(':') == 2:
         mc, mc_name, basepath = basepath.split(":", 2)
         mc_suffix = ':mc:' + mc_name
     else:
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------DC31B596048E0FC90E9E5F6C--
