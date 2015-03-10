Return-Path: <net147@gmail.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 769D9739AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 00:08:30 +0000 (UTC)
Received: by qcvp6 with SMTP id p6so9621562qcv.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 17:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=h1L+SzVHonWL0bQqPZcFuJuVjTI6hPBVJaN1baMzCxI=;
	b=EdpHa/zaZqvZCWE2xUtk+igWQbYIwn6Ugcf3MGFlrDGOZTDaCnpSxpAcsV1HuNj12k
	Si4u8E0Y5z4bJ2sBd3ncOfuBxikijXD98alG6d4Ql0DWllYmAsgxVQuIqjSY+pWXRDsb
	zvSgKQjSHobJLzGSFndsOuYWqzDkcPnMi+gwdD3qIOp6419BlH2CR7JNJRvb2FaH+IGV
	N9NAdX7rT/ie4wyLaIIlekiqSu6oXRgYyJhdoYJXcPo6uK7bWDW0GMRMqZOFCGmYwi7v
	SybP6pcpSOLq6y93/+3upQPqg9XCQ+p63+Y0okT77+/SfG583nYg2/oPzaVTAGasVVH4
	TRnA==
MIME-Version: 1.0
X-Received: by 10.55.23.6 with SMTP id i6mr7732973qkh.39.1425946111151; Mon,
	09 Mar 2015 17:08:31 -0700 (PDT)
Received: by 10.96.56.100 with HTTP; Mon, 9 Mar 2015 17:08:31 -0700 (PDT)
In-Reply-To: <1425919096-19919-1-git-send-email-ross.burton@intel.com>
References: <1425919096-19919-1-git-send-email-ross.burton@intel.com>
Date: Tue, 10 Mar 2015 11:08:31 +1100
Message-ID: <CANwerB1U-FhCe+k_syG19p_eSnvpXAcbcz2iV62pJeCHTB-48A@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] liberation-fonts: inherit allarch as fonts are arch-independent
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
X-List-Received-Date: Tue, 10 Mar 2015 00:08:31 -0000
Content-Type: text/plain; charset=UTF-8

Hi Ross,

On 10 March 2015 at 03:38, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Should probably do the same for ttf-bitstream-vera.

Regards,
Jonathan

