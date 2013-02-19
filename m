Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7mMm-0007GO-5I
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 13:32:12 +0100
Received: by mail-wg0-f47.google.com with SMTP id dr13so5300704wgb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 04:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=z+8NNsA531WIaKEe6HSI5yoLWrfnoG7ffOQBZRwTEuQ=;
	b=gGmiecGYl75z9ulNbBxpW9wcGEnjTBwsV5k7FHaTx5Zdrv/mEo8JVirbPp5DXiJDgv
	cmQXxQBZN7b4mptIYWfTIKcC+q6gws8SBXwPEhrP6ZhTND1b8fXLvps/Eo2qK9PK4viY
	YDf5cWg4V/I3vtLX2bjz3QeD/CmXZb0dXDMFh8nT2S1MDurKRri6Y8r4SbVGlxgVA68V
	BJs4/WRqAxsJX1Na/3wJRGF4ffi/6aLSCDpjFEQm2KiLUV1vaeFmKyg8r3iZWTIk/UkZ
	LiGQAwMEz3tAV4hwgJTZTttQjSCaxkjzdHne9dDFQx85r4EEg0bbG3bqFAlVjaQ0LbWY
	738w==
X-Received: by 10.194.235.6 with SMTP id ui6mr25923041wjc.12.1361276163038;
	Tue, 19 Feb 2013 04:16:03 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fg6sm27407696wib.10.2013.02.19.04.16.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Feb 2013 04:16:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2013 12:13:41 +0000
Message-Id: <1361276022-22204-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlSEncfBlrBUQl7dFKVZaw0M9N9qy5wf24+MKkyv6V5t6+pFDAfxEKsnVpGrbEzRxV1A7yO
Cc: jstashluk@dekaresearch.com
Subject: [PATCH][V2] gst-plugins-gl: add package recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2013 12:32:12 -0000

Hi,


V2 of Jeremy's gst-plugins-gl package.  I just moved some lines around, added a
comment, and removed the redundant glew dependency as it is only used for GL
builds (that we disable).

Ross


