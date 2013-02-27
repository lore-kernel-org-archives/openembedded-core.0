Received: from mail-oa0-f49.google.com ([209.85.219.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UAmGy-00043t-VH
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 20:02:39 +0100
Received: by mail-oa0-f49.google.com with SMTP id j6so1908602oag.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 10:46:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:x-mailer:mime-version
	:content-transfer-encoding:x-gm-message-state;
	bh=BMtPXqKZv2VxCN1zuj/k9tykOCmFLCYuqX/1pVkUoYs=;
	b=RLXxe/ea1uKeoEOh+VuT+6cQTo5y9Hu+DtdtLmAfVbM2wFXECaeUbAMTAQthmNY/XS
	+G7+k922So9/LIPXb4P2ewRulBhn3xidTdU8Xx3TVPlFAX6jF390YG/vHDCpmGMwjbaV
	CAQoZZhEbBKE9l+Hu+EALcznWG6NT+wku96twHDJeRLOY2g1yF0jIA7DUoCAke7mBAd9
	yHApKHs+3ZswzvAj6n3uF1laRHQIYEsCCn+r84G4EEH1L5GJyMyxeNdf3h0Nvss+f6Xf
	eoAIERNcu6+j+IzMrmtLChWzMG3JdB3CosQZFf3FX3vIXSsxcvhJt4CYBZFpXFwqWXk6
	Dspw==
X-Received: by 10.182.52.102 with SMTP id s6mr3214713obo.87.1361990773752;
	Wed, 27 Feb 2013 10:46:13 -0800 (PST)
Received: from [10.0.1.95] (adsl-68-88-197-100.dsl.rcsntx.swbell.net.
	[68.88.197.100])
	by mx.google.com with ESMTPS id ka6sm9359756obb.3.2013.02.27.10.46.12
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 10:46:12 -0800 (PST)
Message-ID: <1361990771.1809.16.camel@rrMBP>
From: Koen Kooi <koen@dominion.thruhere.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 19:46:11 +0100
In-Reply-To: <CAJTo0Lbnt78ssmdTmTh2CoFfDMHq_SpoV9qYEX+2kPod4EW9Jg@mail.gmail.com>
References: <CAGiJk9drhuVo1AfCsHEc3jbevtzaYcONQwHQ2qfE=HuJjUCbSw@mail.gmail.com>
	<CAJTo0Lbnt78ssmdTmTh2CoFfDMHq_SpoV9qYEX+2kPod4EW9Jg@mail.gmail.com>
X-Mailer: Evolution 3.6.3 (3.6.3-2.fc18) 
Mime-Version: 1.0
X-Gm-Message-State: ALoCoQnxSknOLMETijPiweDFto1xF9rkS6ENb1OCoYV+C63Xegyu7rkejNRAERMlMQ/jcGAdo8Sf
Cc: Patches, about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: gst-plugins-bad and EXTRA_OECONF
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 19:02:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-02-27 at 16:09 +0000, Burton, Ross wrote:
> On 26 February 2013 08:57, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
> > This is caused by sdl-config from my buildhost, though gst-plugins-bad
> > has EXTRA_OECONF += "... --disable-sdl ... --disable-orc"
> 
> I tried replicating by bitbaking libsdl and then gst-plugins-bad, but
> it still disabled the SDL plugins.  What version of oe-core are you
> using, and do you have any other layers that could be involved?

I know angstrom overrides the OE-core recipes to enable or and other
plugins:

[koen@rrMBP meta-angstrom]$ cat
recipes-tweaks/gstreamer/gst-plugins-bad_0.10.23.bbappend 
PRINC := "${@int(PRINC) + 2}"
DEPENDS += "orc orc-native"
EXTRA_OECONF =  "--disable-directfb --disable-examples --disable-vdpau
--disable-apexsink --enable-experimental --enable-orc"





