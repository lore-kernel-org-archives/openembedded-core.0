Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6C81F71B3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 19:22:40 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id c78so2540312wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 12:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/cr7dMLpRp9OKnUtxi0oRDeaLNg1+FyNiO+sZlA+GUE=;
	b=kveZxsojdoFffm43JaT2B4TwTwnnWJ5eanpmkahPtRr/f5j7Q7KTvaKop+EJqkSz+C
	prPfP2E6DIA9xpmmOOudCkzrjXfKP94viaFnL3X9mOGYLKvXZ8Lqbx8r+4r7WZCEm2vP
	5WtBX5nEPCIhilBaSHKpLDs7cneDvQXseeMycCZ+m/eDJdxg+zIlyrFTueAmlv2YVeQQ
	DW25s0zR4tRUXWyhxd9ac91ca0jMnHxK6R1GzTPGHmKdShTErsKJNSPrxgebZFlHPbqC
	o1x1nvH415XFD8tn9H68wjPPDy7JFten57pJWUMrd0/sZLD3COy+W7d6FS7j6pd7Gy3W
	Xbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/cr7dMLpRp9OKnUtxi0oRDeaLNg1+FyNiO+sZlA+GUE=;
	b=DdGn60am5hzBpy6gBuhuVQngnRmXJn1sFeN4jkFg5VZO1WjyDWnlVlfjbsLdxY3HQO
	HdKriUa6iWIjWEoKsWv8o89KWQknYU5wCAmgC9dtoFKmhChPiAFVVRMPydVkwXYnlCZE
	Pkwsw68s4Fs3sdzbGlHJCizOqarjYA1rd6y6deuyVNyhQ5CiSPgIOx9xn//vi9dvO33b
	ckJqfi44x/FAkjkWO3BTdxh8Sj6216OMj9A/hNKx+mTa9u4CBh0GxW6NxNCUmPyoIJl6
	2jXPzHXReDY1/m92282eC6uJ+2ntN8+c7b//X7bHoFqYaCMhDSydht/WfINIVQKttRzg
	G3LA==
X-Gm-Message-State: AA6/9RlOlcnwfvz+Bw6TBXchi8CVKt6yclSVZ4WBs6/RpkhBlLhHy0seV1YcKX9xDmne3Q==
X-Received: by 10.28.109.3 with SMTP id i3mr11303984wmc.121.1477077761184;
	Fri, 21 Oct 2016 12:22:41 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:18a5:22c4:b359:6709])
	by smtp.gmail.com with ESMTPSA id
	r63sm5683940wmb.24.2016.10.21.12.22.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Oct 2016 12:22:40 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 21:22:33 +0200
Message-Id: <1477077754-6211-1-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/1] Add 'task-time' buildstats helper script
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
X-List-Received-Date: Fri, 21 Oct 2016 19:22:40 -0000

If this goes in, I could also submit some documentation to the manuals. I
suspect many people don't use the buildstats since getting useful information
out of them is a bit of work.

Ulf Magnusson (1):
  task-time: Add simple buildstats analysis script

 scripts/task-time | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100755 scripts/task-time

-- 
2.7.4


