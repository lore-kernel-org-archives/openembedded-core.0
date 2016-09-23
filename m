Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD3D60750
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 17:23:11 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id my20so5336500pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 10:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=BEquyd21WjUgwQ9vhmf2R3YWvVKwC8yTeU8T7FW3Gkk=;
	b=Ewpx8u1gJ+H541F2/fb5FmtZpiHlCp0riyn0X9YKDaodXCAWKkwZsNaMI8wGdnKVEY
	mt65nXrC7BN799YD+dwjXCD8H3+29Fw0j8vvB8+0Clf1MkVE2mhh8xISbj2ep4KJz/Dx
	DuzGGGh3OD3gtC5H+Yzyl5dmYDsfkJbSDfjMp5/xbEp/Eh2rH7xom67uBU+NiLvrh+Vx
	DnX6OaMrw9yKP0NVp7v8jjinryc5fG8gtNIaO5NetkNHjS161idw08YPpfTKDHXC3K5e
	eI60q1XFW1f5wIp7tR7j8PYxe56GAyz1Mf4vO9Yetkd6Z32BTSYQomADl4P4g+UJi0L4
	EnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=BEquyd21WjUgwQ9vhmf2R3YWvVKwC8yTeU8T7FW3Gkk=;
	b=iTvfvv9cnv9srnISGM3+Wh4pBzSGsy5z2wnIwKh4+UdFuwT0/CXST0Qyk/bjHznkYX
	9/5e8mYQPIo9wTOvkwI+vl49NASkQvlt4kizYQIMBTjJuC+YJAGyhLaaV0gyfhtuT2DR
	YD2PoaK13DtgwqgHsRJ6cOFtWyakVzA51mSw9zwERLoOjLYh/uuMxBYy2m+bRZftOZi1
	lqOn3KJUo8KMwb99jimHN4CY1eAJhj7RMXtnMPcFYMF80kmbyGwJC87QM1DFarGGEUcq
	UDywlfGlN+7n/8cxOP3ELR314Rh3WWYmyUOGpgxvXLCUWZ+2R01j8DK82uMlVy+fqOvP
	K9hA==
X-Gm-Message-State: AE9vXwNDLTnOR2fWZncP2cunnWZwPzZit4CArXnt5vzKbeSHAf+fPuhEGYqYtaTEEh394w==
X-Received: by 10.66.249.200 with SMTP id yw8mr14404784pac.13.1474651392554;
	Fri, 23 Sep 2016 10:23:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:c560:5d36:d9b:7d07?
	([2601:202:4001:9ea0:c560:5d36:d9b:7d07])
	by smtp.gmail.com with ESMTPSA id
	wr8sm12896362pab.44.2016.09.23.10.23.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 10:23:11 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <cover.1474238169.git.akuster@mvista.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <82a667ae-827f-3def-d59a-3ac86b406d62@gmail.com>
Date: Fri, 23 Sep 2016 10:23:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1474238169.git.akuster@mvista.com>
Subject: Re: [PATCH 00/13] Jethro-next pull request
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
X-List-Received-Date: Fri, 23 Sep 2016 17:23:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Ping


