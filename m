Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 217C374871
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 01:30:50 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p8-v6so7104354pgq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 18:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=u15/SUdaV0SVJj2Nr2toeuVxEUYebaFqD8S0CKWlAb4=;
	b=K8+RfPnrr0Bzky+2daoAPBFYQQre2IuAi5K4/20cn8UbfVjLCj0Gwvcgf2DUCtXHZ8
	vAfAGjkNiXf3kLFZC43GVwNYoqfNorg0z9y4UtBsikrv4zT53r6WgJvqJaHZwKwVS+2R
	vuFLYpxTLk97k7rcpLdvVzRDZSERToQlJz5nYFhl8JNCAdYKhPNP37NzWgFlXjC6Db7i
	ogJm7BQs53KuxOYZy03YRnxhcePuf2BDJHiOBZhXKzlVt7g8YIuv+noYc9EL9v+FYSj7
	1HDLcNWaqfDx5wD59/5Hn0UWot6/8aVQEYZzkHnmFH0IdMuCUTRRa96c9i+F2YK9gnus
	GQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=u15/SUdaV0SVJj2Nr2toeuVxEUYebaFqD8S0CKWlAb4=;
	b=oXGC40QuliWgorHtS5R9vF8ElxgjVl5CnOTsuP/70On8Qnu9naVLQUXaHwLbvNUm56
	JHZ1dtN5QXAowvMJNvQ4WjC5ulDLbX8RIYa9u/afFVtrMNqzFUBTtD8pr9NbyAZ9JuvG
	Z1tTOYkqnE3A0Eyp16milMb4DUUEyFyb1mCQpsheugIstMmic4utJ7WlmDRFaZoK//Ul
	SzHG9suQIOSg6u9mV8cDkGTcy4QkefnzA4saWtDgg5hhYscoT7/LRu3NcfdZ3aZ6UAFv
	LX6z36Mu/u1i0pKeX4/weKn6DjSZkG2f9gTynr8X9uIik5SIpFcU5R7EkiFTHx5Gcduq
	IbNA==
X-Gm-Message-State: ALKqPwdMF+Zq92SmqwgAMHsGJqPfzSJZSJ/jUoTPMxNYN16bX9enjVQ0
	bCPokJJ0HBav/NtJj9XNEjrJQQ==
X-Google-Smtp-Source: AB8JxZr9D0WwQ2MEkpyDd9aArc6DC/ewHE40syB5w6hgHpbeT6Jro3IiNWRmXWGWtHVdHnGOFtPKmw==
X-Received: by 2002:a63:602:: with SMTP id 2-v6mr5104459pgg.81.1526952651880; 
	Mon, 21 May 2018 18:30:51 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:cda1:4d10:a5a1:339b?
	([2601:202:4000:1184:cda1:4d10:a5a1:339b])
	by smtp.gmail.com with ESMTPSA id
	h75-v6sm29636296pfh.148.2018.05.21.18.30.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 18:30:50 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>
References: <1526931828-20358-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spByqR0tuCeY_iW549mK6K6A9nFd1PcEzebFVCDvpVUOg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8523df99-ce1f-c99e-0379-4b72df9d58ad@gmail.com>
Date: Mon, 21 May 2018 18:30:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spByqR0tuCeY_iW549mK6K6A9nFd1PcEzebFVCDvpVUOg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] bind update req. new pkg in core
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
X-List-Received-Date: Tue, 22 May 2018 01:30:51 -0000
Content-Type: multipart/alternative;
	boundary="------------720D812BEF734107A416539B"
Content-Language: en-US

--------------720D812BEF734107A416539B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 05/21/2018 06:06 PM, Khem Raj wrote:
>
> On Mon, May 21, 2018 at 3:44 PM Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     With this update, the python-ply package is required.
>     I copied the one from meta-python to core. Once this hits master,
>     I will send a patch to remove the same recipe from
>     meta-python.
>
>
> Can this be turned on/off using packageconfig ?
Yes we can and it is already in the PACKAGECONFIG options.

If we do disable python, then the python binaries that are currently
being installed will not. Someone decided: dnssec-coverage
dnssec-checkds=C2=A0 where=C2=A0 important to install in the current Bind=

solution.=C2=A0=C2=A0 A new one is being added; dnssec-keymgr. If we don'=
t want
dnssec support, thats easy to exclude.

BTW, pthon-ply=C2=A0 exists in 4 other layers besides meta-python and=C2=A0=
 at
different versions.

let me know which way you want to go.
- armin




