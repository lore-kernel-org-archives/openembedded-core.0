Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 37BB865C7C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:33:49 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id a41so4696606yho.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Zq0hJPOJa7BEB/5egohRQKlh7jHSicdvXLBQXmVpb0g=;
	b=VIu2WUk13DtC+Pe/jmECGoGxOo/Y16lu86Euxzp11VqrrEguNku77eVVQkJ/7yiOWs
	+SIJnImAIRhja3RgNAAsRbG3lJwzCevznEa0mYjgjfcaEhf6vmASICiEGwDiKAuHYZap
	6c1Dn1GEFMf2fSAknsqNvoN5THXsFYq4u0WL556sp3605kT8OawA5go7WVR/UATvZx/2
	WdRwb/S7CWyTFdumcF3I7Hc7iovtuGBYjbbsJ8K/5gK4OfpYTISc2PJvarm4LSVs51+3
	hwDxWtT9kpbpqig/pAA3Nf9pfAaaBaUNRnoukojPBD9UYTEtT2jPwaHBwXrLgmcFmIUC
	0UbA==
MIME-Version: 1.0
X-Received: by 10.236.79.230 with SMTP id i66mr8374545yhe.136.1407180830884;
	Mon, 04 Aug 2014 12:33:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 12:33:50 -0700 (PDT)
In-Reply-To: <6eee11939b5e229740cca413eaa741bfc85689c7.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<6eee11939b5e229740cca413eaa741bfc85689c7.1407177403.git.ben.shelton@ni.com>
Date: Mon, 4 Aug 2014 16:33:50 -0300
X-Google-Sender-Auth: CJe6Dop5VVi_bPMeBISUdFOwtqU
Message-ID: <CAP9ODKp4-eBwWVKwm4JxBAGtr+enhcEgnMBH6D-9+naFy3cDVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/20] udev-cache: Remove superfluous subshell on extract
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
X-List-Received-Date: Mon, 04 Aug 2014 19:33:53 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 3:40 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>
> tar -C exists in both GNU and busybox tar, so use that instead of
> (cd /; tar ...). This allows the subshell to be removed.
>
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58620
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

