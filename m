Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id CFF2565CD8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 06:45:42 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so488863wiw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 23:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=dF5vTE4waNCeCDV7s17zEmvavOlDkfVkno+4FcSTCVA=;
	b=EMPIMEfK8ybag8T35DWBMkPRuCulyh/sn0FlF5FWRxCzaZcF45R2eOsjHVL652+FTw
	VT2y809gaY8XcF1CTBQHzanvsjnZbtDHvrhkpg099wpr6L+SaPF8GNtx9yMKe0xzBXc1
	B5WHLQl+SGemZhZnsi8Ka3LKa8sMOwrM2i/1MEosz2b72bra4LrH7AslzCnXfaw+ohDf
	Bs6lEN4Ew7U3LWDICDEN1CFkNKWb3oqceUfgJyJRABWgluj0t/vUZf6UClKxoO6TnKwI
	wRRdPxybK0iCQhQqIud+ylqrsaNe78OTjJov5Y/qORGpGxw/bYxl7/n3zTirn21Frnue
	+VWQ==
X-Gm-Message-State: ALoCoQmN31XNHYdpMm8kv/DSYSkLVGzKKr2HBBA3njQo5OfQEYRWZIBpp/Hx177V9wqsY2OQ/W3Q
X-Received: by 10.194.77.212 with SMTP id u20mr1056707wjw.27.1407480342855;
	Thu, 07 Aug 2014 23:45:42 -0700 (PDT)
Received: from ?IPv6:2001:610:612::ac99:cd44:c629:56a6?
	([2001:610:612:0:ac99:cd44:c629:56a6])
	by mx.google.com with ESMTPSA id w6sm15112450wjq.39.2014.08.07.23.45.41
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Aug 2014 23:45:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1407197771-18736-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
Date: Fri, 8 Aug 2014 08:45:39 +0200
Message-Id: <7B384873-F81D-4BBA-8566-48F7AFF7D817@dominion.thruhere.net>
References: <1407197771-18736-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: Matt Fleming <matt.fleming@intel.com>,
	"Glenn P. Williamson" <glenn.p.williamson@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kexec-tools: Create separate package for vmcore-dmesg
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
X-List-Received-Date: Fri, 08 Aug 2014 06:45:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 aug. 2014, om 02:16 heeft Ricardo Neri =
<ricardo.neri-calderon@linux.intel.com> het volgende geschreven:

> The kexec-tools recipe already specifies separate packages for kexec =
and
> kdump. Thus, it follows that a separate package can also be used to =
install
> vmcore-dmesg granularly.

This breaks the upgrade patch sinds ${PN} is now an empty package. =
Please inspect buildhistory after changes to packaging. I'm sending a =
patch to fix this and actually improve the situation a bit.=

