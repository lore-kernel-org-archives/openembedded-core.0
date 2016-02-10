Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 898C6731F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 23:19:49 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id o4so3719595obb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 15:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eDyuKFiXqEAtxs1B8xdylJdnYA/rJd1VKtTH6x1d5Zs=;
	b=H9FdT1xAa04X4UFsahbuWLmq6THrBwz8lXyvDsAT0QyFI/uQ09x9BwA555+85nvya6
	aH1bPwcSknFnkAjgKsOQGN+2nlDxFc6/KHp0XTpOvXfn8eGS4gfkrz9KLFDfbUBNQ+CI
	xZymBRVbVPhqAe8Zrprogin4kcyBfoB4o98fnx/hoREpCNDWE3GSdFENzfPAyyTMTShi
	JaSSwObUNQHicz/sWZZhf+K5aiBLytOLnmSxO5XQDtqmnXnQWdbAua0HVK4sl21Pc854
	HaNcORkUSfTXMRHEG++uKKvd1zwtTT8TviedVHij5N65xvLK6dpNr8mRZ035rElc8Nl6
	Hbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eDyuKFiXqEAtxs1B8xdylJdnYA/rJd1VKtTH6x1d5Zs=;
	b=IMkvQp/D9Cwr2/vtrzQ+fCV2TO5HXSXqETbrUdF9adcbKrwITrem9ydGU2KP+7gs89
	M4IJXrQaaWz7baIBhAt0cg/bRLlYOS7J5f+JNuUe9WDUQTWJ9kVsOHA89gpU3yABjEtX
	ovCfyk8YnsqOX71RzRgzywapgxhElFcbVtvTVCeEOGx5doAr0gUt3bQJDNa8QlYT4QNR
	ifaJakFpH21d9mEnHaLA0gdslon8jxsFGvHMH4iDwgenv5glqbu6VZugfaMllrRdvFKb
	nNRLHRaPpk7Yn+mUWlbg3AsTYYKph2WV8sVymZ2ePeMHtTGPzOZld2nATo/bNWzY6glW
	jByQ==
X-Gm-Message-State: AG10YOTLYigjJI8+JPLxoGUTkWup08HGdNajMFbqboQkTOuKY7n5R1g0MelO5SeoEt7SrA==
X-Received: by 10.60.82.229 with SMTP id l5mr40774671oey.6.1455146390076;
	Wed, 10 Feb 2016 15:19:50 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q10sm2873000obg.1.2016.02.10.15.19.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 15:19:49 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 15:19:38 -0800
Message-Id: <1455146378-29690-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455146378-29690-1-git-send-email-armccurdy@gmail.com>
References: <1455146378-29690-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] freetype: update 2.6.2 -> 2.6.3
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
X-List-Received-Date: Wed, 10 Feb 2016 23:19:49 -0000

Update LICENSE.TXT hash due to minor rewording to clarify licensing
of fthash.c and fthash.h files. No changes to overall licensing.

Other changes from the upstream changelog:

  I. IMPORTANT CHANGES

    - Khmer,  Myanmar, Bengali,  and Kannada  script support  has been
      added to the auto-hinter.

  II. MISCELLANEOUS

    - Better  support of  Indic  scripts like  Devanagari  by using  a
      top-to-bottom hinting flow.

    - All  FreeType macros  starting  with two  underscores have  been
      renamed to  avoid a violation of  both the C and  C++ standards.
      Example: Header  macros of the  form `__FOO_H__' are  now called
      `FOO_H_'.  In most cases,  this should be completely transparent
      to the user.   The exception to this  is `__FTERRORS_H__', which
      must be  sometimes undefined by  the user to get  FreeType error
      strings:  Both this  form and  the new  `FTERRORS_H_' macro  are
      accepted for backwards compatibility.

    - Minor improvements mainly to the Type 1 driver.

    - The  new CFF  engine now  supports all  Type 2  operators except
      `random'.

    - The macro `_STANDALONE_', used for  compiling the B/W and smooth
      rasterizers  as   stand-alone  modules,  has  been   renamed  to
      `STANDALONE_', since macro names starting with an underscore and
      followed by an uppercase letter are reserved in both C and C++.

    - Function  `FT_Library_SetLcdFilterWeights'  now  also  activates
      custom LCD filter weights (instead of just adjusting them).

    - Support for  `unpatented hinting'  has been  completely removed:
      Consequently,  the two  functions `FT_Face_CheckTrueTypePatents'
      and  `FT_Face_SetUnpatentedHinting'  now  return  always  false,
      doing nothing.

    - The `ftgamma' demo  program has been modernized;  the gamma grid
      display has been moved from `ftview' to this program.

    - It is now possible to  cycle through the available LCD fitlering
      modes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../freetype/{freetype_2.6.2.bb => freetype_2.6.3.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.6.2.bb => freetype_2.6.3.bb} (88%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.6.2.bb b/meta/recipes-graphics/freetype/freetype_2.6.3.bb
similarity index 88%
rename from meta/recipes-graphics/freetype/freetype_2.6.2.bb
rename to meta/recipes-graphics/freetype/freetype_2.6.3.bb
index a41f5c8..cf6882a 100644
--- a/meta/recipes-graphics/freetype/freetype_2.6.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.6.3.bb
@@ -8,15 +8,15 @@ BUGTRACKER = "https://savannah.nongnu.org/bugs/?group=freetype"
 SECTION = "libs"
 
 LICENSE = "FreeType | GPLv2+"
-LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56 \
+LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1 \
                     file://docs/FTL.TXT;md5=d479e83797f699fe873b38dadd0fcd4c \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://use-right-libtool.patch"
 
-SRC_URI[md5sum] = "86109d0c998787d81ac582bad9adf82e"
-SRC_URI[sha256sum] = "baf6bdef7cdcc12ac270583f76ef245efe936267dbecef835f02a3409fcbb892"
+SRC_URI[md5sum] = "0037b25a8c090bc8a1218e867b32beb1"
+SRC_URI[sha256sum] = "371e707aa522acf5b15ce93f11183c725b8ed1ee8546d7b3af549863045863a2"
 
 inherit autotools pkgconfig binconfig-disabled multilib_header
 
-- 
1.9.1


