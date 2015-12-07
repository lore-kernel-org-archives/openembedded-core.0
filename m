Return-Path: <fabrice.coulon@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9896360124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 09:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id CC69A2E144;
	Mon,  7 Dec 2015 10:15:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Qujg9HUcoCKs; Mon,  7 Dec 2015 10:15:53 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 3AB002E1A7;
	Mon,  7 Dec 2015 10:15:53 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 233861429;
	Mon,  7 Dec 2015 10:15:53 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 16DE4D6;
	Mon,  7 Dec 2015 10:15:53 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 12802341CC;
	Mon,  7 Dec 2015 10:15:53 +0100 (CET)
Received: from [10.92.161.3] (10.92.161.3) by xmail2.se.axis.com (10.0.5.74)
	with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 7 Dec 2015 10:15:52 +0100
To: Andre McCurdy <armccurdy@gmail.com>
References: <1449062556-13116-1-git-send-email-fabrice.coulon@axis.com>
	<CAJ86T=VF1HsQdgbyVsvutJO0HJ+LNp6d+rKMEsReB0XmDs3=mw@mail.gmail.com>
From: Fabrice Coulon <fabrice.coulon@axis.com>
Message-ID: <56654E31.8020601@axis.com>
Date: Mon, 7 Dec 2015 10:15:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VF1HsQdgbyVsvutJO0HJ+LNp6d+rKMEsReB0XmDs3=mw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Make it possible to override the append in a bbappend
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
X-List-Received-Date: Mon, 07 Dec 2015 09:15:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/02/2015 08:05 PM, Andre McCurdy wrote:
> On Wed, Dec 2, 2015 at 5:22 AM, Fabrice Coulon <fabrice.coulon@axis.com> wrote:
>> I need this in order to avoid a conflict when used with
>> base-passwd-native.
> Doesn't something like this work from your .bbappend?
>
>    do_install_append_class-native () {
>        # Remove to avoid conflict with base-passwd-native
>        rm -f ${D}${sysconfdir}/passwd ${D}${sysconfdir}/group
>    }
>

Yes it works. I don't need to change the recipe, it's enough with this 
in a bbappend. Thanks!



