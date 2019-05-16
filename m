Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id DCE2F6C132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 19:29:12 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 15so545120wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 12:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=OzLwSuY99I8xvt+rHiRLgs+xklfZj/KidzVF/Q4D0sM=;
	b=CSRsm7nsCCp5C/6e7txu0SWsbKzX/KwlGlpDYmVo7gM1X0O8wWnohuwGcC0X85vcLI
	jJmHQkesp4/8jjEXpkns+B9vJAtJakgj5x07RlnI04pWBc3hxFhTUI5W4elC/CrnGn8c
	ytHM6WVuqByEZVyLKAdgxDAJsPsJRtzFRvEEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OzLwSuY99I8xvt+rHiRLgs+xklfZj/KidzVF/Q4D0sM=;
	b=X6EyEG0Q1F/OgoH+k+FPSvbVgOoqfWhBSwOwhMOxcnlrgArJJ2lYSEkAuIrOZX7qgd
	lDhwulsZnDS1df/gJSdWXwW0qzr0ZyrAISXoCqTP6r/OOGmcv9U1EfcCc5ZKz/j4fW/C
	85IIkUndShmk8CRo4jXL/pSuAoToPe7SBOt5o4/UNJnJ0vRZxFIH11LfQ18HvWdyeu68
	YB1jbah1Gu1y5P6sCaO/ElvcBdK/yCI3rlPtY6JwqsmeTMS5UaFDXT47MWcqs8zC13EC
	Ifwxs9ulzIP5ExE8q1e4S10FK6/f97LfrhsQUg+HVs+y9RMdFraZ8KXynylygq2UqblS
	rfmA==
X-Gm-Message-State: APjAAAX8nhwRvAua2c06qX8VIzTuLVt6nKYD14Fx3Gh8EHMyU4d045hg
	yxLqSnX3975Hn6y0muwgSyauJA==
X-Google-Smtp-Source: APXvYqxSTOXxvhpLkUMV3YNq0VxmNWcbGEosaYUNTmy9nRmTPhvjX2sLTrc8P56VaP1gBgu/Lz0Q9w==
X-Received: by 2002:a7b:c053:: with SMTP id u19mr27591529wmc.63.1558034953597; 
	Thu, 16 May 2019 12:29:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j46sm11732574wre.54.2019.05.16.12.29.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 12:29:13 -0700 (PDT)
Message-ID: <6e9630df6d8d4bd8f436526f440cf5f2f107bb31.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 20:29:11 +0100
In-Reply-To: <1557969749-80524-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1557969749-80524-1-git-send-email-ee.peng.yeoh@intel.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2 v2] oeqa/runtime/cases/rpm.py: Enable rpm install dependency testing
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
X-List-Received-Date: Thu, 16 May 2019 19:29:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-16 at 09:22 +0800, Yeoh Ee Peng wrote:
> Convert manual testcase bsps-hw.bsps-hw.rpm_-
> __install_dependency_package
> from oeqa/manual/bsp-hw.json to runtime automated test.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/runtime/cases/rpm.py | 30
> ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Much better, only one failure this time in multilib:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/612

Cheers,

Richard


