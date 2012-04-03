Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SF0cH-0004G3-BX
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 12:05:33 +0200
Received: by bkcjg15 with SMTP id jg15so3245375bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2012 02:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=ZkE9jPYidRe7QGXDd5hi9e0V8TzoffFrd9JjBYWiqY4=;
	b=l64dT/xXyFg0kbjVynUxYqT0G8ZlTW8MNzZy03XqtGRtQXT92tMCZ0wdqg0BCEMUlI
	Ut02+YvM9Vo/cXT5rY68u/47fIvVD3HK8r1BDnLpO5VG+PYIBQJJ6krQRKpAs1e3Sgl4
	Hk3kQYpaThMe3S74Bq4oAnQQ9LQHOgoimnDb9n9cEYAhTMYX24Ht79PD9gLK1r8jauSD
	VMyK6Xq2n0qG+Rv/K2Ys2gNucC4G1DTv80msA8YzuFQtplZGDhhaqrVgjoNDvZyx+64A
	lA5UQ2CHeTXJIY76EhDbm3Nmf1l5LwABFRKMyZKxcsurUL+tKPtycou3pqsz2SVUpGrU
	r3cA==
Received: by 10.204.133.195 with SMTP id g3mr5037934bkt.73.1333446983980;
	Tue, 03 Apr 2012 02:56:23 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de. [217.92.191.7])
	by mx.google.com with ESMTPS id u5sm44532072bka.5.2012.04.03.02.56.23
	(version=SSLv3 cipher=OTHER); Tue, 03 Apr 2012 02:56:23 -0700 (PDT)
Message-ID: <4F7AC946.5060704@dresearch-fe.de>
Date: Tue, 03 Apr 2012 11:56:22 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120328 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1333056489.18082.31.camel@ted>
	<1333100747-19358-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1333100747-19358-1-git-send-email-sledz@dresearch-fe.de>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQknFy7hB/KUrhMBppbCOIV3ZYcTqqwgm9WNua4C58hSaRqEBGHuDEpczC/FRC+mK/vDFl+h
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH v2] docbook-utils-native: fix syntax problem in jw.in
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 10:05:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.03.2012 11:45, Steffen Sledz wrote:
> Fix runtime error occurred e.g. with docbook-to-man calls:
> 
>   grep: character class syntax is [[:space:]], not [:space:]
>   grep: character class syntax is [[:space:]], not [:space:]
>   jw: There is no frontend called "/docbook/utils-0.6.14/frontends/docbook".
> 
> See also:
> 
>    <https://qa.mandriva.com/show_bug.cgi?id=61127>
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  .../docbook-utils/docbook-utils-0.6.14/re.patch    |   29 ++++++++++++++++++++
>  .../docbook-utils/docbook-utils-native_0.6.14.bb   |    7 +++-
>  2 files changed, 34 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
> 
> diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch b/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
> new file mode 100644
> index 0000000..db079d6
> --- /dev/null
> +++ b/meta/recipes-devtools/docbook-utils/docbook-utils-0.6.14/re.patch
> @@ -0,0 +1,29 @@
> +Upstream-Status: Pending
> +
> +Fix runtime error occurred e.g. with docbook-to-man calls:
> +
> +  grep: character class syntax is [[:space:]], not [:space:]
> +  grep: character class syntax is [[:space:]], not [:space:]
> +  jw: There is no frontend called "/docbook/utils-0.6.14/frontends/docbook".
> +
> +See also:
> +
> +   <https://qa.mandriva.com/show_bug.cgi?id=61127>
> +
> +Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> +
> +diff -Nurd docbook-utils-0.6.14-orig/bin/jw.in docbook-utils-0.6.14/bin/jw.in
> +--- docbook-utils-0.6.14-orig/bin/jw.in	2012-03-29 07:50:00.789564826 +0200
> ++++ docbook-utils-0.6.14/bin/jw.in	2012-03-29 07:52:10.371302967 +0200
> +@@ -80,9 +80,9 @@
> + SGML_CATALOGS_DIR="/etc/sgml"
> + if [ -f "$SGML_CONF" ]
> + then
> +-  RE='^[:space:]*SGML_BASE_DIR[:space:]*=[:space:]*'
> ++  RE='^[[:space:]]*SGML_BASE_DIR[[:space:]]*=[[:space:]]*'
> +   SGML_BASE_DIR=`grep $RE $SGML_CONF | sed "s/$RE//"`
> +-  RE='^[:space:]*SGML_CATALOGS_DIR[:space:]*=[:space:]*'
> ++  RE='^[[:space:]]*SGML_CATALOGS_DIR[[:space:]]*=[[:space:]]*'
> +   SGML_CATALOGS_DIR=`grep $RE $SGML_CONF | sed "s/$RE//"`
> + fi
> + 
> diff --git a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
> index 96459dc..2a89479 100644
> --- a/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
> +++ b/meta/recipes-devtools/docbook-utils/docbook-utils-native_0.6.14.bb
> @@ -7,9 +7,12 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  DEPENDS = "openjade-native sgmlspl-native docbook-dsssl-stylesheets-native docbook-sgml-dtd-3.1-native"
>  
> -PR = "r2"
> +PR = "r3"
>  
> -SRC_URI = "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/docbook-utils-${PV}.tar.gz"
> +SRC_URI = "\
> +	ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/docbook-utils-${PV}.tar.gz \
> +	file://re.patch \
> +"
>  
>  SRC_URI[md5sum] = "6b41b18c365c01f225bc417cf632d81c"
>  SRC_URI[sha256sum] = "48faab8ee8a7605c9342fb7b906e0815e3cee84a489182af38e8f7c0df2e92e9"

Ping!

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


