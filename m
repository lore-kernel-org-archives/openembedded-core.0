Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.7259.1612854794615593853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 23:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitradio.com header.s=google header.b=F0lPnE4T;
 spf=pass (domain: taitradio.com, ip: 209.85.216.51, mailfrom: douglas.royds@taitradio.com)
Received: by mail-pj1-f51.google.com with SMTP id fa16so1051535pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 23:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitradio.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=jW8PgbNJdnUOI7LWVlkvDYgtI8P8XxXEXcsaihnJXsU=;
        b=F0lPnE4Ts6TxaAuI+DD+7B4mlr1t/8AGYebbUBjCsw9o3skvaaNY1ZXRA9BH6gW0SA
         xg+zhXvtsW3qpuAMiWj/ge23U7nFVC3/ea/1sa/07L3cJstwjhQIN3aT4sSzqSSfxbaY
         8EqPruVr5916OVHFsRL7aotIaqyDnU8mK9KWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=jW8PgbNJdnUOI7LWVlkvDYgtI8P8XxXEXcsaihnJXsU=;
        b=Xdm33poUhUOAvAnODaA4biRdJtBRaK/tAS8NS/2FGvdQPe92MaCSsYgsD4wl0uFgqY
         JxozIwDP0b5CySDYdwVd6ssuL20LYJ4D+wU5AzxU89B1Xg9YgO++74WR4redH3qM4bB1
         GYkXhbwvXNl6jRBCJenENNDvDXFm3+J4e5iM6IWRHMAvbVpTZYFQabHml+m49XJGBSyG
         uY4wUTp5A4+46aHp+HyL1htTZyBNweeha+W7EM+KIUZaq19iIXpGOqeOHVj9dzM9+6Xd
         /qowxUIHrP/vquu9jE+vc0SAYILVc4SEq5Va6uo6EKspngTa1b8udKh0vW5A9XtIhrVB
         fpcg==
X-Gm-Message-State: AOAM532ZOHGy3fmbGn1m6/mGVZbH/V1yzg+AeHAligH2IFcINet+W8fR
	ycZHcv9F5GDMomkOjWnHlalIcWhbcMsnrCVUFqJCvEoTywb6GGDgubdGaW/2vWS5lCbju+4wa1T
	Tkjcd9F624hLlByeb7dwiVGVCLj0EH0EItJmQdv6eT64=
X-Google-Smtp-Source: ABdhPJwQV1fH1m2g4xUFR8jaNEfY3a/IeqYHDfVAcqx9BNeUXsYuEMkh6DITyYX3WKr/54zvwe3BJA==
X-Received: by 2002:a17:902:5998:b029:e1:880c:a352 with SMTP id p24-20020a1709025998b02900e1880ca352mr19868690pli.70.1612854793861;
        Mon, 08 Feb 2021 23:13:13 -0800 (PST)
Return-Path: <douglas.royds@taitradio.com>
Received: from [172.16.182.119] ([202.37.96.2])
        by smtp.gmail.com with ESMTPSA id e15sm15717402pgr.81.2021.02.08.23.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 23:13:13 -0800 (PST)
Subject: Re: [OE-core] [PATCH] externalsrc: Detect code changes in submodules
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210205034258.340392-1-douglas.royds@taitradio.com>
 <CAPoiz9woPh6dbcXjeLhGxSAmB8QX4jE_txbh-R3Hq8YDQvwoQQ@mail.gmail.com>
From: "Douglas" <douglas.royds@taitradio.com>
Message-ID: <56e16c44-4d81-8f48-dda6-7c568cbf2331@taitradio.com>
Date: Tue, 9 Feb 2021 20:13:10 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPoiz9woPh6dbcXjeLhGxSAmB8QX4jE_txbh-R3Hq8YDQvwoQQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------10C2DFD90891664EA0CC1E38"
Content-Language: en-GB

--------------10C2DFD90891664EA0CC1E38
Content-Type: text/plain; charset="UTF-8"; format=flowed

On 6/02/21 1:01 pm, Jon Mason wrote:
> On Thu, Feb 4, 2021 at 10:43 PM Douglas via lists.openembedded.org
> <douglas.royds=taitradio.com@lists.openembedded.org> wrote:
>> Further to 50ff9afb39, only detect code changes in submodules that are
>> subdirectories of the EXTERNALSRC directory.
>>
>> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
>> ---
> I believe this patch is causing errors in the autobuilder.  See
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1801/steps/14/logs/stdio


