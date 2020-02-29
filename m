Return-Path: <petr.vorel@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id CBDB261A4D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 16:53:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e10so5720089wrr.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 08:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to;
	bh=/ett7UFWCezcOWed2Kg9upq+Tsm3oknB/GZs9c2EtCY=;
	b=EQNEQjidjWCaiby6LLk8FimMnqlxwuKB/y+ajYBkXd4QDVmFPtvajthhdjVuBlTBYc
	6QGgfPiukU6X+KNKowSS+kbuUhsqea13XZlbd3NEdMRubqwvruoQFcrY8VQiKG0HaID9
	zpEWBUtc1U0kg0nwxKazH3YJQ3PISbpzCrr+MK/7yvuOKKvPGXleacd9fwvzdyg3CY0b
	ffLFpP6/Fj9jSFriHu0FrESc92RmiwVaBxcXkprAuwp1rPRZKt2KXczIDrZhpvCUQOfH
	1//aZ2LSUsbWmW7xGJ7Oci8qsk9eGSDK0o9CmMt5kGfbxdNr1myspTDCMDVowzi4X01V
	Jw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to;
	bh=/ett7UFWCezcOWed2Kg9upq+Tsm3oknB/GZs9c2EtCY=;
	b=YaaYN/rDmBiaX+MeuYQQ8sCoelqklxBzr/qcKhOoBtUKv9VvLB/vuX/+oJy/4hkTKj
	//Vy/vcXWskCV5bep+KShM8fMj27l/GSUJxjBF6+zrkjSn9I1uQVGJd9In1+eEDBKSNt
	jo7A3X4/qR+L8/GWJL2S/WwoKABWiLrLc20WmQ6JRWqT0ju7xpPsienv2a4p5uR9i5EF
	5NUxRDpbbgV1atipGWOap/5HctYKv4480L5xepWw0eKkZAP3DHlKJbh8PYAQ+Klt7KIz
	SD17qV9zTsz3DXIAmeV3p4lxYww5mBbpRPdH5c+V9S11A0ksunJKsxP07krO87WZcO6O
	9Bqg==
X-Gm-Message-State: APjAAAXN1hRXBp0PP76WJzQg4OdbgX6pDeaWSDa0cplh7tlsIjSSgQ3U
	XZWg4xqp+cd+nzKyzVTHYc0=
X-Google-Smtp-Source: APXvYqykvkALf4f4XNu95OdTa5GwlCfLSW3oeQmMezeJiKcAPIhB5VcQjgmonLXvgWGTeGaFHQqBUw==
X-Received: by 2002:adf:90ee:: with SMTP id
	i101mr11104075wri.417.1582995225630; 
	Sat, 29 Feb 2020 08:53:45 -0800 (PST)
Received: from x230 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	q16sm1228840wrj.73.2020.02.29.08.53.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 08:53:44 -0800 (PST)
Date: Sat, 29 Feb 2020 17:53:43 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <20200229165343.GA832653@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20200229150036.1900777-1-raj.khem@gmail.com>
	<c9d181ea-ebc6-1183-73dc-461f601c2799@intel.com>
MIME-Version: 1.0
In-Reply-To: <c9d181ea-ebc6-1183-73dc-461f601c2799@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v6 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 16:53:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem, Anuj,

> > * 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
> > IMHO this one shouldn't be needed not, but CI still fails without it
Khem, thanks for fixing it! It'd take me long time.

> Is this patch still needed after the change in v6?
I've sent v7 where I removed it. It actually wasn't used, because although I put
the file itself back in v5 (+ it was in v6 from Khem), it wasn't actually listed
in SRC_URI, so I expect it wasn't used.

Kind regards,
Petr

