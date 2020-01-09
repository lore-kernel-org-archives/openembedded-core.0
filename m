Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD3DC7FEA3
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:50:20 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id j11so587680pjs.1
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xxmiV56/BRUneh9WVNygqi7T8BpL0aQIYM8yzVaS64o=;
	b=EkAGFmtU4t07QUM16BXjWBnrOoHbaC1HKkWuNbTozasi6klvFzmsEIOKcFd9sA8rwR
	6q1xDK0d3c5v5R42n2Dkij0a+v684AGQNArjAkJ40X5gzabmgUHcsTUbiL3nwva503bG
	0F3aYRkndxE3Z1RZs0WLHf2aJUQ8xysLN0EO9pGNaDJ+lsqRi6WIoMqB7UT6w3GZopzf
	PcnJn1y0eeot6T9cA2G1iDPav8fk0gk2XkvDArtjDwc6f4juXq4oHGMcS5IOPTsk5qik
	f5guRqUm2LtsBeFjwQvBqNCxALCiqW/kH91jh3PtUv3ivBD1mANscMLejira3AVzBbvf
	sV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xxmiV56/BRUneh9WVNygqi7T8BpL0aQIYM8yzVaS64o=;
	b=fF2sRuft3KFk49XHgbvfrhb3FNY1hEqVTuPXfWYjbvUa0n8l7eoFShCsVLjR7k6PUu
	nkmydnHdWdBp7E51O5+eLIM+OCFJ/lwv7jpY10uRg8oXPaNooErofwgeo9OGhGaJzZji
	OFVoFI8HF6/B3/q7hrragMUt08UICoCK90cQcdwglxT4fCR+hzuS7h6HlEKq+Pwz+FTV
	G76wKowiLt+ryX0hSv95bkJKLwohhky/jbMyPmVn8QAMBMCPHFf4fIzfNltMQUqKcYZV
	z/6hdAdqWaTKV6F80zPuftw1VbVm3EGvTcpcfAz3DXyNj3UpBphWme8QxT4RdfEZNpay
	dV3w==
X-Gm-Message-State: APjAAAXHWLNK8ozzSH8G9rnG6efiIAqbut/WfGgt4sm4agZHMJHHBT+4
	suCA/DdDBVFJayJdHtjTqozi3yGZ
X-Google-Smtp-Source: APXvYqzU6N1M6Emi0JByHURk0A6cemHu3Bli52oeuaf/HyBFqd3CW5EdkS6ScTNTVkH3bYp76dHV3g==
X-Received: by 2002:a17:902:bd41:: with SMTP id
	b1mr9771150plx.82.1578545421402; 
	Wed, 08 Jan 2020 20:50:21 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.50.20
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:50:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:47 -0800
Message-Id: <f9739e0f58f5d8a5dc01fdb0efaa778af4edd671.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 28/28] kernel: Make symbol link to vmlinux.64 in boot directory
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
X-List-Received-Date: Thu, 09 Jan 2020 04:50:21 -0000

From: Vasyl Gomonovych <gomonovych@gmail.com>

Some mips 64 bit platforms use vmlinux.64 image name
Make a symbol link to vmlinux.64 in arch/mips/boot/

Signed-off-by: Vasyl Gomonovych <gomonovych@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 70626b52e5e61c80018e9f1f85bc169d0434b986)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ebcb79a528..750988f4e5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -613,6 +613,9 @@ do_kernel_link_images() {
 	if [ -f ../../../vmlinuz.bin ]; then
 		ln -sf ../../../vmlinuz.bin
 	fi
+	if [ -f ../../../vmlinux.64 ]; then
+		ln -sf ../../../vmlinux.64
+	fi
 }
 addtask kernel_link_images after do_compile before do_strip
 
-- 
2.17.1


