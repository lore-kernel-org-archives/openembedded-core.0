Return-Path: <linus.svensson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D36E960557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 12:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 182952E45B;
	Tue, 14 Feb 2017 13:15:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 8igdj3--3Ka0; Tue, 14 Feb 2017 13:15:01 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 422D32E457;
	Tue, 14 Feb 2017 13:15:01 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 207FD1A06D;
	Tue, 14 Feb 2017 13:15:01 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 154911A067;
	Tue, 14 Feb 2017 13:15:01 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 14 Feb 2017 13:15:01 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 09A4B7C1;
	Tue, 14 Feb 2017 13:15:01 +0100 (CET)
Received: from [10.94.48.1] (10.0.5.60) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 14 Feb 2017 13:15:01 +0100
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1480609418-3264-1-git-send-email-linus.svensson@axis.com>
	<1480609418-3264-2-git-send-email-linus.svensson@axis.com>
	<CAJTo0LZ_ea-cm=ZSNt2zVbasOApPdbGegZCH7VU-+0XH=-noZA@mail.gmail.com>
	<CAPybu_1tqVeyDqhQLd0qPOOR=D=4WhC_D-Tv4wkZJ2_todZ0oQ@mail.gmail.com>
	<CAJTo0LaChW9ENPiJcrnBNGbrbUFiVDSM+Ro2uUjY8NgpQXiheg@mail.gmail.com>
	<CAPybu_0FepS4PQ_QPMK3-k_h2r5J4ue-b-p8bbGeDDhVjL=Ctw@mail.gmail.com>
From: Linus Svensson <linus.svensson@axis.com>
Message-ID: <58A2F4C4.9010300@axis.com>
Date: Tue, 14 Feb 2017 13:15:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAPybu_0FepS4PQ_QPMK3-k_h2r5J4ue-b-p8bbGeDDhVjL=Ctw@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX03.axis.com (10.0.5.17)
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] meson: Add recipe for the meson build system
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
X-List-Received-Date: Tue, 14 Feb 2017 12:15:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi.

On 02/13/2017 01:28 PM, Ricardo Ribalda Delgado wrote:
> Linus, do you plan to resend? Can I help you?
I will resend it later today.

meson is still under development, and more options for installation 
directories are still (I know at least one more that will come) added. 
That could, or perhaps should, be updated when the meson version is 
updated. Worth to put a comment somewhere regarding that?

/Linus

