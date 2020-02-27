Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8893661894
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:14:24 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id i10so6942840wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 15:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=jT7i+i8HrALZFaaIGxS8O0KidsfU98eRQ5NIzDhOyXg=;
	b=Mb+LWib1CpCWG++sKvzlcCk3Yet5Kl8a/PK7rCqhbAVrgfRo3Y/luNilNqyvLxrjD3
	qawLShfyLGEk4KGYqo6iTphDMkbLxBVRhVqx6mXhjls/hxmmoE5JSGU2gsJ1P/ltGFWj
	Vw2Rw8Ns1OYv20he3hVuILU/1HTZkqAD4uqjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jT7i+i8HrALZFaaIGxS8O0KidsfU98eRQ5NIzDhOyXg=;
	b=P6nDa1KSICOmi7c/hD5Xx5EzJR5uqlSax1UNzXlje7dxq+hTHKsmlKw9ilD+Ol2DGl
	PRG3/2zQeXC39QbHdBDtnJtbTRNlQqfiVj8K0LQRotPj5KG1fIYIBUHnI0mMsRRfOJtX
	LEpCQIknDpG15gfUrVzvis/uiSU0b/3X5293+FfB9kz8CmEG9mqS7PTN3Qrb0jW/Li41
	A7WWEzYdrFAzv7yUtE+7PL4Em2XFBWmZOLNy1xItDXPKJeE6kNIPga+IZdSUTgQNQRk7
	AQeHaDPx19dh5TOREjVilkmvVFr8V09OJ7pstrIHhayttnwLhIxCk2cU/TSLbai7RdgK
	MLsw==
X-Gm-Message-State: APjAAAVjETrPZ48TZA2WKRo/gmcSK7euDCA/qDHEII3lUDw9/6qlDgiQ
	ADHMprhCnrZOAipmBbltJGgLhQ==
X-Google-Smtp-Source: APXvYqwf/02gVvB1cm7xTlnqlwGvSPzg1i4IoNiJ/68t/hN9gTz+fb1F/eQGard5x4U6nDj3Hzb5/A==
X-Received: by 2002:a1c:7919:: with SMTP id l25mr1031194wme.135.1582845265094; 
	Thu, 27 Feb 2020 15:14:25 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o27sm10088220wro.27.2020.02.27.15.14.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 15:14:24 -0800 (PST)
Message-ID: <2fd5b0c062bfee215cd7a4d15789a20293cee8aa.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 23:14:23 +0000
In-Reply-To: <d3d3f4a4-e792-397c-4444-c39630afaf74@windriver.com>
References: <20200226183902.3616626-1-trevor.gamblin@windriver.com>
	<d3d3f4a4-e792-397c-4444-c39630afaf74@windriver.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH] libgpg-error: upgrade 1.36 -> 1.37
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
X-List-Received-Date: Thu, 27 Feb 2020 23:14:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-27 at 11:24 -0500, Trevor Gamblin wrote:
> Looks like I got beat by a day!

Does your version work on x32 though? :)

We need one that does...

Cheers,

Richard


