Return-Path: <matt@console-pimps.org>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 03E7665C68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:41:47 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f8so8867793wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 12:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=5nwauDNSy4XtaQgZQgM2LTZHIyTUy45zNDh+nfey/xo=;
	b=HJXimcA3HYbYIAXdzEyXmOPcIMCADUHupFmZkXILZT2nxYsjTzvPf9faAZpB+bxHjw
	fTiE70HcBdzn0fF+tYJD8ePM2o2Y5uXRFtsQbhbBYZaebDNPMHPAgwMDMf1edE5qvWC+
	58yjkDOifuBSBP4+36PlVgF4JthbUhoKX6JTgKJThSQbxIO/iF7ccihxQIJMS4jwchw1
	cxjlqw0e525t8L55OggJ0S3rXs0m5TtJ4n2Jnm4mIx3GlygA010KZ1V6rHmy/zmb7oed
	hKhLf8ojYriWF5zEVpWKo1bqLqVo1JBtR3Wdl5svJIFNsNlH2K5Na8fS6KFEnP6VZSi8
	v8FA==
X-Gm-Message-State: ALoCoQlKvMYYlsLCmGDvCMxh98IrF1gYq2/I/okxOLOSS68MBbujF2k/+vaTTuP1DvWFpCNd5+Si
X-Received: by 10.180.80.225 with SMTP id u1mr6542881wix.69.1407958908180;
	Wed, 13 Aug 2014 12:41:48 -0700 (PDT)
Received: from localhost (05428d07.skybroadband.com. [5.66.141.7])
	by mx.google.com with ESMTPSA id 10sm6404368wjx.26.2014.08.13.12.41.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 12:41:47 -0700 (PDT)
Date: Wed, 13 Aug 2014 20:41:45 +0100
From: Matt Fleming <matt@console-pimps.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20140813194145.GW15082@console-pimps.org>
References: <1407935023-9284-1-git-send-email-matt@console-pimps.org>
	<1407935023-9284-2-git-send-email-matt@console-pimps.org>
	<20140813134511.GV14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140813134511.GV14848@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Matt Fleming <matt.fleming@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] recipes-extended: Add iasl recipe
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
X-List-Received-Date: Wed, 13 Aug 2014 19:41:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 13 Aug, at 03:45:11PM, Martin Jansa wrote:
> 
> There is acpica-unix2 in meta-oe:
> meta-oe/recipes-extended/acpica/acpica_20140424.bb:SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
> 
> can we use that one instead?

Sure, I don't see why not. Though something like this is probably
required?

---

diff --git a/meta-luv/recipes-extended/acpica/acpica_20140424.bb b/meta-luv/recipes-extended/acpica/acpica_20140424.bb
index d10a31b..03f69ad 100644
--- a/meta-luv/recipes-extended/acpica/acpica_20140424.bb
+++ b/meta-luv/recipes-extended/acpica/acpica_20140424.bb
@@ -32,3 +32,5 @@ do_install() {
 }
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+BBCLASSEXTEND = "native"

-- 
Matt Fleming, Intel Open Source Technology Center

