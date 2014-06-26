Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id BC7E065F15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 17:28:57 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id i57so2354298yha.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 10:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=0fWqA9R4jujD1p7S3Vo51iDsM2td6U3jV1a9BG36VJg=;
	b=hpiLmYkz6w7WsROleo6fdc/W8BBslMM4d1bwmJZ7zOEV+gnqYj9Y9ReexP07adpIjH
	lBVYsTgNycwP76Lyf/g4hdnyAlX/g7FDZtgWmZTacFImsvIvD3dW9iKm2GrTXlBfdIxe
	hCYXvGQtfnaVXDecFYo1dgz8I5It9tEpPw+TTiIHzlrhHqyXtR5dy3AQ9qb5H1qPI8IX
	vIjKyPIPssSXEwlNX0aq4KYoEPz4RboiDV56tpgwblBg0UpuevNsz8YaqjoekQ80kDww
	4X2zaIvZrRVD30nIEolR4DPilyGQlSZXX48YpQvZxEixBBihGkwm4Pg+Rq1/jsdEiLZn
	LxPA==
MIME-Version: 1.0
X-Received: by 10.236.207.225 with SMTP id n61mr16252577yho.148.1403803738651; 
	Thu, 26 Jun 2014 10:28:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Thu, 26 Jun 2014 10:28:58 -0700 (PDT)
In-Reply-To: <1403713196-22214-2-git-send-email-denis@denix.org>
References: <1403713196-22214-1-git-send-email-denis@denix.org>
	<1403713196-22214-2-git-send-email-denis@denix.org>
Date: Thu, 26 Jun 2014 14:28:58 -0300
X-Google-Sender-Auth: Q_nr78FDlzKFR2oDMKcxYEG6k_M
Message-ID: <CAP9ODKptMdY=VmcU5j+D+Si7Uvha2Be-tpL7ThrtkZobxg7jUw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 2/2] udev-cache.default: set PROBE_PLATFORM_BUS to "yes" by default
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
X-List-Received-Date: Thu, 26 Jun 2014 17:28:58 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 25, 2014 at 1:19 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Force probing of "platform" bus by default.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> [Backport from OE-Core/master 6aae37c66fb6e7153b829ad860b7e7f94e804bd4]
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

