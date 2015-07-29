Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id E09647597C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:40:34 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so5458637pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=RSOn/eOA4Bkww74HrAB8dzC/AvYKvO5XI8UI6suzIns=;
	b=nNOj/Gse4Yvw2Y0PqYiSewLqLi6R4I2cNvbPCwLqMFdDbfYS0WHXPgh/oOUc9nggAp
	fCiddtRe8eJQ+ovpClIyiwrlbEoJyhpVsm1Zb+7+Yyowm811HSj0MPatSG4saxqj/58z
	RH9zkiHZownXpLawR5H0xgZpoFdd2PjV/4WS7fiKtuGsorAmoxgzAVjpFUd57cAkow+V
	eazJUWnSBbi0RSwKGhFDXqUn1OmvirB6WGt43OJozCCtMEIZb5wsCMgNNsilhEVmxPCz
	F8VSFKieYORxA9vnMctCb3bob/uTgezhueeq9FY5qJc/+v3l2sqmdTJDi4l65hySffsI
	nHFA==
X-Gm-Message-State: ALoCoQmqDJqW0UxmX/IS41VWt3mxhnPqoyPXxfCvYLcPOYNRuBRJQxqTQR4UQO6F4W0W01tKyEeG
X-Received: by 10.70.98.200 with SMTP id ek8mr93182313pdb.95.1438173634117;
	Wed, 29 Jul 2015 05:40:34 -0700 (PDT)
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com.
	[209.85.220.54]) by smtp.gmail.com with ESMTPSA id
	bu10sm40888108pac.36.2015.07.29.05.40.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 05:40:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padck2 with SMTP id ck2so5301520pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:40:31 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.67.5.2 with SMTP id ci2mr92271157pad.97.1438173631601; Wed,
	29 Jul 2015 05:40:31 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 05:40:31 -0700 (PDT)
In-Reply-To: <1438194339-13618-2-git-send-email-b54851@freescale.com>
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
	<1438194339-13618-2-git-send-email-b54851@freescale.com>
Date: Wed, 29 Jul 2015 09:40:31 -0300
Message-ID: <CAP9ODKo5A0+TF4kb3ine6Fpi7CA0EDuCh2x6iEEiy0iqRHOJHw@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v4 1/5] gstreamer1.0-plugins-base: Bug fix for id3demux issue
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
X-List-Received-Date: Wed, 29 Jul 2015 12:40:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 3:25 PM, Yuqing Zhu <b54851@freescale.com> wrote:
> Use g_utf16_to_utf8() instead of g_convert to fix the issue that
> id3 tags utf16 charaters cannot be extreacted in id3demux when try
> to get the id3v2 tag such as TIT2, TALB etc.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

