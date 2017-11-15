Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 01AC871985
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 10:01:34 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id 15so19946120wrb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 02:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Dxri7RcdmHfKk+EHPvtYr207pyHTvYNn/1qKbBy5fG8=;
	b=Y3oacp/dxmlo8CFKln3weaFr/hmz+XM1cLNuPsNBjoFPVHykgPwxru4rsH05Z5Z4No
	FoTecXR2DXndXu+GCQR/0Sp+oH/JxWB/5AOQQjw9LwRlA9hKNzEHTxj2HD5A2Z6SUf9z
	1CfP7agGKE7OYo77LXyaC3+/KfzyxbSnNFgGBE+Gpz4NBfb3ylZX0LeCJ3N0BOc7YdO1
	fMyMDkcBnj2+MEAKqVfb6gclSm5zWNUhA3Gihao/slWl2Cyf7Rdhk6/eekbmW8TCeAMN
	GHiwy2kaOWt6S7t1lixm0Ellov27KLZ9kcW5zHZ58Vj0qXTo8Bzrm8qzaSLDG5P9wEUf
	BqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Dxri7RcdmHfKk+EHPvtYr207pyHTvYNn/1qKbBy5fG8=;
	b=gyVtF9yaXsYZuf5MNYINZTftuq8hCWhP7goeN9otFTCVoH9gM80mqJ549xZD5leTCm
	FWUIWj+bwo7AOk0nLRRxzYuOcbF8I+EaeLs5xiBaQsQUICSNHaVW3SScN/Qbo10/xIuQ
	oA3Ra0PhgZxUxgpN26lpw9IdIJWz6B4otXwEO6a2aUXCk582E3pZByHQzrbX0iLeIktD
	mBeD57PJJZdGbYQaoWiQp8x5oJ3PEbq6gemZfbi9CJzZFeXygDKXFm7yQgzD47Zvezak
	zLREMhiTz0+QXnG1cw1oTCJ4v1iNhSGJmC4zjZcASU8GexCiQWp4rXgaaIu16oIleant
	X91A==
X-Gm-Message-State: AJaThX7l3oSTkgFyU/Mh5uVYHClR4SIIuaJk0/xV9cF+NEDebOHBki7e
	RMLq+YIGGnzaArGCIT+/DEshQj4=
X-Google-Smtp-Source: AGs4zMaPC09ZRoShAaCRQS2zgFGB+yZ8C6aCbtEAJoXdLc3K0ThBbZJfgbuSgEqMCM3QrStqAiRZSQ==
X-Received: by 10.223.129.35 with SMTP id 32mr7711227wrm.271.1510740095557;
	Wed, 15 Nov 2017 02:01:35 -0800 (PST)
Received: from pohly-mobl1 (p54BD58DF.dip0.t-ipconnect.de. [84.189.88.223])
	by smtp.gmail.com with ESMTPSA id
	x17sm6865472wrg.82.2017.11.15.02.01.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Nov 2017 02:01:34 -0800 (PST)
Message-ID: <1510740093.5979.12.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Wed, 15 Nov 2017 11:01:33 +0100
In-Reply-To: <20171114114239.66b7d58e@lsandov1-mobl2.zpn.intel.com>
References: <20171113181721.79781-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1510647870.5979.4.camel@intel.com>
	<20171114100939.12d4c1df@lsandov1-mobl2.zpn.intel.com>
	<1510675768.5979.9.camel@intel.com>
	<20171114114239.66b7d58e@lsandov1-mobl2.zpn.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] scripts/oe-selftest: oe-selftest-internal wrapper scripts that isolates execution
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
X-List-Received-Date: Wed, 15 Nov 2017 10:01:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-11-14 at 11:42 -0600, Leonardo Sandoval wrote:
> On Tue, 14 Nov 2017 17:09:28 +0100
> Patrick Ohly <patrick.ohly@intel.com> wrote:
> > Is oe-selftest-internal even going to be in the default PATH? It
> > probably shouldn't be, once it truly becomes an implementation
> > detail.
> 
> where can we placed it besides the scripts folder?

scripts/lib/ perhaps, then call it from oe-selftest with an absolute
path?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



