Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1THqxr-0006By-4j
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Sep 2012 08:55:51 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2012 23:42:50 -0700
Received: by wibhj13 with SMTP id hj13so514259wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 23:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=ReqrpDM0agDdveLK1DNyH+tPwq4HhEALm0QHew9vSUo=;
	b=G3qINylQ6Qytw8kRlxkS6sItiHkM3tduxDApAPAjvXCilDqg++d0uH8fA5Sd+OwVeH
	ruWtVukcvyIhnHZ0SlPoYDQfyGZqR0f5RRP2PYGMWeCs3gKHqidREWCvL5zjKkYkwJDw
	i7rs25Pi3Y1n192cosJcvmzvPHE25aKItb7YiTq/8dEqzvmugcw0z5C0xAWFZDRT3csh
	8yrPSutHD1Q1MKmQ2BiRgM8NG2dAiVLjq0Hv4HmktyF1MkNG29mYNaFKwj6gk8SzTX7N
	ccALmKWPqryQTj/qZShjxKjMX6gDiZDRtqbkK2leDwhxzj3D/I/cGT4JWLpbYIsI3fzu
	0LAA==
Received: by 10.180.105.6 with SMTP id gi6mr2246226wib.4.1348900967944;
	Fri, 28 Sep 2012 23:42:47 -0700 (PDT)
Received: from [192.168.1.7] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id v3sm3249038wiw.7.2012.09.28.23.42.45
	(version=SSLv3 cipher=OTHER); Fri, 28 Sep 2012 23:42:47 -0700 (PDT)
Date: Sat, 29 Sep 2012 07:42:48 +0100
From: Ross Burton <ross.burton@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <E64B7127595B4AD8AA31B5C8C0FED741@intel.com>
In-Reply-To: <1348867217.15753.81.camel@ted>
References: <1347373349.2122.35.camel@ted>
	<1348679272.32611.4.camel@phil-desktop> <1348838588.15753.52.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A6B7ED0@039-SN1MPN1-001.039d.mgd.msft.net>
	<1348867217.15753.81.camel@ted>
X-Mailer: sparrow 1.6.3 (build 1172)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnSX47/161OzXnH6MNyJqNNymzaICo5/NLk7HrSxKAhGjRz0MQFZlswAS+k09b8f1MOetzA
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Phil Blundell <philb@gnu.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a clean of ${B} when reconfiguring (and ${S} != ${B})
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
X-List-Received-Date: Sat, 29 Sep 2012 06:55:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday, 28 September 2012 at 22:20, Richard Purdie wrote:
> Totally unrelated, likely a transient race we're meant to have fixed but
> don't seem to have done so :/
> 
> The supposed fix was:
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a92ff3ad4212f8966bbd3f6defcb112737d81cda

FWIW, I saw this yesterday too. :/

Ross 




