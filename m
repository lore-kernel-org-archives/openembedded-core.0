Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 811A460107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 14:54:53 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id zm5so22473750pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=tt/1VrqRxS0AAd5W4iPavK6Miio+hGtcPBgFh5mTdZU=;
	b=i2FZMT67bbR1jBlYTBqFudWVwmLIQSGjNYD1Igw24ueAmlFnWD9Z2Voa31OwEn4DvF
	50Wazc5MZxs+S4AbrNcE1yfzHmdqFIhGYyN+XY2oziJf9uG3y5UVEH+RalaMk3PbjvRw
	Bd9U/77JGVMFU6hrpg73Eif8E6ATcoFVfRkWtfoB9TLNObbUcgcCTd78dO05Aeb6LcIj
	G1h1Br0/lT4UdL2rlCbawu0QDmGLfzhc98w6/OXay5M1StXVUp4ZrgeDbU3oGVhHgJQ7
	MBvU5mmQR14Odl8DVggYsKKshz81xSsHJfWNspYZL6CAllTrhNm+ckYt+Yby7uObn1Wr
	yAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=tt/1VrqRxS0AAd5W4iPavK6Miio+hGtcPBgFh5mTdZU=;
	b=UodrGD9BonhdTLHWE/IED7PwcYFTdqb/v/sqVhhSYbP2uUxWMYPUrRWddYMUEuGqZD
	0d97r5ECqjHCklOyFArs33XnuY9r2FE2JjSnUDrpPCkyDKa3jS+lVEMkLG6njcCgNkO5
	uOnfGmlZlPs6fU+VSKran9z63RZFLW5X936bcsjVehhJ3T8ERzqvof2GFA9FUocRLjvI
	VttdGmEIBQTcCLFhWw3qsX0335MP/v1wO4PLqP8N8PLgjUCXkHfOpFLmCoY0aBDS1k13
	DnI68xCHXOsDt4bVEtMiJ4AmZcc311JkxBrlLktcy9ojq151RQnInS4AFke0BCj9Rh+z
	ZwKA==
X-Gm-Message-State: AOPr4FVu1hOXZ8IQAfptBBE9iqH/lCbB7gaIzzl7XTVIsV3NE1cyt/eBNxd6v7H5reGvTA==
X-Received: by 10.66.171.75 with SMTP id as11mr12573171pac.36.1461768894094;
	Wed, 27 Apr 2016 07:54:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:c5c3:5d7a:4a1a:74b0?
	([2601:202:4000:1239:c5c3:5d7a:4a1a:74b0])
	by smtp.googlemail.com with ESMTPSA id
	fn3sm7472524pab.20.2016.04.27.07.54.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Apr 2016 07:54:53 -0700 (PDT)
To: OE-core <openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5720D2B3.2000506@gmail.com>
Date: Wed, 27 Apr 2016 07:54:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: Staging Security fixes for Jethro and Fido
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
X-List-Received-Date: Wed, 27 Apr 2016 14:54:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


I am integrating security fixes for both Jethro and Fido in my
poky-contrib branches for those who may want to cherry-pick them before
I submit pull requests. I am still working on a few more.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akuster/jethro_cve_fixes


http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akuster/fido_cve_fixes

- Armin

