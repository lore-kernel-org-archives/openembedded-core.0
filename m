Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 62C1971427
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 13:33:01 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id v1so2112408yhn.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=3spiIAjRVtnq04+J1HPUJ+esOsSZKKuVplaAmoZ3GMI=;
	b=MoqFWHs8h60OCttlIk6oeSY7gdFtMRdT0wUOAVCqKsE3FD7Mqx5M6W2Xfsd5K6vbsv
	ZwLbOSsDCp+bibc5bXl56V0fmKYrma+uKahXMUFGiNM19zjALwX7DrMbZJLcRxQaO8gZ
	QInGHCWIZWSKYZIO/NTNvep7NdcxETH1sos7BmXsSN/Z4hvRiMlIDstUSDyNHRTlX7K+
	KR2zXsaXEI0xhJatGFAltprlmMjSpKgWWQSZE4TD4Mtkfqt0lBQuG2I+Tl9dqSU/Avmk
	M14bbOSV1eqSP9lRoFiuddk1pm0PcIn78QBaJ3Ye3TXafZ5tiGJKxM6DQAPgHe9mKhbX
	0++w==
MIME-Version: 1.0
X-Received: by 10.236.162.7 with SMTP id x7mr33531447yhk.6.1410787982849; Mon,
	15 Sep 2014 06:33:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Mon, 15 Sep 2014 06:33:02 -0700 (PDT)
In-Reply-To: <CAJTo0LaB+e=o02t4pbF6kSNKvy8R8YHT5tijT9T43U=6Y_yXdw@mail.gmail.com>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0LaB+e=o02t4pbF6kSNKvy8R8YHT5tijT9T43U=6Y_yXdw@mail.gmail.com>
Date: Mon, 15 Sep 2014 10:33:02 -0300
X-Google-Sender-Auth: RKZy8eeA0r7rSbDZZvRCTABOg1E
Message-ID: <CAP9ODKqtnPzfJ2PwBPQcwQ-jF=yT3dxQiNjWvLB6K71woMX4Vg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Mon, 15 Sep 2014 13:33:05 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 14, 2014 at 6:40 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 14 September 2014 04:34, Denys Dmytriyenko <denis@denix.org> wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> * Update U-boot and corresponding tools to version 2014.07
>> * Small cleanups with indentation and consolidation of u-boot.inc
>
> This missed the feature freeze, so can you justify merging this after
> the freeze or can it wait until 1.8 opens?

I am using 2014.07 in meta-fsl-arm for a while and I support the merge
of this for 1.8.

However I'd love to see a incremental patchset where the indenting
fixes are done /before/ or /after/ the update. It is hard to identify
the real changes.

Another thing I think we can improve is to add the other licenses in
http://git.denx.de/u-boot.git/?p=u-boot.git;a=tree;f=Licenses;h=0d48cfcee2993e1353b3d75d9f6f1c29e7eb8fea;hb=HEAD
to the tracking of licenses.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

