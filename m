Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 17B4671993
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 16:17:08 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id n124so47460751lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 08:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RYzHmcZFpxtTimkOomob7pcvhrkwtcf/PwnLBqDYMA0=;
	b=bs0zmRjKr+HZsbUhDizwITAlgd73fQGd9fFm/jgifkrcZWYPScD3pVrFwe918AC5BI
	g4RTg1PtvXlOF6CW+1dkq0BN5IhxgfEvIs6gaGCmq59FOTzLYF7RaiROXJYX7GcWiqRX
	fvFGHZ3MR18SrOkEpeEBp6M8tZpM2uFFi+EO/xm63x8ldfkhQmWZKOylRgT9EEs00Yx/
	DzKii2da+hrwgkoQbc5pHdepF91kmi2nHchPqJA8BdzCxZ6d0knkcuRSBa/yKjyLuXM2
	ZbP+oanmmVvqiGfZUxb2YuxinXeyOCgiia/KONdZlGDj2uP8RcWmFp4Kd+p7lGNKn67S
	xpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RYzHmcZFpxtTimkOomob7pcvhrkwtcf/PwnLBqDYMA0=;
	b=ljWAgWaGxZEOwo5eEtEKpsqFUiHN7/6t+3+pr2cEdaYccJd2g8NKu5ohsIqiWcSVjA
	4P4ENS2WS+L0EcRr58PS3eCtWMSYtWm6bfZrydI0mbpbWB37gH5bxb7Rghs9S9jxPid3
	5x+LTYQ4hfq/3cUSYcRvd+Hi07qRHvgQG8tbJ77ZcDbvuNZTv2NOTaCBhB1W2rc0vVrx
	SjRKjHLNpP5F/EvVaj3oEmjggIzxVu+r5FL33FrRkZvWpt2h3160xzz1trfKQ9ul0xe3
	GDpFIbTxi6kUEelwpEr9cOhYEewsBytj5ZgGfn90JV30nsZ6f4ydCjtwEJL7VT8ZqmAi
	KVow==
X-Gm-Message-State: AIkVDXJ8RkYhj1zRBvcp9yGezix54QxG3ZM3/SFaNn8DnKOhm1QpNDNUPY7v9D0YdoyCZg==
X-Received: by 10.25.141.12 with SMTP id p12mr4152020lfd.147.1486397828564;
	Mon, 06 Feb 2017 08:17:08 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	a138sm429619lfb.2.2017.02.06.08.17.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Feb 2017 08:17:07 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Date: Mon,  6 Feb 2017 17:16:45 +0100
Message-Id: <1486397807-11699-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <f181ed99-ed09-59d9-96a8-cf5d77a179d7@mender.io>
References: <f181ed99-ed09-59d9-96a8-cf5d77a179d7@mender.io>
Subject: Re: [PATCH v4 2/2] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Mon, 06 Feb 2017 16:17:09 -0000


Rebased and reran tests. Changes since last patchset:

- Because of recipe specific sysroots we now need to import the PATH
  used by wic-tools into the test in order to use its tools.

- Add specific '-o' parameter while testing wic so that we write into
  resultdir.

- Several unrelated changes to poky now means that we need to use an
  absolute path for new_rootfs in the rootfs.py implementation. This
  would have been a good idea from the start anyway.

I hope there are no more outstanding issues with this patchset.

-- 
Kristian

