Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2rri-0006IO-8d
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 00:23:51 +0100
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 05 Feb 2013 15:07:58 -0800
Received: by mail-we0-f197.google.com with SMTP id t44so739827wey.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 15:07:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=IYtVqAgE353Glqxu4Qoq58nMdiW8qZwr89k0KYmwfa0=;
	b=Q4Hk4vcsJcS7NgjucvmT908iqJCQvFexh6XXJft1Bm/zUQRzPMG4DIygV35cRVJuGE
	QtdT1GD/BMybPki2WBCQ44s67viOGGsTv/AiVyuHrtQ7gPIVAaW2bJRBd6DvbKF9+xUJ
	3+hYMohQDTeeE+mcbi/lPXDUk0k4pOM8QY69mbVg6clRphN59VvJOSQOZJjfd4b/N7XB
	zSCMPJqSCyX2kzk/7hwbFTqsEn52HZ0iQUnYt8kn8ZISLs5y2NdCQ0OoFPc3qoB1ynAv
	tL5dOtPivTV9OuXD8DaYgNcwbQZ3nheactl3g1y52Oy2Tsf1x7txFUykIDSMwEX0w5Hc
	Lgtg==
X-Received: by 10.180.72.232 with SMTP id g8mr1254510wiv.0.1360105671694;
	Tue, 05 Feb 2013 15:07:51 -0800 (PST)
X-Received: by 10.180.72.232 with SMTP id g8mr1254502wiv.0.1360105671600;
	Tue, 05 Feb 2013 15:07:51 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s8sm1651753wif.9.2013.02.05.15.07.50
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 15:07:50 -0800 (PST)
Date: Tue, 5 Feb 2013 23:07:47 +0000
From: Ross Burton <ross.burton@intel.com>
To: Jeremy Stashluk <stashluk@gmail.com>
Message-ID: <8E0A609A69BF4E0F9804778EC81CFC12@intel.com>
In-Reply-To: <1360097938-31967-1-git-send-email-jstashluk@dekaresearch.com>
References: <1360097938-31967-1-git-send-email-jstashluk@dekaresearch.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmqCYM4DO306hkNKAMBdhGbB3XDjp90cvseTe840W9+A9Q9sOH/fEBMtA3RJqIF3IlEXbNEdCRL6sJ2uPIo4LhV2DYzOrU6szvTsxtTekoClVYJ8i2umSdJPiXOfhXoFs0KdFORlFbV9ENQoqkc0N1+BPkQNnamHWZcnU3jIjjZDVCVt8zWxq1FIeTzmkNrOOJPzm1t
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5] gst-plugins-gl: add package recipe
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
X-List-Received-Date: Tue, 05 Feb 2013 23:23:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Jeremy,

On Tuesday, 5 February 2013 at 20:58, Jeremy Stashluk wrote: 
> +Index: gst-plugins-gl-0.10.3/gst-libs/gst/gl/gstgldisplay.c

This patch needs a description saying what it does and why, and Upstream-Status and Signed-off-by lines.

https://wiki.yoctoproject.org/wiki/Contribution_Guidelines (https://wiki.yoctoproject.org/wiki/Contribution_Guidelines#Patch_Header_Recommendations) and in particular https://wiki.yoctoproject.org/wiki/Contribution_Guidelines#Patch_Header_Recommendations covers this well.

Ross


