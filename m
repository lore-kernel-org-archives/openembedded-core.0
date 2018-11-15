Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9433F6C135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 19:41:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAFJexdJ002642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 15 Nov 2018 19:41:00 GMT
Message-ID: <cfa00b9cb9aa1fcbe5525c33b16109f11f9b0db7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 19:40:58 +0000
In-Reply-To: <20181115191442.24106-1-JPEWhacker@gmail.com>
References: <20181115191442.24106-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] classes/testsdk: Split implementation into classes
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
X-List-Received-Date: Thu, 15 Nov 2018 19:41:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-15 at 13:14 -0600, Joshua Watt wrote:
> Splits the SDK test implementation into separate class files. The
> classes that are included are controlled by the variable
> ${TESTSDK_CLASSES}. This allows a SDK machine to change which classes
> are used to implement the test cases.
> 
> [YOCTO #13020]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/testsdk-oecore.bbclass    |  88 +++++++++++
>  meta/classes/testsdk.bbclass           | 202 ++---------------------
> --
>  meta/classes/testsdkext-oecore.bbclass | 107 +++++++++++++
>  3 files changed, 205 insertions(+), 192 deletions(-)
>  create mode 100644 meta/classes/testsdk-oecore.bbclass
>  create mode 100644 meta/classes/testsdkext-oecore.bbclass

Would it make more sense to move some of this code to 'proper' python
library/classes under meta/lib/oe ?

We did this with package_managers and I'd say it probably did improve
things...

We probably don't want/need more bbclass files, particularly when they
just include each other.

Cheers,

Richard


