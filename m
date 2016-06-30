Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6C28860797
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 23:03:07 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id bz2so32449494pad.1
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 16:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=JdyA5e9e8cGPSPva1gKfq9rs7DpFmLWV//og5oxYWKM=;
	b=WOO8wEwo2MAl3Rjc0JR7Ax3WHFP+Un2BoM99L5DOwsnEdqlGUF2EYIYgGILC5Djc4y
	sfhOkONj6yTOwjhpjqzPyNJJfDLuMO89jESah3yVM0f4yAIXg0evQ6nLYBoQOlU3Egz8
	LmD7+IiYU2FzNaIZm9inUEqezL3jOtpp5MCXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=JdyA5e9e8cGPSPva1gKfq9rs7DpFmLWV//og5oxYWKM=;
	b=E12IIGyzqzgJtE0+1YT/BhGdyw9ZtbKjWjIwLDtG7M2IIv0KKI3W3MddZcosieyEiU
	oPYff0eVu6xQvDVnqg8m3Fhz9hVXHXmjdf7ELv/dL2CoKZ+PGfazrWEuu9Yp7FuAcIvL
	YwPVsM9qXQCayJXgIn0IjDWyGLd4hC2cK9D15L6rl1M6PMgEI40IkzI47ki/T3xb0Vzh
	uQbcn3eW4NS/jv8I+3KrnemlQHZ4UCfwm5AdKK3/vr7ZIPMdhmFCwxcWP109/fzy+uOc
	Tio7rER5dyQgX50YJv65igF2N3KRif8wPqBfX/naxN27ludmgCmjAhuqCjDPJM3nKMvf
	UVKw==
X-Gm-Message-State: ALyK8tLEBubRhmbKJIcibw4MbAxoxBeU0QbczK6oGqnAluq20LCInZdkW+c/RQS1NdpbUyMY
X-Received: by 10.66.234.65 with SMTP id uc1mr25495792pac.81.1467327788549;
	Thu, 30 Jun 2016 16:03:08 -0700 (PDT)
Received: from yct-desktop.lan ([2001:470:b:16e:222:4dff:fe50:c906])
	by smtp.gmail.com with ESMTPSA id s12sm168716pfj.57.2016.06.30.16.03.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jun 2016 16:03:07 -0700 (PDT)
To: bitbake-devel@lists.openembedded.org,
	Openembedded-core@lists.openembedded.org,
	Openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
From: Michael Halstead <mhalstead@linuxfoundation.org>
Message-ID: <ae4e2654-ca20-85d1-d53b-b0b05ab25a26@linuxfoundation.org>
Date: Thu, 30 Jun 2016 16:03:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
Subject: Patchwork upgrade tonight
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
X-List-Received-Date: Thu, 30 Jun 2016 23:03:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

After 2 weeks of testing and some performance tuning we are going to
proceed with the Patchwork upgrade. Data entered into the current
version in the next few hours may need to be re-entered after the upgrade.

All features of the current Patchwork install work in the new version.
So while there are still issues surrounding detection of patch series
there are no known regressions. Series detection can be addressed after
the upgrade.

The rollback plan can be executed very quickly if needed.

Please reach out if you have concerns.

-- 
Michael Halstead
Linux Foundation / SysAdmin

