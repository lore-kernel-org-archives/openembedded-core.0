Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BE114751D5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 10:19:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w84AJvNs019670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 4 Sep 2018 11:19:58 +0100
Message-ID: <a14eca616f188303437eda22c340e82135d23b11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Niko Mauno <niko.mauno@vaisala.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 04 Sep 2018 11:19:57 +0100
In-Reply-To: <ed7c4dec-e2bd-905a-cf2e-9c5a0ed31cf2@vaisala.com>
References: <ed7c4dec-e2bd-905a-cf2e-9c5a0ed31cf2@vaisala.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: recipes-kernel/linux-libc-headers/linux-libc-headers.inc question
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
X-List-Received-Date: Tue, 04 Sep 2018 10:19:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-31 at 18:41 +0300, Niko Mauno wrote:
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=eb24d4aeac
> aad9d41ddcbefd8d2ac96e95548183
> apparently is needed for 4.15, but it breaks with 4.14 as we get
> 
>   ERROR: linux-libc-headers-4.14-r0 do_install: oe_multilib_header:
>   Unable to find header asm/bpf_perf_event.h.
> 
> I used following to work this around in our own linux-libc-
> headers_4.14.bb:
> 
>   do_install_armmultilib_prepend() {
>       touch ${D}${includedir}/asm/bpf_perf_event.h
>   }
> 
> but curious if somebody could suggest a better mitigation

The options are really what you've done, copy the .inc and edit or use
the never libc-headers. It doesn't need to match your kernel version
and newer libc-headers should be very backwards compatible.

Cheers,

Richard

