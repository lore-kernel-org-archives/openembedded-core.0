Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 58A7D65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 16:35:58 +0000 (UTC)
Received: by wibg7 with SMTP id g7so122859950wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to
	:message-id; bh=R3WjThjMgLOhiQlH+K03PNB20LjTK6GIQ6hCblRHOvg=;
	b=d2ZJtWmOYYwrrXi8skpViUKrfe/761wCY2DJhVglrjid0s20vRiCqvkj1d2an3Rn9e
	xvjE5k7DtBpnY9HnexUNpXI7B3T4miu23shDC6eIVSNeAcQULzrYmDuZHknpDKTO9ukN
	GACRd/ED4MLv8ou7cOPB1dVC1UVG2miXkuH5BULKs5VEM6iGeDnUXFFZE/WP1iiCeinO
	BA14pc2UVwUqkCxcwBnLohEEHBQIVv2WNfETdoOYSjg7ZYeQNat5wM80WdrGOi7W/az7
	KoNewcxIPmWvVStep+jMA6ZBprEYPaOR0liWGmaEd47SQ12sHKEpphsV0/j/+AK1i98P
	kFEg==
X-Received: by 10.194.6.228 with SMTP id e4mr151589134wja.63.1426782959619;
	Thu, 19 Mar 2015 09:35:59 -0700 (PDT)
Received: from [10.53.92.192] (089144230192.atnat0039.highway.a1.net.
	[89.144.230.192])
	by mx.google.com with ESMTPSA id r3sm2638552wjw.7.2015.03.19.09.35.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Mar 2015 09:35:58 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <1426764762.29168.48.camel@linuxfoundation.org>
References: <1426764762.29168.48.camel@linuxfoundation.org>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 19 Mar 2015 17:35:47 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <11112EC8-2E7A-4298-B982-C010C9E788DE@gmail.com>
Subject: Re: [PATCH] scripts/runqemu: Allow FSTYPE to be changed from the environment
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
X-List-Received-Date: Thu, 19 Mar 2015 16:36:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On March 19, 2015 12:32:42 PM GMT+01:00, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>Currently its not possible to change FSTYPE from the environment but it
>would
>be useful to do so where multiple image types have been generated. This
>adds that possibility.
>
>Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

Through reading.
Thanks!

>
>diff --git a/scripts/runqemu b/scripts/runqemu
>index 1277e82..84ece4d 100755
>--- a/scripts/runqemu
>+++ b/scripts/runqemu
>@@ -62,7 +62,7 @@ MACHINE=${MACHINE:=""}
> KERNEL=${KERNEL:=""}
> ROOTFS=${ROOTFS:=""}
> VM=${VM:=""}
>-FSTYPE=""
>+FSTYPE=${FSTYPE:=""}
> LAZY_ROOTFS=""
> SCRIPT_QEMU_OPT=""
> SCRIPT_QEMU_EXTRA_OPT=""



