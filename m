Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD4177E76
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 08:31:05 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v528V0rW027363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 2 Jun 2017 09:31:01 +0100
Message-ID: <1496392260.6630.81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fan Xin <fan.xin@jp.fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Fri, 02 Jun 2017 09:31:00 +0100
In-Reply-To: <1496391315-26446-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1496391315-26446-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 02 Jun 2017 09:31:01 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] sed: Upgrade 4.2.2 -> 4.4
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
X-List-Received-Date: Fri, 02 Jun 2017 08:31:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-06-02 at 17:15 +0900, Fan Xin wrote:
> 1. Upgrade sed from 4.2.2 to 4.4
> 
> 2. Update the SRC_URI
>    The format of archive file is changed from .tar.gz to .tar.xz
> 
> 3. Rename the folder from sed-4.2.2 to sed
>    No need to update the folder name when version upgrade
> 
> 4. Delete unncessary patch file due to the applied file is not exist.
>    sed-add-ptest.patch

That patch touches three files. Could you explain more about why this
patch is no longer required as I don't quite understand what you mean
here?

Cheers,

Richard