On 09/18/2016 03:44 PM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> please consider these security and bug fixes for Jethro.
>
> My krogoth-next stagging branch has a complimentary set for the security fixes.
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next: 7a24bd8a38a2819965b8c1926d33042bd61d1f0b
>
> The following changes since commit 6b732a392289a7bb50b0e3716c066c62fa32a14d:
>
>    curl: security fix for CVE-2016-5420 (2016-09-02 08:48:20 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib akuster/jethro-next
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=akuster/jethro-next
>
> Armin Kuster (8):
>    openssl: Security fix CVE-2016-2177
>    openssl: Security fix CVE-2016-2178
>    bind: Security fix CVE-2016-2088
>    git: Security fix CVE-2016-2315 CVE-2016-2324
>    openssh: Security fix CVE-2016-6210
>    openssh: Security fix CVE-2016-5615
>    openssh: Security fix CVE-2015-8325
>    wget: Security fix CVE-2016-4971
>
> Ismo Puustinen (1):
>    libpcre: Fix CVE-2016-3191
>
> Ross Burton (1):
>    openssl: add a patch to fix parallel builds
>
> Yi Zhao (3):
>    tiff: Security fix CVE-2016-3186
>    tiff: Security fix CVE-2016-5321
>    tiff: Security fix CVE-2016-5323
>
>   .../bind/bind/CVE-2016-2088.patch                  | 216 ++++++++++++++
>   meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |   1 +
>   .../openssh/openssh/CVE-2015-8325.patch            |  33 +++
>   .../openssh/openssh/CVE-2016-6210.patch            | 114 +++++++
>   .../openssh/openssh/CVE-2016-6210_p2.patch         | 110 +++++++
>   .../openssh/openssh/CVE-2016-6210_p3.patch         |  62 ++++
>   .../openssh/openssh/CVE-2016-6515.patch            |  54 ++++
>   meta/recipes-connectivity/openssh/openssh_7.1p2.bb |   5 +
>   .../openssl/openssl/CVE-2016-2177.patch            | 286 ++++++++++++++++++
>   .../openssl/openssl/CVE-2016-2178.patch            |  51 ++++
>   .../openssl/openssl/parallel.patch                 | 326 +++++++++++++++++++++
>   .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   3 +
>   .../git/git-2.5.0/CVE-2016-2315_2324.patch         | 307 +++++++++++++++++++
>   .../git/git-2.5.0/CVE-2016-2315_p1.patch           | 115 ++++++++
>   .../git/git-2.5.0/CVE-2016-2315_p2.patch           |  89 ++++++
>   .../git/git-2.5.0/CVE-2016-2315_p3.patch           | 160 ++++++++++
>   .../git/git-2.5.0/CVE-2016-2315_p4.patch           | 237 +++++++++++++++
>   meta/recipes-devtools/git/git_2.5.0.bb             |   5 +
>   .../recipes-extended/wget/wget/CVE-2016-4971.patch | 294 +++++++++++++++++++
>   ...mping-and-continue-behaviour-with-ftp-pro.patch | 108 +++++++
>   meta/recipes-extended/wget/wget_1.16.3.bb          |   2 +
>   .../libtiff/files/CVE-2016-3186.patch              |  24 ++
>   .../libtiff/files/CVE-2016-5321.patch              |  45 +++
>   .../libtiff/files/CVE-2016-5323.patch              | 103 +++++++
>   meta/recipes-multimedia/libtiff/tiff_4.0.4.bb      |   3 +
>   .../libpcre/libpcre/CVE-2016-3191.patch            | 174 +++++++++++
>   meta/recipes-support/libpcre/libpcre_8.38.bb       |   1 +
>   27 files changed, 2928 insertions(+)
>   create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6210.patch
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6210_p2.patch
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6210_p3.patch
>   create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-6515.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/parallel.patch
>   create mode 100644 meta/recipes-devtools/git/git-2.5.0/CVE-2016-2315_2324.patch
>   create mode 100644 meta/recipes-devtools/git/git-2.5.0/CVE-2016-2315_p1.patch
>   create mode 100644 meta/recipes-devtools/git/git-2.5.0/CVE-2016-2315_p2.patch
>   create mode 100644 meta/recipes-devtools/git/git-2.5.0/CVE-2016-2315_p3.patch
>   create mode 100644 meta/recipes-devtools/git/git-2.5.0/CVE-2016-2315_p4.patch
>   create mode 100644 meta/recipes-extended/wget/wget/CVE-2016-4971.patch
>   create mode 100644 meta/recipes-extended/wget/wget/Fix-timestamping-and-continue-behaviour-with-ftp-pro.patch
>   create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
>   create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
>   create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch
>   create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch
>


