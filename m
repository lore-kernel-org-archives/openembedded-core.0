Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3D23560123
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Feb 2016 00:20:21 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id cy9so54093006pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 16:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=pQl4pC2YTQ73Nm2jNR8ilW4a+v8pWhODnof81Cq0S+w=;
	b=pOCiQHsaOIJi4tdjm1FpyDZPNgQ4BtE8sHk6JQUnmuDfRPIe4N9Txs6b1MvD1IRNtS
	Le43vgpCuyzJuJA+mR8BLQ844Zk+CjRb7D5OWOTbOt/ArF7RnC068MC0ayRgJnhFv28N
	GGFk7l0kkypmid/YO0T+uZzS7zpQC5eWNNdUMPW5lflSC/dEI+Q7QGraqgOLRq/z1q50
	QjZqu/sEHTuCMnDSCOAj+x39ObcRhk8ulanPj0cOHAY5KAgUxk49xlBuewG77Dnm93NP
	5+p9pvsrUIzDqjwxn3Gu3qdyHgfiw1E75yk0MMLQyd+LQNsCcWVvWl8xYG3DRnS7uqw0
	saKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=pQl4pC2YTQ73Nm2jNR8ilW4a+v8pWhODnof81Cq0S+w=;
	b=I+qWh0jXb0I4BYkbVjygD5XYTxWQrqWtV3t79O2i8AkMlSRP2ZdtCKS5LZSJMGflJJ
	Nwi/1t8xrMySD0TW8o/rsItxpACzIeIMkCfuBZckOjfmhhiXPP6zrFxk6TxaRgC1ACbs
	ctNmo40Lie/YFN64/LOwnrbTuAEk8HetvUrbDdlNa5nu2V5jmaLb6YwiziH40//V29q4
	Ru7S3ditBoRib2TwhlmtBK7yesSRXZcg+BwtLpjQxlqGSBaSuoYij/eswJxjnx1tfzUm
	q4EkYABcpHe0DwXPFOwf9KUbWqEp/nD0qUiOO0x9/zrYyZywCU0BGo6XJszgS9b6rc3H
	2Lyg==
X-Gm-Message-State: AG10YORq8ALD0Ab0xCq1gNt256oLuvSiRvlrAmVOyE1loEL6mlnA63xTbhh96O1mNBcp2w==
X-Received: by 10.66.102.70 with SMTP id fm6mr31221468pab.80.1454804422247;
	Sat, 06 Feb 2016 16:20:22 -0800 (PST)
Received: from Akusters-laptop.local ([2601:202:4000:1239:16d:a571:890e:3ae5])
	by smtp.googlemail.com with ESMTPSA id
	s90sm28045192pfa.49.2016.02.06.16.20.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Feb 2016 16:20:21 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1454773573-6990-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LaGPJ-11B_008M+BXqs4UBvt6nd_Mhtt3wf2oeSYqssxA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56B68DC2.8070800@gmail.com>
Date: Sat, 6 Feb 2016 16:20:18 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaGPJ-11B_008M+BXqs4UBvt6nd_Mhtt3wf2oeSYqssxA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lsscsi: Add new package
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
X-List-Received-Date: Sun, 07 Feb 2016 00:20:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 2/6/16 12:50 PM, Burton, Ross wrote:
>
> On 6 February 2016 at 15:46, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     The lsscsi command lists information about SCSI devices in Linux
>
>
> And this should be in oe-core because?

The other sub-system utils appear to be in oe-core like pciutils,
usbutls and pcmciautils so it seemed like a reasonable assumption.

I can handle no as the answer. send it to meta-oe.

- armin

>
> Ross


