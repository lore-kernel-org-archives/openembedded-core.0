Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D302D605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 14:10:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s47EAeud001592; Wed, 7 May 2014 15:10:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id d5RwoQiJfRCZ; Wed,  7 May 2014 15:10:39 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s47EAWWN001511
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 7 May 2014 15:10:34 +0100
Message-ID: <1399471826.31891.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Wed, 07 May 2014 15:10:26 +0100
In-Reply-To: <CANR6C55dqiKEqAS5_dN8O50vvirpn5MzEOeoFN1H7QfBegUppw@mail.gmail.com>
References: <1399257033-7155-1-git-send-email-ming.liu@windriver.com>
	<CANR6C57rRhM=uSs9segE=ZcGMVaT4EUFbP8PCzg2F_=_REd28w@mail.gmail.com>
	<CANR6C55dqiKEqAS5_dN8O50vvirpn5MzEOeoFN1H7QfBegUppw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] ldconfig-native: also default to lib32 and lib64 directories
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
X-List-Received-Date: Wed, 07 May 2014 14:10:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-05-07 at 23:51 +1000, Nick D'Ademo wrote:
> "ld: cannot find -lgcc"

This iss is not from the ldconfig patch, its due to the addition of gcc
4.9 and the realisation that certain PREFERRED_VERSION directives aren't
working (you'll see its building bits of gcc 4.9 and parts of 4.8).

There are patches out for this, it also needs a bitbake version update
to get one of the fixes.

Cheers,

Richard



