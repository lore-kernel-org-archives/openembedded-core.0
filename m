Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tyk4c-000543-1L
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 15:16:06 +0100
Received: by mail-pb0-f50.google.com with SMTP id wz7so229097pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 06:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=vRqfWReT4KgIqdRB8/7+jtnSR+ygdQKIFTjWGg/GSCA=;
	b=eKAzEofrkWDF9TuKBlb4PjB7XcB+EkhyyaHI0iCiPX/Uf6hMwC5TTD/cWnZ+nkOhuY
	fgPG+LScAumC/Scz3G5g9ikRQjc7qJUV0GuOuH7yxWKRe5vM+M4fuAH+3ZNKiW6zTWk6
	Q7EBak8G+Zm732qVK66Si+4sF2R5T567pK1LY5WVXKl5gJFz75q+sv+iYaowtj/yPNb5
	IntGVjlvUNmoCMuqyajZ3CjhEGvZ0e3B7k4MqxC+LCVkcNYFGr3wgRz6A8/g9Og341vl
	15gtqXJmjiMNKGRelviLHcovmp5tIK67Y057hv7WMn9CaWgD3ooMt2J/e7e1zHDTfG31
	RVLQ==
X-Received: by 10.66.78.168 with SMTP id c8mr13782896pax.16.1359122430929;
	Fri, 25 Jan 2013 06:00:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v2sm913476paz.36.2013.01.25.06.00.28
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 06:00:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 15:00:25 +0100
Message-Id: <1359122425-15797-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <20130125134705.GF3200@jama>
References: <20130125134705.GF3200@jama>
Subject: [PATCH] prservice.py: fix NameError: global name 'host' is not defined
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
X-List-Received-Date: Fri, 25 Jan 2013 14:16:06 -0000

* http://git.openembedded.org/openembedded-core/commit/?id=e00f49de8b1f79c3e07b887d257bd75a46052fa0
  removed host and port variables

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/prservice.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 57fb39a..27883a7 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -10,7 +10,7 @@ def prserv_make_conn(d, check = False):
                 raise Exception('service not available')
         d.setVar("__PRSERV_CONN",conn)
     except Exception, exc:
-        bb.fatal("Connecting to PR service %s:%s failed: %s" % (host, port, str(exc)))
+        bb.fatal("Connecting to PR service %s:%s failed: %s" % (host_params[0], host_params[1], str(exc)))
 
     return conn
 
-- 
1.8.1.1



