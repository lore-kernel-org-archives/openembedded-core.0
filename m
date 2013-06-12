Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 966756A9E5;
	Wed, 12 Jun 2013 17:08:26 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id ha12so2885829vcb.7
	for <multiple recipients>; Wed, 12 Jun 2013 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=jnXRTDcU1xmU6YKAN0j43uZr4d3P7O1Qy70Kk/YFPPE=;
	b=MdFCsRChMFO4ePOa2yqBjctmrJa97P0uZsIQv+JMZbv8bowe/0voeBtimiQMuJUYsK
	M1a0AzDXlCw1FDMIDvknS1DyVTGoviB/HShlieF9MKp2qvzn45AmKiqkyvamOvK0c51O
	SXmQVZ6XY/O/2ZFKfZ/TYaxJsExNLreQe403t8viAgMxqHIhXkuvoYxoCpu6a2Zd2dx+
	62zVqMTDSZ3fBaACIdh89ygQwcWqs6zr9gul5p/BWyxseKWRSdwQNgnouTfhbLqq/FHc
	gbJhnrY7FuqlaoXkQ/llYZ2XyO232f4METUrRXvYwDF/KJ3b3DbDJB9c81gi/CqBm4Vv
	iotw==
X-Received: by 10.58.37.165 with SMTP id z5mr10194043vej.12.1371056907187;
	Wed, 12 Jun 2013 10:08:27 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Wed, 12 Jun 2013 10:07:47 -0700 (PDT)
In-Reply-To: <20130611160434.GI3233@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 12 Jun 2013 18:07:47 +0100
X-Google-Sender-Auth: 96vK4Co5Vcd6YFhSkcLofQHs47c
Message-ID: <CANyK_8faU-wx54fY+4EZdc1rLP-TSmwuuQc6660+guMVXzqWkQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world
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
X-List-Received-Date: Wed, 12 Jun 2013 17:08:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 11 June 2013 17:04, Martin Jansa <martin.jansa@gmail.com> wrote:
> common:
>   meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb, do_compile

I've got patches to pull this up to version 0.8.1 and then fix the
compile error. A patch to fix the error has also been submitted
upstream. Building for qemuarm, beagleboard and raspberrypi now (my
main 3 test platforms) and will submit patches to openembedded-devel
once it's confirmed to build.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

