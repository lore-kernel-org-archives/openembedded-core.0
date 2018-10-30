Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C882579BB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 16:49:48 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9UGnfb2006672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 30 Oct 2018 16:49:42 GMT
Message-ID: <7d0550c8af1ad69f6b7832e8d5605e4fd09fe475.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2018 16:49:41 +0000
In-Reply-To: <09487c1d7e9d9a2cf0c60883ad209712c2d31dc2.camel@andred.net>
References: <09487c1d7e9d9a2cf0c60883ad209712c2d31dc2.camel@andred.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: broken sstate archives
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
X-List-Received-Date: Tue, 30 Oct 2018 16:49:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-10-30 at 15:45 +0000, André Draszik wrote:
> Having updated poky from 028a292001f64ad86c6b960a05ba1f6fd72199de
> (end-of
> July) to 3b77e7b7852549dcfbc426d4ce258e6e857c0acd (mid October), at
> least
> two broken sstate archives have been created:
> 
> * the sstate archive for update-rc.d package_write_ipk contains a
> broken
>   main package update-rc.d_0.8-r0_all.ipk
> * zlib populate_sysroot has a broken sysroot-
> destdir/lib/libz.so.1.2.11
> 
> For the update-rc.d case:
> * tar tzvvf displays a reasonable size for all files inside the
> sstate
>   archive
> * tar xzf extracts all files and sets a size on update-rc.d_0.8-
> r0_all.ipk,
>   but it's all NULs, and hence is broken
> * for those who know midnight commander, it's 'open' displays a size
> of
>   0 bytes for update-rc.d_0.8-r0_all.ipk in the first place
> 
> 
> For the broken zlib sstate archive, things are similar, additionally:
> * the zlib ipk packages (and their contents) contained inside
>   sstate_zlib_*_package_write_ipk.tgz are actually not broken
> 
> 
> The original (first) build resulting from my poky.git update had
> actually
> completed successfully. It is only subsequent builds trying to use
> the
> generated sstate artefacts that now don't work.
> 
> I can't say for sure whether or not other sstate artefacts are
> broken, too.
> 
> 
> Any ideas how this could have happened? Have similar issues been seen
> before?

I've not seen/heard of any reports of that before and it is worrying.
The question is can you reproduce it? As things stand that is a little
bit of a hard one to replicate/debug :(

Which host OS and filesystem was it?

Cheers,

Richard


