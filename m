Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SwfmW-0005c0-74
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 22:44:37 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 13:32:55 -0700
Received: by pbcwz12 with SMTP id wz12so1633302pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 13:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=wR6cvsZGgcR7V7g8Lq1lxZm7VYvhh6jxWO+he1LSJ64=;
	b=OB6dGX/6bPq4AM/hbg1UNPcdv4x40TUi59dvVs/awhoX0smey43Lx6SIVnzR8WXhkd
	/Uh1idPSEHLk4sZO0GNj5Q8BaNHtVVzgLKMQAL5EUttqRG5LuM31/R86D+Eh86cHTMfu
	4m2QsQLIpADw+qXMXs/G/DVpqtzU+vIkQpAE2P8F5QP+Pq5zL9DFH/nwlibVT1tAMdiP
	3w4AbfyE4LG31V9XKqvYBVBokTolfi0hWbstSLfqOOlZrjWEQ+3BBhOjfTimD+gz2WOU
	NDhLCzwe6kOanZMJnTfdhsKWnUqN4OlKlUg+HrzBvy3SJ+0Sa3Z6Kv7UNAZpuEur1CjI
	pOJA==
Received: by 10.68.194.201 with SMTP id hy9mr54476552pbc.69.1343853174526;
	Wed, 01 Aug 2012 13:32:54 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id og7sm2841032pbb.62.2012.08.01.13.32.53
	(version=SSLv3 cipher=OTHER); Wed, 01 Aug 2012 13:32:54 -0700 (PDT)
Message-ID: <50199278.9040407@intel.com>
Date: Wed, 01 Aug 2012 13:32:56 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl0Xlcv7dMV9RYgSTEG0vURHe1myQOLSnx1WVSTnB8xIPzk8g1tll90ddU+jM42BCRcDml8
Cc: yocto@yoctoproject.org, "poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: denzil-next (1.2.2) staging branch change
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 20:44:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I just wanted to make a short announcement that I've just renamed my 
sgarman/denzil-next-1.2.2 staging branches to simply sgarman/denzil-next.

oe-core based:
http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next

poky based:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=sgarman/denzil-next

I created the -1.2.2 branches because at the time the Yocto Project 
1.2.1 release was still being finalized and I needed to start tracking 
patches for the next denzil point release. Now that 1.2.1 is out, the 
meaning of denzil-next is no longer ambiguous.

Again, the workflow I'm using is I pull in community requests for denzil 
commits into my sgarman/denzil-next branches, run some tests on them, 
and then submit a pull request to the appropriate mailing lists so 
Richard can then approve and merge them into the official denzil branches.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


