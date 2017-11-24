Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 100C0786A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 17:18:39 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id 70so15691340pgf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 09:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=D6RMJDSazjo/9N0kJrSw74UEURCvqgC2rq0U8Ax6VLY=;
	b=D5k47HN8KNfwr86esdwJotupOIwhH5SILSOKUoQmcPw0sTvQxgIUcvyDEkNlMhTOoc
	3T/EcWYnjVFT+VpkyMucKMVFB+2tzrOOUv7RRebrDb+WRkxtVeJqqXoEP56uvWVElhco
	HhEkZDs132CPZpQCyFJjki2cFDVG6CpXnNGZeJp9jBua8XJjOhDwjHxBy8wQWmY7dwZz
	E5YVZvhbF5DRhu8xwLlI9bifTRzVKIEYvIrzwcnylQ3Qu+f2R86uCWZzdbBftLu7v5P8
	ycJ5KNNtqkaxn4A7AoIUnT/x/al9SFaOE5a3i0r5kNdT30h+1OaYpwPDMfot8mu3frzm
	v6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=D6RMJDSazjo/9N0kJrSw74UEURCvqgC2rq0U8Ax6VLY=;
	b=FvgojpmC0euDNsex/k2iyrIMVlycUgzWnOEALYqThStDbQmcf6S/qBn6TgY8oH9JOj
	VSAa/VYX+s9i5Pz7cpS/32SA5m5ZOYBjczSdGVvVqlSSRIsyW6IDo18leOt/LaOs8wHw
	MO7D0zHDfbapNtB713jbD13+2EZpve4i8NRgvODK7rkA371NXR9BkXRY6Vjg/MqnSe6N
	U5CIqzrw5qlQp8CReWgM6yDMYFxYozIHJr8LPdHTmNrApHN/cw1ifgl9fVXcQObUEaum
	Vz0yIHedZXqIsA9N2OYD6woeJ5fi82y3qntrhVLGty94y+7kjrQBjcLSZtUJwk6retaP
	NKZA==
X-Gm-Message-State: AJaThX5GSwFxHEeT8WL05sC0iYRqgRbiy1YXRtfI5U1IwFP85ajTUwrj
	Qtpfw9FL1EzrGAUxwwxW34c=
X-Google-Smtp-Source: AGs4zMYTHXVWFj4tLrY1DoID3tZHyxSrOAF+aYnMwzxTCKDKZeAirPluFl3J/zWqi7dsANe9pX/TCg==
X-Received: by 10.98.16.90 with SMTP id y87mr24000472pfi.116.1511543921014;
	Fri, 24 Nov 2017 09:18:41 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:2178:58dc:281c:c010])
	by smtp.gmail.com with ESMTPSA id
	p19sm40846886pfj.140.2017.11.24.09.18.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Nov 2017 09:18:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Nov 2017 09:17:55 -0800
Message-Id: <cover.1511543562.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/43] Changes stored for Morty
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
X-List-Received-Date: Fri, 24 Nov 2017 17:18:40 -0000

From: Armin Kuster <akuster@mvista.com>

In the spirt of Yocto Compatable, We are submmiting these changes to the list. You are welcome to them.


