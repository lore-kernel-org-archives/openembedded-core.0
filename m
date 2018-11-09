Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0452D6C1DF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 10:30:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v18-v6so1326281wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 02:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8a4awSRzFDQ5Vy1VXuC2ajyySFHAGh3XPA2ydGYPrd0=;
	b=MIVSaYRlNRFZ9DJlOF7/eBhIxM361ryu1/wzoTtlfwixAp6WjLbxJ2XbY2xdHpIyB9
	UGj4K3UWYOQKteH4MBJBRwn8eR7W3HWN1ZcTB9m2jO6+c7LiUZmyxh8MY84UaLwWhARx
	t6Ttj6gdgtCVSJ+AvMGeIZRULY4rBg27Td0mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8a4awSRzFDQ5Vy1VXuC2ajyySFHAGh3XPA2ydGYPrd0=;
	b=HM3D/CdD4h+Xed5OX97YK7fHiU2fv94CSeSCx2NXUwwpFheYXPPD+ghexRBb+2HJkl
	r8yG8P6Efib314IgNvDl0vOqZFeXU/nAxlE90Ag2MMLMqFxubieFKDyTt3Wn4oZI+nY3
	UsLwyDExI0di2dUeoueV4MxQHYqwC8mZ99YDMBn6IPZgLAIkrmbtV3H6j1GHvavmmEjB
	CFzhi/ibyHCvUZrn7jao9cEexagpCapGr+Q7UPdwgr/AC6TFQlg7c+rC1vzSLCaTo6A8
	7wHd2W0WQdGh9J0vVWOTkdcXNMi0aJFxX1vQcR/E6/D+HvyDofELaqQw2cpAAuNH7lOS
	EfHg==
X-Gm-Message-State: AGRZ1gIXci7pfM4HG897aplHoNJzx9ajttGTAHEWtduuMryGX0kLznsj
	1h3RuYp2KjwS58r4mjsoSgEBag==
X-Google-Smtp-Source: AJdET5ep1kRlQ5EoGJEHctNkyzHd8Ho50bAiQnSknJNN4ESfml6dIKbjD7foWPF/axibvrt9ooancg==
X-Received: by 2002:adf:df0a:: with SMTP id
	y10-v6mr7023009wrl.127.1541759436325; 
	Fri, 09 Nov 2018 02:30:36 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y64-v6sm1033185wmy.35.2018.11.09.02.30.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Nov 2018 02:30:35 -0800 (PST)
Message-ID: <f04feafb7ce74b451ee4e514e0331642c3fc12ac.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 09 Nov 2018 10:30:34 +0000
In-Reply-To: <cb45fc25b42e280523a2a8c0173dd7b494cb4635.1541754618.git.hongxu.jia@windriver.com>
References: <cover.1541754618.git.hongxu.jia@windriver.com>
	<cb45fc25b42e280523a2a8c0173dd7b494cb4635.1541754618.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] libjitterentropy: add 2.1.2
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
X-List-Received-Date: Fri, 09 Nov 2018 10:30:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-11-09 at 17:12 +0800, Hongxu Jia wrote:
> From the following kernel commit we know: Fedora has integrated the
> jitter
> entropy daemon to work around slow boot problems, especially on VM's
> that
> don't support virtio-rng
> 
> 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=81e69df38e2911b642ec121dec319fad2a4782f3
> 
> Do the same thing for Yocto.
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

I'm not convinced this is going to help. The userspace support comes up
quite late and the kernel blocking has already happened before that
point when I last saw these issues. This was why I just enabled the
virtio rng passthrough everywhere...

Is libjitterentropy actually helping your use cases?

Cheers,

Richard


