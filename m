Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0E9AE7FC3E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 09:15:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so1961644wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 01:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=SLjWmJTXgxN0J4149J2zOnFgWVWTu07LXW4YpkirnzI=;
	b=QJVg+fRPsVlmqdD7J0DIcx7pdGhO4AqeMO86zhJ9tRXMBOcj4wOKu/GiblPW1IKg1t
	Qo/R0XKN8EJj2cPwdTJOKWQd2JCIujK2GeCQzxiqxoRjzBGRXVKERMIFXuID5pcpbCM6
	E9YqwdrVy11/wEaCsTbTKX58HDgfdkEeTKsd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=SLjWmJTXgxN0J4149J2zOnFgWVWTu07LXW4YpkirnzI=;
	b=GVgVdyLno5mSg7uzeMMg9XVhKQDxbd8/d8NR05GF/WUVtM+sQVynIfXepyx/wrYq9E
	aCnxgtGUMba8KhPHMaF5pIvS9Q89BTod+Jps0ltg+4Wbz9JECp4uepgDSyD3g0vm3FZp
	uF/JQTXXtyy2j3ReQLyqCWSA7lvmkkfvjVPjz3Hn5GkFz0g/+XT1rtR/ZNCwXHfItlv0
	AUmTQYo/IeKtPer80Q6T2PP7hUyYayMMlvPdzfJGdKcRgeaAM6AjroC2hQyht8ZOa6ye
	G459geDCtecRVPjALeFgG8nzmXnCnBWSpaPIVO44AWZYXIvpnLd/LM4FLRdTKsU9APWH
	QwQA==
X-Gm-Message-State: APjAAAUGG88kYqDLpAxJPOivRqDWmrozIuxNaU2rvBRSpNC5OzxwuVVo
	WuBX9sLOaKZF4q7wwc6GJxBv8vsTIgU=
X-Google-Smtp-Source: APXvYqxXIk0092iOYb2y7PiQYzYQWkaNZzq45vw1V0S/NkrA2hf+XjHwwKs8yiJHQ5A/sescZGegGA==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr3710414wmk.15.1578561332593; 
	Thu, 09 Jan 2020 01:15:32 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id m7sm7500481wrr.40.2020.01.09.01.15.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 01:15:31 -0800 (PST)
Message-ID: <1ff9bc906b285fb4dae3bd47f048f46a0c49b9ac.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Jan 2020 09:15:30 +0000
In-Reply-To: <20200108132759.95603-9-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-9-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 09/28] ltp: update to 20190930
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
X-List-Received-Date: Thu, 09 Jan 2020 09:15:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> Drop a big pile of backports.
> 
> Add a patch to address absent string formatting error.
> 
> Additional fixing of builds with musl.

https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/444
https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/379

Cheers,

Richard


