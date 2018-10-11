Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 289D879B17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 22:15:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9BMFI9a021395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 11 Oct 2018 23:15:20 +0100
Message-ID: <3e9d30caac8e6139484154abf783bbc38dd2289b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 23:15:18 +0100
In-Reply-To: <1539252978-415942-1-git-send-email-changqing.li@windriver.com>
References: <1539252978-415942-1-git-send-email-changqing.li@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH V2] e2fsprogs: fix test f_detect_junk print error msg
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
X-List-Received-Date: Thu, 11 Oct 2018 22:15:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-11 at 18:16 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> 1. This test need to check config.h, so install it
> 
> 2. Test script have problem when the file want to grep
> don't exist, change the check command to fix this problem
> 
> even we install the config.h,  but the script use relative path,
> and will find the config.h decide by in which folder you run
> the test scirpt. like below 2 cases, if without the fix of
> check command, it will also met error msg in case (b). But, with
> the fix, the problem can be fixed
> 
> a) root@qemux86-64:/usr/lib/e2fsprogs/ptest/test# ./test_one
> ./f_detect_junk
> f_detect_junk: detect non-fs file data: ok
> 
> b) root@qemux86-64:/usr/lib/e2fsprogs/ptest# ./test/test_one
> ./test/f_detect_junk
> grep: ../lib/config.h: No such file or directory
> ./test/f_detect_junk/script: line 3: [: : integer expression expected
> f_detect_junk: detect non-fs file data: ok
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

If you've fixed 1) then we don't need to carry the patch for 2)? 

Perhaps it should be sent upstream as an improvement to their code? I'm
not sure I agree with the Upstream-Status. 

Regardless, I don't want to add a patch which we don't really need
though...

Cheers,

Richard


