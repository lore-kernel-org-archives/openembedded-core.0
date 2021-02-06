Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.3770.1612595894902761249
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 23:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=fU/vnq9O;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.210.193, mailfrom: scott.branden@broadcom.com)
Received: by mail-pf1-f193.google.com with SMTP id d26so4623140pfn.5
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 23:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to;
        bh=i9Obr7xU9f+iEihgY+JfIyYiINADTUhkgxbK+LnKkSQ=;
        b=fU/vnq9O89RJBznfD90ieF0cRT5HMArhD7sB/GT9MQWvKobozk9kFUs0rZViHa677p
         04Q4jM1noF82M0/lGuO4sE016u80WJdYwHwuAKDKtV5p/AkunSgcEYhyxWQXyT5yk+Q2
         xVcFBJnS8Bt7//bIcCV4/fITQEbza12aiUldQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=i9Obr7xU9f+iEihgY+JfIyYiINADTUhkgxbK+LnKkSQ=;
        b=ts5mKKeaOAHc9RevAX2NlNa4H+NtuNVnQpLoOkfLv/kS++inbbhPRMSdFtqWM11fKG
         QwxGR9n4px1tVcKXZVzAFdIyvYjlEQ1xe+lL/eo6oQPpl9R53cxDfNPNcb449uGzxp0e
         ofnjJQjX6pf+Oi9eN7qLcGkEDcOWLyvhd3tPb7aJX9zMM7Fw8vxhYLS25t830lt+HzlZ
         B+2Ubm0lRT8djWTtGVJUz8kTA6Oe4GOSGjRUEXJq1VNRv2Cd84Dm48u7cNhHdqhcoOic
         NUuhIJM+k0JIE4Gw2w1w+qsfVtRQrz1OCkhbXt8w1fLSNUMP+smG0xNtkcisr/LedAyT
         i+eg==
X-Gm-Message-State: AOAM533O3AJNMSEz7uXmcUez3TsOiqc7OBPG2iOWpBV3RjalC7jRehEr
	zdgeOOyS1XM5gUsmkNDm0rAp/GZNcVB77+oHuIflCWzO6CWGthm+JhiWGo7glM2cjgrc5JGXEOM
	qMS25jhnmPF9/ea3MSran6WPPhfg82r1nGjnQwbtgiPSiMoiaE23oWoqpf5AE1lJr6AF/v4phgk
	Hi/l4zZ57AtnnERCkxhDp1T6DG3J9L1g==
X-Google-Smtp-Source: ABdhPJxzCaqoUkdUNe7cBYavdqXhkg2ZQvKxdMS2N8pzhHxK64a2L407dhB4d+xxaGlxn0feFKJyzA==
X-Received: by 2002:a63:44d:: with SMTP id 74mr8197629pge.170.1612595893741;
        Fri, 05 Feb 2021 23:18:13 -0800 (PST)
Return-Path: <scott.branden@broadcom.com>
Received: from lbrmn-lnxub113.ric.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id z18sm11769676pfq.68.2021.02.05.23.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 23:18:13 -0800 (PST)
Subject: Re: [OE-core] [PATCH] externalsrc: Detect code changes in submodules
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210127083331.2561-1-tomasz.dziendzielski@gmail.com>
From: "Scott Branden" <scott.branden@broadcom.com>
Message-ID: <70f1d941-3c80-22e7-3430-25e2e5d355a5@broadcom.com>
Date: Fri, 5 Feb 2021 23:18:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127083331.2561-1-tomasz.dziendzielski@gmail.com>
X-Groupsio-MsgNum: 147719
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000071d0a105baa5bd8a"

--00000000000071d0a105baa5bd8a
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This patch, now integrated in master branch of poky, appears to also fix 
this yocto bug:

"Bug 13748 - bitbake doesn't detect changes in code to run do_compile 
when using devtool modify on recipe with destsuffix"
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13748

