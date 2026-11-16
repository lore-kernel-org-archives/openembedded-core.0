Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17873.1794788655181455163
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=I9oQnFGv;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so15812315e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 16:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794788653; x=1795393453; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygsBKyM8Uh8y7tdChtj/6QYel+sQ4UiTU7FTOftH5Bg=;
        b=I9oQnFGvrGi+S4bHkInMoGQoqqbFn3zuwxgeIptrrM1t4jtn8T8HbIr5RoVxthgxx0
         Zya7pRaZ2i1AZK5b3WPdcSZlqSEw24wLCE9fUZnuJd4I3PY9sGmAu0FLtvdze4dEKlSl
         vpTc621ngapblHUO+5fW1KI3HKEFbDdRgVNCH+l8WEX7QL+UN3aN3egChfXDjGtqO6Vf
         W3O0QZv1UKIRb5Oepn8nCbItiMGryR/eWEOQqZgnBG2tTKgZ3kN3jAjQ/R3ZX6pDNb9n
         SnzMHle1qdRHfp1y0w1Nctq5aRHJaQeVT8Cw/Vjvv+WDI1CSuysTGUsvaCWElcqpipSG
         ZHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794788653; x=1795393453;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygsBKyM8Uh8y7tdChtj/6QYel+sQ4UiTU7FTOftH5Bg=;
        b=KaNrpFATcVQS3g+eLWtV+4l3bGvqNypFlj8U0SFksKLL3IYbbHf5f/jY6qYznv7rLo
         oKraKsbr8V5sgzR5Ps/b+rBKVuZOjicjCI9d0MgmupcTISSRR9aZ8HQYqMheCrIf8OkP
         qtGoHb7mrXwb9/fwtRvefZb9+bwgliENUhNZQKjpIRR11uYsQK0dU4GJv8rx5YwB29Pr
         ezYuta6rzmDZ7fuEFYeJ0Ew5Ja/T7xFeWYcC81ZtgZd2sclife05WIkDc9QG2nRalPKB
         dhTiMgGUO71gYVrahY+CcPKQKVt6IJGImNl+BNucVZjodNc0GeSCB4J5uZLgJynwvgP5
         /sPA==
X-Forwarded-Encrypted: i=1; AL+hErEqWYoG07xpd32s8jHFgiprD+bPsKggJ4x9mJwRWpDQXB3LVkQmv7I7RITC2gZJiNE6N/Emr5/V2VD36QE9lJBZMg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+TM8vcRxtimCfLXQ0g6Ebkph2BolCIQqiAtXFmb86E8KBS6xN4
	KYxTXfm5i86//0J3g1kKZZotPUKdgsYxOBQLq2NcDZFdICVi2rTEiWkkAUwXL8wGtIA=
X-Gm-Gg: AYBFou0UHEftdZQqXz7waQDfq+G6vDPMKreXh75E/afWUhzQMPnuHan5g6xMykQfucr
	7d+Ft+I9NtZJNHb62w8rXtZBCWknfADzHDrhVyNPNS806fodw5IUDGYXWBu1DJQ74pzpQjO7XhX
	2oxixEkeeUiv7FsSfmteqcB423rxqP47HgceVLYool21cYnIuqcorPLXsVdafl7GzB0fPYXufsi
	8I3FQSIobN0qYnMOulhhRLWVvjvSf6KSQAyzI766NlTo5R+70tQ1B206o/1mgzPkaPW7nB2uKJb
	G55LB4oUq1Ljxs60w+IrVeCLdbGrhiRdTq585aLeFAtM/BM7sHBJ83edxevJ4GFdCRaAXY/qwL2
	+y2z9ZwjGMa8kPSQq9whdORKQVI5bR904Entwj2GkMt2kYIv7I1vunJeayxgkxsvmFHW+MaImA+
	nAuGYxZWiN0z6s/x7v+yI7N56P18OMxYvmGgkj4JB29AuGzT6c5zlBTs/pWJdKt89/q92564YRy
	XdrtrY6GJ6lfhoepa6GTufDhK87j0Q1yTglVlvdy7yj8PW+PB5PLJw2YxPsq//XOhaQy14h9oBX
	p5B6OQlPRbcetE+lQZ/z4tYipsXDcbjY2RlGq3LzUC+O5pywtB3akhdjf2s5bnRm0TBKMSREpOc
	ugGDGc49ZflpLvJ5JwbWlVRf1M7yaCNmdNtysCw==
