Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 16D6878A99
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 17:04:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w94H3uCC017377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 4 Oct 2018 18:03:57 +0100
Message-ID: <53961341e042e2493580d379271b9af43c2b0620.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: grygorii tertychnyi <gtertych@cisco.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Oct 2018 18:03:56 +0100
In-Reply-To: <20181004052931.21389-1-gtertych@cisco.com>
References: <20181004052931.21389-1-gtertych@cisco.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH v2] lib/oe/utils: add eol to format_pkg_list()
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
X-List-Received-Date: Thu, 04 Oct 2018 17:04:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-04 at 08:29 +0300, grygorii tertychnyi via
Openembedded-core wrote:
> Append '\n' to the non-empty formatted string before return. If you
> write it to the (manifest) file, it will ensure file ends with a
> newline.
> 
> Many GNU utilities have problems processing the last line of a file
> if it is not '\n' terminated. E.g. if the last line is not terminated
> by a newline character, then "read" will read it but return false,
> leaving the broken partial line in the read variable(s).
> It can also break or adversely affect some text processing tools,
> that operate on the file.
> 
> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
> ---
> 
> Changes in v2:
>  o make sure we don't append '\n' to the empty string

This still breaks things which doesn't give me much confidence in this
change for 2.6 :(.

https://autobuilder.yoctoproject.org/typhoon/#/builders/28/builds/90/st
eps/7/logs/step2d
https://autobuilder.yoctoproject.org/typhoon/#/builders/24/builds/87/st
eps/7/logs/step4b

and more...

Cheers,

Richard

