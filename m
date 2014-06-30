Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 51BC460CEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 12:48:56 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id f51so1883573qge.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 05:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=va1Rcjeb+9w1XkzzbOhPzsc5BRIav2JHv6VDk46YIaE=;
	b=Lbb5SND7Fo1FZXMG2URN3TgAaZCvwKL832JU7cYcFM03e0akJcAA+lWpmUFVzNGr2R
	F5GJYDvi/mMHIOFoWGtiC8Md7KqiDGTruR9uCsG28ZJkrX36yePbTeECHbxzYbbarxH1
	gk/IPV8gzyy7m1p5935gFOwUZhaiFC1upGiDctu4baK2IJjSCQv+5kQhkG8AYzz7GO3f
	huLhZ7tkVJVTeCGpnfequ3+sjQJPcPpyhaZS1lwUl/cJrpeUNbZ1vdJvuJt1P8rWizHY
	LrfwS5DFwGXouPYbV9GBAhINMzUK81buWSpeb0mnEdFHPmvHoFvxcOUaIxOoF6Z/J6uM
	S4IQ==
X-Gm-Message-State: ALoCoQmL4AwGKwxGPVOVw6L0v/vHw489zOH6ja5Qkza1ABrAdJhCHxm8s5DfDAX3eUEZNekC0FfK
X-Received: by 10.224.124.74 with SMTP id t10mr34725474qar.78.1404132537705;
	Mon, 30 Jun 2014 05:48:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Mon, 30 Jun 2014 05:48:37 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Jun 2014 13:48:37 +0100
Message-ID: <CAJTo0LZvpZCFPYxsF21b1gvzr7TMMRwrLMdthGLzWFcm3JWqbQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: package_name_hook in debian.bbclass
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
X-List-Received-Date: Mon, 30 Jun 2014 12:49:00 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

package_name_hook in debian.bbclass is tagged using EXPORT_FUNCTIONS,
so that other classes can "inherit" it and define their own
foo_package_name_hook, calling up to debian_package_name_hook.

This seems unlikely to actually happen, and I was thinking about
removing the EXPORT_FUNCTIONS tag.  Would this break anyone's code?

Ross

