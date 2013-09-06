Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC1F6BEA2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 14:46:53 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id p13so2200258vbe.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 07:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Owk9+1sBDP5yRhe8lTYqaGeuKKO8evrtUGTMUY15u7c=;
	b=S6sAS9Wdve8iYBX/KiaLpg9gxkb861QXX2auX0yVdz/TEGsTZZ61boL3n6wJzDG0lX
	+ScLa2IApVC4AQCt1/39kA+Q+lpL7zqlT+l58GTuCEZulKPkMcC+VaeSL+OQxbUfL6d2
	JBfe3TENLUxwX5Olz/NJhJNebF8oBcyK1JR4WEQqBUHlEqnJvAALrv3yHK7/Brn5EHbf
	Xi6AdtCGR0ohrwNPF6JrUZevAzZ8T4bxvUMnfuoqydmt/vKrkoubWo77GdTAPQO28IvL
	nc7p4rQPnLQShuDtXe+SByuzXaRa6abz+qLeUbhF2iK3OvBAmFLXX9GLog56HCumhFNu
	+YXw==
X-Gm-Message-State: ALoCoQn6rSdJ23GWD1WbojXao1wDAie7Sqm8MAcFUz/rfEuahyBfw/ZYy0qO2FTHMZo5eq3ZjnDJ
X-Received: by 10.58.218.225 with SMTP id pj1mr2097596vec.24.1378478814422;
	Fri, 06 Sep 2013 07:46:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 6 Sep 2013 07:46:34 -0700 (PDT)
In-Reply-To: <1378478579.3484.4.camel@ted>
References: <1378478579.3484.4.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Sep 2013 15:46:34 +0100
Message-ID: <CAJTo0LZ_bA0ctzS3qrPdoOVhLSLZbVu9Nyk8WKNvaqe517RsCA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oeqa/qemurunner: Use a timeout in select() call
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
X-List-Received-Date: Fri, 06 Sep 2013 14:46:53 -0000
Content-Type: text/plain; charset=UTF-8

On 6 September 2013 15:42, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> -                sread, swrite, serror = select.select(socklist, [], [], 0)
> +                sread, swrite, serror = select.select(socklist, [], [], 0.1)

As discussed on IM, for the purposes of this loop a timeout of seconds
instead of fractions of seconds would be more correct, although we're
obviously going to be having diminishing returns.

Ross

