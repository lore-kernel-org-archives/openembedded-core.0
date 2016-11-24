Return-Path: <umut@tezduyar.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 361476067D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 11:07:37 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id c21so69214973ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 03:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tezduyar-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=aXH+JWdvlDIkfxnucIT3JdVKfxcghvp7wNmnTKAigk4=;
	b=hmnIFQSUBXhFtcrO/x8u1G8TQynJiN8eQ8zN9W+LLlZPylBhdaUyQOXOQ/BClZuWlc
	ezaOhJoRW1jbv3gLDveE1i2x+CKhEsoK+3H/JAXcwkP4b+KYYSAGScCcHa/6TuFaAagg
	XIioGP/i+daAdku8N9s6Xqw2xNO6d1pz3xs6jRkeF349WjZDnEVjSRCCgzU1Vh1Fsyh2
	vjPeZFthXlMMz9zZA1GC91oA8PNF13230uYY3NsAEYTAVPlrkxrDo6jhRLq/vdfyzr5q
	V9GAbWtsp/HC1ZmOTue3fgsk5N3+Csml93y492ZL+Ss0R+JYLpWcEJhslANBQhrbuBFB
	jr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=aXH+JWdvlDIkfxnucIT3JdVKfxcghvp7wNmnTKAigk4=;
	b=EYARNAFPMJ9M3svBR7yylyZkp/Aupm/+CS2RI+2xHt7QaY19Cfk8fv3gnvdTLp8+zJ
	ZBUrLwOFf6kPxESRsf1ybDvaM0UvH4vZCbUMN5r9N/agttDdY8NU4n00ks3yGCEWMfsq
	77ectPSD7ZpkwrEiQkwm5fnObbFAozH+FFVfJvNp1tFA9MqjiZF/XfAzaU/leBTnvCYj
	yalDG49qZTyltX56C/KmH1kg27tDPYI1tePtNsyjGGe8mDnaX3s3/OdDwH+4rqwpaCf1
	da2Jwk+BRaNoxQIWizQN+VfYW9chruoK2acM9bqBf0PD14xnpDKD2P0tjnMwF2+FMyqC
	Ikew==
X-Gm-Message-State: AKaTC00p0gGzWWbVwO8m2iEmX6975abUx2eRABlfR3s5p+6Ut+3nn2Aay2TBUt/7MA/QoDW4MZO57Zx2Z3t5Pw==
X-Received: by 10.107.30.69 with SMTP id e66mr1422763ioe.62.1479985659040;
	Thu, 24 Nov 2016 03:07:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.187.225 with HTTP; Thu, 24 Nov 2016 03:07:08 -0800 (PST)
From: Umut Tezduyar Lindskog <umut@tezduyar.com>
Date: Thu, 24 Nov 2016 12:07:08 +0100
Message-ID: <CAFKnvs7vCQnU2=Qq9QNraoCoh7uCGO=whqDgjL6as4SKaohRzQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: file paths in the production code
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
X-List-Received-Date: Thu, 24 Nov 2016 11:07:38 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

Some open source softwares are one way or another including the file
paths in the binaries which reside in non debug sectors. They won't
get stripped out and shipped in the production code. It is quite a
waste when the storage is scarce.

Do you guys handle this problem?

Umut

