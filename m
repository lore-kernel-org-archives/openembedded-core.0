Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id E756373078
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 16:07:57 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id m27so69229424iti.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=N8nziJvf/wNvT6wjpWlGyZPrkxLMcvhkgY1vzOSiPr8=;
	b=p9GmtJ1jAVaBUJ3tfWnCo1HR4oCS2r15qtrWz85IGvF4dBoKZFBPMqej6igMMhO/PR
	OG3S+tuQXCflWrxywk5cqtsJfUItDETkMefiDu8jxU98Ipy11T67J3EDHslnicdlKVa1
	6IXLegD8k4GDL8LXJQTRgt4Vuxe06OJhvkVQ/7aWzh/ZOPhLgl7w+4YOW5IHNUu6khuN
	PGB9z6UjD+GGTHxWP2uyzeV/yPilb9GSOs+lnTqDMAhp4zsiaBNCc/XbyORcZ72Jkhrl
	SYRQnJZVRauRcacwdbofMVbsYCjbb1WD+8Ud9To/1dB+NMOXT0gC9XO/5W7TSCT6dh5l
	224Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=N8nziJvf/wNvT6wjpWlGyZPrkxLMcvhkgY1vzOSiPr8=;
	b=okDK60bWxa1iKzX3bFAOmwBD7Yvnco9cAA9wXe7KcN9tRQrWZIC56hnatYVxMdHRqv
	PCDsKPU81jIA1qdv30iAaX3wyrqC7qRLpsdGVYiZ6yqoI/jWtDXj0H1cuovZqKqjOawq
	FOsigxJ07Ih/htxsy2FSLhL5+uIL0o0NuVTs/wWhpn+mnJMt3MzbjMI4uy04ScIE3Q+5
	W1EWNGZWNfF6iH4PpGvbe4xAPJfC+5YQxZFbTu0NsfZcwhwBZ+caIGcEiShVzcj4cKau
	eoZkxJrm17f7NSwU0GEPvzn+2KI3AtgPAn/lvX057w6UHfrbwKxvP0CLImZx4ir3Zu1f
	B0YA==
X-Gm-Message-State: AMke39nO5xpozlDC6JUGUZH3x210jvfL3fGBAVaUMHJHXBOVgkxJujgRP7nUGSCOloaGQjRg
X-Received: by 10.36.153.197 with SMTP id a188mr32067075ite.5.1489075678689;
	Thu, 09 Mar 2017 08:07:58 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D47C.dip0.t-ipconnect.de. [93.232.212.124])
	by smtp.gmail.com with ESMTPSA id
	m38sm3121154ioi.60.2017.03.09.08.07.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Mar 2017 08:07:57 -0800 (PST)
Message-ID: <1489075674.7785.368.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: jobol@nonadev.net
Date: Thu, 09 Mar 2017 17:07:54 +0100
In-Reply-To: <20170309140706.19814-1-jobol@nonadev.net>
References: <20170309140706.19814-1-jobol@nonadev.net>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: =?ISO-8859-1?Q?Jos=E9?= Bollo <jose.bollo@iot.bzh>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Thu, 09 Mar 2017 16:07:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-09 at 15:07 +0100, jobol@nonadev.net wrote:
> From: José Bollo <jose.bollo@iot.bzh>
> 
> The copy of extended attributes is interesting for
> Smack systems because it allows to set the security
> template of the user's home directories without
> modifying the tools (useradd here). But the version
> of useradd that copies the extended attributes doesn't
> copy the extended attributes of the root. This can make
> use of homes impossible! This patch corrects the issue
> by copying the extended attributes of the root directory:
> /home/user will get the extended attributes of /etc/skel.

Makes sense to me.

> This includes 2 patches to implement the behaviour:
> one for the target and one for the native.
> 
> The patch for the target was submitted upstream (see
> http://lists.alioth.debian.org/pipermail/pkg-shadow-commits/2017-March/003804.html)
> 
> The patch for the native couldn't be submitted upstream
> because it applies after the patch specific to open-embedded
> that creates the parent directories:
>   0001-useradd.c-create-parent-directories-when-necessary.patch

Can't you reorder and rebase the patches so that this
0001-useradd.c-create-parent-directories-when-necessary.patch applies on
top of the patch which was submitted upstream?

"devtool modify shadow-native" might be useful for that. "git rebase -i"
in workspace/sources/shadow-native", then finish with "devtool
update-recipe shadow-native". I haven't tried whether "update-recipe"
handles re-ordering patches. If it doesn't, just fix it manually.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




