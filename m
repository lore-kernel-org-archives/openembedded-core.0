Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id D13AE606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 19:27:34 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id hh10so11965490pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 12:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Vq+ekAZ0Skxsx6JSkGgTrQNhWPGSPks5GlQvDvFbiSc=;
	b=j6lttWMK3DL6YdnH0XE8rFm0QiyWy8GiNF30xiZPxPLbXj7WiMU+iMgRzTHyxLFJZ2
	8kYnFpSWRTZ2LkP5zYD7rAbYPTxlu49721U7LHIB6aOEe/0/XiAWkrAh1vqC+UL7GjWl
	KjaI0w2RMruRAgSvyurc/aVhaTJD9zJtF+ugINi3bFzE29UmWXEZGBW85m885KyVvGiu
	2JTfI35Y/G1s8YoNYmzDvvnm9Ykd2lwhp+zUfGKdlf03tixpMMhxLEBVHt0KGn+KSY3O
	2YzZIwzf96ESn5aB99GI7GVoGNTzCuKB6TK2LD2qM9nEsAt0C4KL9LZHZGm/hwVn/jBQ
	APJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Vq+ekAZ0Skxsx6JSkGgTrQNhWPGSPks5GlQvDvFbiSc=;
	b=nECFv7Ev7eVBKwQEtcyHD3BuaYfzCmhR7yzZ5jnNneqAAkb5whCvpyzB4EtNVZNBW3
	ut/k/MtezzVTSg1RsTDhAzvWsjghJEtO1/AeyUTszspuB5CQL2JEYuuIu1ie4NQH8Wz8
	HM3Wbh31TSiXKE2aAcreEbt+qrYPBvOBc5FidGmWjA1vhBf26DYwySjvOK5Zg8BZxYe4
	meq9nI65OuumnxOU9bVI/YY0J151XVSxN0WIbS5p6FXBj4JKMuR1k4/e5zcJn46lUEFm
	ibPzK2nHNc6/Mu7g35z9c6rEtja5lYMENQ4LgEROPvUcojA0lvJDV/yUEP2E4TkfEL0l
	Qv1w==
X-Gm-Message-State: AEkoouvgxEbkriAs8OCuTlYVpAelgQ+e/wVmD80q0S0bdRySCVtUy8IyfTWjxKN2EVFchg==
X-Received: by 10.66.9.42 with SMTP id w10mr32277055paa.34.1469474855309;
	Mon, 25 Jul 2016 12:27:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:6c0e:a9d0:7912:a6b5?
	([2601:202:4001:9ea0:6c0e:a9d0:7912:a6b5])
	by smtp.googlemail.com with ESMTPSA id
	s89sm41984092pfi.83.2016.07.25.12.27.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jul 2016 12:27:34 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <cover.1468111537.git.akuster@mvista.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57966824.5020609@gmail.com>
Date: Mon, 25 Jul 2016 12:27:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1468111537.git.akuster@mvista.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH 00/17] Jethro-next security fixes
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
X-List-Received-Date: Mon, 25 Jul 2016 19:27:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Ping



On 07/09/2016 06:08 PM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> Please consider these changes for jethro-next.
> 
> The libxml2 changes don't affect Master nor krogoth.
> Glibc changes have been sent for Master and soon for Krogoth.
> 
> The following changes since commit 118380bc5d01e52b5edc574abb4176f6e70a54a6:
> 
>   documentation: Updated date in the manual revision tables. (2016-06-21 12:59:47 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akuster/jethro-next
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro-next
> 
> Armin Kuster (17):
>   glibc: Security Fix for CVE-2016-3706
>   glibc: Security fix for CVE-2016-4429
>   libxml2: Security fix for CVE-2016-1762
>   libxml2: Security fix for CVE-2016-3705
>   libxml2: Security fix for CVE-2016-1834.patch
>   libxml2: Security fix for CVE-2016-4483.patch
>   libxml2: Security fix for CVE-2016-1840
>   libxml2: Security fix for CVE-2016-1838
>   libxml2: Security fix for CVE-2016-1839
>   libxml2: Security fix for CVE-2016-1836
>   libxml2: Security fix for CVE-2016-4449
>   libxml2: Security fix for CVE-2016-1837
>   libxml2: Security fix for CVE-2016-1835
>   libxml2: Security fix for CVE-2016-1833
>   libxml2: Security fix for CVE-2016-3627
>   libxml2: Security fix for CVE-2016-4447
>   libxml2: Security fix for CVE-2016-4448
> 
>  meta/recipes-core/glibc/glibc/CVE-2016-3706.patch  |  226 +++++
>  meta/recipes-core/glibc/glibc/CVE-2016-4429.patch  |   89 ++
>  meta/recipes-core/glibc/glibc_2.22.bb              |    2 +
>  .../libxml/libxml2/CVE-2016-1762.patch             |   84 ++
>  .../libxml/libxml2/CVE-2016-1833.patch             |  368 +++++++
>  .../libxml/libxml2/CVE-2016-1834.patch             |   55 +
>  .../libxml/libxml2/CVE-2016-1835.patch             |   95 ++
>  .../libxml/libxml2/CVE-2016-1836.patch             |  443 ++++++++
>  .../libxml/libxml2/CVE-2016-1837.patch             |  143 +++
>  .../libxml/libxml2/CVE-2016-1838.patch             |   96 ++
>  .../libxml/libxml2/CVE-2016-1839.patch             |  127 +++
>  .../libxml/libxml2/CVE-2016-1840.patch             |   37 +
>  .../libxml/libxml2/CVE-2016-3627.patch             |   64 ++
>  .../libxml/libxml2/CVE-2016-3705.patch             |   71 ++
>  .../libxml/libxml2/CVE-2016-4447.patch             |  208 ++++
>  .../libxml/libxml2/CVE-2016-4448_1.patch           | 1067 ++++++++++++++++++++
>  .../libxml/libxml2/CVE-2016-4448_2.patch           |  208 ++++
>  .../libxml/libxml2/CVE-2016-4449.patch             |   47 +
>  .../libxml/libxml2/CVE-2016-4483.patch             |   55 +
>  meta/recipes-core/libxml/libxml2_2.9.2.bb          |   17 +
>  20 files changed, 3502 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-3706.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-4429.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1762.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1833.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1834.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1835.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1836.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1837.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1838.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1839.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-1840.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-3627.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-3705.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4447.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4448_1.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4448_2.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4449.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-4483.patch
> 

