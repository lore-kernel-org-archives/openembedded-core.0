Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 461716FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:22:08 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id j2so8899708pff.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=u2GUE4L4zfUJelxE1O9BxG4wOC5BOeS5gK5EVg7MJNc=;
	b=ZBv+Ypsaf0r+hCKBAD0vBpokr8n5vZEy6aEvHAFwCBZteDRWF+OCfB7BejbLaZK5/m
	MbR8MkSbRy7lld4ACpQW0XMWQGRoLf1eghoxcflsoELkA5PeZwKJkJiYsdzGv7KZXqhn
	97ourUD8hi92XNyE/vH0/HlAyGj7ECl4nJak6WhH/kUhKJ1jaOhuEsI3FTeavTheFhnd
	5cCU0hMk7VpfTvJfoI2bItoNfEriR2EEH4PkPS5SGoLlaHF+P/pKlYwOaZ1HRJ1r9D/e
	bOqk8iN0p+d9KjjGDSgxoIJ/BgUT+KwXhhuBnzX7szy6LoBl1WBWAhPoYNa7Maiaf2dr
	BPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=u2GUE4L4zfUJelxE1O9BxG4wOC5BOeS5gK5EVg7MJNc=;
	b=rYNSqrtOzWBgQgBmUv9XZSWyNnyrc8+dCGIOInZ/wGfR5+Gt4rJd6maW8T70SJkgPQ
	W/yo70FUOt0aRpcxdCNazASg/my20javnrD/iNEfUWmRi+YAeiH3R6mUI9vvHMBojL8R
	Y4CyeQUzvf/94eJuOn36GXGdXxqqGAbeYGw976vOiM4TMtzBUjK6BgJ+8RhvEQBwpp3a
	EKA5jqq7T9apabB8ORa/OBukmhiM/hZQsMKZOcOSLH+g7Shq0y9IedfVmYBeczfL0M9l
	t0xs+tWTO+kDWWEg55iCepNz4yfM0LeENXXv2nZxQkYBhIEnEe4wt0BJW02zSQFE3v2B
	1Y4g==
X-Gm-Message-State: AElRT7F/wcLwZPD0fc2W2L0vRt2XyMYZHTZvWQlPVAmO9ooiJSm84IMK
	wvZkXAvJrpDEKnuryumHuEv40g==
X-Google-Smtp-Source: AG47ELvoZh/UIwICnxQYKFzGVSO7KEvpF8P/7v0iXEU2p9APo1PvbjrT/nectnifbgYjD4PRhHxb1w==
X-Received: by 10.98.52.133 with SMTP id b127mr37210174pfa.17.1522160530068;
	Tue, 27 Mar 2018 07:22:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:9901:2a59:c9ba:abba?
	([2601:202:4000:1184:9901:2a59:c9ba:abba])
	by smtp.gmail.com with ESMTPSA id
	t64sm1951625pfi.34.2018.03.27.07.22.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Mar 2018 07:22:09 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>, Armin Kuster <akuster808@gmail.com>
References: <1522159989-22111-1-git-send-email-akuster808@gmail.com>
	<CA+chaQdyCn5gma9YFDY9eQ-Ja62vMUmjhYT6CKi_PFG7BjSLCA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1c1b55e7-06bb-21e9-9dee-3783c229bdf3@gmail.com>
Date: Tue, 27 Mar 2018 07:22:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdyCn5gma9YFDY9eQ-Ja62vMUmjhYT6CKi_PFG7BjSLCA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V3][PATCH] libshmfence: update to 1.3
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
X-List-Received-Date: Tue, 27 Mar 2018 14:22:09 -0000
Content-Type: multipart/alternative;
	boundary="------------3315254DAB39D1226890D132"
Content-Language: en-US

--------------3315254DAB39D1226890D132
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 03/27/2018 07:19 AM, Martin Jansa wrote:
> Looks like you have forgot to remove it from SRC_URI.
That is too funny. I am not trying to make to v100 ; )

