Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2A47E74E2F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 15:48:47 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id n202-v6so12229345ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 08:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HzVgnBzraaG91rrabBRAoTOKIEP95dFDj90tClDeuG0=;
	b=p8ZOScrA+pgLY/ShV8PTnPlKafF+I/Xsfr83tq0Q1Z8uLqkzk1+3Cyv7bbojfqJSi9
	5NyQKVCRA80aUmxYrTOu2wzNDr8KcZR77F7J+RNczZlTV4zPLx2ZwEO1c2P6ypLsQzp1
	K2YlHjVVk5FyouO2TCachJ2bDKXQfHY2nL8p/qk8RKjsLxRgfz26lNZSe9QO62b6Ba1E
	GX/cyo+11/CrFwfSnkNMwbMG4ojx+ukGGLzgRQvQJR8lH0w0FBTWJBq+YwGjxJdnk5ui
	bRlN4kyGzsGfEWfwwQ1fxmHjstS+2N1+xBKA+RqI0FkZt+Rkze4K9NIebLT9zRBlRGlM
	wXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HzVgnBzraaG91rrabBRAoTOKIEP95dFDj90tClDeuG0=;
	b=beCg1laijAOLIjo+J4aYvSDH6/XbEYOQtJx8HxwyozFS/uLpWPZ/1eNclmjei4Lsyz
	F/HHUZIsLMjo2iinCtDhI43rFaYkqcXEWBi25FLSkx0T2/XTX5yuLsqk5n3g+wiiGe8P
	tX4UwEoE+/2KXaQB2oWXV0QgKDYvAMO2a6+KtfyT+iNSZFkdzRDUYFpGh6ujIcKEry5i
	fvTYCoPuJKoh430R+Ir27SCJtIlogRk0DTn21bMQpLMwowja9lIFA3K9mM79ieptx83n
	kXRrbC4kIbKfiJnsU9qiiBBL2/L7sHYP13yrikYEn7VDSxu4+56EXVlX5ma2KMIorcW4
	UKpg==
X-Gm-Message-State: ALQs6tAUIypujbclpDG3UWLnfa151a0CqHN7eQN+nuZ/mOeV3DiY54uw
	2/HYLOhjlI+ovXmpK6TuUo4=
X-Google-Smtp-Source: AB8JxZrK+ZbRg2FGy6GMooZtzIs7EAiu5pwc1NW5R78vGdy7SzfDjh3qyATkmpXua2nK8ei58hJkBQ==
X-Received: by 2002:a24:19c9:: with SMTP id
	b192-v6mr1888083itb.78.1525708128715; 
	Mon, 07 May 2018 08:48:48 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	w93-v6sm10469128ioe.87.2018.05.07.08.48.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 May 2018 08:48:47 -0700 (PDT)
Date: Mon, 7 May 2018 11:48:45 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20180507154845.GA17081@linux-uys3>
References: <20180507152701.12046-1-twoerner@gmail.com>
	<CA+chaQfbViBTpaV3rOXd1Q9NBnViSLAjb-obywEi7y1rpJAz5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfbViBTpaV3rOXd1Q9NBnViSLAjb-obywEi7y1rpJAz5w@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace: switch source URI
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
X-List-Received-Date: Mon, 07 May 2018 15:48:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Martin,

On Mon 2018-05-07 @ 05:33:26 PM, Martin Jansa wrote:
> There is already a fix for this, see:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150423.html

Oops, I should have checked, sorry!

> Using github archives is even worse as they are regenerated from time to
> time.

Crazy! But good to know.

> Also when you really want to use v${PV}.tar.gz archive, then
> use downloadfilename parameter to fetch it with some more meaningful
> filename and to prevent possible conflicts with other badly named tarballs.

Oh, I see, in one's own DL_DIR. So (not that this patch is relevant anymore)
instead of:

	-SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
	-"
	+SRC_URI = "https://github.com/efficios/babeltrace/archive/v${PV}.tar.gz"

better:

	-SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
	-"
	+SRC_URI = "https://github.com/efficios/babeltrace/archive/v${PV}.tar.gz;downloadfilename=babeltrace-v${PV}.tar.gz"

In this case, would the checksums need a tweak too, or do they know to look
for the downloadfilename file name?

