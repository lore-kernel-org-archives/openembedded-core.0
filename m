Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 164A96B7DE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Dec 2018 11:15:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wB8BFKXZ008226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 8 Dec 2018 11:15:21 GMT
Message-ID: <e0bd92138fc94749aea670bf00d5b5631c893304.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 08 Dec 2018 11:15:20 +0000
In-Reply-To: <20181208102638.44170-1-raj.khem@gmail.com>
References: <20181208102638.44170-1-raj.khem@gmail.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2] mdadm: Drop redundant patches and fix build with clang
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
X-List-Received-Date: Sat, 08 Dec 2018 11:15:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-12-08 at 02:26 -0800, Khem Raj wrote:
> Several patches were being applied unnecessarily, the purpose they
> served at one point has either been fixed differently, or accepted
> upstream.
> 
> Add a new patch to make clang's diagnostics happy
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Sorry, it doesn't build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/71/builds/45/steps/7/logs/step1b

(and several other errors)

Cheers,

Richard


