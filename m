Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id 45397606AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 10:57:13 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id w15so2765915vbf.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 03:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=vhJffnK5VpgAWogW0GvZV476cBN2IHA0bExKFgCO5UY=;
	b=PirCBJHS6dALkQwl3msVDQVctvhsUaTPpjslgm2ZiYrS7Qk8ys0vZvXrVerP2HNc8V
	LP8l9u41SmFRrJrAef82nliku63/0nKZ5rPsjMl8fpJpDL7E4RXAsAkpEQJ1owyDJ3UR
	3Epbz1X7HPboaIPZPe2IqVCayCuX8EUYnEsH3g2vOPCSQRuBf8xdwfKNh22RHRklc2Jx
	fHGeOcdKNrlI9Buy1uvERtwjIWNkfm44CjDeeRTSirZPC7pNgTJUqJt6/2aUdQ/boodt
	nKhBhTEqqMR/YvcLG94Y+8dxWjBXEud4c6y7HJBBu+ybrUjvUkHObbkEXBetBKUkXmss
	GKIw==
X-Received: by 10.221.4.138 with SMTP id oc10mr2468903vcb.26.1371553033888;
	Tue, 18 Jun 2013 03:57:13 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Tue, 18 Jun 2013 03:56:33 -0700 (PDT)
In-Reply-To: <1371552925-25557-1-git-send-email-zhenhua.luo@freescale.com>
References: <1371552925-25557-1-git-send-email-zhenhua.luo@freescale.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 18 Jun 2013 11:56:33 +0100
X-Google-Sender-Auth: ww1VHrF-rk0ABnIc2yGFLxB9TNc
Message-ID: <CANyK_8e39TGX9AHGhaBwTFJbkhP30nYzTf9+seXHrPr4nN+Eqw@mail.gmail.com>
To: Zhenhua Luo <zhenhua.luo@freescale.com>
Cc: b40527@freescale.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [patch] sanity.bbclass: correct the gcc_arch check logic
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
X-List-Received-Date: Tue, 18 Jun 2013 10:57:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 June 2013 11:55, Zhenhua Luo <zhenhua.luo@freescale.com> wrote:
> -    if check_gcc_march(sanity_data):
> +    if check_gcc_march(sanity_data) == True:

Unless there's something I've forgotten about Python, these two are
exactly equivalent.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

