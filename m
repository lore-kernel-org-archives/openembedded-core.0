Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id DCF97608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 10:58:01 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id g17so3114408vbg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 03:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lA7OJMq1Wvy+m309vElPdAHj89S8dVB4h/SL0mh8v8s=;
	b=h4V9HEge85nBck3dGezmL2SY+WZabWZTrF+xRUh5OKV6A7k1URZHr6gj9dP6+khk1/
	kwQTlHk+BhU9b4quA63MwXb7rG9PpieXxxaVpxIfsdgGCQCnxipgXDE1+lNMaq1J2e2b
	arO9dii9a1N3ftFu4RpI7wBg7Vknk/sMo+4/3WAKvNK9K10b9F5XHIBFK8Oei63c9yLF
	aIAVi3LldDPL8FrupdUfgMJMoDzLLAuyrvFQCB1ysNFW68JkWsjmbEostN2GDT+vONjQ
	EbZmUv7kJvZx4YLTxi3wYNimiwJIwsvIxbrNYqJXtCqW1diziqgdpAFbzR2eq+FydrLY
	qKdA==
X-Gm-Message-State: ALoCoQlESJQVaAssvC3uisY2B+39yUYpZxg1uF+c+noceoZ6vXtEZp5Y61msUlcpASvP7RS6meuR
X-Received: by 10.220.13.15 with SMTP id z15mr3614902vcz.46.1375959482131;
	Thu, 08 Aug 2013 03:58:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 8 Aug 2013 03:57:42 -0700 (PDT)
In-Reply-To: <52035D0E.4090502@windriver.com>
References: <cover.1374643300.git.rongqing.li@windriver.com>
	<947336a1ef2b936328ba6fcf519d55a4eda7085d.1374643300.git.rongqing.li@windriver.com>
	<5201F783.4020601@windriver.com>
	<CAJTo0LZw9kOSmQbeQM71JGZh36nYy58o=ZEB_oA8nYOFBtqZTw@mail.gmail.com>
	<52035D0E.4090502@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Aug 2013 11:57:42 +0100
Message-ID: <CAJTo0LaLYpG12N74wtDRbPC81Qc+0DYuoRd98w1vRd0yHLS_FQ@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: ignore qemu output, and check its return code
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
X-List-Received-Date: Thu, 08 Aug 2013 10:58:02 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2013 09:55, Rongqing Li <rongqing.li@windriver.com> wrote:
> | ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
> ignored.

That's probably what's causing the problem, not the syscall warning.

It looks like https://bugzilla.yoctoproject.org/show_bug.cgi?id=4843
which is tricky to replicate, maybe you should speak to Peter about
your configuration so we can finally fix it.

Ross

