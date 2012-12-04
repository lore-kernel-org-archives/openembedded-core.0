Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1Tfj9Y-0000iN-79
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 04:26:36 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2080026pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 19:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=7oQ//vYwl+eADJiemO2qIW3bVCktwkZl+AHyU3fSplY=;
	b=m/v+3FLQM1obby1LffvK3qgUwOIEIMJhe/MLVZqCYd9yegydzAqNaOqS9HMU/D6tOn
	XScjDRuiriMnrAnDT9f8WPXODUglyUttuMXZpla7ffFhuUWLTDwazh6Y/JeiZE4G1GzN
	OwmzvgqflDlM6+OkzHFQUppQnr1rmX1oHRW9yrYuG7ISlrtmHt25nC/J0iFn+HbnlCWu
	rWHMDq5KD1qMQHd8YKUX36WXB7nfnoUIlnaSY0rj07OcdZkTbvzwWyMrtC2oX/wVW9QC
	7TSg0nB6KCpE5PYrCxyYcskl3TRFeT7Pk0uVnO9vVmOMiJ5zuflQcZIp8BmpLbWj1ioj
	RTRg==
Received: by 10.68.253.226 with SMTP id ad2mr34774381pbd.38.1354590733438;
	Mon, 03 Dec 2012 19:12:13 -0800 (PST)
Received: from yiqingliang-pc.localnet ([121.237.170.22])
	by mx.google.com with ESMTPS id p10sm9090878pax.27.2012.12.03.19.12.10
	(version=SSLv3 cipher=OTHER); Mon, 03 Dec 2012 19:12:12 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 04 Dec 2012 11:10:55 +0000
Message-ID: <21849320.A8AIqssvdU@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.3 (Linux/3.6.8-1-ARCH; KDE/4.9.3; x86_64; ; )
In-Reply-To: <1354550072.5970.14.camel@ted>
References: <3752816.NQS16Yy7Ff@yiqingliang-pc> <1354550072.5970.14.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: why remove yaffs2?
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
X-List-Received-Date: Tue, 04 Dec 2012 03:26:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

clear, thanks!!!

On Monday, December 03, 2012 03:54:32 PM Richard Purdie wrote:
> On Mon, 2012-12-03 at 14:03 +0000, niqingliang2003@gmail.com wrote:
> > Hi, All:
> > 
> > I have untouched oe for several months, and recently found that yaffs is
> > dropped, and also in official kernel, why?
> 
> We removed it from OE-Core 18 months ago. The code was old, not working
> particularly well and lacking someone to maintain it so it got moved
> out. I'm sure the tools would be accepted into meta-oe if someone
> updated and cleaned up the recipe for it. For OE-Core you'd have to show
> a larger user base than there currently appears to be...
> 
> Cheers,
> 
> Richard


