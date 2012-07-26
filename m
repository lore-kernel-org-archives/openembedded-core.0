Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SuMvm-000730-3N
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 14:12:38 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2012 05:01:06 -0700
Received: by yhpp61 with SMTP id p61so1677909yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 05:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=z5a8eI2QZe8Q8gwTYH5yE/B9097ZF37AIPr6FLhC9ug=;
	b=CN/kr1/urLKPjtwraOork1rjujw8ixYxZss7NQNN2lT7936l1HhQLfTV12fQqE01uG
	pO/YnXFZCDHIQxV8zeu4nR59p3EYL3XyN5f+FTu4S1Ep7iTKOtqj5sEzz+qh7G8Kzs0E
	DYUzgLFvFMhJ54WLmARomS2WSVAovYjH6VOBI5QXgWWjArPRxgJFReJKLj6aH9o9rNCA
	m1sdq14wltGXaQc6WAYfV7DtTJAOMKqHDVxQWFactB2rDj1zTZVwzoDX8w7G+u2+/cWl
	tHaHIDDikVsbjKL1/sISIYZDdbdaSNTfHhthN4pY1liK3g14jl6Q4/Zmauu1JLtmN0vp
	2NMA==
Received: by 10.50.208.34 with SMTP id mb2mr1356914igc.5.1343304065218; Thu,
	26 Jul 2012 05:01:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Thu, 26 Jul 2012 05:00:45 -0700 (PDT)
In-Reply-To: <C132AEAF-467E-450E-A86F-7A68BE96F917@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
	<F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
	<50110B50.3030900@intel.com>
	<446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
	<50111C7C.8080904@intel.com> <50112207.3060709@intel.com>
	<CAJTo0LYeKt+KypnrVq50tSbjqfK8XyvUnZp0xvz=KRmMx7dXzQ@mail.gmail.com>
	<C132AEAF-467E-450E-A86F-7A68BE96F917@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jul 2012 13:00:45 +0100
Message-ID: <CAJTo0LZx5E7tcvLUMrjPdH2B5p+DnFxU63tbtL6tsDX5dVfVSQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnruXlZfSWH+Ha4qcExte6nbCCjjd1FCI12Bm5o3AbaDzuOv1j52hxeA0gt/eSToy+DVGfr
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 12:12:38 -0000
Content-Type: text/plain; charset=UTF-8

On 26 July 2012 12:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
> It would be nice if other layers that have RDEPENDS_foo = "dbus-x11" keep working till their maintainers get around fixing them. Note that you might need to do a -c cleansstate on dbus first to trigger any errors.

Yes, and isn't that what the RPROVIDES is for?

Ross


