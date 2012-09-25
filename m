Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGVO0-0001Yy-FO
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 15:41:16 +0200
Received: by eeit10 with SMTP id t10so1725100eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 06:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6x8xF/HYIgWjTPsTT8nyNXNmDAIEbiqbQ75hU8QdOKQ=;
	b=h4tCWdpRFPNvX9IUuN5Tw05IHVRMNqKm1adm/M5MqnM8iITbGmxxVRmRi6GJStedGY
	kzqOaj9JPWm3C+YXVEPPygZAuRyUBBsdqKTQtAq6zwYD2O7yLfuzbFSKTzaei7x5EPrT
	3ug/73pwllvUjK99HX+sjcMLmORJk9EV6eRbxiBLAXDH/GENfbG3J0XB8YCPfVDA6Gge
	qmz4xKOKgemJBED2hv0aILxib2LRhFBtPOw8WbSBHnFBvEUG7cSp9lF7VUCwIL5sqH4w
	jBfF3nfe1PCrbK7TnGCEsDX5IbWpl9SWd9QN6qpWl+LePDsROOA9os6rf66ysXa0zRmi
	ECdQ==
Received: by 10.14.218.134 with SMTP id k6mr20077647eep.14.1348579707323; Tue,
	25 Sep 2012 06:28:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Tue, 25 Sep 2012 06:27:57 -0700 (PDT)
In-Reply-To: <1348560878.8662.29.camel@ted>
References: <1348530910-9917-1-git-send-email-raj.khem@gmail.com>
	<1348560878.8662.29.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Sep 2012 06:27:57 -0700
Message-ID: <CAMKF1srWM46Jofrjd8xxX22waY1b7O3a0Nwr-Av+B_mid9fSfw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] jpeg-native: Do not use libtool-cross for native recipe
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
X-List-Received-Date: Tue, 25 Sep 2012 13:41:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 25, 2012 at 1:14 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This wallpapers over cracks. Why is libtool-native/libtool-cross broken?
> Shouldn't we fix whatever is breaking libtool?
>

it is not broken. But we were ending up using cross-libtool for native
recipe that does not seem right.


