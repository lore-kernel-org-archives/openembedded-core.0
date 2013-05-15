Received: from mail-pd0-f179.google.com ([209.85.192.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1UcXcE-0003ph-IQ
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 11:03:24 +0200
Received: by mail-pd0-f179.google.com with SMTP id q10so1174717pdj.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 01:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=S0XKyVFasTKmb5hTyxcKVHJJKFLTzUqkqkG6B01H7nE=;
	b=Sgr15qWtgcycyt4uklR/ASjalVIrRdmt/berTLKbGKDrY6q3D/9D20x5/9IUAnzI7O
	OixFPvo4+V6I5sFVz1UOPPuQw/gUiWTen2pCqsSgIGRIDYGy2YCI+jtt8lKVBFHSgN5o
	CVK2lYq0GmjiDtHR7OuD1GvvVVor6Al3Lb2r+uqQDNVz6rxn2SPiYpEnPa7sSEki+/+/
	/iLIq6HSrg9cfvXnyqCQzvEoAaKhcXdZZh2/74yWhlqLUQncR0VScjlS/qOQPdgC9A+V
	fkic2k5COUz4ZSoi5bsEtyntv27jfyXU7D93eBL1KfEs/gpIDwPbNh+F/KBsu0a8p4ky
	ZGuA==
X-Received: by 10.68.51.234 with SMTP id n10mr10177217pbo.221.1368607505530;
	Wed, 15 May 2013 01:45:05 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.237.163.165])
	by mx.google.com with ESMTPSA id v5sm2046716pbz.4.2013.05.15.01.45.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 May 2013 01:45:04 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Wed, 15 May 2013 16:41:13 +0800
Message-ID: <5586817.YLlYCAFBIu@yiqingliang-pc>
User-Agent: KMail/4.10.2 (Linux/3.8.11-1-ARCH; KDE/4.10.2; x86_64; ; )
In-Reply-To: <519344E1.3020704@topic.nl>
References: <3388285.jCfN1Lj2u9@yiqingliang-pc>
	<1875466.EG2CYrV9ea@yiqingliang-pc> <519344E1.3020704@topic.nl>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt keyboard problem
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
X-List-Received-Date: Wed, 15 May 2013 09:03:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, May 15, 2013 10:18:41 AM Mike Looijmans wrote:
> On 05/15/2013 10:10 AM, Yi Qingliang wrote:
> > On Wednesday, May 15, 2013 10:05:45 AM Mike Looijmans wrote:
> >> On 05/15/2013 08:19 AM, Yi Qingliang wrote:
> >>> I'm running qt application on yocto's qt image. cpu is s3c2442, like
> >>> mini2440.
> >>> 
> >>> the problem is:
> >>> 
> >>> key event issued by pressing gpio-key eat by 'getty' (from busybox),
> >>> my application can't receive input event,
> >>> if I remove respawn 'getty' for tty1 in /etc/inittab, everything ok.
> >> 
> >> I solved it by no longer starting the console login. Set the following
> >> in one of your .conf files (distro or local.conf):
> >> 
> >> USE_VT = "0"
> >> SYSVINIT_ENABLED_GETTYS = ""
> >> 
> >> You may need to rebuild initscripts for this to have effect.
> 
> Alternatively, you could disconnect the console when the GUI starts. You
> probably have some script that sets things up and starts the GUI, so you
> could extend it with the console on/off function.
> 
> That allows you to see the boot log on the screen for example, and debug
> things via the console when the GUI isn't running.

Good idea!

> 
> I forgot how to do that though, I think is was something in /proc/.

if you remembered, tell me please! thanks!

> 
> Mike.
-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com


