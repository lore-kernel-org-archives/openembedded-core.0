Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF2173905
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 20:09:54 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so118379102pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 13:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=IIZUQ7nCRlElMODW5I9Ihdj5acxyX11J3iBqj3skvgc=;
	b=kybiS6R2qmQm4iDTrwjBnm/b20b7N8VtKCuXj3S170MXDbv0vsqB6U/RW1qSP4Cqs9
	fZ43ozOTd5HUhkpnm6RzqkAlqX6nOgO3LR8T+Ik0QSYmrfNhCmF57LnZCS0eu/gb6pw1
	yl4/5kqIacRg0GynKtd8BIrIYHAsxWrcIYIU9zzeavJyk10oOcTWOpsdpU1BQBtfqI7s
	8CJp1jInQxjLN6KJB5ro4LwC2jzUPzJraGABv1Fj9AGScMwAneA5bdmkjUXcloxTFCMR
	bqGg0Jq+6i01mm5e9qyKbZHjWm/0Rbt722mFGzR7shtIN73XiuAQZ2Aoo2wGBentIUxa
	itgg==
X-Received: by 10.70.127.140 with SMTP id ng12mr12514188pdb.94.1436299794558; 
	Tue, 07 Jul 2015 13:09:54 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id e9sm17738697pdk.7.2015.07.07.13.09.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jul 2015 13:09:53 -0700 (PDT)
Message-ID: <559C320F.4020707@gmail.com>
Date: Tue, 07 Jul 2015 13:09:51 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
References: <cover.1435497302.git.akuster808@gmail.com>	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>	<55956F2C.2040301@gmail.com>
	<20150707053411.GA17548@ad.chargestorm.se>
	<CAJTo0Lb87w=NO5o-0_vcz29UO0JrVTahEg5c1VhQnVDNCma2wQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lb87w=NO5o-0_vcz29UO0JrVTahEg5c1VhQnVDNCma2wQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Tue, 07 Jul 2015 20:09:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 07/07/2015 03:40 AM, Burton, Ross wrote:
>
> On 7 July 2015 at 06:34, Anders Darander <anders@chargestorm.se
> <mailto:anders@chargestorm.se>> wrote:
>  >
>  > So could you double check the 3.1.1 release, and verify whether it only
>  > consists of LGPLv3 | GPLv2+ licensed files, or if there actually are any
>  > files having the GPLv3(+) restriction?
>
> The nettle manual says quite clearly:
>
> "Nettle is dual licenced under the GNU General Public License version 2
> or later, and the GNU Lesser General Public License version 3 or later"
> <https://git.lysator.liu.se/nettle/nettle/blob/master/nettle.texinfo#L147>
> (https://git.lysator.liu.se/nettle/nettle/blob/master/nettle.texinfo#L147)
>
> An updated recipe that puts the "or" operator in the LICENSE field will
> solve all the problems.

which recipe? 2.7.1 / 3.1 or both?

- armin
( sucks at this licensing stuff)
>
> Ross
>
>

