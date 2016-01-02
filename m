Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 96E7C60291;
	Sat,  2 Jan 2016 22:24:53 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id 6so153897606qgy.1;
	Sat, 02 Jan 2016 14:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=+SzdhvonmCyDTaqIPYN7W7joEZztOfIcpRjOIzWjQP8=;
	b=fRHNAu82s3x62OX7FHGJvMBkHRfRUIMnyMowX5RAGOd0cyetAGB+TFSEo9INHAETfv
	AoFNq6huBBf4aau/pW/TB1tABAT1a7RUQZXk3qO7tFGMqeLbYno/PlM+mIMX9BoPiW0Q
	Piwt08rQkk0epB3TKP2vjyMf1GCTAVY/MUA0flDnqCal85Wk0mly5dq4hRNmqq266Xn6
	bLR55WR1ZJmEyQZ/+LqCH5oVZGmVWVLewz55k2wETSpQi3RFF5UBBS1C+AFkRfXeZXe1
	cyTW72F6qn9VTkHVgpi2ViX0+6Fwv4TxNhWjum2vKB2Cln3PjsMuwzQyt3bpZnfIa4nE
	3NRw==
X-Received: by 10.140.234.17 with SMTP id f17mr114614964qhc.19.1451773493801; 
	Sat, 02 Jan 2016 14:24:53 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	l38sm37035077qgd.27.2016.01.02.14.24.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jan 2016 14:24:53 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CA+chaQfGTBOqGyGq6S7fMbP8c9rdm+1cDrc===xA1kOF=+WGOQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56884E30.2080703@gmail.com>
Date: Sat, 2 Jan 2016 17:24:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQfGTBOqGyGq6S7fMbP8c9rdm+1cDrc===xA1kOF=+WGOQ@mail.gmail.com>
Subject: Re: State of bitbake world, Failed tasks 2016-01-01
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
X-List-Received-Date: Sat, 02 Jan 2016 22:24:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 01/02/16 13:19, Martin Jansa wrote:
>
> == Tested changes (not included in master yet) - meta-openembedded ==
...
> 7020a19 nodejs: cleanup and update
...
>
> == Failed tasks 2016-01-01 ==
...
>
> === qemuarm (1) ===
>     * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb <http://nodejs_4.2.2.bb>, do_compile
>

Can it really be considered a failed build when the recipe explicitly
excludes qemuarm (armv5) from the compatible machine list?

