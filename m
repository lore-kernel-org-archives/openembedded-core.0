Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5588E73257
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 08:58:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so2860944wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 01:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PjsSGLEkEzzszehuuwhZBfILrxsD9pfXEHj06xB5WrE=;
	b=p32AYWe1uqoG96V747VXtgthcB8aIY1nRC3sr7CTS4gdxrAFd0QXGtkPF9l4F0gPOE
	ZlOwl+CHhG6shV403sXHkqPcORrrP+KghDi0FMgslYrKSluavKYCGptlYwE+BDM13fwg
	rGFj1vIEjk2JqASQDvbs1MKvoNGv6umtGdW/ae0fVKhoIHsDC96YvXhCcRxQLeJTJSH7
	VCCGNrDUDMwwZa9s5YJiWJPhYpOgtvDWZgkRzh7Y8QL8Veig/FqyFBPQQf6Y9MTOfqGi
	sjKB5lzGYZUfV8Sq0UOhPMlb6E58l3W+UXp/w9nN4EFkkAK5U0k4ZKGc9DAd+psYlGeH
	kY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PjsSGLEkEzzszehuuwhZBfILrxsD9pfXEHj06xB5WrE=;
	b=jXhPwCppDEUOjkR9XpNjNNBdXYW28UZ+r+sP2XbxFxsjkuEDXxsDKmwRPueICzvJVQ
	cqlLIB18UkCcvTYI8Zs4slIqAzgBru0D1k6G0lU47UtsazLuIg5JGoGIe22AVibIRIb1
	OBXY7YSEjkuNMjrvFkiT/+LSgwjTICxzISG9D2nT2zWYqJq/c/ZG64z+43JzacIygWQS
	jJYXJuRoGXHU7v5P2rZzxbJ8FDcsLDb/SQSTWhXdGHGdiPhIewbzfwTMuStzmu58wa+M
	uff6nkuojktfHfm0H7VQhtb6AxBA11MBDK9tYyiv0Aaxv5LARkot24Lx7EpNfuaYnhdU
	vlvQ==
X-Gm-Message-State: AEkoous3+iCbY1WD25LXZlENqnhdhwwxX+y7BrrumSYiwSjs32QRsZ6l7tVgHdD8OMChZA==
X-Received: by 10.194.240.4 with SMTP id vw4mr4648402wjc.134.1470387531165;
	Fri, 05 Aug 2016 01:58:51 -0700 (PDT)
Received: from Saturn.local.all (212-41-96-100.adsl.solnet.ch. [212.41.96.100])
	by smtp.gmail.com with ESMTPSA id
	a9sm16808093wjf.16.2016.08.05.01.58.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 01:58:50 -0700 (PDT)
Message-ID: <1470387529.2393.4.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Brian Avery <avery.brian@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 05 Aug 2016 10:58:49 +0200
In-Reply-To: <b41fd09b-cb0e-8702-d789-27ab70d56787@gmail.com>
References: <CAKV_0einF1siokeL5FFx2jLbwAk6xYSnb42fCZ75wpfQ3MbqRw@mail.gmail.com>
	<b41fd09b-cb0e-8702-d789-27ab70d56787@gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: RFC: eclipse debug functionality issue
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
X-List-Received-Date: Fri, 05 Aug 2016 08:58:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Brian

Am Donnerstag, den 04.08.2016, 19:49 -0700 schrieb Khem Raj:
> 
> On 8/4/16 2:20 PM, Brian Avery wrote:
> > The core issue:
> > The busybox resize command breaks the eclipse ssh debug stream. 
> >  This is
> > because the resize command for busybox sends a set of cursor
> > control
> > escape sequences to stderr. The resize cfg was added to Krogoth and
> > is
> > still in master.  The point of resize is to set the environment and
> > terminal settings to the current xterm window size.
> > 
> > Additional complexity:
> > eclipse-debug is an IMAGE_FEATURE.  If it is turned on by a user in
> > local.conf via EXTRA_IMAGE_FEATURES then I can conditionally turn
> > off
> > busybox/resize in the cfg file.  Unfortunately, if a user makes a
> > new
> > image with IMAGE_FEATURES += " eclipse-debug " in it, I do not see
> > this
> > from the scope of the busybox##.bb recipe.
> > 
> > So, there are a couple of ways to solve this and I'm not sure which
> > is
> > the best one.
> > 
> > 1) conditionally turn off the resize.cfg if eclipse-debug is in
> > extra-image-features.  Also, make a rm_resize.bbclass to rm the
> > usr/bin/resize from the rootfs in a do_rootfs[postfuncs] which can
> > be
> > inherited by the various sdk images we build.
> > 
> > This is problematic since if a user makes a new image recipe of
> > their
> > own and includes eclipse-debug but doesn't inherit the
> > rm_resize.bbclass
> > eclipse debug will fail.
> > 
> > 2) elevate eclipse-debug to a distro feature which would make it
> > visible
> > to the busybox###.bb recipe.  Unfortunately, it is really an image
> > specific set of packages to be included so elevating it doesn't
> > seem
> > reasonable.
> > 
> > 3)   use the update-alternatives method (busybox is currently doing
> > this
> > for syslog) to make a separate busybox-resize package and make an
> > eclipse friendly resize package that is empty and add the eclipse
> > one to
> > the eclipse-debug packagegroup.
> > 
> > 4) Just turn off resize or patch it so it doesn't try to control
> > the
> > cursor via escape sequences sent to stderr but still sets up the
> > environment.  It's worth noting that the ubuntu  resize doesn't
> > send
> > escape sequences to any of the streams.
> 
> this seems to be best option.

We fixed this by only executing resize if logging in from a serial
console:

http://git.toradex.com/cgit/meta-toradex.git/commit/?h=V2.6-next&id=9d1
32ea3cf75562ef5610dd6ff1c89d0cffa334d

I guess one could apply the same fix to here
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/b
ase-files/base-files/profile?h=krogoth

Regards
Max

> > 
> > 5) Something else?
> > 
> > Thanks,
> > Brian
> > an Intel employee
> > 
> >  
> > 
> > 