> If so then it would be ideal=C2=A0
>
> If not then please send the removal patches for meta-python regardless
> so it can be tested together=C2=A0
>
>
>
>     Armin Kuster (2):
>     =C2=A0 bind: update to 9.12.1
>     =C2=A0 python3-ply: add package needed by bind 9.12 update
>
>     =C2=A0...0001-build-use-pkg-config-to-find-libxml2.patch | 13 +++--=
-
>     =C2=A0...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 +++--=
-
>     =C2=A0.../0001-lib-dns-gen.c-fix-too-long-error.patch=C2=A0 =C2=A0 =
| 13 +++---
>     =C2=A0.../bind/bind/bind-confgen-build-unix.o-once.patch | 48
>     ----------------------
>     =C2=A0...-searching-for-json-headers-searches-sysr.patch | 13 +++--=
-
>     =C2=A0.../bind/bind/dont-test-on-host.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 17 --------
>     =C2=A0.../use-python3-and-fix-install-lib-path.patch=C2=A0 =C2=A0 =C2=
=A0| 36
>     ----------------
>     =C2=A0.../bind/{bind_9.10.6.bb <http://bind_9.10.6.bb> =3D>
>     bind_9.12.1.bb <http://bind_9.12.1.bb>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 21 ++++------
>     =C2=A0meta/recipes-devtools/python/python-ply.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 18 ++++++++
>     =C2=A0meta/recipes-devtools/python/python-ply_3.11.bb
>     <http://python-ply_3.11.bb>=C2=A0 =C2=A0 |=C2=A0 2 +
>     =C2=A010 files changed, 49 insertions(+), 145 deletions(-)
>     =C2=A0delete mode 100644
>     meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.=
patch
>     =C2=A0delete mode 100644
>     meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
>     =C2=A0delete mode 100644
>     meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib=
-path.patch
>     =C2=A0rename meta/recipes-connectivity/bind/{bind_9.10.6.bb
>     <http://bind_9.10.6.bb> =3D> bind_9.12.1.bb <http://bind_9.12.1.bb>=
}
>     (86%)
>     =C2=A0create mode 100644 meta/recipes-devtools/python/python-ply.in=
c
>     =C2=A0create mode 100644
>     meta/recipes-devtools/python/python-ply_3.11.bb
>     <http://python-ply_3.11.bb>
>
>     --=20
>     2.7.4
>
>     --=20
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------720D812BEF734107A416539B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 05/21/2018 06:06 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1spByqR0tuCeY_iW549mK6K6A9nFd1PcEzebFVCDvpVUOg@mail.gmail.com">
      <div><br>
        <div class="gmail_quote">
          <div dir="auto">On Mon, May 21, 2018 at 3:44 PM Armin Kuster
            &lt;<a href="mailto:akuster808@gmail.com"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">With this
            update, the python-ply package is required.<br>
            I copied the one from meta-python to core. Once this hits
            master,<br>
            I will send a patch to remove the same recipe from<br>
            meta-python.</blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Can this be turned on/off using packageconfig
            ?</div>
        </div>
      </div>
    </blockquote>
    Yes we can and it is already in the PACKAGECONFIG options.<br>
    <br>
    If we do disable python, then the python binaries that are currently
    being installed will not. Someone decided: dnssec-coverage
    dnssec-checkds  where  important to install in the current Bind
    solution.   A new one is being added; dnssec-keymgr. If we don't
    want dnssec support, thats easy to exclude.<br>
    <br>
    BTW, pthon-ply  exists in 4 other layers besides meta-python and  at
    different versions. <br>
    <br>
    let me know which way you want to go.<br>
    - armin<br>
    <br>
    <br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CAMKF1spByqR0tuCeY_iW549mK6K6A9nFd1PcEzebFVCDvpVUOg@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto">If so then it would be ideal </div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">If not then please send the removal patches
            for meta-python regardless so it can be tested together </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            <br>
            Armin Kuster (2):<br>
              bind: update to 9.12.1<br>
              python3-ply: add package needed by bind 9.12 update<br>
            <br>
             ...0001-build-use-pkg-config-to-find-libxml2.patch | 13
            +++---<br>
             ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13
            +++---<br>
             .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13
            +++---<br>
             .../bind/bind/bind-confgen-build-unix.o-once.patch | 48
            ----------------------<br>
             ...-searching-for-json-headers-searches-sysr.patch | 13
            +++---<br>
             .../bind/bind/dont-test-on-host.patch              | 17
            --------<br>
             .../use-python3-and-fix-install-lib-path.patch     | 36
            ----------------<br>
             .../bind/{<a href="http://bind_9.10.6.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">bind_9.10.6.bb</a>
            =&gt; <a href="http://bind_9.12.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">bind_9.12.1.bb</a>} 
                  | 21 ++++------<br>
             meta/recipes-devtools/python/python-ply.inc        | 18
            ++++++++<br>
             meta/recipes-devtools/python/<a
              href="http://python-ply_3.11.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python-ply_3.11.bb</a> 
              |  2 +<br>
             10 files changed, 49 insertions(+), 145 deletions(-)<br>
             delete mode 100644
            meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch<br>
             delete mode 100644
            meta/recipes-connectivity/bind/bind/dont-test-on-host.patch<br>
             delete mode 100644
meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch<br>
             rename meta/recipes-connectivity/bind/{<a
              href="http://bind_9.10.6.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">bind_9.10.6.bb</a>
            =&gt; <a href="http://bind_9.12.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">bind_9.12.1.bb</a>}
            (86%)<br>
             create mode 100644
            meta/recipes-devtools/python/python-ply.inc<br>
             create mode 100644 meta/recipes-devtools/python/<a
              href="http://python-ply_3.11.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python-ply_3.11.bb</a><br>
            <br>
            -- <br>
            2.7.4<br>
            <br>
            -- <br>
            _______________________________________________<br>
            Openembedded-core mailing list<br>
            <a href="mailto:Openembedded-core@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
            <a
              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------720D812BEF734107A416539B--
