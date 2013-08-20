Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3630461883
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 09:53:55 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id cy12so121241veb.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 02:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iFYh41quqqGWyw5o5jwVEA7HFqkvZgNZO25xKEa7MIM=;
	b=NOTc75gVLveDJPyhEnMySAkBBUEiV3dkBZxi0Du5dpqgJZA1LhAmHOuObVQYlMsv79
	Ne2HNCZncZOHuphAbkGPagKCyoZ17aEYi2CMtpueM4UGtDd/EMWEY51EwxqsDYWO8Xty
	0lVT/qjvbPjsNGUTHC2fpvcm5DyFcvhyBbsu6rxpyOW2Rp2sKP5ndGL3t2rfATUOKPaG
	GKjbm1JVqZQvofG0sSgs2cEOjLYAM8nR1bGn5FtQxugce/uXBvpCziJwftWgTsezQNYh
	zQapZLYCEyKQYmmq1WI1gS0ZnMS22s9KdI2JECi/hWVJASfm/uMTCjQuyU9Voz23MsBd
	/CBg==
X-Gm-Message-State: ALoCoQlDJfIoAgpe7iYuScyBYXwp8Ktkm1cGZ0zonKrmwiYMKETw1Kj4sJL9oS2/QzXvAc7s0twe
X-Received: by 10.58.19.162 with SMTP id g2mr436366vee.12.1376992435394; Tue,
	20 Aug 2013 02:53:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 20 Aug 2013 02:53:35 -0700 (PDT)
In-Reply-To: <cover.1376928709.git.sgw@linux.intel.com>
References: <cover.1376928709.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Aug 2013 10:53:35 +0100
Message-ID: <CAJTo0Lb67rHK3_woWxgopJ7b+mA1GOJFYL9F0D8qfcw=bg+iwg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: paul.eggleton@linux.intel.com, clarson@kergoth.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/25] Review and ACK
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
X-List-Received-Date: Tue, 20 Aug 2013 09:53:55 -0000
Content-Type: text/plain; charset=UTF-8

On 19 August 2013 17:19, Saul Wold <sgw@linux.intel.com> wrote:
> Jackie Huang (1):
>   texinfo: handle correctly @enumerate specification greater than 10

The patch is missing a signed-off, but then again the patch header
does have Jackie's email in.

> Joe Slater (2):
>   coreutils: add PACKAGECONFIG info for acl support
>   coreutils: allow for acl support

I don't like the comment describing the packageconfig format, but that
can be removed later.

> Khem Raj (3):
>   qemuppc: Change default tune to 74xx
>   tune-ppc7400.inc: Add tune file

The ordering of these two in the branch is backwards, which could hurt
someone doing bisects.  Richard, can you fix the ordering when
merging?

Apart from that, Acked-By: Ross Burton <ross.burton@intel.com>.

Ross

