Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C1FD371A1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 08:27:57 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z129so3583327wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LWlFtS4PV7lcTIl5yHlZtJUHkrpUb+OzxpTzM9kBBnE=;
	b=IIyMIbkAk0t2Jgv71s4/XKPVT8GzphMcGqbR0UrMS05DTTScwUPXkpEUpIg38g99mY
	q/XXEE/csU9+IXEhKV4s0dqseWRTQSffD6ydReqmH5v34YMy1EpXjiFBbzL76ubgDKXI
	rDFGThjSTxjf2LlrTfaQdgFi5euDbb/+FH9ZGy+fnmtB0aPD+pXb4sKZxokusCQ+Ts8L
	XMW/LIhF2A/IwSLQLT+kV92ojSdgiY3lSPg+616DKE55by3QptVTbA6B/kt/K45Gvudz
	J4ktv8d/0sYLb566xRoSy6mrRShcAk9700JqAouu3q8h2CTjUGSVAU5ImP2JApTMDkKX
	FLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LWlFtS4PV7lcTIl5yHlZtJUHkrpUb+OzxpTzM9kBBnE=;
	b=C/1nrdnYMYJcWj3JPka4Tzr9o1YGwPhM3+/CGymhQwUwnQNZZLV0I6oCBGNtP9oFkj
	3IdQSY1ywxLgMelVPmWRjEBxGnT10cKzJk2GuTSJEOJ43gllDFXhVRlJ3Wzw41/Rk7vL
	TwhSjsmlDIfVO9j81Rgy2R2aoLYRz1wH8OmIUvEnpWw7G21euwk7ft+G66tBVcWOgDeq
	VrLI+mcCU2GDjqcEdQ8FnDhQznbevhJK7QI+2sW2yyLJju9N4HVC2052txwFAFsjMrv2
	KhrVHojkwIZDF6EiEHQATFwg+6AjXwg7Sn3YZXOKKd0h2E90bXIinCemadkFoFQ9e/pa
	v7TQ==
X-Gm-Message-State: AN3rC/6dR/RXMSHLOjyl5k/063Fljg+OgbXs654X1/9Z0JLmbMKYYtW7
	LzoesjhjOx20PQ==
X-Received: by 10.28.55.3 with SMTP id e3mr17631755wma.15.1492590478319;
	Wed, 19 Apr 2017 01:27:58 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id a5sm2743648wma.28.2017.04.19.01.27.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Apr 2017 01:27:57 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 19 Apr 2017 10:27:50 +0200
Message-ID: <2335903.2zueHJxyF0@crde-port-20.cahors.local>
In-Reply-To: <CAHiDW_EQL63FQt7t8fETRZkx0sVjNs-as5Y+qexN48CtCUS5MQ@mail.gmail.com>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<CAHiDW_EQL63FQt7t8fETRZkx0sVjNs-as5Y+qexN48CtCUS5MQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Wed, 19 Apr 2017 08:27:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On jeudi 13 avril 2017 10:05:29 CEST Jussi Kukkonen wrote:
> Hi David,
> 
> Just a heads-up: I will propose a revert of this patch this week unless
> better ideas come up in the mean time.
Sorry, I've been away last week so didn't have time to respond to your 
previous mails. I've seen the revert proposal but I think I could provide some 
heads-up to find a better solution to deal with my problem after the revert.
> 
> I get that you have an actual problem you're solving but I don't think
> postinstall is a correct solution. I'm sorry I don't have an alternative
> solution ready for you: if you share your other configuration recipe and
> explain how you use the two, maybe we can figure something out.
This is my other recipe that installs the alternative configuration:

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://openssl-hwengine.cnf"

do_install_append () {
    install -m 0644 ${WORKDIR}/openssl-hwengine.cnf ${D}${sysconfdir}/ssl/
}

PACKAGES =+ "${PN}-conf-hwengine"

FILES_${PN}-conf-hwengine = "${sysconfdir}/ssl/openssl-hwengine.cnf"
CONFFILES_${PN}-conf-hwengine = "${sysconfdir}/ssl/openssl-hwengine.cnf"
RPROVIDES_${PN}-conf-hwengine += "${PN}-conf"
RCONFLICTS_${PN}-conf-hwengine += "${PN}-conf"
RREPLACES_${PN}-conf-hwengine += "${PN}-conf"
RDEPENDS_${PN}-conf-hwengine = "libp11-engine"
RDEPENDS_${PN}-conf-hwengine_class-native = ""
RDEPENDS_${PN}-conf-hwengine_class-nativesdk = ""

pkg_postinst_${PN}-conf-hwengine () {
#!/bin/sh
if [ -e $D${libdir}/ssl/openssl.cnf ]; then
    rm -f $D${libdir}/ssl/openssl.cnf
fi

# If openssl-conf is installed before openssl, we must ensure that the symlink
# destination exists
mkdir -p $D${libdir}/ssl/
ln -s ${sysconfdir}/ssl/openssl-hwengine.cnf $D${libdir}/ssl/openssl.cnf
}


The package is then chosen during image creation based on some 
MACHINE_FEATURES, i.e. if the machine provides a crypto accelerator to use 
instead of relying on software implementations. I hope that these new details 
will help you understand what I was trying to achieve.

> 
> Jussi
> 

David

