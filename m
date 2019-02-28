Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4AF7CB35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:34:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n2so21961708wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=QUKdFrW8H2tqX8MZLDROPFYDr9SjDsYBZI6vkrryuC4=;
	b=d0WwtbYicqhIb9Pk4weBUjLFJu7R8dh39ZFSH6rWFhxZNnjMcPD2GFr1HCCpjBv3SJ
	qT64se/5qsAZjo34xJPgJU+BYf51c5xSqsm+pIgk6i/odppjEnzsq7CJES9mJg0/eLT4
	HgIms/GB/I5/WZC2IeYEWtWoXt4l0JUpHDi4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=QUKdFrW8H2tqX8MZLDROPFYDr9SjDsYBZI6vkrryuC4=;
	b=UxVYGyi2aQF/dgFg22LQ9v1HY/i8a/Kn1Ztuzzj/Cq4ECMw5aYPGkHceOnG3h8XJdB
	DipuK+yVyUnSFVgA8Hfj/UEaKQH28AJUUym9fBu4zb79V4B3xyOC/DJ10p54q3s1YXsC
	OjIhunddNcasMDIYcThZDpdpkXNmbw6aIwwy6ZL6JOTlDOlCWbyBU+9UsbjeNxUWWJah
	IterujdagkTNIBETiHvpFvmWfyH/sqo9pHbx8fg2XnVpmQ9Qd2eBQaAA1CtZRNq4NV1V
	gz4GoOvq3utfdc9Y6Ay6Oew16xXEAAOz1QTZzZtZg5wGoG82KbzeLOE68hgd4gBDkrMj
	t6Sg==
X-Gm-Message-State: APjAAAXdOvxTpYazufbcbIz1OLEkkg/8bLfNOEmdO11AhYjsrCIqmDhY
	qx723jY4B6HLItJFvhUH3FEY7Q==
X-Google-Smtp-Source: APXvYqz/rM4Ptu2r5FRudiwRbtQIX7XNrTJYnoiXUv6oaQ7RyyId22WF1Gf/eS2Avgc+77sYAWo7Yw==
X-Received: by 2002:adf:90af:: with SMTP id i44mr6260818wri.222.1551360869568; 
	Thu, 28 Feb 2019 05:34:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f4sm18468836wrx.68.2019.02.28.05.34.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 28 Feb 2019 05:34:28 -0800 (PST)
Message-ID: <36b91e378815475d7a1a68789c9b461db31d4df6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 13:34:27 +0000
In-Reply-To: <5C774072.6070202@windriver.com>
References: <1551149425-254169-1-git-send-email-mingli.yu@windriver.com>
	<5C774072.6070202@windriver.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH] libdazzle: add check for GTK3DISTROFEATURES
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
X-List-Received-Date: Thu, 28 Feb 2019 13:34:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-28 at 09:59 +0800, Yu, Mingli wrote:
> Ping.

You sent this less than 48 hours after sending the original patch.
Please have a little more patience!

Cheers,

Richard


