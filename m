Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U256q-0004Dk-Mx
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Feb 2013 20:20:15 +0100
Received: from mail-we0-f200.google.com ([74.125.82.200])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 03 Feb 2013 11:04:23 -0800
Received: by mail-we0-f200.google.com with SMTP id d7so6289112wer.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Feb 2013 11:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=WJ6FeSNrfjJUGUEgTwwzdonOFb46HHrXo9CJddT7dnk=;
	b=SFdfIpEpFQhfu+FEkvKzc4R4tzBV6Nrou5yBAKDbhaODkwgzGvQp/p54XMBSDKiBWn
	JNO9zodurprjjJGK95XkfBEjJtvHc+Tgz4iQAECqfWiEF0tAMmFt7WWsqJMGG/2z3XmB
	GkLS921hn5urRS4CslMdTpbBtf7XqN6U+a13s9H8gTDBMudR7twtewMZAd7K2WOGs/Gu
	oK+bO0+U3pw11WwUU0oWvegL3Q/yHofkWHeP49hTw204JsQClkhQcJRZKb8NFs17EsoH
	pMMv7NJwAtL7DGdYmXd63vJ+Q1Gf2q2dllDlaX6a+u9VKwg/m4PEEW+bOjoXgxeRTDDM
	pzhQ==
X-Received: by 10.180.85.103 with SMTP id g7mr6736018wiz.29.1359918261683;
	Sun, 03 Feb 2013 11:04:21 -0800 (PST)
X-Received: by 10.180.85.103 with SMTP id g7mr6736003wiz.29.1359918261451;
	Sun, 03 Feb 2013 11:04:21 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id df2sm15979694wib.0.2013.02.03.11.04.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 03 Feb 2013 11:04:20 -0800 (PST)
Date: Sun, 3 Feb 2013 19:04:18 +0000
From: Ross Burton <ross.burton@intel.com>
To: Ian Geiser <igeiser@devonit.com>
Message-ID: <50E181AF64EF4AF9835BF9FD769D9B93@intel.com>
In-Reply-To: <B57A220D1EE1644685BA9AD5C790D20526BE045F3A@SOUTHSIDE.devonintlgroup.com>
References: <B57A220D1EE1644685BA9AD5C790D20526BE045F3A@SOUTHSIDE.devonintlgroup.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQniGE75EY/7XBin8XS+rWBHcrmtsNWo07pR6yBOlP5OAYvV/GDcmI6i8vi7HhnNqiko34TxnDj9S2bkW3IrQw7lexj/AGkfvRAjXiIoVMB6eFZq3u2CYNarmhyG7/bMdEgou0sIyDZUOOKPxKrHFxaotrWncawLUJFHMrXSubxNmAhyeEKlKnGxEE/y/+YjfBOFWsEh
Cc: "=?utf-8?Q?openembedded-core=40lists.openembedded.org?="
	<openembedded-core@lists.openembedded.org>
Subject: Re: OpenGL as a DISTRO_FEATURE
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
X-List-Received-Date: Sun, 03 Feb 2013 19:20:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday, 3 February 2013 at 17:15, Ian Geiser wrote:
> Greetings, I maintain 3 different platforms with varying degrees of GL support. Would it make more sense to migrate the "opengl" distro feature to MACHINE_FEATURES? This way we could compensate for the platforms that use Mesa and the ones that use their custom implementations? Thoughts?

Even if there were machine features, a distro feature is still something you'd want.

There's been the idea of having fine-grained machine features for the aspects of OpenGL that the hardware supports (gl, gles, egl, etc).  It's not as simple as it appears and causes a rather large number of packages to become machine-specific.

What would you use the machine features for?  Conditionally compiling support for a particular variant of GL into packages that cannot be detected at runtime, or something else?

Ross