The following changes since commit b4b085b3c34172f2a6a1b7193ae377a4f7e498ac:

  glibc: CVE-2017-15670 (2017-11-23 17:40:44 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib akuster/for-stable-morty
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=akuster/for-stable-morty

Armin Kuster (5):
  binutis: Security fix CVE-2017-7614
  binutis: Security fix CVE-2017-9038
  binutils: Security Fix CVE-2017-9039
  binutils: Security fix for CVE-2017-9040 and 2017-9042
  binutils: Security Fix CVE-2017-9041

Manjunath S Matti (1):
  Fix seg-fault in the linker when examining a corrupt binary.

Thiruvadi Rajaraman (37):
  binutils: CVE-2017-7226
  binutils: CVE-2017-12448
  binutils: CVE-2017-12449, CVE-2017_12455, CVE-2017-12457,
    CVE-2017-12458, CVE-2017-12459
  binutils: CVE-2017-12451
  binutils: CVE-2017-12450_12452_12453_12454_12456
  binutils: CVE-2017-7223
  binutils: CVE-2017-7224
  binutils: CVE-2017-7225
  binutils: CVE-2017-7227
  binutils: CVE-2017-7301
  binutils: CVE-2017-7302
  binutils: CVE-2017-7303
  binutils: CVE-2017-7304
  binutils: CVE-2017-8393
  binutils: CVE-2017-8395
  binutils: CVE-2017-8397
  binutils: CVE-2017-8396
  binutils: CVE-2017-8421
  binutils: CVE-2017-8394
  binutils: CVE-2017-8398
  binutils: CVE-2017-7299
  binutils: CVE-2017-9751
  binutils: CVE-2017-9749
  binutils: CVE-2017-9746
  binutils: CVE-2017-9748
  binutils: CVE-2017-9747
  binutils: CVE-2017-9750
  binutils: CVE-2017-9752
  binutils: CVE-2017-9753_and_CVE-2017-9754
  binutils: CVE-2017-9755
  binutils: CVE-2017-9756
  binutils: CVE-2017-9745
  binutils: CVE-2017-9954
  binutils: CVE-2017-9955
  binutils: CVE-2017-14729
  binutils: CVE-2017-15024
  binutils: CVE-2017-15938

 meta/recipes-devtools/binutils/binutils-2.27.inc   |   58 +
 .../binutils/binutils/CVE-2017-12448.patch         |   49 +
 .../binutils/CVE-2017-12449_12455_12457.patch      |  240 ++
 .../binutils/CVE-2017-12449_12455_12457_1.patch    |   97 +
 .../CVE-2017-12450_12452_12453_12454_12456.patch   |  375 ++
 .../CVE-2017-12450_12452_12453_12454_12456_1.patch |  113 +
 .../binutils/binutils/CVE-2017-12451.patch         |  384 ++
 .../binutils/binutils/CVE-2017-14729.patch         |   45 +
 .../binutils/binutils/CVE-2017-15024.patch         |  241 ++
 .../binutils/binutils/CVE-2017-15938.patch         |  153 +
 .../binutils/binutils/CVE-2017-7223.patch          |   40 +
 .../binutils/binutils/CVE-2017-7224.patch          |   48 +
 .../binutils/binutils/CVE-2017-7225.patch          |   66 +
 .../binutils/binutils/CVE-2017-7226.patch          |   42 +
 .../binutils/binutils/CVE-2017-7227.patch          |   49 +
 .../binutils/binutils/CVE-2017-7299_1.patch        |   47 +
 .../binutils/binutils/CVE-2017-7299_2.patch        |  120 +
 .../binutils/binutils/CVE-2017-7300.patch          |   55 +
 .../binutils/binutils/CVE-2017-7301.patch          |   52 +
 .../binutils/binutils/CVE-2017-7302.patch          |   81 +
 .../binutils/binutils/CVE-2017-7303.patch          |   55 +
 .../binutils/binutils/CVE-2017-7304.patch          |   53 +
 .../binutils/binutils/CVE-2017-7614.patch          |  105 +
 .../binutils/binutils/CVE-2017-8393.patch          |  201 ++
 .../binutils/binutils/CVE-2017-8394.patch          |  114 +
 .../binutils/binutils/CVE-2017-8394_1.patch        |   80 +
 .../binutils/binutils/CVE-2017-8395.patch          |   72 +
 .../binutils/binutils/CVE-2017-8396.patch          |  102 +
 .../binutils/binutils/CVE-2017-8397.patch          |   50 +
 .../binutils/binutils/CVE-2017-8398.patch          |  147 +
 .../binutils/binutils/CVE-2017-8421.patch          |   51 +
 .../binutils/binutils/CVE-2017-9038.patch          |   51 +
 .../binutils/binutils/CVE-2017-9039.patch          |   72 +
 .../binutils/binutils/CVE-2017-9039_1.patch        |   56 +
 .../binutils/binutils/CVE-2017-9040_and_9042.patch |   83 +
 .../binutils/binutils/CVE-2017-9041_1.patch        |   51 +
 .../binutils/binutils/CVE-2017-9041_2.patch        |   84 +
 .../binutils/binutils/CVE-2017-9745.patch          |   62 +
 .../binutils/binutils/CVE-2017-9746.patch          |   88 +
 .../binutils/binutils/CVE-2017-9747.patch          |   40 +
 .../binutils/binutils/CVE-2017-9748.patch          |   45 +
 .../binutils/binutils/CVE-2017-9749.patch          |   75 +
 .../binutils/binutils/CVE-2017-9750.patch          |  262 ++
 .../binutils/binutils/CVE-2017-9751.patch          | 3738 ++++++++++++++++++++
 .../binutils/binutils/CVE-2017-9752.patch          |  204 ++
 .../binutils/binutils/CVE-2017-9753_9754.patch     |   76 +
 .../binutils/binutils/CVE-2017-9755_1.patch        |   60 +
 .../binutils/binutils/CVE-2017-9755_2.patch        |  101 +
 .../binutils/binutils/CVE-2017-9756.patch          |   43 +
 .../binutils/binutils/CVE-2017-9954.patch          |   58 +
 .../binutils/binutils/CVE-2017-9955_1.patch        |   93 +
 .../binutils/binutils/CVE-2017-9955_2.patch        |  112 +
 .../binutils/binutils/CVE-2017-9955_3.patch        |   44 +
 .../binutils/binutils/CVE-2017-9955_4.patch        |   50 +
 .../binutils/binutils/CVE-2017-9955_5.patch        |   89 +
 .../binutils/binutils/CVE-2017-9955_6.patch        |   55 +
 .../binutils/binutils/CVE-2017-9955_7.patch        |   79 +
 .../binutils/binutils/CVE-2017-9955_8.patch        |  170 +
 .../binutils/binutils/CVE-2017-9955_9.patch        |  360 ++
 59 files changed, 9686 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-12448.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-12449_12455_12457.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-12449_12455_12457_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-12450_12452_12453_12454_12456.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-12450_12452_12453_12454_12456_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-12451.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-14729.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-15024.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-15938.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7223.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7224.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7225.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7226.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7227.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7299_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7299_2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7300.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7301.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7302.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7303.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7304.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7614.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8393.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8394.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8394_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8395.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8396.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8397.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8398.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8421.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9038.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9039.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9039_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9040_and_9042.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9041_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9041_2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9745.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9746.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9747.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9748.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9749.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9750.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9751.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9752.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9753_9754.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9755_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9755_2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9756.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9954.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_3.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_4.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_5.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_6.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_7.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_8.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9955_9.patch

-- 
2.7.4


