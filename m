Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 37DD871144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 17:30:30 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so2860588igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 10:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=Qs7SbSLSICMYmA430FPseaurha/dGlQYs5gcDJr66ds=;
	b=qUMys0lUKh5G0MknIx4fTxdu98m0mRcLd6Liyz/q9kcqyjl8lLFAxp8oNz8bwawbRV
	Tj1aI2aG3mOx7UTvndzSQnopLhwPYgq5cKm/DX2+Phqg+p3az4zx6/cSGtXbfoIk2McO
	s5UdjzFT+GWeP4zIiQyD4Hx2Pw24Hjvh/DeIbDBDOHtzCEZp/FjT3aFV1yK4KheLgefZ
	wxt4DkGmWcDaZN36E74iob+Dvwu5+/KnWJEi2rVkU+CohR1PvJQywK1yvSWXZvkjuBIh
	Al7YreqioDkpmYP2XUIlQlPvkzSToMLSxveVRPf/TxHHPzG4phqZwFTMRrpsm8xjX54Q
	OAuw==
MIME-Version: 1.0
X-Received: by 10.50.80.19 with SMTP id n19mr6118003igx.30.1429723831807; Wed,
	22 Apr 2015 10:30:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Wed, 22 Apr 2015 10:30:31 -0700 (PDT)
In-Reply-To: <20150422172752.GA5915@ad.chargestorm.se>
References: <1429722072-13369-1-git-send-email-bruno.bottazzini@intel.com>
	<1429722072-13369-4-git-send-email-bruno.bottazzini@intel.com>
	<20150422172752.GA5915@ad.chargestorm.se>
Date: Wed, 22 Apr 2015 14:30:31 -0300
X-Google-Sender-Auth: o6QnDiVFvXBbrZF_vNm8QaJc0a0
Message-ID: <CAP9ODKoacgFv4sxM8MU_TcF9COZi7iFWERfesRzpoAac_VLA5Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruno Bottazzini <bruno.bottazzini@intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: split modules into packages
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
X-List-Received-Date: Wed, 22 Apr 2015 17:30:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 22, 2015 at 2:27 PM, Anders Darander <anders@chargestorm.se> wrote:
>
> I'm repeating the comments from my review of the earlier version.
>
> I'm slightly worried as we're changing some of the default
> configurations here. And we're suddenly starting to build almost
> everything in systemd...

I am in favor of the modularization changes but against the default
change. If it is done:

 - needs further discussion
 - needs to be another patch

So NACK.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

