Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD8C772BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 13:53:18 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id b123so3718266itb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 05:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=AVGWGkdMpCKZ1cilbV88ccvsazFjsT+Z8xEDoiW04/E=;
	b=EMDglu2udHzeIfxi2NS2aICv7Nr6tPtgM4CkB+pK3KQXjgXPbiPprCVjTaLXoXwGFh
	9983Dech/CDRyIlThLvJtpmDb/8tSYZe+qcNvOqGJgfOPGx6V/T803wgqd20Ffif/U3w
	rH3gZx5xgvoGyMuEhHCbdMcb8xDjZhbB4hqS5ajjXZvWNMp+DP47i5RIBbWzEZKF8DVR
	hD+gi856om5DowlORtsTgzdQoBpgwZUWCC3UBtReefAXyx1nT34xU8qD1yYppph2zHQo
	zy7fwci+FnogI5iH8y97e2ZZpo2E1pCoUglkK88jCUDDHHWsTs77d2qsMZF6gDmIgEzg
	tCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=AVGWGkdMpCKZ1cilbV88ccvsazFjsT+Z8xEDoiW04/E=;
	b=IHoPWyewJ3umG4ZLzrAmpv7O7B3acv/+8UnT5O0Z3GHfHpaLJeiFjtmGFdxsoUJ0Um
	e4KbLwLlxzh0b6lDjbLD7qIF9NR06gn/NKjviJ5N8J8Rcef9alMtbIUGo/cb6XpGd4fj
	l3x1ORmzLNKluoGZ9cbQS26ZR3PteicqvyHdYwMu6jU6AjUT2KBU301Gpu73zzPEZPxj
	KGnWwAMs7teR+fVo8ID7s9ckA7htGUHBTHPqPY+rzQ0ZavKVpDhK/TllXnWJyadpNL0Z
	SSjqYg9G76Ev5bUg3tF+Zy8ZU4rEs1oHvndWr7cU9FpMnXOO3Zv8Qwm7B+39bkbU+q8t
	JTvA==
X-Gm-Message-State: AKaTC01G9fHNvBC5qXGE4eif6cyDqUgVo31l6TwVl7zRuEciGJz7JjolrUJXpKyo+UKfoQ==
X-Received: by 10.36.17.194 with SMTP id 185mr1432101itf.46.1481810000036;
	Thu, 15 Dec 2016 05:53:20 -0800 (PST)
Received: from openSUSE-i7.site ([45.72.129.229])
	by smtp.gmail.com with ESMTPSA id p20sm4336350itc.8.2016.12.15.05.53.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 05:53:19 -0800 (PST)
Date: Thu, 15 Dec 2016 08:53:17 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20161215135317.GA11254@openSUSE-i7.site>
References: <CAHZ0fbGcJPSjagwjxu08SxbaCAr50ucZ7WL3s-cMG2v4JaoNdg@mail.gmail.com>
	<CAJTo0LbB5_PkVd-XBH7ESUtiGvTi7ziqLjRr9FXjLp7zAVpvqw@mail.gmail.com>
	<CAHZ0fbGUf4naEmiEvTPuEMT2LgRYKf+m70-rqon7ZReVrp9a3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHZ0fbGUf4naEmiEvTPuEMT2LgRYKf+m70-rqon7ZReVrp9a3g@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-intel] [PATCH 2/2] gstreamer1.0-vaapi: Import from meta-intel
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
X-List-Received-Date: Thu, 15 Dec 2016 13:53:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I'm guessing I have to wait a little longer for various repositories to sync
up with respect to each other, or is something going bad here?

	| configure: error: Requested 'gstreamer-codecparsers-1.0 <= 1.8.99' but version of GStreamer codec parsers is 1.10.1
	| WARNING: /z/layerindex-master/minnowmax/tmp-glibc/work/corei7-64-oe-linux/gstreamer-vaapi-1.0/1.8.2-r0/temp/run.do_configure.11053:1 exit 1 from 'exit 1'
	| ERROR: Function failed: do_configure (log file is located at /z/layerindex-master/minnowmax/tmp-glibc/work/corei7-64-oe-linux/gstreamer-vaapi-1.0/1.8.2-r0/temp/log.do_configure.11053)
	ERROR: Task (/z/layerindex-master/layers/meta-intel/common/recipes-multimedia/gstreamer/gstreamer-vaapi-1.0_1.8.2.bb:do_configure) failed with exit code '1'

This is a core-image-x11 build using master for minnow/turbot:

	Build Configuration:
	BB_VERSION        = "1.32.0"
	BUILD_SYS         = "x86_64-linux"
	NATIVELSBSTRING   = "opensuse-42.2"
	TARGET_SYS        = "x86_64-oe-linux"
	MACHINE           = "intel-corei7-64"
	DISTRO            = "nodistro"
	DISTRO_VERSION    = "nodistro.0"
	TUNE_FEATURES     = "m64 corei7"
	TARGET_FPU        = ""
	meta              = "master:91f856426c7523e1ebdf6d6f93f5fa7e509d6e49"
	meta-intel        = "master:3d218385a7d8509fbb66b6aa92efef185d1cfcde"
	meta-oe
	meta-gnome        = "master:e6c7a66eb4f3944059bd4fff4103f8a9fdcb167c"
	meta-browser      = "master:3f4fc6dd50650417a0b966c4157f3ad7f3697633"
	meta-nodejs       = "master:7d63ea2e056e96a617a6281613afff6fe7762619"
	meta-realtime     = "master:c7807efaaa9933f45a68576c56a2ff2f9bd24203"

