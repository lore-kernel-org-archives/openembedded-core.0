Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ACD6D607E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 12:36:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9ACa0VQ008049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 10 Oct 2018 13:36:01 +0100
Message-ID: <222d0fe27ce0839f25a69d8f13d1f99462e15d99.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pascal Bach <pascal.bach@siemens.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 13:36:00 +0100
In-Reply-To: <20181010081035.10735-1-pascal.bach@siemens.com>
References: <20181010081035.10735-1-pascal.bach@siemens.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCHv3 1/4] cmake.bbclass: use CMAKE_SYSTEM_LIBRARY_PATH instead of CMAKE_LIBRARY_PATH
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
X-List-Received-Date: Wed, 10 Oct 2018 12:36:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-10 at 10:10 +0200, Pascal Bach wrote:
> CMAKE_LIBRARY_PATH is intended to be set by projects.
> CMAKE_SYSTEM_LIBRARY_PATH is better suited to be used in a toolchain
> file.
> 
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta/classes/cmake.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I have a feeling something in this series may have caused:

https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/42753/raw

but haven't bisected to confirm it is the cmake changes yet (it is from
something in master-next).

Cheers,

Richard


