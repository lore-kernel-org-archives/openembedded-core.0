Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd19416.kasserver.com (dd19416.kasserver.com [85.13.139.185])
	by mail.openembedded.org (Postfix) with ESMTP id 058B46B8C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 10:26:55 +0000 (UTC)
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 8711A1840352;
	Thu, 16 Jan 2014 11:26:54 +0100 (CET)
Message-ID: <52D7B3EA.6090308@herbrechtsmeier.net>
Date: Thu, 16 Jan 2014 11:26:50 +0100
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1389376488-22286-1-git-send-email-ross.burton@intel.com>
	<1389376488-22286-4-git-send-email-ross.burton@intel.com>
In-Reply-To: <1389376488-22286-4-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] cmake: default to out-of-tree builds
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
X-List-Received-Date: Thu, 16 Jan 2014 10:26:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 10.01.2014 18:54, schrieb Ross Burton:
> Set B=${WORKDIR}/build in cmake.bbclass so that recipes using cmake.bbclass do
> out-of-tree builds by default.
You should update the note to reflect the new behaviour.


