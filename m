Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B326E77DCD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 10:15:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w56AFaa8020147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 6 Jun 2018 11:15:37 +0100
Message-ID: <8ed35481c14f9e1c9d3bd8efa6ad1c89751d6d3e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jun 2018 11:15:36 +0100
In-Reply-To: <20180605165055.19306-1-otavio@ossystems.com.br>
References: <20180605165055.19306-1-otavio@ossystems.com.br>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] mesa: Update 18.0.2 -> 18.1.1
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
X-List-Received-Date: Wed, 06 Jun 2018 10:15:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-06-05 at 13:50 -0300, Otavio Salvador wrote:
> This includes all bugfixes of 18.0.x series and major new
> features. For list of changes check:
> 
> https://www.mesa3d.org/relnotes/18.1.0.html
> https://www.mesa3d.org/relnotes/18.1.1.html
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

This triggered a few failures:

https://autobuilder.yocto.io/builders/nightly-mips-lsb/builds/1037/steps/BuildImages_1/logs/stdio

https://autobuilder.yocto.io/builders/nightly-musl/builds/1074/steps/BuildImages/logs/stdio

https://autobuilder.yocto.io/builders/nightly-wic/builds/1061/steps/BuildImages_3/logs/stdio

Cheers,

Richard

