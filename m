Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 966FD754C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:19:23 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5JDJLMb007482
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 19 Jun 2018 14:19:22 +0100
Message-ID: <4c21ecd57addad5079dcace30c316cfa5aa844be.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>
Date: Tue, 19 Jun 2018 14:19:21 +0100
In-Reply-To: <CAJO0J4hDdQbK_2jzo_ehd0so1SjWnq2RgT5ESdg7JAfAc8Pvew@mail.gmail.com>
References: <20180619114512.11699-1-richard.purdie@linuxfoundation.org>
	<20180619114512.11699-3-richard.purdie@linuxfoundation.org>
	<CAJO0J4hDdQbK_2jzo_ehd0so1SjWnq2RgT5ESdg7JAfAc8Pvew@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] image/testimage: Rework auto image test execution
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
X-List-Received-Date: Tue, 19 Jun 2018 13:19:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-06-19 at 15:06 +0200, Paulo Neves wrote:
> I also would like to discuss the possibility of testing u-boot in a
> virtual machine. I have a setup where I am able to pass to qemu,
> u-boot.bin as a bios file, and then I am able to boot from tftp
> enabled qemu network device. This allows for unification of test
> setup
> of virtualized and real target booting. Do you have any integration
> like this in the plans?

We'd take patches expanding something like the qemuarm machine to do
this assuming the testing costs aren't too high resource wise.

Cheers,

Richard

