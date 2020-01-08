Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD3AD7FA47
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 14:47:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c9so3641815wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 06:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=oSFDO1RlekySRZZnDd8z/vu6acVYN+29u+uCnjWcpj8=;
	b=Pq9X+zaljEYbGEwOc5q59KAT+Fsx5xfP9fx8nk1VhoupXK0hOem0gOeUUpFzlM1WPs
	lITt85eAptWQSieWdkFQkIbEOriz2zwx/udOOFjlM5k1IBfmkJo2jRkXhPOt7O1jAgt+
	GJvo9Bc+m64nsaolYuVL8D8Vi2rYstQMRh3hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=oSFDO1RlekySRZZnDd8z/vu6acVYN+29u+uCnjWcpj8=;
	b=RsphCGWVJlywXSaw7ZrtmLoEAbkNlDz+pRC1jdWtPErFtVSr9JCYVI5f8USC0IG6ek
	WAMLIsOAEaTQLtmWmAtT+ZxxUx9tLyuxbmaFIlmNrQXWq0uikroXO1spbTA+YlJ18R8b
	aKEoTJ0n5d/8EbcVOqSU0rkI2lRAvqMl/eDUHSs+B8hHAvrn+aoxDQ5iiAkycWF7TKWF
	9unoRl6QRaEYIikV2lvv8BYvyncUfditBANaN7yYUzkI0r2Ie8dLiK08+tHUit7Mb7Sh
	nXuygrmNg6j7WtXO2SjsxTWAooocpQ60+njPxk7JrCEJWmn7PM2pPhbrEs2jmELLv6X3
	YM/g==
X-Gm-Message-State: APjAAAUpoWlzaq7cYDY9CGS5agBBoSS63sctL4JjCFdMA5aHx2WDod4p
	CCHgtwOHnMrgczW2tLQA1x05Yg==
X-Google-Smtp-Source: APXvYqxzWvv1j122UH7tzRRbCX+sMpuu4soo7eK9PkDx1U/n55Mn5UYNoHdgNx0JVKrJOfUdVu4iDQ==
X-Received: by 2002:adf:bc4f:: with SMTP id a15mr5038207wrh.160.1578494848486; 
	Wed, 08 Jan 2020 06:47:28 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f1sm4817216wrp.93.2020.01.08.06.47.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 06:47:27 -0800 (PST)
Message-ID: <0fa2ddf5f8c860dd796addeaa3252db8dc009373.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yi Zhao <yi.zhao@windriver.com>
Date: Wed, 08 Jan 2020 14:47:26 +0000
In-Reply-To: <CANNYZj90XtZ2Oi2q1u0UU9Z=+o711YQ2T0=URCxK_MdwsT_4RA@mail.gmail.com>
References: <20200108065117.4556-1-yi.zhao@windriver.com>
	<CANNYZj90XtZ2Oi2q1u0UU9Z=+o711YQ2T0=URCxK_MdwsT_4RA@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] maintainers.inc: cleanup entries
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
X-List-Received-Date: Wed, 08 Jan 2020 14:47:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-08 at 12:17 +0100, Alexander Kanavin wrote:
> Just a note: there is an oe-selftest for this which you can use to
> verify that all recipes still have a maintainer listed:
> 
> oe-selftest -r distrodata.Distrodata.test_maintainers

Perhaps we should extend it to check for recipes which have a
maintainer but no recipe? :)

Cheers,

Richard