X-Received: by 2002:a05:600c:1553:b0:4bb:5e6b:49e with SMTP id 5b1f17b1804b1-4bb5e6b0656mr147230575e9.6.1794788653275;
        Sun, 15 Nov 2026 16:24:13 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6934sm18506839f8f.48.2026.11.15.16.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 16:24:12 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 01:24:12 +0100
Message-Id: <DMW7H8DOPSUB.16R70VW7D7TPH@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 0/9] curl: Security fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261106071932.490299-1-dkelaiya@cisco.com>
In-Reply-To: <20261106071932.490299-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 00:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250302

On Fri Nov 6, 2026 at 8:19 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Backport nine additional security fixes to curl 8.19.0 on Wrynose.
>
> This series applies on top of my earlier curl CVE series [1],
> from CVE-2026-86414 through CVE-2026-18924.
>
> These commits address MIME cleanup, HSTS expiration, SSH host
> verification on redirects, output-file handling, FTP wildcard
> callbacks, connection cleanup, credential removal from effective
> URLs, interface-bound connection reuse and certificate parsing.
>
> The CVE-2026-94266 commit includes the Git 2.53.0 compatibility
> backport needed for the effective-URL behavior change. Keep that
> companion change with the curl fix.
>
> The CVE-2026-87866 commit carries the source fix for wolfSSL
> pinning, including the shared ASN.1 parser and affected TLS callers.
>
> [1] https://lists.openembedded.org/g/openembedded-core/message/249332
>
> Darsh Kelaiya (9):
>   curl: fix CVE-2026-92391
>   curl: fix CVE-2026-87863
>   curl: fix CVE-2026-86410
>   curl: fix CVE-2026-92390
>   curl: fix CVE-2026-92388
>   curl: fix CVE-2026-92392
>   curl: fix CVE-2026-94266
>   curl: fix CVE-2026-107929
>   curl: fix CVE-2026-87866
>
>  ...l-stripping-creds-from-effective-url.patch | 140 ++++
>  meta/recipes-devtools/git/git_2.53.0.bb       |   1 +
>  .../curl/curl/CVE-2026-107929.patch           | 470 +++++++++++
>  .../curl/curl/CVE-2026-86410.patch            | 102 +++
>  .../curl/curl/CVE-2026-87863.patch            | 203 +++++
>  .../curl/curl/CVE-2026-87866.patch            | 750 ++++++++++++++++++
>  .../curl/curl/CVE-2026-92388_p1.patch         | 139 ++++
>  .../curl/curl/CVE-2026-92388_p2.patch         |  33 +
>  .../curl/curl/CVE-2026-92390_p1.patch         | 270 +++++++
>  .../curl/curl/CVE-2026-92390_p2.patch         | 150 ++++
>  .../curl/curl/CVE-2026-92391.patch            | 203 +++++
>  .../curl/curl/CVE-2026-92392.patch            |  59 ++
>  .../curl/curl/CVE-2026-94266_p1.patch         | 225 ++++++
>  .../curl/curl/CVE-2026-94266_p2.patch         | 235 ++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |  12 +
>  15 files changed, 2992 insertions(+)
>  create mode 100644 meta/recipes-devtools/git/git/0001-http-handle-curl-s=
tripping-creds-from-effective-url.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-107929.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86410.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87863.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87866.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388_p1.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388_p2.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92390_p1.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92390_p2.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92391.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92392.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266_p1.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266_p2.patc=
h

Hello,

I think there are a few issues with this series:
- 5/9 is a duplicate of an earlier patch:
  https://patchwork.yoctoproject.org/project/oe-core/patch/20261030085403.1=
3165-1-adarsh.jagadish.kamini@est.tech/
  I plan to continue with the earlier patch, please review/compare it
  with yours to spot issues.
- 1-4, 6-9/9 (all others) are needed for blacksail but no backport was
  sent for them (I don't think the curl upgrade master did is OK for
  stable)

Please shout if you disagree with the above

For reference, patch number <-> CVE:
 [wrynose,1/9] curl: fix CVE-2026-92391
 [wrynose,2/9] curl: fix CVE-2026-87863
 [wrynose,3/9] curl: fix CVE-2026-86410
 [wrynose,4/9] curl: fix CVE-2026-92390
 [wrynose,5/9] curl: fix CVE-2026-92388
 [wrynose,6/9] curl: fix CVE-2026-92392
 [wrynose,7/9] curl: fix CVE-2026-94266
 [wrynose,8/9] curl: fix CVE-2026-107929
 [wrynose,9/9] curl: fix CVE-2026-87866

Regards,
--=20
Yoann Congal
Smile ECS

