Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.4274.1585051373747441171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 05:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=fKgw1Cud;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=etaf=5j=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48mqd54V3Yz4J;
	Tue, 24 Mar 2020 13:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585051370;
	bh=xzWEQbmYkmLv1mX6ZHE+9hq5fe6AZ2sT6klh7uNboEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKgw1Cudm4E95vdNMR0a56da/k1dO0VuN0RBrCz1WtvxVjJ9IWNv7RCyckkH/t0vo
	 HtJzPDQgIxHB0f9bX+PZbP+uP7s2M1+DXlUZcJVrQ1sDqK1dymHxfFX+W+cNftQtWR
	 uV3TED0e7mVX3rYs3OFpzP+2O8XqGZIpRdqeKUPbz5TntO2BmRZebRicI2H0EG3ZQ3
	 rGtv4jcjMToP5WKy5HpY/ioM52/rztbWyCPWPyqvlN4wbm54knmeBvVNkUDmLrWuIt
	 Il5GBL4fRAAxfOHbpVodhciuF7jN68jUvnB8ybP/T+RHrKSmZej5wLMh2l8J4RsE0U
	 9Yn2FFQG4mPT65tpzAiuBH4JlBNfTQ4eWMjBCAbfagvLAAVMurqrAhmxUOr5gqq0bB
	 MlVFAYalexXfY8++7Owkd38biVfvEOKsw29R8ou+o3Rtg8hJrUc7z0M6xqRGtxjpjI
	 LitDPNPJ/+iKxMH3g+AqHokY24/WxfosfECV4jr2aV5EclPwTKZcEcsWW8GLKvsEaE
	 NZF8jOvZpPzUIc8UM75dhfNH9Fgu/ggOiQGfB8nzfeSwlZjSQx808gjYphwPjwTEjz
	 FA8qPNq4fvYDgDeGHqBnPGLjGNA80DBsW3Ar+Lr90J4u1GxoPfk2HYz3eebmEwzqaS
	 +3igj8kf5jGNNUjtGl3oc1HE=
Date: Tue, 24 Mar 2020 14:02:47 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lto.inc: Add global LTO distro policy file
Message-ID: <20200324120247.GA15317@localhost>
References: <20200323232529.3658577-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200323232529.3658577-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 23, 2020 at 04:25:29PM -0700, Khem Raj wrote:
> Distros which want to enable LTO can utilize this file, it only covers
> packages from OE-Core, other layers should include there own exclusion
> list for recipe which dont work with LTO
>...

More and more upstreams already default to LTO in their build system.

What is the recommended way to get the correct configure options to 
disable LTO in all such recipes?

The option is obviously recipe-specific, but there has to be some
global define the recipe can check for disable/default/enable.

cu
Adrian
