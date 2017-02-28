Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3878672FDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:56:36 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id j18so13378993ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9FO7LwPDlaA+30W72SKkHXWMvenXKMKt9LFKxHODsjw=;
	b=ON2cHQjObV8sJV5VTVeV53g7LINdQrG9zzVotWE3gSjx+8ZJVrGtrURn8Z3PzUuGgd
	3uN/xVtSojU7r6eMuV1BolWp2k4xt4UnZAXvxNKHuGWsjXAsAlCHO+13XiW+Xmi3E9Au
	8QCdQFZGTlQTRrVlIasKJup74PUHcRIzxrJxSBMiNyliuzx2YOPr/C5YVKiC/ECctpT1
	G6EzVOirZESPgTh2Y327G4drXd8uPN96LYHnwdeNqQxtvkXQ7Z603Jfu6e6BTlSB0eha
	v7iQnM9fgIsWaPZy8xMdhUa1i/R146BdoWzrEdNajTfcckrHXqyRjNV/3ft90fyQRESa
	RPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9FO7LwPDlaA+30W72SKkHXWMvenXKMKt9LFKxHODsjw=;
	b=MLPGjDedVXVclsFIEiL5MEKDHjXC/lz+HRZXQIvgHGcFwW3bdtm9qc6Ww4tHlhOQIz
	jgtFtgdhpATfjLMZwwbfFrIrRVO7ATpzl0iRy0AkQyuvtNWbYRTJ9ikAyuAl03IWzFo+
	S7RO1Wln/G74V+xIVncdfXfOlTNeD2fxtdkuaVleKrVNCFvGohgRGjpZ6RInVqfgccEM
	bfd09SbrNkDo7VNMQcniIWWEHAhmmvX1/DqjL2oxz1v8mPhAKEDfqEoREM3JdLuMFg2a
	4IylPuZmPjxLjKUcIdR2pzshB8bPIyuU1+QA5+Xk1ZHCKWEdDA394d6ops/ZgPumGWMn
	cRUg==
X-Gm-Message-State: AMke39nmoIHS0GkCFX11zv36m81Ft8yEq/1dhmZdEeG/YkzfJqi5z6JUK1zE0uDvSCvAsA==
X-Received: by 10.107.128.169 with SMTP id k41mr3968463ioi.59.1488300997932;
	Tue, 28 Feb 2017 08:56:37 -0800 (PST)
Received: from linux-uys3 ([45.72.250.10]) by smtp.gmail.com with ESMTPSA id
	t18sm5797679itb.30.2017.02.28.08.56.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 08:56:37 -0800 (PST)
Date: Tue, 28 Feb 2017 11:56:35 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170228165635.GA16277@linux-uys3>
References: <20170228045004.GA5913@linux-uys3>
MIME-Version: 1.0
In-Reply-To: <20170228045004.GA5913@linux-uys3>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: npm thoughts
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
X-List-Received-Date: Tue, 28 Feb 2017 16:56:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

My first thought is that "devtool add ..." shouldn't act differently depending
on whether it is pointed at a checkout of the code or whether it is pointed at
the code's npm repository.

