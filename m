Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1870F6EE34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 16:15:08 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k4so22445730qaq.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:15:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-type;
	bh=CEdb5XSQXPnAxKtTFgxFPiDaF6844HwPU+Rwtyg3y14=;
	b=PPNNorl3AKMyKIt+d3T4UvMnGNcf9BtOSlKwosBFr956Fj7UATB2teDsh+Zqz2uMfY
	nLYvq8OH5jwihf5HdQxW8B92d4i9AQnsXrHegXiIpdergdAKPWP/1EGIFiYPXA0aLu28
	6xD334VknEjDH9ETIFXp84/gEJ3XzFm5S8JffxK76/U4rC6DrgIoRbPmK/F4mGXLuH6k
	LI0MkwarV1pZ6g1aipfNwvrbkn2X3H1+TPqEBtdSVYAY4o3w1vOPntgFdOahcGJ34o+u
	DY+f1UVzdUFuObmPKLshzl4LAVQy1VV7UdMe7akGw+RQuA049FnuWLMdyB5oTzDMIgJA
	+PSw==
X-Gm-Message-State: ALoCoQmfgdkgg8FtDynbJ2MygnxUeJrv29GBlaEbLmbzJrjL+ccd+GRl3AIU90yVwSCz1IX+KEGQ
X-Received: by 10.140.106.225 with SMTP id e88mr33509535qgf.66.1392653708911; 
	Mon, 17 Feb 2014 08:15:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 17 Feb 2014 08:14:48 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Feb 2014 16:14:48 +0000
Message-ID: <CAJTo0LYip7WYGCqepC9ooxD=ZosM2_BSO1jCO73AwbXXUTA7Yw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: [dora] grub: move xz to DEPENDS list from RDEPENDS
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
X-List-Received-Date: Mon, 17 Feb 2014 16:15:08 -0000
Content-Type: text/plain; charset=UTF-8

Hi Robert,

Can you backport this commit from master to Dora:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit?id=d9da9cb7b345ef7ea732264bde8096a0d113f405

Just had to debug a session for someone who was hit by this.

Ross

