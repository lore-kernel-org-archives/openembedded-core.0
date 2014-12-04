Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id BA71160670
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 14:03:51 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id hl2so18675411igb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 06:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=0lCp51UCqjL5ny46YoUsCg55c139vkegf7mhWxKqcJE=;
	b=mXlu00Vnx3tYbZag+HE5aMCLFeQzOkspX0Y3rX9AHVn7q0OK1wKiAcNHEBcHVCneqt
	cGCJsYXf+KHyNhQTGuZfw1Jeo54TJjCuItdosSk+Z3EfM9be8dz2R8NjliU5pFUMpbcX
	nE6RApTFcvctzXR/MK+XUxxBQHOchLpP2RCtuGuscmOmYdLqCg0uZrDagXf5hwMpkn5n
	vXL1X0M3I1aT40h8eBpCJjkBKXoClfahJFx2M8zrtkE9Q5T03hylAYJ9y3Xt+Hv6rzUn
	aNQ8pSfBypLvTdCatpQNFOOH3OiH02QlCTdAdTuDs/+osSu1pCC0Fm3tL2Bpf3Ogqo3t
	C2CA==
X-Gm-Message-State: ALoCoQnGQ6pGCD/lW5ZnHl6oCEpge8Q+URpvd9tCc89lBnu6fJ1BL7V8IbA0nXqj0vnlVFt72OHw
X-Received: by 10.107.164.75 with SMTP id n72mr10022392ioe.17.1417701831923;
	Thu, 04 Dec 2014 06:03:51 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id 39sm11258347ioi.7.2014.12.04.06.03.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 06:03:51 -0800 (PST)
Message-ID: <548069B9.6020303@linaro.org>
Date: Thu, 04 Dec 2014 09:03:37 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<11435118.DSGP9nSeOe@peggleto-mobl5.ger.corp.intel.com>
	<547D41C7.5020303@linaro.org>
	<2036260.XzzDUvKe82@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2036260.XzzDUvKe82@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Thu, 04 Dec 2014 14:03:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Paul,

Are you making these changes on the existing contrib/paule/devtool or
somewhere else?

A small nit I stumbled on recently... many layers contain a
"recipes-devtools" directory, and I'm thinking that using the same word
for this feature might get confusing (?). Maybe it would be best to
replace "devtool(s)" with "workflow(s)"?

Best regards,
    Trevor

