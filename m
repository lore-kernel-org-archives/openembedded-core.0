Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E3E30606CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 08:04:48 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id k18so5491656wre.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 00:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=bt9ia8p5dkeVZuK0XnHQlkfvJwobGEEk+rHDsyGrG0I=;
	b=l4jOBOwHlzdVuUE3wdBM0Uy8Ml5QchtHUE1sUbBO3xD8q1h5Zh/3nOfR0e1uuw5pyq
	3ja8LXeTa3STtp2XbBfMDGr5C5q5Wig4EWa4iQw2X+zO5lburlOvFJUHXeEqig5seJQR
	QqNL9m5yBPvag1sVnvJ1drBFbfd4RMaBqza4RsjrBNfClOS5DbmT+DBWpZDsANUVp2FL
	X4oQrox0YcSbteOF34OStci+Qex6vf253L86gYqCz3CPtDe/AhtcARlqz6PFEn4I0Lov
	IjGlafS0blMGhcgswM5ZHiOKb8W/ZDfltk+L8r2ejJVzWDKPtglitxQRKggks12F73+U
	4eZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=bt9ia8p5dkeVZuK0XnHQlkfvJwobGEEk+rHDsyGrG0I=;
	b=cHFfPzlfj0UaAUHKHplh6U4KmG8uVgXZcYt3cpvP0uCK51PBMHZ4n4CCjSE1vv3Xqf
	JoZ42dK07QfRpj3Fj6/oNQSxWclkGuiodrDjXnNqPw1RHCzkReLFWBUrhDUr0l3GXc6G
	dV52L5mbeUU6jGMt26IvDpn12DN6Q4z2lFowAkDhbfzQxehTD9Gn4yu/uEeKqiyLU3P2
	eM/qL5D/n5KsN3LE6ahAjDBeT+AqYW3rCmi08Leu14cmFNGYIQ/06WJU2dJcXFspL0Be
	NZF7bzpB1gHe+a2mHupUx7BZjT22vTAu+ADlNWZ4UZF5bFAojZ0HNJLux2hecXDokbb8
	gy/g==
X-Gm-Message-State: AJaThX7cZbj9HHGC20IVRmUivwg8nXYSxdqrrwx/k7ersohTkHiO6+Kf
	DTzClXSNz2BtXp8H2eKyq1gV
X-Google-Smtp-Source: AGs4zMb8U+kg6/lWSF4zEILG/fKrgUWb5vRtZuD3lKxlLokTbV2IFjFdKAyzA84B36/ukj1BLemLSQ==
X-Received: by 10.223.168.23 with SMTP id l23mr13574841wrc.15.1511251489508;
	Tue, 21 Nov 2017 00:04:49 -0800 (PST)
Received: from pohly-mobl1 (p54BD5744.dip0.t-ipconnect.de. [84.189.87.68])
	by smtp.gmail.com with ESMTPSA id
	r14sm31335030wrb.43.2017.11.21.00.04.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Nov 2017 00:04:48 -0800 (PST)
Message-ID: <1511251487.5979.54.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 09:04:47 +0100
In-Reply-To: <3126cc0be3fdcd228a3bc73e2e58b90447c53ef2.1486668313.git.jussi.kukkonen@intel.com>
References: <cover.1486668313.git.jussi.kukkonen@intel.com>
	<3126cc0be3fdcd228a3bc73e2e58b90447c53ef2.1486668313.git.jussi.kukkonen@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Subject: native CA cert bundles (was: Re: [PATCH 3/3] cve-check-tool: Use CA cert bundle in correct sysroot)
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
X-List-Received-Date: Tue, 21 Nov 2017 08:04:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-02-09 at 21:38 +0200, Jussi Kukkonen wrote:
> Native libcurl looks for CA certs in the wrong place by
> default.
> * Add patch that allows overriding the default CA certificate
>   location. Patch is originally from meta-security-isafw.
> * Use the new --cacert to set the correct CA bundle path
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../cve-check-tool/cve-check-tool_5.6.4.bb         |   4 +-
>  ...ow-overriding-default-CA-certificate-file.patch | 215
> +++++++++++++++++++++
>  2 files changed, 218 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-
> curl-allow-overriding-default-CA-certificate-file.patch
> 
> diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-
> tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-
> tool_5.6.4.bb
> index c78af67..fcd3182 100644
> --- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> +++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e8c1458438ead3
> c34974bc0be3a03ed6"
>  SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v
> ${PV}/${BP}.tar.xz \
>             file://check-for-malloc_trim-before-using-it.patch \
>             file://0001-print-progress-in-percent-when-downloading-
> CVE-db.patch \
> +           file://0001-curl-allow-overriding-default-CA-certificate-
> file.patch \
>            "
>  
>  SRC_URI[md5sum] = "c5f4247140fc9be3bf41491d31a34155"
> @@ -39,7 +40,8 @@ do_populate_cve_db() {
>      [ -z "${cve_file}" ] && cve_file="${TMPDIR}/cve_check"
>  
>      bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
> -    if cve-check-update -d "$cve_dir" ; then
> +    # --cacert works around curl-native not finding the CA bundle
> +    if cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-
> certificates.crt -d "$cve_dir" ; then

I went back to this patch to see how the problem was solved, because I
am facing it again elsewhere. Now that I think about it again, I'm
starting to wonder which SSL certificates the native tools really
should trust. Tools like Python or  wget are taken from the host, which
means they use the host defaults for SSL. That native tools built with
bitbake then try to use ca-certificates-native looks inconsistent to
me.

There is https://bugzilla.yoctoproject.org/show_bug.cgi?id=9883 open
about some aspect of this, but it doesn't actually address the
underlying question about what the right behavior should be. It's based
on the assumption that libcurl-native should always use ca-
certificates-native.

Thoughts anyone?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



