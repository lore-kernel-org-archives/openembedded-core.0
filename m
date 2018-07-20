Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7E545745C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 08:24:48 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6K8OkY6000894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 20 Jul 2018 09:24:47 +0100
Message-ID: <6ed21283e73910b31f4b0ed59aecae2613f63813.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Otavio Salvador
	<otavio@ossystems.com.br>
Date: Fri, 20 Jul 2018 09:24:46 +0100
In-Reply-To: <CA+chaQf6dci=B5GZ=u9ij0hPF6p4QtBuJm2U=ByT-X_29hiqQA@mail.gmail.com>
References: <20180521215050.30322-1-otavio@ossystems.com.br>
	<CA+chaQdrQKjrLbMwwkNx-dEtO+zQzQHB7D=+-w6P=AobKK2iYg@mail.gmail.com>
	<CA+chaQf6dci=B5GZ=u9ij0hPF6p4QtBuJm2U=ByT-X_29hiqQA@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linux-firmware: upgrade to 8fc2d4e5 revision
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
X-List-Received-Date: Fri, 20 Jul 2018 08:24:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-07-20 at 08:54 +0200, Martin Jansa wrote:
> This happened again when this commit was backported to sumo
> yesterday, so now newer revision of oe-core sumo needs additional fix
> for meta-raspberrypi:
> https://github.com/agherzan/meta-raspberrypi/pull/291
> this is quite unfortunate, so I'm going to send LIC_FILES_CHKSUM
> addition to oe-core recipe before this spreads even more.

I think adding that to oe-core would be a good solution, thanks!

Cheers,

Richard

