Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 814236C110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:25:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAJEPqOs007893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 19 Nov 2018 14:25:53 GMT
Message-ID: <895f07363a38c1be4c3d584547fffe6e8bc7b0a3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 14:25:52 +0000
In-Reply-To: <20181118191914.14495-1-JPEWhacker@gmail.com>
References: <20181115191442.24106-1-JPEWhacker@gmail.com>
	<20181118191914.14495-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] classes/testsdk: Split implementation into classes
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
X-List-Received-Date: Mon, 19 Nov 2018 14:25:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks for reworking this, it does look a lot better and should stop
some of the bbclass proliferation we're seeing.

I assume all the code was functionally unchanged in the move?

On Sun, 2018-11-18 at 13:19 -0600, Joshua Watt wrote:
>  python () {
> -    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False"):
> -        bb.build.addtask("testsdk", None, "do_populate_sdk", d)
> -        bb.build.addtask("testsdkext", None, "do_populate_sdk_ext", d)
> +    auto = oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False")
> +    bb.build.addtask("testsdk", None, ("", "do_populate_sdk")[auto], d)
> +    bb.build.addtask("testsdkext", None, ("", "do_populate_sdk_ext")[auto], d)
>  }

This doesn't look like an improvement to code readability? :)

Cheers,

Richard




