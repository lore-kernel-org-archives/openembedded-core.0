Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id D241772E57
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:16:15 +0000 (UTC)
Received: by pdbni2 with SMTP id ni2so65053720pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=fxLzglCvXlsEAqsXsb3nrp6LQKqmjBPKZi2FVk3xCls=;
	b=Y2qfvqN6fmXHeAFmzfaHCn0d1kDCsnqrT18iW4LpzRRg3EjjK88fPAXuJlen2+2teb
	7T8bzsy/+a68b0yjxHSxFMBC3Uw5TcfwwYORoQ5wVQ3NFnx05Wq0CKH2P7xpRIt+pH6j
	uzsiu6dXJolQmVkdS0Tj2gNDHiJW5xYFNO1+rBE4Qnxm3u+OzlRJjejN7V9sjlOwyavc
	/0uaapeKvKZM9zF7wCm8Ovvr775M9cAVNBTzpwzF+YbSo0JSICQMuJZS/Tn/9WT7KvAh
	Qm9yWJ8XMB75oMLEOJcUD7PYnx5li5eyWgFp1yswWUEHX1tVj1C3vPOHF9iUWGpotZ5T
	oFGQ==
X-Received: by 10.70.45.227 with SMTP id q3mr105741143pdm.22.1426742177258;
	Wed, 18 Mar 2015 22:16:17 -0700 (PDT)
Received: from apollo.localnet ([2601:9:3580:84c:c8b9:695e:11a6:752a])
	by mx.google.com with ESMTPSA id nj5sm559939pdb.35.2015.03.18.22.16.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Mar 2015 22:16:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 22:16:15 -0700
Message-ID: <1677684.fR5X4LUuld@apollo>
Organization: HIMVIS LLC
User-Agent: KMail/4.14.6 (Linux/3.19.0-9-generic; KDE/4.14.6; x86_64; ; )
In-Reply-To: <7a6e7530acddd570b395ca2f3eedd473db7cec8a.1426733823.git.Qi.Chen@windriver.com>
References: <cover.1426733823.git.Qi.Chen@windriver.com>
	<7a6e7530acddd570b395ca2f3eedd473db7cec8a.1426733823.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2 5/5] glibc-collateral.inc: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 19 Mar 2015 05:16:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, March 19, 2015 10:59:17 AM Chen Qi wrote:
> +LIC_FILES_CHKSUM =
> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6\
> +                    file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218
> 675ffea8be556788b780"


why not access the file from glibc sources 

