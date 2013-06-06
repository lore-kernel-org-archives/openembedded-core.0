Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 89C886A5A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 21:55:43 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id r11so2491057lbv.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 14:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KVgwxWtM/ITF1oqS2ckmLREk2n1lh7m5VFoq9Mlptq0=;
	b=dXqHkQ0x3ujMOf84QkK7Ds1wBVaEid52pvpEEobZ3qKK+AQjwwrC6wfHwA8HqXwAYA
	zGrbEYBhQSS8HgkS5PVIir9TjVPRKSEy9xGUXT6Fpiqt6eepecak9FzT9a7+VxIMxRr3
	p0Em5MVlUBhS2XUsugyXgliI6E4/Q2WL/mmxFWnaiqYXepyFoY2ohtFi01yXoABc34CB
	T5lcwr9qoedyEDlIY9bYiAOZxTu8JOHlv6MRMy4aqejkkRZmP0cw7JLe//BPe0NV8D0y
	+NtXfBoCICBRcjfIVF0CZgV2LtBxZylGXMUpt4bYmy8mxrb5nipW0DgzroLynACRlJfO
	TXOA==
X-Received: by 10.152.20.136 with SMTP id n8mr1099233lae.58.1370555743977;
	Thu, 06 Jun 2013 14:55:43 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPSA id e9sm28439101lbj.3.2013.06.06.14.55.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 14:55:43 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Uki9m-0004Kx-BH; Fri, 07 Jun 2013 00:55:42 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 00:55:40 +0300
Message-Id: <cover.1370555136.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] gnomebase.bbclass improvements
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
X-List-Received-Date: Thu, 06 Jun 2013 21:55:44 -0000

A couple of gnomebase.bbclass changes from the tree where I've been
working to include recipe for latest (gtk3-only) vte version in addition
to older gtk2-compatible one.

trim_version() -patch should't be any way controversial.
GNOMEBN -patch is one you may want to apply now, or to wait if there
is going to be any users for the feature and apply only when
actually needed.

The following changes since commit 8a2ac668d99f7d64c2acffc3a39cedb2d152be6e:

  lrzsz: check locale.h in configure (2013-06-04 15:53:45 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/misc

Marko Lindqvist (2):
  gnomebase.bbclass: implement gnome_verdir() using trim_version()
  gnomebase.bbclass: add support for archive name different from BPN

 meta/classes/gnomebase.bbclass |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
1.7.10.4


