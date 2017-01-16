Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5BECD71AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:16:35 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 204so5487924pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=u+7r5BlfASInBv3/sJOKkfnCj085BOZpA24umgPgbyM=;
	b=bS2l78svZqpvmO9G3YuBy7nSG6jJ0L89LkyPPiDrdf5mQ2CEUazqivdBUDny8hs+yo
	m559/jiQRwaxv1IW1rsqZ89yhaYOVFqXW0Wbu4WTau9ZoBpacEt8XDZHBuxc2sT4/jUG
	PBDdDMOQle+FnIeVm54lVowINbHWhUxYB5UnqZPYTi7G8KOQB0+gqzrhAMtylz5iolxw
	C2/yrSWYRDgWQ/8MHTFUUloYg8T4ag2uftMpRiGa877xsmS0mrLCSIpa02frDRdXb1C0
	Hu779OZgmnFSm30ILam8WgHSekEJ6sVZzpTz/IdG/LfZ+Mmkvd7zZzhaXr9bKGd3Q0La
	A3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=u+7r5BlfASInBv3/sJOKkfnCj085BOZpA24umgPgbyM=;
	b=NbDNsxRqO118YigBNjL7B8yJfavh7FPZVrL4m31pYdV00CEtrFR29NR5SUYSgZ1DD6
	81g+HYlBRDY7WfVOnLxosbrW6odi0Ki5yO1BLkJ/q00GFywu5Li00A25rhrxYyEjX/Pe
	wjMExbHyUuVwc/WHOcYcM0vOSqCZtxkekvIY9I0+DDpWjh4ESjH7KAO/DzTxOZXiDIBp
	Lz91BJ7vwLuLg/nU5xkky8z2YAqulsHM3NOImr7B5P9XXhaHCKZtmlScFBPWLsvsM7bE
	ig02mEad6Is5Jp7YEk4RED2WUXPetNDNvSTJ6li9W0VNtjejHii3kHjFS1dkhfmp0hLr
	H1Gw==
X-Gm-Message-State: AIkVDXJ3s8L7S6T29E3FhW6graMQXC64G9pzZ77vOM6Ri2OyYgmmYlPE4IJo3wEtNuCvuA==
X-Received: by 10.84.215.194 with SMTP id g2mr51053361plj.16.1484576195639;
	Mon, 16 Jan 2017 06:16:35 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	g87sm27205808pfj.20.2017.01.16.06.16.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:16:35 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-12-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 12/30] libsdl_1.2.15.bb: Add 'stdio-redirect' PACKAGECONFIG
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
X-List-Received-Date: Mon, 16 Jan 2017 14:16:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a PACKAGECONFIG for 'stdio-redirect'. This configure option
enables/disables the Windows only option for redirecting the
stdout/stderr to files instead of to the console.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 21dfb9fdb9..591aa81343 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -57,6 +57,7 @@ PACKAGECONFIG[directfb] = "--enable-video-directfb, --disable-video-directfb, di
 PACKAGECONFIG[opengl] = "--enable-video-opengl, --disable-video-opengl, virtual/libgl libglu"
 PACKAGECONFIG[x11] = "--enable-video-x11 --disable-x11-shared, --disable-video-x11, virtual/libx11 libxext libxrandr libxrender"
 PACKAGECONFIG[directx] = "--enable-directx,--disable-directx"
+PACKAGECONFIG[stdio-redirect] = "--enable-stdio-redirect,--disable-stdio-redirect"
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
 
-- 
2.11.0