On 2021-01-27 12:33 a.m., Tomasz Dziendzielski wrote:
> The srctree_hash was calculated only from main source directory ignoring
> changes in submodules.
> 
> [YOCTO #13748]
> 
> Use submodule--helper to determine all submodules, and calculate hash
> from all git tree objects names combined.
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>   meta/classes/externalsrc.bbclass | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index 7a7d31e311..64e94e3301 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -190,6 +190,7 @@ def srctree_hash_files(d, srcdir=None):
>       import shutil
>       import subprocess
>       import tempfile
> +    import hashlib
>   
>       s_dir = srcdir or d.getVar('EXTERNALSRC')
>       git_dir = None
> @@ -214,7 +215,16 @@ def srctree_hash_files(d, srcdir=None):
>               env = os.environ.copy()
>               env['GIT_INDEX_FILE'] = tmp_index.name
>               subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
> -            sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
> +            git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
> +            submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
> +            for line in submodule_helper.splitlines():
> +                module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
> +                proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
> +                proc.communicate()
> +                proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
> +                stdout, _ = proc.communicate()
> +                git_sha1 += stdout.decode("utf-8")
> +            sha1 = hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
>           with open(oe_hash_file, 'w') as fobj:
>               fobj.write(sha1)
>           ret = oe_hash_file + ':True'
> 
> 
> 
> 
> 


--00000000000071d0a105baa5bd8a
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
I/3RRboOeC9M13VNr5feU91O0iDoMreAgPQJ0Lo7YrodKYug0Tt/fFDjkW3v3VIbEr2liUN69U0C
AwEAAaOCAdEwggHNMA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEwgY4wTQYIKwYBBQUH
MAKGQWh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVyc29uYWxzaWduMnNo
YTJnM29jc3AuY3J0MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vZ3Nw
ZXJzb25hbHNpZ24yc2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEQGA1Ud
HwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hh
MmczLmNybDAlBgNVHREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAK
BggrBgEFBQcDBDAfBgNVHSMEGDAWgBRpcoJiMWeVRIV3kYDEBDZJnXsLYTAdBgNVHQ4EFgQUWOK7
qiyDSt/IDm/SRcNi/sTEiyswDQYJKoZIhvcNAQELBQADggEBAEe2edd4F9tpp0GPmrFrQ+xp9kY7
uxBzPdCw588bgVrPemjLwiwV37XTT4iWJtNhPfEpaguM6jeLm58LCvHq5/IBjcyHyf4URQVwAg7B
pqkH8/M+IBstu4/D+znPHB59X+c+au3Q8D+xoNFd7I30kaE+oJuBuFsGXRBc0Ci+FM86x9k7SF8U
aui1E7Y9wDfsRSCL2TSwU773f09WkrvVdlKxNqQZj2z7bQUUn+yfXdFfBz0LqlYNfn7xJOpQE3HI
H4jq6U9+b0Qf+J0n0wyysjXPSeQ7EKXVkT8dM2KSpIN86v5dd9LkAz3C1dmjuPRGEC8ZhI1IjMBt
0itrn6C23NsxggJvMIICawIBATBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWdu
IG52LXNhMTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0g
RzMCDFtD165RQeUC8DvoCDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgS8HN2Mzp
TS2+0n4Xd7g+Ubf7M9m+f0QR0h7Gte7iw+QwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkq
hkiG9w0BCQUxDxcNMjEwMjA2MDcxODE0WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjAL
BglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG
9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAIH64XuEAaU2UPlNxzlnb5eotsFB
ZGFQETYxWqdJJ0ePvdt386CTVABh0oj0go3fB9JSdJInvPkq2SwAZCbCpysj1u+79yL5+qDyt134
RrTBDurjDPKVOl0O++SQzTo0UryPfH3iQx6hKs0bky7BoqfsQZsJq5dLsaf11UIvNiMkelHDLll1
Rsbsj3wg+ePFTFGXQff4JIAtOqyy5FsFEYyDfqNpUPnkOc5QmvG1aahM/fHc+jHN9bR/+sDn5Gmu
GOL8hpb/hc4FmndeOv521OyOS49tu7SlaOfLP05PkvsaHQMgXq6wTBeH5ucUey/yXSBt1g90+/P4
dBEXsS5RDa0=

--00000000000071d0a105baa5bd8a--
