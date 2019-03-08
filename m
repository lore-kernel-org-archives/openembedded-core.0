Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9B49A6C3B6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 19:38:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44GHqR11yyz4x;
	Fri,  8 Mar 2019 20:38:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552073923;
	bh=fAiE3Y7VM8Mb6upA0RsiduQC+zX2ML2iCqnrtPiWPm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyE8UEeTW6Rt2p0NDc3dFrvbKWemX3h+oDCC1GumOeaDhcxElWAxajTvw9hKc1GMR
	AdsDKbBgm6prhw21Wa/BqxUX4D0ECR5CHjv2JTAV2+jSbzqxAN5WFa8qmz0YNnPoQs
	fU1J8/YNyws/yuRfIrAUxa7BE02xvmKd999aa4IIyxh6xeRNgJiiZYR97DOWPT2au4
	wgcvcYDDkDF5aygYMC0O9Yszq1IOGSyHPHqszqXn44CbS5XQ/wJp7plRVn5KioV0GJ
	g6MJYV6nmsHX32bFdIel5n/sgfzgQi6qj5E6NGByUQrcxNFXvaNNosx2/HwR5ylrbO
	NCpE7mufLRUBALpk6hrH0sRMTyNDrTX3AXgiCVTfjZIhKWTGRWfXhLD/AZ7kX2zpcA
	ddB2BD3iAZJ29BJkAlZX+EtQRDc/TyF+0JhZIimQVvKBBLMfzknNKjncI7tYmzSb3Y
	H5Y+OnsGodLIZsQA/FH1h5VfJ8rtFENlI9Omrezk/PZffOQepPrqjUaTWddx5zpbZ0
	Af64/XEiDb01mD4CwQ9lCm8ip8LcHHTUiqSpYBJRN0nvOMwvSXYg74F9BwErCWpLPj
	7dXIAfJz5dH5/imqE/RAkiF91MJJQOzpfI/nyygOvHw2LfIX2xifqCrsZpSKShoGOS
	yRoIdlFDv5hnQ3ugktY5VGa8=
Date: Fri, 8 Mar 2019 21:38:41 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190308193841.GA13393@localhost>
References: <20190308184939.22937-1-bunk@stusta.de>
	<CANNYZj-c+H9zqsj640ef+evBNQbi+6M1XAqJHaqu-_i5dHaxnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-c+H9zqsj640ef+evBNQbi+6M1XAqJHaqu-_i5dHaxnA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][RFC][PATCH] Remove openssl10
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
X-List-Received-Date: Fri, 08 Mar 2019 19:38:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 08, 2019 at 10:15:42PM +0300, Alexander Kanavin wrote:
> This is premature. Plenty of recipes outside of oe-core still rely on
> openssl10,
>...

How many and which recipes actually?

The upcoming releases of Debian and Ubuntu ship without OpenSSL 1.0.

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


