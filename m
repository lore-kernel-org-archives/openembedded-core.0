Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id F25A9609B2;
	Wed, 11 Feb 2015 21:09:17 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so6471497pab.13;
	Wed, 11 Feb 2015 13:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=MprQVKJ2hDpedSL0TGEwgg4BuA8RqsHD39LjgsAqsag=;
	b=foxgysX8pZqDAtl0OZckLtjOMkomLxkuvOtC4a0DOSSmvIQJFb0xrkrG8XJqeEnEVe
	ArQgIolqrVSLHbjn21AdxkmPuR31Fpb6NVlEVEWY4Tq0MaCcbdmRYNKalpG3GJiMI5+I
	fUe4OLs6c7KMdtxF7epDZjNd2swjK35YxuzRB4lCpZULKjgYVL/IT9RVj0CSgMoYzP1r
	HFXr4H1HIXfg9Re8IqQyRQEEdVLqorLIegiR5Pi1xFsRv9Lx5Ueckzv9xRSoFsOve8OQ
	qmzAGPl2EyeZ35/aZKosPiX/j9o09GbahST0CkoYuJBvLa+vaF3G3bFop3DSAmUggEc6
	Ztgw==
X-Received: by 10.68.107.2 with SMTP id gy2mr676659pbb.63.1423688958635;
	Wed, 11 Feb 2015 13:09:18 -0800 (PST)
Received: from [10.22.11.16] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id bi11sm1797772pdb.8.2015.02.11.13.09.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Feb 2015 13:09:17 -0800 (PST)
Message-ID: <54DBC4FB.1000509@gmail.com>
Date: Wed, 11 Feb 2015 13:09:15 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <20150211202632.GA2272@jama> <20150211203512.GB2272@jama>
In-Reply-To: <20150211203512.GB2272@jama>
Subject: Re: State of bitbake world, Failed tasks 2015-02-10
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
X-List-Received-Date: Wed, 11 Feb 2015 21:09:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Thanks.





On 02/11/2015 12:35 PM, Martin Jansa wrote:
> On Wed, Feb 11, 2015 at 09:26:32PM +0100, Martin Jansa wrote:
>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>
>> == Failed tasks 2015-02-10 ==
>>
>> INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150210_214029.log
>>
>
> More details bellow:
>
> * /meta-openembedded/meta-oe/recipes-support/fltk/fltk_1.1.10.bb, do_compile
> * /meta-openembedded/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb, do_compile
> are trying to use xml2-config
>
> * /meta-openembedded/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb, do_compile
> * /meta-openembedded/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb, do_configure
> are trying to use pcap-config

I will look into this.

- armin
>
>
> * /meta-openembedded/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb, do_compile
> | i586-oe-linux-gcc: error: unrecognized command line option '--should-not-have-used-/usr/bin/freetype-config'
>
> * /meta-openembedded/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb, do_compile
> *** error: gettext infrastructure mismatch: using a Makefile.in.in from
> gettext version 0.18 but the autoconf macros are from gettext version
> 0.19
>
> * /openembedded-core/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb, do_compile
> | tools/dumpimage.c:195:37: error: 'PLAIN_VERSION' undeclared (first use in this function)
>
> * /meta-openembedded/meta-oe/recipes-extended/unixodbc/unixodbc_2.3.2.bb, do_configure
> | gnu-configize: 'configure.ac' or 'configure.in' is required
>
> * /meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
> | qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>
> * /openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb, do_compile
> | btrfs.c:172:17: error: 'BTRFS_BUILD_VERSION' undeclared (first use in this function)


>
> * /meta-openembedded/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb, do_configure
> ERROR!  Libpcre header not found.
>
> * /meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb, do_compile
> ktap.c:33:2: error: #error "Please enable CONFIG_EVENT_TRACING before compile ktap"
>
>
>