Good find by the autobuilder. Earning its money.

This is a git weakness: In this case of a local-files-only recipe, 
devtool creates an empty git repository and `git submodule--helper list 
path/` fails. Add a file (not even committed), and it works just fine.

Updated patch on its way.


>
>>   meta/classes/externalsrc.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
>> index 64e94e3301..27496bb2db 100644
>> --- a/meta/classes/externalsrc.bbclass
>> +++ b/meta/classes/externalsrc.bbclass
>> @@ -216,7 +216,7 @@ def srctree_hash_files(d, srcdir=None):
>>               env['GIT_INDEX_FILE'] = tmp_index.name
>>               subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
>>               git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
>> -            submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
>> +            submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list', s_dir], cwd=s_dir, env=env).decode("utf-8")
>>               for line in submodule_helper.splitlines():
>>                   module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
>>                   proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
>> --
>> 2.25.1
>>
>>
>> 
>>

-- 
This Communication is Confidential. We only send and receive email on the
basis of the terms set out at www.taitradio.com/email_disclaimer 
<http://www.taitradio.com/email_disclaimer>

--------------10C2DFD90891664EA0CC1E38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 6/02/21 1:01 pm, Jon Mason wrote:<br=
>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAPoiz9woPh6dbcXjeLhGxSAmB8QX4jE_txbh-R3Hq8YDQvwoQQ@mail.gmail=
.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Thu, Feb 4, 2021 at 10:43 =
PM Douglas via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:douglas.royds=3Dtaitradi=
o.com@lists.openembedded.org">&lt;douglas.royds=3Dtaitradio.com@lists.opene=
mbedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Further to 50ff9afb39, only detect code changes in submodules that are
subdirectories of the EXTERNALSRC directory.

Signed-off-by: Douglas Royds <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:douglas.royds@taitradio.com">&lt;douglas.royds@taitradio.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I believe this patch is causing errors in the autobuilder.  See
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/79/builds/1801/steps/14/logs/stdio">https://autobu=
ilder.yoctoproject.org/typhoon/#/builders/79/builds/1801/steps/14/logs/stdi=
o</a></pre>
    </blockquote>
    <p><br>
    </p>
    <p>Good find by the autobuilder. Earning its money.</p>
    <p>This is a git weakness: In this case of a local-files-only
      recipe, devtool creates an empty git repository and `git
      submodule--helper list path/` fails. Add a file (not even
      committed), and it works just fine.</p>
    <p>Updated patch on its way.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CAPoiz9woPh6dbcXjeLhGxSAmB8QX4jE_txbh-R3Hq8YDQvwoQQ@mail.gmail=
.com"><br>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D""> meta/classes/externalsrc.b=
bclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.b=
bclass
index 64e94e3301..27496bb2db 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -216,7 +216,7 @@ def srctree_hash_files(d, srcdir=3DNone):
             env['GIT_INDEX_FILE'] =3D tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=3Ds_di=
r, env=3Denv)
             git_sha1 =3D subprocess.check_output(['git', 'write-tree'], c=
wd=3Ds_dir, env=3Denv).decode("utf-8")
-            submodule_helper =3D subprocess.check_output(['git', 'submodu=
le--helper', 'list'], cwd=3Ds_dir, env=3Denv).decode("utf-8")
+            submodule_helper =3D subprocess.check_output(['git', 'submodu=
le--helper', 'list', s_dir], cwd=3Ds_dir, env=3Denv).decode("utf-8")
             for line in submodule_helper.splitlines():
                 module_dir =3D os.path.join(s_dir, line.rsplit(maxsplit=
=3D1)[1])
                 proc =3D subprocess.Popen(['git', 'add', '-A', '.'], cwd=
=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.DEVNULL, stderr=3Dsubprocess=
.DEVNULL)
--
2.25.1




</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

<br>
<hr>This Communication is Confidential. We only send and receive email on =
the<br>basis of the terms set out at <a href=3D"http://www.taitradio.com/em=
ail_disclaimer" target=3D"_blank">www.taitradio.com/email_<wbr>disclaimer</=
a><div><hr></div>

--------------10C2DFD90891664EA0CC1E38--
