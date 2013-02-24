Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U9ZKq-0001vn-KI
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Feb 2013 12:01:46 +0100
Received: by mail-wg0-f52.google.com with SMTP id 12so1606519wgh.31
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2013 02:45:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:date:from:to:message-id:in-reply-to:references:subject
	:x-mailer:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=yGwle4C2bvXs1WR7mlRsDB/C7fI4IUyjiJXA+rsZOzA=;
	b=pUWM4DyPvrqhGSYLlwZNj/n4/brD2+/4YU4hOjhycDFLymyWPE7hM9AmDoPcO03G4l
	Y2h5Uv8+zAlUtkMQoB6ll6ypoi1zLaV3XqiXicRLv+EluYCbfUCXfY/3tZhZzJWgqjZP
	Eh21Op85bRI5FWok/nr7QQQkXaweQzZ7UYahx3gJekbInvLai2LJ/hwggMCwIN9cZE+m
	u9goK5+OGjOHACBnFOPcz3HsTTlWf0WL0Ha3ulmODxv0UlGDIvan9WAgUrL7wDAagmOY
	46dWX2riprPheQlI08RZ0aoBoyNVuAsg83PkVUCJP9ET4WP1S5j84CfrXF7EuB+g2u67
	vgww==
X-Received: by 10.194.239.202 with SMTP id vu10mr12789346wjc.49.1361702720698; 
	Sun, 24 Feb 2013 02:45:20 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ex1sm9220057wib.7.2013.02.24.02.45.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 24 Feb 2013 02:45:19 -0800 (PST)
Date: Sun, 24 Feb 2013 10:45:18 +0000
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <8F5B35F84EED4266938D882953E70D9F@intel.com>
In-Reply-To: <E79C80CE9122499B9C7D2D855CDF6319@intel.com>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
	<E79C80CE9122499B9C7D2D855CDF6319@intel.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQl1LdaB5mI3Fu3Rh+O9nKALtLzH8ZMSz+Tuzn5IDM76rE6octeWkjOcKR0DyA/jyFUqx8B2
Subject: Re: RFE: make the init manager an image feature (again)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Feb 2013 11:01:50 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday, 24 February 2013 at 10:37, Ross Burton wrote:
> Here's the fun bit - we can't have two builds of udev in the same distro, and that's what could happen, so I think we'll need to cut down to one udev instead of two.

Ignore this, we can continue to key off the systemd distro feature to pick between udev and systemd as the source for udevd. 

Ross


