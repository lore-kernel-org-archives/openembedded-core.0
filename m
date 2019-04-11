Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id BDCAD7D316
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 13:54:35 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id s15so7451338wra.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4WG+c+EBLfmd23O0GH+uLUtJrSg3MbJZFAcCUCZsl/M=;
	b=VWwHhrCqnvrIgMcOv9P6AjRfjLTAFkPzMJKExacsdWBwMccmwdkDww3/05IcV1cts8
	Fh5C6yz5JN2giT0w3FjVzNbzuySUpQe9BlkFL6Wrfb945SyQ+9/kgh5VLJmx5IVNTDr9
	goQ9LbpZydAos5hFJmPWZI8koJ/gVfiRk3Ik4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4WG+c+EBLfmd23O0GH+uLUtJrSg3MbJZFAcCUCZsl/M=;
	b=ZM6JuMfSP+j7FAHbVg8WuJNIp74OZdmAJdJtqx5AcyAmghAQGtCYVde2MJfeoms2xx
	RUUg9V0wkbw4dXA+N9QqpAelHo4ipqebjcJVLjOFrl6L6hIfMbjwZ5TgNOUIN0nVZiZU
	isnj6I+9mDe3EoV7Iu/TQIC6J0VF0Y8CueWl3sPe2nD9IeQOHrhSnBaBxZ2xq/SAjmF/
	r6qqDa7nRsxN+YnEEcyF0QWp8jje+PwBLOqiNfvAZB8VWzenUBMkY9w9twEBO5kTCZT7
	w8GRPjmmK7zXMomH2/iGzJb9PLMVzMt2qBggha8irDLTPJPGwuiSf7pWtAtmRKY/0kgb
	LVmQ==
X-Gm-Message-State: APjAAAU/XXnC2HPgghywdNcYyQbt+XreX1qpmcMqcBKDV6GNOd5nUFI8
	q+8k2J77bEK+X9vBzXY7ebSZ6w==
X-Google-Smtp-Source: APXvYqzkOJpr1sA0vErWoMu1mLifGiP2ocACls0nfECAya1en54VNH3wxXSW+kiZyY0MDX3LF5DCPQ==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr15687950wrq.200.1554990876440; 
	Thu, 11 Apr 2019 06:54:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i17sm38591394wrs.44.2019.04.11.06.54.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Apr 2019 06:54:35 -0700 (PDT)
Message-ID: <cbc8f5019376c70c1d5ba123279b7904a0ca151e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Apr 2019 14:54:34 +0100
In-Reply-To: <CANNYZj9UUBV1=RWTpwco1wGqctacKrPNRkjMCB-naCWAMUJW=w@mail.gmail.com>
References: <1554995545-20943-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj_rYwg3Y5uDxKiwzJZrzMsmjLCNXOU2TMpgmB5Ydgt2sw@mail.gmail.com>
	<60b0b95f4227efd2be7ac7908b92aa08243de396.camel@linuxfoundation.org>
	<CANNYZj9UUBV1=RWTpwco1wGqctacKrPNRkjMCB-naCWAMUJW=w@mail.gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf: Enable nativesdk
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
X-List-Received-Date: Thu, 11 Apr 2019 13:54:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-11 at 14:16 +0200, Alexander Kanavin wrote:
> Presumably to be able to put dnf into SDKs?

nativesdk-dnf would depend on nativesdk-python3-core, not python3-core
though?

nativesdk-dnf doesn't run target packages?

Cheers,

Richard


