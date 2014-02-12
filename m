Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id CEE8D6EE57
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 10:50:12 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 200so14644653ykr.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 02:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=V7foyfee/n22fZ83R0XhfbVzL72INr480w4TS7hVXj8=;
	b=s53XwYRC3MHkzBZhR/KsovqTBN5IJ4ah28k8tkCNKWLU5cj0ioK6GoYzlS0GtsBe9I
	VasY6I4uFc0ysMwW7HR9rWRgevK6FJOutMkC0fVa3PD/MMJNPXznpPY+9wq/6Dyj1OHm
	VEUVxq2Z7RsT1aQdz00X+jteMI4frEWKPWXg2Dwjmw/7R2MsMSkM7RYd0Ty62/YAkMmj
	/G6sGxrpyjYq04iy7vrJyhuxjPMmKSrUhVZcMcTrXZuX6W6SiAp/6nEcJ5NhifbZF06W
	RyJszJ7ntWpKk5a2snQHd2bCFN+x+uQzW5+aJDpJHzF6YgzMoCShaWR3fLmb4hhiU6bN
	748Q==
MIME-Version: 1.0
X-Received: by 10.236.126.162 with SMTP id b22mr1572995yhi.72.1392202213788;
	Wed, 12 Feb 2014 02:50:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.161.3 with HTTP; Wed, 12 Feb 2014 02:50:13 -0800 (PST)
Date: Wed, 12 Feb 2014 08:50:13 -0200
X-Google-Sender-Auth: akQheLkVZlBYg7436ywy4qDA5lI
Message-ID: <CAP9ODKpzN6HvJmTa62es0RY_Qr7LLk26mTkbiL6b8XmRPUHs7w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Robert Yang <liezhi.yang@windriver.com>
Subject: [for-dora] Pulseaudio fix
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
X-List-Received-Date: Wed, 12 Feb 2014 10:50:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

This change should be backported to dora as people are having problems
using x11-less distros with pulseaudio:

otavio@nano ~/.../poky (git)-[dora] % git cherry-pick
77c4f158c6dbc8a373d2064552224f5dfe1a7bd2
[dora 19606eb] pulseaudio: fix RDEPENDS traversal for consolekit
 Author: Christopher Larson <chris_larson@mentor.com>
 1 file changed, 5 insertions(+), 1 deletion(-)
otavio@nano ~/.../poky (git)-[dora] % git cherry-pick
e230b4498790a3dfdc36ea5761807459fc96368e
[dora 090424d] pulseaudio: only package consolekit module when x11 is enabled
 Author: Christopher Larson <kergoth@gmail.com>
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

