Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC7E60807
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 20:21:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45Tbvm0JzJz4f;
	Wed, 19 Jun 2019 22:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560975716;
	bh=9az0JKk4Wy99j1zTdQTJt+zrnmBbYRWw8VOcmxrY4DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMDHQbJoZRRR0NWx6FKd/MqUyp6Yj+p/ECZPSEmXaMYkV7BmlRwmg/W3Q1uvKvqvb
	Y6XwH0IRhegQVSFeJ1HKLJeT+LbqPpnLQEYx+KMN1okkNFqw/tedL/DBwKxsrRmrNg
	XKihpr8IjSJNUM0hEMHh3Q0LoGwf2Fy02SZxFcBzse00dVq/atxCZDZndzalwslWST
	YkOgIUu646kWH3oW4mPfd18cXB/T8PQbMquaBLoL2AH/22bbztAzOqCdYWgOrzxm2K
	ReiCzVlroDeV16ZV1d34fymRY9XhLyE733pMJDXrziN/zJ4OdsU1OVAs7uoCvPf6ms
	lpGyFJP3U0svJL8yGwtta8sT4RrcP7eW+9Yj7JWDVooGS6/5JCwqY6I7rKPMKN/DGq
	215E08QCAXRZLO+9Iif3lKB+lB983DaQho9JN14BgrehaD3s5h7HWLik76BRY+Wowy
	BkFS/bG5jhLsuPzAC3xwXCbAeTwzT/6Jjjg6a/KzCLhWipXm/S2qtA8FRMjzM6pqC+
	V5sNptcvKvY3zupQUr+RyOZsPg8LvIdf8nMlPxfW831hLR20DcCrLsG5gQmOiL3mPt
	MBEeg0V6BxoRle60nOKSqoZUJ5/MufsBUuQ+PCbr6lAzSudNkWcLGWEjfGabuGpl4J
	JQ4LRMkdZ5u+DLc7yvLQyVbI=
Date: Wed, 19 Jun 2019 23:21:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Pierre Le Magourou <lemagoup@gmail.com>
Message-ID: <20190619202149.GA12516@localhost>
References: <20190619135940.18544-1-lemagoup@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190619135940.18544-1-lemagoup@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Wed, 19 Jun 2019 20:21:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Not sure which of the changes is responsible, but this is new:
WARNING: flex-native-2.6.0-r0 do_cve_check: Found unpatched CVE (CVE-2015-1773)

https://nvd.nist.gov/vuln/detail/CVE-2015-1773

Note that the flex tool is completely unrelated to Apache Flex.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


