Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id B2BAF71FD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 20:34:44 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id a41so726319yho.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 12:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:cc:content-type; 
	bh=3vZzjFFWsHhI5X8U88VZVonmeIrjvNans41ybKgLZIw=;
	b=LRogTl31yH8wtZ+I28vo0hsEydmo7gQnpI1oKJaELCtyOy7H3X6ZRUvEv1vAuJX9HU
	7pXUM6EreuN75wqeJG9I+vMFVSYPTahGdtc/Jmk95360hI+4THgPzv3y7qfcoxy2y0d4
	iZDy3DlUO1VFolrSUF3GGEEF0lVNOhKzaUrVXMf2ynFQ7fFpJ9fOvuj1nxZ4ILmQzI5U
	48IuZetbRv8Rg7hFQ4EeIsq7dxyxKVibFhQC9p3mMQx4+qG5njuAgFoAlYFsWkiUewsl
	E7+xzZ5nEBodWuYJWe9D02MXzSgFWvqXu13KiTU4qrH6UdcyB8mAw6TW4YXKU83hsuct
	i62A==
MIME-Version: 1.0
X-Received: by 10.170.223.84 with SMTP id p81mr7552253ykf.110.1415219684845;
	Wed, 05 Nov 2014 12:34:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Wed, 5 Nov 2014 12:34:44 -0800 (PST)
Date: Wed, 5 Nov 2014 18:34:44 -0200
X-Google-Sender-Auth: ARjpFJie8Gkikmsh1T2Czl9_5tI
Message-ID: <CAP9ODKqZU0SpC_T_jYLExYKYLXQkLyv_7Vy7GW-9uA=_wBjLhQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [for-daisy] Pseudo backport breaks build in some hosts
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
X-List-Received-Date: Wed, 05 Nov 2014 20:34:49 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

In clean hosts the pseudo build is broken. It seems to be lacking the
attr dependency which has been added during the Dizzy development
cycle but not included when doing the backport for Daisy; I suspect it
has not been detected in Yocto Project AB because it should have attr
headers available.

We seem to need a better way to test backports as this is the second
time backports has included regressions. I think we ought to have a
daisy-next (and likely dizzy-next) branches with intended fixes for
easy testing outside of Yocto Project AB and get wider exposure for
different host setups.

Best Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

