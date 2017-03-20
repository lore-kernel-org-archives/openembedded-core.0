Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6061177957
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 12:21:48 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id g138so92780551itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=+IOrkbqpl7K3Qr0ufZ4ggmevLo4huPwC5LD4eBOCHA4=;
	b=wTFnILhqha5SZyssLx3gcKKsFaSJxFOUGMIoD1ol7IUqBn5w6E/pKlHOp+FkhCHKOY
	YRZM1MjhQQ5w3j5kCqg66aZSjuXSXy/68Tq65oc9MgAHOkxWtR2vPSmzUwHtuvjVY82Z
	fj+YM9UJwypNtYDSUmqj94vY/8fg2+Ji2x7xQyLEvqVCZgiiYb1wdj6aJbdh5MSimieP
	Zc/gmn1H1RjlECwkaf4Si01MVObHxuAWhd7aGXEmRPspiyoFde3LETxd5sBv738aOU9l
	spjAKPJYraFmyXUPWzNyS2zCiOyi3M9WRCDyaXmfHtTJJZr53/Ci45buOB0nl9B0Bt5P
	TSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=+IOrkbqpl7K3Qr0ufZ4ggmevLo4huPwC5LD4eBOCHA4=;
	b=or9xmNeTsXoPHM7S1llYKWEG/ttNMZv4RhnRpMw5owUyDbBfDx75P2R+GbX0/OQDbE
	Y9ewR6oT1LtdZX4Q683B+P81/oLktZH8fboQjWSJ54SAhep807zobTJUxFJhpEBm3wgM
	g85TxtVNubsnDdIk/LS3IE/cpSssb1TMw/4s8sjenO7UaCmPs57+R2Gn1bgy+mPDCH9j
	TA6wsgd3VQqoIYLhhluEFO8bWH3ChFFghEZk1YnE3DAV9lDFrukT5ij0yjUi1gypdHkY
	6zFFk4ns9PNkptMYMNXFRmd512AMdIeDpp8jffYs9j+pGvYCqP6QVKDUZdqr26rWSlc0
	OS+w==
X-Gm-Message-State: AFeK/H28GYItH2DO7hn64/OWbJYWMEYcylD1jleYwT8/MJPd27IaO1oTK33U3pSXCbbc5yTh
X-Received: by 10.107.46.136 with SMTP id u8mr12535152iou.85.1490012510170;
	Mon, 20 Mar 2017 05:21:50 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C233.dip0.t-ipconnect.de. [93.232.194.51])
	by smtp.gmail.com with ESMTPSA id
	x100sm5133312ita.12.2017.03.20.05.21.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 05:21:49 -0700 (PDT)
Message-ID: <1490012507.6396.173.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Date: Mon, 20 Mar 2017 13:21:47 +0100
In-Reply-To: <597a60bd-e1a7-c832-3f95-13464ca8ebd2@mlbassoc.com>
References: <597a60bd-e1a7-c832-3f95-13464ca8ebd2@mlbassoc.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Error after updating Poky
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
X-List-Received-Date: Mon, 20 Mar 2017 12:21:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-03-20 at 13:12 +0100, Gary Thomas wrote:
> I just updated to the latest Poky master (7e0985bab68547) which
> replaced rpm-5.4 with rpm-4.13.90 (git).  My builds in an existing
> tree now fail:
> 
> | 
> /build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/recipe-sysroot-native/usr/lib/librpmdb.so: 
> file not recognized: File format not recognized
> | collect2: error: ld returned 1 exit status
> | ext/CMakeFiles/libsolvext.dir/build.make:285: recipe for target 'ext/libsolvext.so.0' failed
> | make[2]: *** [ext/libsolvext.so.0] Error 1
> | make[2]: Leaving directory '/build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/build'
> | CMakeFiles/Makefile2:207: recipe for target 'ext/CMakeFiles/libsolvext.dir/all' failed
> | make[1]: *** [ext/CMakeFiles/libsolvext.dir/all] Error 2
> | make[1]: Leaving directory '/build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/build'
> | Makefile:163: recipe for target 'all' failed
> | make: *** [all] Error 2
> | ERROR: Function failed: do_compile (log file is located at 
> /build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/temp/log.do_compile.8183)
> ERROR: Task (/local/poky-cutting-edge/meta/recipes-extended/libsolv/libsolv_0.6.26.bb:do_compile) failed with exit code '1'
> 
> Looking at this file shows it's a stale symlink:
> $ file 
> /build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/recipe-sysroot-native/usr/lib/librpmdb.so
> /build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/recipe-sysroot-native/usr/lib/librpmdb.so: 
> symbolic link to librpmdb-5.4.so
> $ file `readlink 
> /build/p7619_2016-02-23/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libsolv/0.6.26-r0/recipe-sysroot-native/usr/lib/librpmdb.so`
> librpmdb-5.4.so: cannot open `librpmdb-5.4.so' (No such file or directory)
> 
> Any ideas how to fix this?

The code maintaining the recipe specific sysroots does not always keep
the sysroots in sync with what they should contain, primarily because it
is limited to updating them instead of (at least sometimes) starting
from scratch.

Probably a "bitbake -c clean libsolv && bitbake libsolv" will help in
your case. If it doesn't, try "rm -rf tmp" next (might be faster and
easier too, if more recipes are affected).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




