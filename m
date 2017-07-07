Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 63FED77D48
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 10:47:40 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v67AlCPT020138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Jul 2017 11:47:13 +0100
Message-ID: <1499424432.30311.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matthew McClintock <msm-oss@mcclintock.net>
Date: Fri, 07 Jul 2017 11:47:12 +0100
In-Reply-To: <20170706182313.18992-1-msm-oss@mcclintock.net>
References: <20170706182313.18992-1-msm-oss@mcclintock.net>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 07 Jul 2017 11:47:13 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] u-boot: add workaround patch for missing python dev
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
X-List-Received-Date: Fri, 07 Jul 2017 10:47:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-07-06 at 13:23 -0500, Matthew McClintock wrote:
> Per the comments in the included patch:
> 
> tools: disable _libfdt.so (swig present, python-dev missing breakage)
> 
>  This is probing for tools and enabling if swig is found, however Python
>  libraries might be absent per the comment. This is just a host tool so
>  let's just disable it entirely for the now.

Can we ever find this given swig isn't in HOSTTOOLS with RSS? Do we
just need this on pre-pyro?

I don't really want to carry an non-upstreamable patch if we don't need
it.

Cheers,

Richard