- armin
>
> On Tue, Mar 27, 2018 at 4:13 PM, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     From: Armin Kuster <akuster@mvista.com <mailto:akuster@mvista.com>>
>
>     refreshed patch
>
>     [v2]
>     Remove dangling space in patch
>
>     [v3]
>     remove patch as changes on in update
>
>     Signed-off-by: Armin Kuster <akuster@mvista.com
>     <mailto:akuster@mvista.com>>
>     ---
>      .../xorg-lib/libxshmfence/extensions.patch              | 17
>     -----------------
>      .../{libxshmfence_1.2.bb <http://libxshmfence_1.2.bb> =>
>     libxshmfence_1.3.bb <http://libxshmfence_1.3.bb>}        |  4 ++--
>      2 files changed, 2 insertions(+), 19 deletions(-)
>      delete mode 100644
>     meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
>      rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.2.bb
>     <http://libxshmfence_1.2.bb> => libxshmfence_1.3.bb
>     <http://libxshmfence_1.3.bb>} (77%)
>
>     diff --git
>     a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
>     b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
>     deleted file mode 100644
>     index 4cc9e05..0000000
>     --- a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
>     +++ /dev/null
>     @@ -1,17 +0,0 @@
>     -With glibc 2.27 memfd_create is behind a _GNU_SOURCE guard, so call
>     -AC_USE_SYSTEM_EXTENSIONS to get that defined.
>     -
>     -Upstream-Status: Submitted
>     -Signed-off-by: Ross Burton <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>>
>     -
>     -diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     -index 0c98875..ebf4dee 100644
>     ---- a/configure.ac <http://configure.ac>
>     -+++ b/configure.ac <http://configure.ac>
>     -@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am])
>     - AC_CONFIG_HEADERS([config.h])
>     -
>     -+AC_USE_SYSTEM_EXTENSIONS
>     -+
>     - # Initialize Automake
>     - AM_INIT_AUTOMAKE([foreign dist-bzip2])
>     diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
>     <http://libxshmfence_1.2.bb>
>     b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
>     <http://libxshmfence_1.3.bb>
>     similarity index 77%
>     rename from meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
>     <http://libxshmfence_1.2.bb>
>     rename to meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
>     <http://libxshmfence_1.3.bb>
>     index 1df068d..f6f5fb2 100644
>     --- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
>     <http://libxshmfence_1.2.bb>
>     +++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
>     <http://libxshmfence_1.3.bb>
>     @@ -15,5 +15,5 @@ BBCLASSEXTEND = "native nativesdk"
>
>      SRC_URI += "file://extensions.patch"
>
>     -SRC_URI[md5sum] = "66662e76899112c0f99e22f2fc775a7e"
>     -SRC_URI[sha256sum] =
>     "d21b2d1fd78c1efbe1f2c16dae1cb23f8fd231dcf891465b8debe636a9054b0c"
>     +SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
>     +SRC_URI[sha256sum] =
>     "b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7"
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------3315254DAB39D1226890D132
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
    <div class="moz-cite-prefix">On 03/27/2018 07:19 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQdyCn5gma9YFDY9eQ-Ja62vMUmjhYT6CKi_PFG7BjSLCA@mail.gmail.com">
      <div dir="ltr">Looks like you have forgot to remove it from
        SRC_URI.</div>
    </blockquote>
    That is too funny. I am not trying to make to v100 ; )<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CA+chaQdyCn5gma9YFDY9eQ-Ja62vMUmjhYT6CKi_PFG7BjSLCA@mail.gmail.com">
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Tue, Mar 27, 2018 at 4:13 PM, Armin
          Kuster <span dir="ltr">&lt;<a
              href="mailto:akuster808@gmail.com" target="_blank"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
            Armin Kuster &lt;<a href="mailto:akuster@mvista.com"
              moz-do-not-send="true">akuster@mvista.com</a>&gt;<br>
            <br>
            refreshed patch<br>
            <br>
            [v2]<br>
            Remove dangling space in patch<br>
            <br>
            [v3]<br>
            remove patch as changes on in update<br>
            <br>
            Signed-off-by: Armin Kuster &lt;<a
              href="mailto:akuster@mvista.com" moz-do-not-send="true">akuster@mvista.com</a>&gt;<br>
            ---<br>
             .../xorg-lib/libxshmfence/<wbr>extensions.patch           
              | 17 -----------------<br>
             .../{<a href="http://libxshmfence_1.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libxshmfence_1.2.bb</a>
            =&gt; <a href="http://libxshmfence_1.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libxshmfence_1.3.bb</a>} 
                  |  4 ++--<br>
             2 files changed, 2 insertions(+), 19 deletions(-)<br>
             delete mode 100644 meta/recipes-graphics/xorg-<wbr>lib/libxshmfence/extensions.<wbr>patch<br>
             rename meta/recipes-graphics/xorg-<wbr>lib/{<a
              href="http://libxshmfence_1.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libxshmfence_1.2.bb</a>
            =&gt; <a href="http://libxshmfence_1.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libxshmfence_1.3.bb</a>}
            (77%)<br>
            <br>
            diff --git a/meta/recipes-graphics/xorg-<wbr>lib/libxshmfence/extensions.<wbr>patch
            b/meta/recipes-graphics/xorg-<wbr>lib/libxshmfence/extensions.<wbr>patch<br>
            deleted file mode 100644<br>
            index 4cc9e05..0000000<br>
            --- a/meta/recipes-graphics/xorg-<wbr>lib/libxshmfence/extensions.<wbr>patch<br>
            +++ /dev/null<br>
            @@ -1,17 +0,0 @@<br>
            -With glibc 2.27 memfd_create is behind a _GNU_SOURCE guard,
            so call<br>
            -AC_USE_SYSTEM_EXTENSIONS to get that defined.<br>
            -<br>
            -Upstream-Status: Submitted<br>
            -Signed-off-by: Ross Burton &lt;<a
              href="mailto:ross.burton@intel.com" moz-do-not-send="true">ross.burton@intel.com</a>&gt;<br>
            -<br>
            -diff --git a/<a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a> b/<a
              href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a><br>
            -index 0c98875..ebf4dee 100644<br>
            ---- a/<a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a><br>
            -+++ b/<a href="http://configure.ac" rel="noreferrer"
              target="_blank" moz-do-not-send="true">configure.ac</a><br>
            -@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am]<wbr>)<br>
            - AC_CONFIG_HEADERS([config.h])<br>
            -<br>
            -+AC_USE_SYSTEM_EXTENSIONS<br>
            -+<br>
            - # Initialize Automake<br>
            - AM_INIT_AUTOMAKE([foreign dist-bzip2])<br>
            diff --git a/meta/recipes-graphics/xorg-<wbr>lib/<a
              href="http://libxshmfence_1.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libxshmfence_1.2.bb</a>
            b/meta/recipes-graphics/xorg-<wbr>lib/<a
              href="http://libxshmfence_1.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libxshmfence_1.3.bb</a><br>
            similarity index 77%<br>
            rename from meta/recipes-graphics/xorg-<wbr>lib/<a
              href="http://libxshmfence_1.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libxshmfence_1.2.bb</a><br>
            rename to meta/recipes-graphics/xorg-<wbr>lib/<a
              href="http://libxshmfence_1.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libxshmfence_1.3.bb</a><br>
            index 1df068d..f6f5fb2 100644<br>
            --- a/meta/recipes-graphics/xorg-<wbr>lib/<a
              href="http://libxshmfence_1.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libxshmfence_1.2.bb</a><br>
            +++ b/meta/recipes-graphics/xorg-<wbr>lib/<a
              href="http://libxshmfence_1.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libxshmfence_1.3.bb</a><br>
            @@ -15,5 +15,5 @@ BBCLASSEXTEND = "native nativesdk"<br>
            <br>
             SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://extensions.patch">"file://extensions.patch"</a><br>
            <br>
            -SRC_URI[md5sum] = "<wbr>66662e76899112c0f99e22f2fc775a<wbr>7e"<br>
            -SRC_URI[sha256sum] = "<wbr>d21b2d1fd78c1efbe1f2c16dae1cb2<wbr>3f8fd231dcf891465b8debe636a905<wbr>4b0c"<br>
            +SRC_URI[md5sum] = "<wbr>42dda8016943dc12aff2c03a036e09<wbr>37"<br>
            +SRC_URI[sha256sum] = "<wbr>b884300d26a14961a076fbebc762a3<wbr>9831cb75f92bed5ccf9836345b4592<wbr>20c7"<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.7.4<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------3315254DAB39D1226890D132--
