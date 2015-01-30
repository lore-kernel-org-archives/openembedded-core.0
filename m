Return-Path: <walt@giroir.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id D368C606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 13:57:50 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id va2so23875590obc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 05:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:content-transfer-encoding
	:subject:message-id:date:to:mime-version;
	bh=oauktXDAhnKlGMdirNOeXQXzHBheCJj+kM+8dk1x2Kw=;
	b=cpKOZuIFiyQmlVREdJaRyRyO69jRAru0nx2JuYVEAsjQWDJQIU/t2LF7h4Y8YMV4Yk
	sz+I/p+9FwqgLcpRel2ldQK6mRWD2fMYO3adlUuCKBb3XQp29Bzi6vO27HPi+k6SnRNl
	sKI1XPU5+kCckwM61tzRKx3fMKA61H6ECfCk7i+RezsewF6CGPfKSmOn9lg7UsVzbRqc
	9eVI/k+REQItxwoGu6Ped8U3DIZUkhi+j+YwPAOWncoWwbGr9Jze5B1Mz1MHZ+Y2Z1Fa
	0ayod6GdNhuzlznDXbh7qDIGejEYpZ0XOuLIFBL1sl3upSvMT8/Z4WaoTY7nO7y1tkM3
	7/Mg==
X-Gm-Message-State: ALoCoQnDHDXDiyJxWsh7Jdne8c2qesA2DJiCNTAP9RzCWWYF25eNso/9FTl28ix0Xb1ePBMsIfFu
X-Received: by 10.60.73.103 with SMTP id k7mr3757441oev.38.1422626271197;
	Fri, 30 Jan 2015 05:57:51 -0800 (PST)
Received: from [10.10.102.130] (168-215-245-19.static.twtelecom.net.
	[168.215.245.19])
	by mx.google.com with ESMTPSA id i7sm2127650oej.9.2015.01.30.05.57.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 30 Jan 2015 05:57:50 -0800 (PST)
From: Walter Giroir <walt@giroir.com>
Message-Id: <78ABB290-AC92-4AEB-B096-EB3D3A1A9BAB@giroir.com>
Date: Fri, 30 Jan 2015 07:57:48 -0600
To: openembedded-core@lists.openembedded.org
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
X-Mailer: Apple Mail (2.2070.6)
Subject: Changes to Image Definitions in 1.7.1
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
X-List-Received-Date: Fri, 30 Jan 2015 13:57:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


I am in the process of moving from Yocto 1.5.1 to 1.7.1.

Overall the process has gone very smooth but I have one blocking issue.

I have a layer with an Image defined in =
new_layer/classes/new_image.bblcass

When running with 1.5.1, it works fine.
When running with 1.7.1, it does not even parse the file

Has anyone encountered this or is there a description of the changes in =
this area.

Thanks in advance,
=E2=80=94Walt


