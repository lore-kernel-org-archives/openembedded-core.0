Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2rik-00068N-1L
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 00:14:37 +0100
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 05 Feb 2013 14:58:40 -0800
Received: by mail-ea0-f197.google.com with SMTP id j13so731118eaa.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 14:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=gx3Y5GtlpVKH4LziJC3AMmwrR3mnJw7jLh8QYhYT7qs=;
	b=bjn97R1MCe7Qk5o3IFjZRKwHTpCyuN30ygD5EFcS2AZpINWCJPDXCVEdhIaCoLUADg
	GHZKL7apwFSoRvMspsBSmBzJtA7mRcshd/Wd70n5efU4UmtZEHgyLOca4zVPpxI3F4R8
	nnmYlWHh471igNu77xuAHu09LCmSr+SATm3KSXzEk6r+aGowe87L6fdlXxaeqoCIiMwn
	yTN9KHPFTZRRi+RCkMJYpyBYp5cmPhKWISWBXzNkqzHYKnlDbpID3LDzziFOnSDbDVYy
	JONahBbfgd/M4xu8D4O8TnDPCL0pHdYbNwIfeZqmTWxLrXaAmx+uW09g/1MFnAYSDl2L
	JUUQ==
X-Received: by 10.180.85.97 with SMTP id g1mr1206142wiz.29.1360105114913;
	Tue, 05 Feb 2013 14:58:34 -0800 (PST)
X-Received: by 10.180.85.97 with SMTP id g1mr1206127wiz.29.1360105114778;
	Tue, 05 Feb 2013 14:58:34 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id m6sm30874645wic.2.2013.02.05.14.58.32
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 14:58:33 -0800 (PST)
Date: Tue, 5 Feb 2013 22:58:29 +0000
From: Ross Burton <ross.burton@intel.com>
To: Felipe Ferreri Tonello <eu@felipetonello.com>
Message-ID: <0CB2DDB0E2D34358AAD3481B8F78E9F1@intel.com>
In-Reply-To: <511182A9.2060702@felipetonello.com>
References: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
	<51115E97.1080404@linux.intel.com> <511182A9.2060702@felipetonello.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlOrGZtShZqMD/hRj2rHJwyGzR8Ei0/smmwZhl/VXkVNB4SKr7FRHGew4D3pu3p6KKj3+8uOeN3+iz0hcq8KXPtD76COiZPe4xpGOqRe5x6y+Lspt79qraZ0QP1jGqpG18WLB2CF47DZopVbLsrxwAiMdOZpblTKBcv8FJGIBe2yNInCzaRX9fY7uUYckcz3hFHcLAE
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Tue, 05 Feb 2013 23:14:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday, 5 February 2013 at 22:07, Felipe Ferreri Tonello wrote:
> I chose this path because there is also a front-end library for connman
> for gnome in the same directory.

It's not a library, it's a UI.  To be honest, I'd happily see it move to recipes-gnome and connman-qt be in recipes-qt.

Ross 




